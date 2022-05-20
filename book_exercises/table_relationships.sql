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


ALTER TABLE singers
ADD CONSTRAINT unique_id UNIQUE (id);

CREATE TABLE albums (
  id serial PRIMARY KEY,
  album_name varchar(100),
  released date,
  genre varchar(100),
  label varchar(100),
  singer_id int,
  FOREIGN KEY (singer_id) REFERENCES singers(id)
);

CREATE TABLE customers (
  id serial PRIMARY KEY,
  customer_name VARCHAR(255)
);

CREATE TABLE email_addresses (
  customer_id INT PRIMARY KEY,
  customer_email VARCHAR(255),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
  ON DELETE CASCADE
);

INSERT INTO customers (customer_name)
VALUES
  ('Natasha O''Shea'),
  ('James Bergman'),
  ('Aaron Muller');

INSERT INTO email_addresses (customer_id, customer_email)
VALUES
  (1, 'james1998@email.com'),
  (2, 'natasha@osheafamily.com');

CREATE TABLE products (
  product_id SERIAL PRIMARY KEY,
  product_name VARCHAR(50),
  product_cost NUMERIC(4,2) DEFAULT 0,
  product_type VARCHAR(20),
  product_loyalty_points INT
);

INSERT INTO products (product_name, product_cost, product_type, product_loyalty_points)
VALUES
  ('LS Burger',	3.00,	'Burger',	10),
  ('LS Cheeseburger',	3.50,	'Burger',	15),
  ('LS Chicken Burger', 4.50,	'Burger',	20),
  ('LS Double Deluxe Burger', 6.00,	'Burger',	30),
  ('Fries',	1.20,	'Side',	3),
  ('Onion Rings',	1.50,	'Side',	5),
  ('Cola',	1.50,	'Drink',	5),
  ('Lemonade',	1.50,	'Drink',	5),
  ('Vanilla Shake',	2.00,	'Drink',	7),
  ('Chocolate Shake',	2.00, 'Drink',	7),
  ('Strawberry Shake',	2.00,	'Drink',	7);

CREATE TABLE orders (
  id serial PRIMARY KEY,
  customer_id INT,
  order_status VARCHAR(20),
  FOREIGN KEY (customer_id) REFERENCES customers (id)
  ON DELETE CASCADE
);

CREATE TABLE order_items (
  id serial PRIMARY KEY,
  order_id integer NOT NULL,
  product_id integer NOT NULL,
  FOREIGN KEY (order_id)
  REFERENCES orders (id)
  ON DELETE CASCADE,
  FOREIGN KEY (product_id)
  REFERENCES products (product_id)
  ON DELETE CASCADE
);

SELECT countries.name, continents.continent_name
FROM countries JOIN continents
ON countries.continent_id = continents.id;