// import { PORT_DB, HOST_DB, USER_DB, PASSWORD_DB, NAME_DB } from '../config/enviroment';
import mysql from 'mysql';
import { PORT_DB, HOST_DB, USER_DB, PASSWORD_DB, NAME_DB  } from '../environments/enviroment';

export default class MysqlClass {

    private connectDB: mysql.Connection;

    private static _instance: MysqlClass;

    constructor() {
        this.connectDB = mysql.createConnection({
            port: PORT_DB,
            host: HOST_DB,
            user: USER_DB,
            password: PASSWORD_DB,
            database: NAME_DB,
            charset: 'utf8mb4',
            
        });
        // this.onConnect();
    }

    public static get instance() {
        return this._instance || ( this._instance = new this() );
    }
    
    onConnect( callback: Function ) {
        
        this.connectDB.connect( callback );
    }

    onExecuteQuery( sql: string, callback: Function ) {

        this.connectDB.query( sql, ( error: any, result: Object[] ) => {
            if( error ) {
                console.log('Error al procesar query ===> ', sql);
                console.log(error);
                return callback( error , [] );                
            }

            return callback( null,  result[0] );
        })
    }

}