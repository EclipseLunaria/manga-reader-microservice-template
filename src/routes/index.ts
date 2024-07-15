import { Router } from "express";
import templateRouter from "./templateRoute";

const routes = Router();

// attach route definitions
routes.use("/template", templateRouter);


export default routes;