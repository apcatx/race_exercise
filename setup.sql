-- DROP DATABASE IF EXISTS racedb;
-- CREATE DATABASE racedb;
-- -- This is database specific (Postgres). Other systems will be different.
-- \c racedb;

-- DROP TABLE IF EXISTS runner;
-- DROP TABLE IF EXISTS venue;
-- DROP TABLE IF EXISTS race;
-- DROP TABLE IF EXISTS result;

-- CREATE TABLE runner(
--   bib_id SERIAL PRIMARY KEY,
--   name VARCHAR(100) NOT NULL,
--   division VARCHAR(100),
--   sponsor VARCHAR(100)
-- );
--
-- CREATE TABLE venue(
--   venue_id SERIAL PRIMARY KEY,
--   name VARCHAR(100) NOT NULL,
--   location VARCHAR(100) NOT NULL
-- );
--
-- CREATE TABLE race(
--   race_id SERIAL PRIMARY KEY,
--   name VARCHAR(250) NOT NULL,
--   distance FLOAT NOT NULL,
--   race_date DATE NOT NULL,
--   venue_id INTEGER,
--   FOREIGN KEY(venue_id) REFERENCES venue(venue_id)
-- );
--
-- CREATE TABLE result(
--   race_id INTEGER,
--   FOREIGN KEY(race_id) REFERENCES race(race_id),
--   bib_id INTEGER,
--   FOREIGN KEY(bib_id) REFERENCES runner(bib_id),
--   result_time TIMESTAMP,
--   PRIMARY KEY(race_id, bib_id)
-- );
--
INSERT INTO runner(name, division, sponsor)
  VALUES
  ('Austin Carey', 'M35', 'ATXlocals'),
  ('Marissa Carey', 'W30', 'OFLlocals'),
  ('Garret Putman', 'M35', 'ATXlocals'),
  ('Justin Foreman', 'M35', 'OFLlocals'),
  ('Holly Eschliman', 'W25', 'ATXlocals'),
  ('Tiffany Rolan', 'W25', 'ATXlocals');
