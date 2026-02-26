const express = require('express');
const mongoose = require('mongoose');
const todosRouter = require('./routes/todos');

const app = express();
const PORT = process.env.PORT || 3000;
const MONGO_URI = process.env.MONGO_URI || 'mongodb://mongo:27017/tododb';

app.use(express.json());

app.get('/', (req, res) => {
  res.json({ message: 'Todo API is running' });
});

app.use('/todos', todosRouter);

mongoose
  .connect(MONGO_URI)
  .then(() => {
    console.log('Connected to MongoDB');
    app.listen(PORT, () => {
      console.log(`Server running on port ${PORT}`);
    });
  })
  .catch((err) => {
    console.error('Failed to connect to MongoDB:', err.message);
    process.exit(1);
  });

module.exports = app;
