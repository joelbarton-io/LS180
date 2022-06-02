CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items (
  id SERIAL PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6, 2) NOT NULL CHECK (initial_price <= 1000.00),
  sales_price numeric(6, 2) CHECK (sales_price <= 1000.00)
);

CREATE TABLE bids (
  id SERIAL PRIMARY KEY,
  bidders_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
  amount numeric(6, 2) NOT NULL CHECK (amount <= 1000.00)
);

CREATE INDEX ON bids (bidders_id, item_id);


SELECT name AS "Bid on Items" FROM items WHERE id IN
(SELECT DISTINCT item_id FROM bids);

SELECT name FROM bidders WHERE EXISTS
(SELECT 1 FROM bids WHERE bidders.id = bids.bidders_id);

SELECT DISTINCT name FROM bidders
JOIN bids ON bidders.id = bids.bidders_id;


SELECT max(num_of_bids.count) FROM
(SELECT bidders.name, count(bids.bidders_id) FROM bids
JOIN bidders ON bids.bidders_id = bidders.id
GROUP BY bidders.name) AS num_of_bids;

-- SELECT name, count((SELECT count(bids.id) FROM bids WHERE bidders.id = bids.id))
-- FROM bidders GROUP BY name;

-- SELECT DISTINCT name, count(bids.id) FROM bids
-- JOIN bidders ON bids.bidders_id = bidders.id
-- GROUP BY name;

SELECT DISTINCT items.name, count(bids.id) FROM bids
JOIN items ON bids.item_id = items.id
GROUP BY items.name;

SELECT DISTINCT items.name,
(SELECT count(bids.id) FROM bids WHERE items.id = bids.item_id)
FROM items GROUP BY items.name, items.id;

SELECT name,
  (SELECT count(item_id) FROM bids WHERE item_id = items.id)
FROM items;

SELECT items.name,
(SELECT count(bids.id) FROM bids WHERE items.id = bids.item_id)
FROM items; GROUP BY items.name, items.id;

SELECT id FROM items
WHERE (name, initial_price, sales_price)
= ('Painting', 100.00, 250.00);

ALTER TABLE bids
RENAME COLUMN bidders_id TO bidder_id;

SELECT users.name AS "Admins" FROM users
  JOIN user_roles ON users.id = user_roles.user_id
  WHERE user_roles.role = 'Admin';
