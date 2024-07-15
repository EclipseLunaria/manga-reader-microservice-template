import { Router } from "express";
import { templateController } from "../controllers";

const templateRouter = Router();

templateRouter.get("/", templateController);

export default templateRouter;