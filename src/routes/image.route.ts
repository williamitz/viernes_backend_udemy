import { Router, Request, Response } from "express";
import moment from "moment";
import path from 'path';
import fs from 'fs';

let ImgRoute = Router();

ImgRoute.get('/product/:nameFile', (req: Request, res: Response) => {

    const image = req.params.nameFile || 'none.xd';
    
    const imagePath = path.resolve(__dirname, '../uploads/', image);
    const defaultPath = path.resolve(__dirname, '../assets/no-image.png');
    
    if (fs.existsSync(imagePath)) {
        return res.sendFile(imagePath);
    }

    res.sendFile(defaultPath);
});
export default ImgRoute;