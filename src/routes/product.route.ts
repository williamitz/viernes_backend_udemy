import { Router, Request, Response } from 'express';
import { ILogin } from '../interfaces/login.interface';
import MysqlClass from '../classes/mysqlClass';
import jwt from 'jsonwebtoken';
import reqIp from 'request-ip';
import { verifyToken } from '../middlewares/token.md';
import IProduct from '../interfaces/product.interface';

const mysql = MysqlClass.instance;

const ProductRoute = Router();

ProductRoute.post( '/Product', [verifyToken], (req: any, res: Response) => {
    let pkUser = req.userData.pkUser || 0;
    let body: IProduct = req.body;

    console.log('body add', body);
    let sql = `CALL as_sp_add_product( `
    sql += `'${ body.nameProduct }',`;
    sql += `${ body.priceProduct },`;
    sql += `${ body.statusRegister },`;
    sql += `${ pkUser }`;
    sql += `);`;

    mysql.onExecuteQuery( sql, (error: any, data: any) => {
        
        if (error) {
            return res.status(400).json({
                ok: false,
                error
            });
        }

        // let rowString = JSON.stringify(data);
        // let jsonData = JSON.parse( rowString );
        
        let showError = Number(data[0].showError) ;

        res.json({
            ok: true,
            data: data[0],
            showError
        });
    
    });

});


ProductRoute.get( '/Product', [ verifyToken ], (req: any, res: Response) => {
    let pkUser = req.userData.pkUser || 0;
    let page = req.query.page || 1;
    
    
    let sql = `CALL as_sp_get_products( `
    sql += `${ page },`;
    sql += `${ pkUser }`;
    sql += `);`;

    console.log('sql productos, ', sql);

    mysql.onExecuteQuery( sql, (error: any, data: any) => {
        
        if (error) {
            return res.status(400).json({
                ok: false,
                error
            });
        }

        // let rowString = JSON.stringify(data);
        // let jsonData = JSON.parse( rowString );
        

        res.json({
            ok: true,
            data,
        });
    
    });

});


ProductRoute.put( '/Product/:id', [verifyToken], (req: any, res: Response) => {
    let pkProduct = req.params.id || 0;
    let body: IProduct = req.body;
    let pkUser = req.userData.pkUser || 0;

    console.log('body update', body);

    let sql = `CALL as_sp_update_product( `
    sql += `${ pkProduct },`;
    sql += `'${ body.nameProduct }',`;
    sql += `${ body.priceProduct },`;
    sql += `${ body.statusRegister },`;
    sql += `${ pkUser }`;
    sql += `);`;

    mysql.onExecuteQuery( sql, (error: any, data: any) => {
        
        if (error) {
            return res.status(400).json({
                ok: false,
                error
            });
        }

        // let rowString = JSON.stringify(data);
        // let jsonData = JSON.parse( rowString );
        
        let showError = Number(data[0].showError) ;

        res.json({
            ok: true,
            data: data[0],
            showError
        });
    
    });

});

ProductRoute.delete( '/Product/:id', [verifyToken], (req: any, res: Response) => {
    let pkProduct = req.params.id || 0;
    let pkUser = req.userData.pkUser || 0;

    let sql = `CALL as_sp_delete_product( `
    sql += `${ pkProduct },`;
    sql += `${ pkUser }`;
    sql += `);`;

    mysql.onExecuteQuery( sql, (error: any, data: any) => {
        
        if (error) {
            return res.status(400).json({
                ok: false,
                error
            });
        }

        let rowString = JSON.stringify(data);
        let jsonData = JSON.parse( rowString );
        
        let showError = Number(jsonData[0].showError) ;

        res.json({
            ok: true,
            data: jsonData[0],
            showError
        });
    
    });

});

export default ProductRoute;