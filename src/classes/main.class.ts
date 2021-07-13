import Express from 'express';
import http from 'http';
import { PORT } from '../environments/global.environment';

export class MainClass {

    port: number;
    app: Express.Application;
    private _httpServer: http.Server;
    private static _instance: MainClass;

    constructor() {
        this.port = PORT;
        this.app = Express();
        this._httpServer = http.createServer( this.app );
    }

    static get instance() {
        return this._instance || ( this._instance = new this() );
    }

    onRunServer( callback: Function ) {
        this._httpServer.listen( this.port, callback() );
    }
}
