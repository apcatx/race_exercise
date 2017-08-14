const express = require('express');
const db = require('./db')

let app = express();

app.get('/', (req, res, next) => {
  db.query('SELECT * FROM runner', [], (err, results) => {
    if (err) {
      return next(err)
    }
    res.send(results.rows);
  });
});

app.listen(3000, () => {
  console.log('listening on port 3000')
})
