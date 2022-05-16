SELECT population FROM countries WHERE name = 'USA';

SELECT population, capital FROM countries;

SELECT name FROM countries ORDER BY name ASC;

SELECT name, capital FROM countries ORDER BY population;

SELECT name, binomial_name, max_weight_kg, max_age_years
  FROM animals
  ORDER BY max_age_years, max_weight_kg, name DESC;

SELECT name FROM countries WHERE population > 70000000;

SELECT name FROM countries WHERE population > 70000000 AND population < 200000000;

SELECT first_name, last_name FROM celebrities where deceased <> true OR deceased IS NULL;

SELECT first_name, last_name FROM celebrities WHERE occupation ILIKE '%Singer%';

SELECT first_name, last_name
  FROM celebrities
  WHERE occupation ILIKE '%act%';

SELECT first_name, last_name
  FROM celebrities
  WHERE occupation ILIKE '%act%' -- WHERE (occupation LIKE '%Actor%' OR occupation LIKE '%Actress%')
    AND occupation ILIKE '%sing%';

SELECT burger
  FROM orders
  WHERE burger_cost < 5.0
  ORDER BY burger_cost ASC;

SELECT customer_name, customer_email, customer_loyalty_points
  FROM orders
  WHERE customer_loyalty_points >= 20
  ORDER BY customer_loyalty_points DESC;

SELECT burger FROM orders
  WHERE customer_name = 'Natasha O''Shea';

SELECT customer_name FROM orders
  WHERE drink IS NULL;

-- SELECT burger, side, drink FROM orders
--   WHERE burger IS NOT NULL
--   AND (side <> 'Fries' AND side IS NOT NULL)
--   AND drink IS NOT NULL;
SELECT burger, side, drink FROM orders
  WHERE side != 'Fries'
  OR side IS NULL;

SELECT burger, side, drink FROM orders
  WHERE side IS NOT NULL
  AND drink IS NOT NULL;

