const mysql = require('mysql2/promise');

const db = mysql.createPool({
host: process.env.DB_HOST || 'localhost',
user: process.env.DB_USER || 'cs421_user',
password: process.env.DB_PASSWORD || 'securepassword123',
database: process.env.DB_NAME || 'cs421_db'
});

module.exports = db;
