import { Router } from 'express';
import UploadRoute from './upload.route';
import ImgRoute from './image.route';
import AuthRoutes from './auth.route';

let MainRouter = Router();

MainRouter.use( UploadRoute );
MainRouter.use( ImgRoute );
MainRouter.use( AuthRoutes );

export default MainRouter;