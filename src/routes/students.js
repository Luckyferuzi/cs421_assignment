const express = require('express');
const router = express.Router();
const db = require('../config/db');

router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT name, program FROM students');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: 'Failed to fetch students' });
  }
});

module.exports = router;
