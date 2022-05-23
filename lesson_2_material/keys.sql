-- @block
CREATE SEQUENCE counter;

-- @block
SELECT nextval('counter');

-- @block
DROP SEQUENCE counter;

-- @block
ALTER TABLE films
ADD COLUMN id serial PRIMARY KEY;

-- @block
INSERT INTO films (title, year, genre, director, duration, id)
VALUES ('imitation game', 2016, 'thriller', 'ion know', 110, 3);

-- @block
ALTER TABLE films
DROP CONSTRAINT films_pkey;