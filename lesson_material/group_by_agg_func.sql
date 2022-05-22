-- @block
INSERT INTO films (title, year, genre, director, duration)
  VALUES
    ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95),
    ('Bourne Identity', 2002, 'espionage', 'Doug Liman', 118);

-- @block
SELECT DISTINCT genre FROM films;

-- @block
SELECT genre FROM films GROUP BY genre;

-- @block
SELECT ROUND(AVG(duration), 0) FROM films;

-- @block
SELECT DISTINCT genre, ROUND(AVG(duration), 0) AS mean_duration
FROM films GROUP BY genre ORDER BY mean_duration;

-- @block
SELECT floor(year/10) * 10 AS decade,
      ROUND(AVG(duration)) AS mean_duration
      FROM films
      GROUP BY floor(year/10) * 10
      ORDER BY decade ASC;

-- @block
SELECT * FROM films WHERE director LIKE 'John%';

-- @block
SELECT genre, count(*) FROM films GROUP BY genre ORDER BY count DESC;
SELECT genre, count(films.id) FROM films GROUP BY genre ORDER BY count DESC;

-- @block
SELECT year / 10 * 10 AS decade, genre, string_agg(title, ', ') AS films
FROM films GROUP BY decade, genre ORDER BY decade, genre;
-- @block
SELECT genre, sum(duration) AS total_duration
FROM films GROUP BY genre ORDER BY total_duration, genre ASC;

CREATE TABLE names (
  id serial PRIMARY KEY,
  name varchar(255)
);
INSERT INTO names (name)
  VALUES
    ('Abedi'),
    ('Allyssa'),
    ('amy'),
    ('ben'),
    ('Becky'),
    ('Christophe'),
    ('Camilla'),
    ('david'),
    ('Elsa'),
    ('frank'),
    ('Felipe');


SELECT substring(upper(name), 1, 1) as first_letter, count(id)
FROM names GROUP BY first_letter ORDER BY count DESC;

CREATE TABLE ice_cream (
  name VARCHAR(255),
  age int,
  favorite_flavor varchar(255)
);
INSERT INTO ice_cream (name, age, favorite_flavor)
VALUES
('Afia', 6,'Strawberry'),
('Ben',	6,'Chocolate'),
('Clara',	6,'Strawberry'),
('David',	7,'Rocky Road'),
('Emma',	6, 'Vanilla'),
('Jian',	7, 'Chocolate'),
('Juana',	6, 'Chocolate'),
('Kayla',	7, 'Vanilla'),
('Michael',	6, 'Chocolate'),
('Sofia',	7, 'Chocolate'),
('Taylor',	6, 'Strawberry'),
('Zoe',	7, 'Chocolate');
-- @block
SELECT
  favorite_flavor as flavor,
  count(favorite_flavor) as votes,
  round(avg(age)) as age

  FROM ice_cream
  GROUP BY favorite_flavor;

CREATE TABLE users(
  id serial PRIMARY KEY,
  name varchar(255),
  email varchar(255),
  admin boolean,
  last_login date
);

INSERT INTO users (name, email, admin, last_login)
VALUES
('Mike', 'mikeym@example.com',	false, '2017-12-30 08:43:12'),
('Gustavo', 'gus@example.com',	true, '2018-01-12 22:17:34'),
('Tamara', 'tammy@example.com',	true, '2018-01-15 09:22:22'),
('Arron', 'arronrose@example.com',	null, '2018-01-29 21:37:46'),
('Jane', 'jane@example.com',	false, '2017-11-28 15:17:21');

SELECT name FROM users WHERE admin = false OR admin IS NULL;

