import Router from 'express';
import { addNewGarage, getAllGarages, getGarageById } from '../controllers/garage.js';
var router = Router();

router.get("/", getAllGarages);
router.get("/register", addNewGarage);


export default router;