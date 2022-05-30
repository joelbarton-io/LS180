ALTER TABLE books_categories
ALTER COLUMN category_id
SET NOT NULL;

ALTER TABLE books_categories
ADD CONSTRAINT books_categories_book_id_fk
FOREIGN KEY (book_id)
REFERENCES books (id)
ON DELETE CASCADE;

ALTER TABLE books_categories
ADD CONSTRAINT books_categories_category_id_fk
FOREIGN KEY (category_id)
REFERENCES categories (id)
ON DELETE CASCADE;

-- @block
SELECT b.id, b.author, string_agg(c.name, ', ')
    AS categories FROM books AS b

  JOIN books_categories AS bc
    ON b.id = bc.book_id
  JOIN categories AS c
    ON bc.category_id = c.id

GROUP BY b.id
ORDER BY b.id;

-- @block
CREATE TYPE genre AS ENUM()

-- @block
ALTER TABLE books
ALTER COLUMN title TYPE varchar(50);

INSERT INTO books (author, title)
  VALUES
    ('Lynn Sherr', 'Sally Ride: America''s First Woman in Space'),
    ('Charlotte Brontë', 'Jane Eyre'),
    ('Meeru Dhalwala and Vikram Vij',	'Vij''s: Elegant and Inspired Indian Cuisine');

INSERT INTO categories (name)
  VALUES
    ('Space Exploration'),
    ('Cookbook'),
    ('South Asia');

INSERT INTO books_categories (book_id, category_id)
  VALUES
    (7, 5),
    (7, 1),
    (7, 7),
    (8, 2),
    (8, 4),
    (9, 8),
    (9, 1),
    (9, 9);

-- SELECT unnest('Biography, Nonfiction, Space Exploration', ', ');

-- @block
SELECT c.name, count(bc.category_id), string_agg(b.title, ', ') FROM categories AS c

LEFT JOIN books_categories AS bc
ON c.id = bc.category_id

JOIN books AS b
ON bc.book_id = b.id

GROUP BY c.name
ORDER BY c.name ASC;

