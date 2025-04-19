const mysql = require('mysql2/promise');

const db = mysql.createPool({
  host: 'localhost',
  user: 'cs421_user',
  password: 'securepassword123',
  database: 'cs421_db'
});

module.exports = db;
