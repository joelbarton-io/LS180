-- @block
SELECT countries.name, continents.continent_name
FROM countries JOIN continents
ON countries.continent_id = continents.id;

-- @block
SELECT countries.name, countries.capital
FROM countries JOIN continents
ON countries.continent_id = continents.id
WHERE continents.continent_name = 'Europe';

-- @block
SELECT s.first_name FROM singers AS s
  WHERE s.id IN (
      SELECT a.singer_id FROM albums AS a WHERE a.label = 'Warner Bros'
  );

-- @block
SELECT s.first_name, s.last_name, a.album_name, a.released
FROM singers s JOIN albums a
ON s.id = a.singer_id
WHERE a.released >= '1980-01-01'
AND a.released < '1990-01-01'
AND s.deceased = false
ORDER BY s.date_of_birth DESC;

-- @block
SELECT s.first_name, s.last_name FROM singers s
JOIN albums a ON s.id = a.singer_id
WHERE a.id IS NULL;

-- @block
SELECT s.first_name, s.last_name FROM singers s
WHERE s.id NOT IN (
  SELECT a.singer_id FROM albums a
);

-- @block
SELECT o.*, products.* FROM orders o
JOIN order_items
ON o.id = order_items.order_id
JOIN products
ON order_items.product_id = products.product_id;

-- @block
SELECT oi.order_id FROM order_items AS oi
WHERE oi.product_id = 5;

-- @block


-- @block
SELECT c.id AS customer_id, c.customer_name, o.id AS order_id_number, oi.product_id, p.product_name, p.product_cost
FROM customers c
JOIN orders o
ON c.id = o.customer_id
JOIN order_items oi
ON o.id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
WHERE c.customer_name = 'Natasha O''Shea';

-- @block
SELECT SUM(p.product_cost) as total_cost
FROM customers c
JOIN orders o
ON c.id = o.customer_id
JOIN order_items oi
ON o.id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id
WHERE c.customer_name = 'Natasha O''Shea';


-- @block
SELECT p.product_name, COUNT(oi.id)
FROM products AS p JOIN order_items AS oi
ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY p.product_name ASC;

