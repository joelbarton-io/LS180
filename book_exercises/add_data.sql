INSERT INTO countries
  (name, capital, population)
  VALUES
  ('France', 'Paris', 67158000);

INSERT INTO countries
  (name, capital, population)
  VALUES
  ('USA', 'Washington D.C.', 325365189),
  ('Germany', 'Berlin', 82349400),
  ('Japan', 'Tokyo', 126672000);

INSERT INTO celebrities
  (first_name, occupation, date_of_birth, deceased, last_name)
  VALUES
  ('Bruce', 'singer and songwriter', '1949-09-23', false, 'Springsteen');

INSERT INTO celebrities
  (first_name, last_name, date_of_birth, occupation)
  VALUES
  ('Scarlett', 'Johansson', '1984-11-22', 'actress');

INSERT INTO celebrities
  (first_name, last_name, occupation, date_of_birth, deceased)
  VALUES
  ('Frank', 'Sinatra', 'singer and actor', '1915-12-12', true),
  ('Tom', 'Cruise', 'actor', '1962-07-03', default);

ALTER TABLE celebrities
  ADD CHECK (last_name <> '');

ALTER TABLE celebrities
  ALTER COLUMN last_name DROP NOT NULL;

INSERT INTO celebrities (first_name, occupation, date_of_birth, deceased)
                 VALUES ('Madonna', 'Singer, Actress', '1958-08-16', false),
                        ('Prince', 'Singer, Songwriter, Musician, Actor', '1958-06-07', true);

ALTER TABLE celebrities
  ADD CHECK (deceased <> NULL);

ALTER TABLE animals
  DROP CONSTRAINT unique_binomial_name;

INSERT INTO animals
  (name, binomial_name, max_weight_kg, max_age_years, conservation_status)
  VALUES
  ('Dove',	'Columbidae Columbiformes', 2, 15, 'LC'),
  ('Golden Eagle',	'Aquila Chrysaetos', 6.35, 24, 'LC'),
  ('Peregrine Falcon',	'Falco Peregrinus', 1.5, 15, 'LC'),
  ('Pigeon'	,'Columbidae Columbiformes', 2, 15, 'LC'),
  ('Kakapo'	,'Strigops habroptila', 4, 60, 'CR');

INSERT INTO orders
  (customer_name, burger, side, drink, customer_email, customer_loyalty_points, burger_cost, side_cost, drink_cost)
VALUES
  ('James Bergman', 'LS Chicken Burger', 'Fries', 'Cola', 'james1998@email.com', 28, 4.50, 0.99, 1.50),
  ('Natasha O''Shea', 'LS Cheese Burger', 'Fries', NULL, 'natasha@osheafamily.com', 18, 3.50, 0.99, DEFAULT),
  ('Natasha O''Shea', 'LS Double Deluxe Burger', 'Onion Rings', 'Chocolate Shake', 'natasha@osheafamily.com', 42, 6.00, 1.50, 2.00),
  ('Aaron Muller', 'LS Burger', NULL , NULL , NULL, 10, 3.00, DEFAULT, DEFAULT);
