const mysql = require('mysql2/promise');

const db = mysql.createPool({
  host: 'localhost',      // XAMPP MySQL runs locally
  user: 'root',           // Default XAMPP user
  password: 'lucky123',           // Default XAMPP password (empty)
  database: 'cs421_db'
});

module.exports = db;
