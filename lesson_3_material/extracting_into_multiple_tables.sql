CREATE TABLE directors (id serial PRIMARY KEY, name text NOT NULL);

INSERT INTO directors (name) VALUES ('John McTiernan');
INSERT INTO directors (name) VALUES ('Michael Curtiz');
INSERT INTO directors (name) VALUES ('Francis Ford Coppola');
INSERT INTO directors (name) VALUES ('Michael Anderson');
INSERT INTO directors (name) VALUES ('Tomas Alfredson');
INSERT INTO directors (name) VALUES ('Mike Nichols');

ALTER TABLE films ADD COLUMN director_id integer REFERENCES directors (id);

ALTER TABLE films DROP COLUMN director;

ALTER TABLE directors ADD CONSTRAINT valid_name
  CHECK (length(name) >= 1 AND position(' ' in name) > 0);

SELECT films.title, films.year, directors.name AS director, films.duration
  FROM films INNER JOIN directors ON directors.id = films.director_id;