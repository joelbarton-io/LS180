-- @block
CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  director_id integer REFERENCES directors ON DELETE CASCADE NOT NULL,
  film_id integer REFERENCES films ON DELETE CASCADE NOT NULL
);

INSERT INTO directors_films (film_id, director_id)
  VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 3),
    (8, 7),
    (9, 8),
    (10, 4);

ALTER TABLE films DROP COLUMN director_id;

SELECT films.title, directors.name FROM films
  JOIN directors_films ON films.id = directors_films.film_id
  JOIN directors ON directors_films.director_id = directors.id
  ORDER BY title ASC;

INSERT INTO films (title, year, genre, duration)
  VALUES
    ('Fargo', 1996, 'comedy', 98),
    ('No Country for Old Men', 2007, 'western', 122),
    ('Sin City', 2005, 'crime', 124),
    ('Spy Kids', 2001, 'scifi', 88);

INSERT INTO directors (name)
  VALUES
    ('Joel Coen'),
    ('Ethan Coen'),
    ('Frank Miller'),
    ('Robert Rodriquez');

INSERT INTO directors_films (film_id, director_id)
  VALUES
    (11, 9),
    (12, 10),
    (13, 11),
    (14, 12);


SELECT d.name, count(f.title) FROM films AS f
  JOIN directors_films AS d_f ON f.id = d_f.film_id
  JOIN directors AS d ON d_f.director_id = d.id
GROUP BY d.nameORDER BY count(f.title) DESC, d.name;