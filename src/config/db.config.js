const env = process.env;
const mysql = require('mysql');

const db = mysql.createConnection({
  host: env.DB_HOST,
  user: env.DB_USER,
  password: env.DB_PASSWORD,
  database: env.DB_NAME,
  port: env.DB_PORT || 3306,
});

module.exports = db;
