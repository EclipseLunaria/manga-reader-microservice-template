import express from 'express';
import routes from './routes';

// init express app
const app = express();

const port = process.env.PORT === undefined ? (() => {console.warn("Port not specified defaulting to 6900"); return 6900})() : parseInt(process.env.PORT);

// attach routes
app.use('/', routes);

// default route
app.get('/', (req, res) => {
  res.send('Service is running');
});

// start server
app.listen(port, () => {
  console.log(`Service is running in http://localhost:${port}/`);
});
 