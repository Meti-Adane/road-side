import Router from "express";
import {
  addNewGarage,
  deleteGarage,
  getAllGarages,
  getGarageById,
} from "../controllers/garage.js";
var router = Router();

router.get("/", getAllGarages);
router.get("/:id", getGarageById);
router.post("/register", addNewGarage);
router.delete("/:id", deleteGarage);

export default router;
