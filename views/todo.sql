DROP TABLE IF EXISTS todos;
CREATE TABLE todos (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  details VARCHAR,
  priority INTEGER NOT NULL DEFAULT 1,
  created_at DATE NOT NULL,
  completed_at DATE
);

INSERT INTO todos (title, details, priority, created_at, completed_at)
VALUES
( 'mow yard', 'get mower out and mow', 5, '08/01/2017', NULL ),
( 'dinner', 'find date and go out', 4, '01/27/2016', NULL ),
( 'finish iron yard', 'stay focused', 3, '02/28/2015', NULL ),
( 'call friends', 'make time to call home', 2, '04/20/2000', '08/05/2017' ),
( 'finish daily', 'finish the damn SQL list', 1, '04/01/2018', NULL);

SELECT title, details FROM todos WHERE completed_at IS NULL;
SELECT * FROM todos WHERE priority > 1;
UPDATE todos SET completed_at = '08/08/2017' WHERE id = 5;
DELETE FROM todos WHERE completed_at IS NOT NULL;
