ALTER TABLE animals
ADD COLUMN class varchar(100);

UPDATE animals SET class='AVES' WHERE class IS NULL;

ALTER TABLE animals
  ADD COLUMN phylum varchar(100),
  ADD COLUMN kingdom varchar(100);

UPDATE animals SET phylum='Chordata';
UPDATE animals SET kingdom='Animalia';

ALTER TABLE countries
ADD COLUMN continent varchar(50);

UPDATE countries SET continent ='Europe' WHERE name = 'France' OR name = 'Germany';

UPDATE celebrities
  SET deceased = true
  WHERE first_name = 'Elvis';

ALTER TABLE celebrities
  ALTER COLUMN deceased
  SET NOT NULL;

DELETE FROM celebrities
WHERE first_name = 'Tom';

ALTER TABLE celebrities
  RENAME TO singers;
DELETE FROM singers
  WHERE occupation NOT ILIKE 'singer%';

DELETE FROM countries;

UPDATE orders SET drink='Lemonade' WHERE customer_name = 'James Bergman';

UPDATE orders SET side='Fries',
  side_cost=0.99,
  customer_loyalty_points=13
  WHERE id=4;

UPDATE orders set side_cost=1.20
  WHERE side='Fries';

