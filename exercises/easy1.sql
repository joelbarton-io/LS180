-- @block
CREATE TABLE birds (
  id serial PRIMARY KEY,
  name varchar(25),
  age integer,
  species varchar(15)
);
-- @block
INSERT INTO birds (name, age, species)
  VALUES
    ('Charlie', 3, 'Finch'),
    ('Allie', 5, 'Owl'),
    ('Jennifer', 3, 'Magpie'),
    ('Jamie', 4, 'Owl'),
    ('Roy', 8, 'Crow');

-- @block

-- @block
SELECT (id,name,age,species) FROM birds WHERE age < 5;
-- @block
UPDATE birds SET species = 'Raven' WHERE id = 5;
UPDATE birds SET species = 'Hawk' WHERE name = 'Jamie';
-- @block
DELETE FROM birds WHERE species = 'Finch' AND age = 3;
-- @block
ALTER TABLE birds ADD CONSTRAINT check_age CHECK (age > 0);
INSERT INTO birds (name, age, species) VALUES ('johnny', -13, 'jaborwalkie');

-- @block
DROP TABLE birds;

CREATE TABLE player_scores (
  id serial PRIMARY KEY,
  name varchar(25),
  team varchar(25),
  score int
);

INSERT INTO player_scores (id, name, team, score)
  VALUES
    (1, 'Julie', 'Red', 22),
    (2, 'Mario', 'Gold', 18),
    (3, 'Steve', 'Red', 25),
    (4, 'Ruby', 'Blue', 30),
    (5, 'Dolores', 'Blue', 19),
    (6, 'Shawn', 'Gold', 27),
    (7, 'Lucas', 'Red', 28),
    (8, 'Ella', 'Gold', 24),
    (9, 'Alberto', 'Blue', 21);


CREATE TABLE pet_owners (
  id serial PRIMARY KEY,
  name varchar(25)
);

INSERT INTO pet_owners (id, name)
  VALUES
    (1, 'David'),
    (2, 'Keiko'),
    (3, 'Zia'),
    (4, 'Carlos');

CREATE TABLE pets (
  id serial PRIMARY KEY,
  name varchar(25),
  type varchar(25),
  FOREIGN KEY owner_id
    REFERENCES pet_owners (id)
);

Z