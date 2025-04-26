const express = require('express');
const router = express.Router();
const db = require('../config/db');

router.get('/', async (req, res) => {
try {
console.log('Fetching subjects from database...');
const [subjects] = await db.query('SELECT id, subject_name AS name, academic_year AS year FROM subjects');
console.log('Subjects fetched successfully:', subjects);
res.status(200).json(subjects);
} catch (error) {
console.error('Error fetching subjects:', {
message: error.message,
code: error.code,
sqlMessage: error.sqlMessage,
sqlState: error.sqlState
});
res.status(500).json({ error: 'Failed to fetch subjects' });
}
});

module.exports = router;
