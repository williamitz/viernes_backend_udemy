import { NextFunction, Request, Response } from "express";
import jwt from 'jsonwebtoken';
import { SEED_KEY } from '../environments/enviroment';

const verifyToken = ( req: any, res: Response, next: NextFunction ) => {

    let token = req.get('Authorization') || '';

    jwt.verify( token, SEED_KEY, (error: any, decoded: any) => {
        if (error) {
            return res.status(401).json({
                ok: false,
                error
            })
        }

        req.userData = decoded;
        next();
    } );

};

export {
    verifyToken
}