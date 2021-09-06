import { Router } from 'express';
import UploadRoute from './upload.route';
import ImgRoute from './image.route';
import AuthRoutes from './auth.route';
import ProductRoute from './product.route';

let MainRouter = Router();

MainRouter.use( UploadRoute );
MainRouter.use( ImgRoute );
MainRouter.use( AuthRoutes );
MainRouter.use( ProductRoute );


export default MainRouter;