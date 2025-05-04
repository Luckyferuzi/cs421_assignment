const express = require('express');
const mysql = require('mysql2/promise');
const app = express();

app.use(express.json());

const db = mysql.createPool({
  host: process.env.DB_HOST || 'db',
  user: process.env.DB_USER || 'cs421_user',
  password: process.env.DB_PASSWORD || 'securepassword123',
  database: process.env.DB_NAME || 'cs421_db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

(async () => {
  try {
    const connection = await db.getConnection();
    console.log('Successfully connected to the database');
    connection.release();
  } catch (err) {
    console.error('Failed to connect to the database:', err);
    process.exit(1);
  }
})();

app.get('/api/students', async (req, res) => {
  try {
    console.log('Fetching students from database...');
    const [rows] = await db.query('SELECT * FROM students');
    console.log('Students fetched successfully:', rows);
    res.json(rows);
  } catch (err) {
    console.error('Error fetching students:', err);
    res.status(500).json({ error: 'Failed to fetch students' });
  }
});

app.get('/api/subjects', async (req, res) => {
  try {
    console.log('Fetching subjects from database...');
    const [rows] = await db.query('SELECT * FROM subjects');
    console.log('Subjects fetched successfully:', rows);
    res.json(rows);
  } catch (err) {
    console.error('Error fetching subjects:', err);
    res.status(500).json({ error: 'Failed to fetch subjects' });
  }
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
