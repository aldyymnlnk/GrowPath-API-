const express = require('express');
const router = express.Router();
const db = require('../db');

// GET
router.get('/', async (req, res) => {
  const result = await db.query('SELECT * FROM assessment_questions');
  res.json(result.rows);
});

// POST
router.post('/', async (req, res) => {
  const { question_text, question_type, category } = req.body;

  await db.query(`
    INSERT INTO assessment_questions 
    (question_text, question_type, category, created_by)
    VALUES ($1, $2, $3, 1)
  `, [question_text, question_type, category]);

  res.json({ message: "Soal ditambahkan" });
});

// DELETE
router.delete('/:id', async (req, res) => {
  await db.query('DELETE FROM assessment_questions WHERE id=$1', [req.params.id]);
  res.json({ message: "Soal dihapus" });
});

module.exports = router;