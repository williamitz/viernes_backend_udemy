import cors from 'cors';
import { json, urlencoded } from 'body-parser';
import fileUpload from 'express-fileupload';

import { MainClass } from "./classes/main.class";
import MainRouter from './routes/main.route';
import { Request, Response } from 'express';
import MysqlClass from './classes/mysqlClass';

let server = MainClass.instance;
let db = MysqlClass.instance;

server.app.use( cors( { origin: true, credentials: true } ) );

server.app.use( urlencoded({extended: false}) )
server.app.use( json() );

server.app.use( fileUpload() );

server.app.use( MainRouter );

server.app.get('/', (req: Request, res: Response) => {
    res.json({
        ok: true,
        data: 'estas en node backend'
    })
});

server.onRunServer( (err: any) => {
    if (err) {
        throw new Error('Error al levantar servidor');
    }

    console.log('Servidor corriendo en puerto ', server.port);
    
    db.onConnect( (error: any) => {
        if (error) return console.log('error de conexion con bd');
        console.log('Conectado con base de datos :D');
    });
} );