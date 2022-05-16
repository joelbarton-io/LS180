ALTER TABLE countries
  DROP COLUMN continent;

CREATE TABLE continents (
  id serial NOT NULL,
  continent_name varchar(50)
);

ALTER TABLE continents ADD PRIMARY KEY (id);

ALTER TABLE countries
  ADD COLUMN continent_id integer;

ALTER TABLE countries
  ADD FOREIGN KEY (continent_id)
  REFERENCES continents(id);


INSERT INTO countries
  (name, capital, population)
  VALUES ()

INSERT INTO continents (continent_name) VALUES
('Africa'),
('Asia'),
('Europe'),
('North America'),
('South America');

INSERT INTO countries (name, capital, population, continent_id)
VALUES ('Brazil', 'Brasilia', 208385000, 10),
('Egypt', 'Cairo', 96308900, 6),
('France', 'Paris', 67158000, 8),
('Germany', 'Berlin', 82349400, 8),
('Japan', 'Tokyo', 126672000, 7),
('USA', 'Washington D.C.', 325365189, 9);

CREATE TABLE albums (
  id serial PRIMARY KEY,
  album_name varchar(100),
  released date,
  genre varchar(100),
  label varchar(100),
  singer_id int,
  FOREIGN KEY (singer_id) REFERENCES singers(id)
);

ALTER TABLE albums ADD PRIMARY KEY (id);

