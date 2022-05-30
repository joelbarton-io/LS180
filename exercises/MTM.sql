CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) NOT NULL CHECK (payment_token ~ '^[A-Z]{8}$')
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) NOT NULL CHECK (price >= 0.00)
);

INSERT INTO customers (name, payment_token)
  VALUES
    ('Pat Johnson', 'XHGOAHEQ'),
    ('Nancy Monreal','JKWQPJKL'),
    ('Lynn Blake', 'KLZXWEEE'),
    ('Chen Ke-Hua', 'KWETYCVX'),
    ('Scott Lakso', 'UUEAPQPS'),
    ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services (description, price)
  VALUES
    ('Unix Hosting'      , 5.95),
    ('DNS'                 , 4.95),
    ('Whois Registration'  , 1.95),
    ('High Bandwidth'      , 15.00),
    ('Business Support'    , 250.00),
    ('Dedicated Hosting'   , 50.00),
    ('Bulk Email'         , 250.00),
    ('One-to-one Training' , 999.00);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id integer
    REFERENCES customers (id)
    ON DELETE CASCADE
    NOT NULL,
  service_id integer
    REFERENCES services (id)
    NOT NULL,
  UNIQUE(customer_id, service_id)
);

-- @block
INSERT INTO customers_services (customer_id, service_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (3, 1),
    (3, 2),
    (3, 3),
    (3, 4),
    (3, 5),
    (4, 1),
    (4, 4),
    (5, 1),
    (5, 6),
    (6, 1),
    (6, 2),
    (6, 6);

SELECT DISTINCT c.* FROM customers AS c
  JOIN customers_services AS cs;
  ON c.id = cs.customer_id;
  -- GROUP BY c.id;

SELECT c.* FROM customers AS c
  LEFT JOIN customers_services AS cs
         ON c.id = cs.customer_id
  WHERE cs.service_id IS NULL;

SELECT s.description FROM customers_services AS cs
  RIGHT JOIN services AS s
          ON cs.service_id = s.id
  WHERE cs.service_id IS NULL;

SELECT c.name, string_agg(s.description, ', ') AS services
FROM customers AS c
  LEFT JOIN customers_services AS cs
         ON c.id = cs.customer_id
  LEFT JOIN services AS s
         ON cs.service_id = s.id
  GROUP BY c.name;

SELECT description, count(cs.service_id) -- initially-> cs.customer_id
FROM services AS s
  JOIN customers_services AS cs
    ON s.id = cs.service_id
GROUP BY description
HAVING count(cs.customer_id) > 2;

SELECT sum(price) AS gross
FROM services AS s
  JOIN customers_services AS cs
    ON s.id = cs.service_id;

INSERT INTO customers (name, payment_token) VALUES ('John Doe', 'EYODHLCN');

INSERT INTO customers_services (customer_id, service_id)
VALUES (7, 1), (7, 2), (7, 3);


SELECT * FROM customers_services
JOIN services ON customers_services.service_id = services.id
WHERE price > 100;


SELECT * FROM customers
LEFT JOIN customers_services ON customers.id = customers_services.customer_id
JOIN services ON customers_services.service_id = services.id;
WHERE

*

* count(DISTINCT customers)

SELECT (sum(price) *
  (SELECT count(id) FROM customers)) FROM services
WHERE price > 100.00;

SELECT SUM(price)
FROM customers
CROSS JOIN services
WHERE price > 100;

DELETE FROM customers
WHERE id = 4;

DELETE FROM services
WHERE id = 7;