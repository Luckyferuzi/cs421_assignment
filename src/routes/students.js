const express = require('express');
const router = express.Router();
const db = require('../config/db');

router.get('/', async (req, res) => {
try {
  console.log('Fetching students from database...');
  const [students] = await db.query('SELECT * FROM students');
  console.log('Students fetched successfully:', students);
  res.status(200).json(students);
} catch (error) {
  console.error('Error fetching students:', {
    message: error.message,
    code: error.code,
    sqlMessage: error.sqlMessage,
    sqlState: error.sqlState
  });
  res.status(500).json({ error: 'Failed to fetch students' });
}
});

module.exports = router;
