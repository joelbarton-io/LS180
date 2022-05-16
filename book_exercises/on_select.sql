SELECT * FROM countries LIMIT 1;

SELECT name FROM countries
  ORDER BY population DESC
  LIMIT 1;

SELECT name FROM countries
  ORDER BY population DESC
  LIMIT 1
  OFFSET 1;

SELECT DISTINCT binomial_name FROM animals;

-- SELECT binomial_name, length(binomial_name) FROM animals
--   GROUP BY binomial_name
--   LIMIT 1
--   OFFSET 3;

SELECT binomial_name FROM animals
  ORDER BY length(binomial_name) DESC
  LIMIT 1;

SELECT first_name FROM celebrities
  WHERE date_part('year', date_of_birth) = 1958;

SELECT max(max_age_years) FROM animals;

SELECT avg(max_weight_kg) FROM animals;

SELECT max(id) FROM countries;

SELECT sum(population) FROM countries;

-- SELECT DISTINCT conservation_status, sum(DISTINCT conservation_status) FROM animals
--   GROUP BY DISTINCT conservation_status;
SELECT conservation_status, count(id) FROM animals
GROUP BY conservation_status;

SELECT avg(burger_cost) FROM orders
  WHERE side = 'Fries';

-- SELECT min(side_cost) FROM orders
--   WHERE side_cost <> 0.00;

SELECT min(side_cost)
FROM orders
WHERE side IS NOT NULL;

-- SELECT side, count(id) FROM orders
--   WHERE side IS NOT NULL
--   GROUP BY side;

SELECT side, count(id) FROM orders
  WHERE side = 'Fries'
  OR side = 'Onion Rings'
  GROUP BY side;