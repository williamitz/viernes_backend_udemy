import { Router, Request, Response } from 'express';
import { ILogin } from '../interfaces/login.interface';
import MysqlClass from '../classes/mysqlClass';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { SEED_KEY } from '../environments/enviroment';
import ISingin from '../interfaces/singin.interface';
import reqIp from 'request-ip';

const mysql = MysqlClass.instance;

const AuthRoutes = Router();

AuthRoutes.post( '/Login', [], (req: Request, res: Response ) => {

    let body: ILogin = req.body;
    console.log('body singin', req.body);

    let sql = `CALL as_sp_login( '${ body.userName }' );`

    mysql.onExecuteQuery( sql, (error: any, data: any) => {
        
        if (error) {
            return res.status(400).json({
                ok: false,
                error
            });
        }

        let rowString = JSON.stringify(data);
        let jsonData = JSON.parse( rowString );

        console.log('res login', jsonData[0].showError);
        
        let showError = Number(jsonData[0].showError) ;
        console.log('showError ========', showError);
        let token = '';
        if (showError == 0) {
          
            if ( !bcrypt.compareSync( body.userPassword, jsonData[0].userPassword || 'xD' ) ) {
                showError = 2;
            } else {

              delete jsonData[0].userPassword;
              
              token = jwt.sign( jsonData[0], SEED_KEY, {expiresIn: '7d'} );
              showError = 0;
            }


        }

        res.json({
            ok: true,
            showError,
            token
        });

    } );
});

AuthRoutes.post( '/Singin', [], (req: Request, res: Response ) => {

    let body: ISingin = req.body;
    
    let passwordEncript = bcrypt.hashSync(body.userPassword, 10);

    let sql = `CALL as_sp_singin( `;
    sql += `'${ body.fullname }', `;
    sql += `'${ body.email }', `;
    sql += `'${ body.phone }', `;
    sql += `'${ passwordEncript }', `;
    sql += ` '${reqIp.getClientIp(req)}');`;

    mysql.onExecuteQuery( sql, (error: any, data: any[]) => {
        
        if (error) {
            return res.status(400).json({
                ok: false,
                error
            });
        }

        let showError = data[0].showError || 0;
        let token = '';
        if (showError == 0) {

            let dataToken = {
                pkUser: data[0].pk || 0,
                fullname: body.fullname,
                email: body.email,
                phone: body.phone,
            };
            
            token = jwt.sign( dataToken, SEED_KEY, {expiresIn: '7d'} );

        }

        res.json({
            ok: true,
            showError,
            token
        });

    } );
});

export default AuthRoutes;