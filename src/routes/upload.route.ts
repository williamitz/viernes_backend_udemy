import { Router, Request, Response } from "express";
import moment from "moment";
import path from 'path';
import fs from 'fs';
import { FILES_VALID } from "../environments/global.environment";
import MysqlClass from '../classes/mysqlClass';
import { verifyToken } from "../middlewares/token.md";

const mysql = MysqlClass.instance;
let UploadRoute = Router();

UploadRoute.post('/upload/:id', [verifyToken], (req: any, res: Response) => {

    let id = req.params.id || '';
    let pkUserToken = req.userData.pkUser || '';

    if (!req.files || Object.keys(req.files).length === 0) {
        return res.status(400).json({
            ok: false,
            error: {
                message: 'No files were uploaded.'
            }
        });
    }
    
    // The name of the input field (i.e. "sampleFile") is used to retrieve the uploaded file
    let sampleFile: any = req.files.file;
    let nameFile: string = sampleFile.name || '';
    let ext = nameFile.split('.').pop() || '';
    ext = ext.toString();

    if (!FILES_VALID.includes(ext.toLowerCase()) ) {
        return res.status(400).json({
            ok: false,
            error: {
                message: 'Archivo inválido solo se aceptan: ' + FILES_VALID.join(', ')
            }
        });
    }

    let fileNameUpload = `file${id}-${moment().milliseconds()}.png`;

    let uploadPath = path.resolve( __dirname, '../uploads/', fileNameUpload );

    // Use the mv() method to place the file somewhere on your server
    sampleFile.mv(uploadPath, (err: any) => {
        if (err)
            return res.status(500).send(err);

        updateImgProduct( id, fileNameUpload, pkUserToken, res );
    
        
    });

});

UploadRoute.delete('/oldimage/:namefile', (req: Request, res: Response) => {
    let oldImg = req.params.namefile || 'none.png';
    let oldPath = path.resolve( __dirname, '../uploads/', oldImg.toString() );
    
    let showError = 1;
    let msg = 'No se encontró archivo';
    
    if ( fs.existsSync( oldPath ) ) {
        msg = 'Foto eliminada exitosamente';
        showError = 0;
        fs.unlinkSync(oldPath);
    }

    res.json({
        ok: true,
        data: {
            showError,
            msg
        }
    })
});

function delImg( img: string ): void {

    let oldPath = path.resolve( __dirname, '../uploads/', img.toString() );
    if ( fs.existsSync( oldPath ) ) {
        fs.unlinkSync(oldPath);
    }
}

function updateImgProduct( pk: number, img: string, fkUser: number, res: Response ) {
    // as_sp_update_imgProduct
    
    let sql = `CALL as_sp_update_imgProduct( `
    sql += `${ pk },`;
    sql += `'${ img }',`;
    sql += `${ fkUser }`;
    sql += `);`;

    mysql.onExecuteQuery( sql, (error: any, data: any) => {
        
        if (error) {
            
            delImg(img);

            return res.status(400).json({
                ok: false,
                error
            });
        }

        let rowString = JSON.stringify(data);
        let jsonData = JSON.parse( rowString );
        
        let showError = Number(jsonData[0].showError) ;
        if (showError == 0) {
            delImg( jsonData[0].oldImg || 'xd.png' );
            jsonData[0].urlImg = img;
        }

        res.json({
            ok: true,
            data: jsonData[0],
            showError
        });
    
    });

}

export default UploadRoute;
