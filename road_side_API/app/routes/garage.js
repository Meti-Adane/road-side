import Router from "express";
import {
  addNewGarage,
  deleteGarage,
  getAllGarages,
  getGarageById,
  updateGarage,
} from "../controllers/garage.js";
var router = Router();

router.get("/", getAllGarages);
router.get("/:id", getGarageById);
router.post("/register", addNewGarage);
router.delete("/:id", deleteGarage);
router.patch("/:id", updateGarage);

export default router;
