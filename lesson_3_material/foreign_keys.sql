/*
ALTER TABLE orders ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES products(id);

INSERT INTO products (name)
  VALUES
    ('small bolt'),
    ('large bolt');
INSERT INTO orders (product_id, quantity)
  VALUES
    (1, 10),
    (1, 25),
    (2, 15);

SELECT o.quantity, p.name
FROM orders AS o
LEFT OUTER JOIN products AS p
ON o.product_id = p.id;

INSERT INTO orders (quantity) VALUES (123456);

ALTER TABLE orders ALTER COLUMN product_id SET NOT NULL;

DELETE FROM orders WHERE id = 4;
*/

CREATE TABLE reviews (
  id serial PRIMARY KEY,
  review text NOT NULL,
  product_id int REFERENCES products (id)
);

INSERT INTO reviews (review, product_id)
  VALUES
    ('a little small', 1),
    ('very round!', 1),
    ('could have been smaller', 2);