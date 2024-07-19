import app from ".";

const port =
  process.env.PORT === undefined
    ? (() => {
        console.warn("Port not specified defaulting to 6900");
        return 6900;
      })()
    : parseInt(process.env.PORT);


// start server
app.listen(port, () => {
    console.log(`Service is running in http://localhost:${port}/`);
  });
  