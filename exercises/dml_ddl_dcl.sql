CREATE TABLE people (
  id serial,
  name varchar(25),
  age int CHECK (age > 0),
  occupation varchar(25)
);
INSERT INTO people (name, age, occupation)
  VALUES
  ('Abby', 34, 'biologist'),
  ('Mu''nisah', 26, NULL),
  ('Mirabelle', 40, 'contractor');

CREATE TABLE birds (
  name varchar(255),
  length numeric(3,1),
  wingspan numeric(3,1),
  family varchar(255),
  extinct BOOLEAN
);

INSERT INTO birds (name, length, wingspan, family, extinct)
  VALUES
    ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', true),
    ('American Robin', 25.5, 36.0, 'Turdidae', false),
    ('Greater Koa Finch', 19.0, 24.0, 'Fringillidae', true),
    ('Carolina Parakeet', 33.0, 55.8, 'Psittacidae', true),
    ('Common Kestrel', 35.5, 73.5, 'Falconidae', false);

UPDATE birds SET extinct = false WHERE family = 'Emberizidae';

SELECT name, family
  FROM birds
  WHERE extinct = false
  ORDER BY length DESC;

SELECT round(avg(wingspan), 1) as avg, min(wingspan), max(wingspan) FROM birds;

CREATE TABLE menu_items (
  item varchar(255),
  prep_time int,
  ingredient_cost numeric(4,1),
  sales int,
  menu_price numeric(4,1)
);
INSERT INTO menu_items (item, prep_time, ingredient_cost, sales, menu_price)
  VALUES
    ('omelette', 10, 1.50, 182, 7.99),
    ('tacos', 5, 2.00, 254, 8.99),
    ('oatmeal', 1, 0.50, 79, 5.99);

ALTER TABLE menu_items
ALTER COLUMN ingredient_cost TYPE decimal(4,2);

SELECT item, (menu_price - ingredient_cost) as profit
FROM menu_items
ORDER BY profit DESC LIMIT 1;

SELECT item, menu_price, round(prep_time/60.0 * 13.0,2) as labor,
       menu_price - ingredient_cost - round(prep_time/60.0 * 13.0, 2) as profit
    FROM menu_items
ORDER BY profit DESC;

