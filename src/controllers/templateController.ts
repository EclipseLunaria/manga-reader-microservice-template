import { Request, Response } from "express";
import { templateService } from "../services";

const templateController = (req:Request, res:Response) => {
    templateService();
    res.send("Hello Template Controller!");
};

export {templateController}