const express = require('express');
const app = express();
const studentRoutes = require('./routes/students');
const subjectRoutes = require('./routes/subjects');

app.use('/students', studentRoutes);
app.use('/subjects', subjectRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});