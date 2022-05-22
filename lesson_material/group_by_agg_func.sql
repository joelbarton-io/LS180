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

SELECT substring(name, 1, 1) FROM