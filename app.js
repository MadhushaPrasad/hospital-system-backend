const express = require('express');
const createError = require('http-errors');
const morgan = require('morgan');
require('dotenv').config();
const db = require('./src/config/db.config');
const routes = require('./src/routes/index');

db.connect((err) => {
  if (err) {
    throw err;
  }
  console.log('Connected to the database');
});

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(morgan('dev'));

app.use('/api', routes);

app.use((req, res, next) => {
  next(createError.NotFound());
});

app.use((err, req, res, next) => {
  res.status(err.status || 500);
  res.send({
    status: err.status || 500,
    message: err.message,
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`🚀 @ http://localhost:${PORT}`));
