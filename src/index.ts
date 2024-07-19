import express from "express";
import routes from "./routes";

// init express app
const app = express();

// attach routes
app.use("/", routes);

// default route
app.get("/", (req, res) => {
  res.send("Service is running");
});


export default app;
