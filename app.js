const express = require('express');
const db = require('./db');
const mustacheExpress = require('mustache-express');
const bodyParser = require('body-parser');

const app = express();

app.engine('mustache', mustacheExpress());

app.set('views', './views');
app.set('view engine', 'mustache');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

app.use(express.static('public'));

app.get('/', function(req, res, next) {
  db.query('SELECT * FROM runner', [], function(err, results) {
    if (err) {
      return next(err)
    }
    res.render('index', {runners:results.rows});
  });
});

app.get('/newrunner', function(req, res){
  res.render('newrunner')
});

app.post('/newrunner', function(req, res, next) {
  let newrunner = `INSERT INTO runner (division,sponsor,name) VALUES (
    '${req.body.division}',
    '${req.body.sponsor}',
    '${req.body.name}'
  )`;
  db.query(newrunner, function(err) {
    if (err) {
      return next(err)
    }
    res.redirect('/')
  });
});

app.get('/:bib_id', function(req, res) {
  db.query('SELECT * FROM runner WHERE bib_id=$1',
    [req.params.bib_id], function(error, results) {
      console.log(results)
    res.render('runner', {runner: results.rows});
  })
});

app.listen(3000, () => {
  console.log('listening on port 3000')
})
