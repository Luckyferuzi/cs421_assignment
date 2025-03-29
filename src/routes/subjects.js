const express = require('express');
const router = express.Router();
const db = require('../config/db');

router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT subject_name, academic_year FROM subjects');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch subjects' });
  }
});

module.exports = router;