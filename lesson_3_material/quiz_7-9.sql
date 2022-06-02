CREATE TABLE library_users (
  id serial PRIMARY KEY,
  name text NOT NULL
);
INSERT INTO library_users (name)
VALUES
('Linda Phillips'),
('Natalie Bradley'),
('Javier Dean'),
('Alma Flores'),
('Jessie Meyer');


CREATE TABLE books (
  id serial PRIMARY KEY,
  name text NOT NULL,
  author varchar(50) NOT NULL,
  isbn integer NOT NULL
);

INSERT INTO books (name, author, isbn)
VALUES
('On the Road',	'Jack Kerouac', '9780140283297'),
('A Game of Thrones', 'George R. R. Martin', '9780553593716'),
('The Da Vinci Code', 'Dan Brown', '9780307474278'),
('The Handmaid''s Tale', 'Margaret Atwood', '9780385490818'),
('Jazz', 'Toni Morrison', '9781400076215'),
('1Q84',	'Haruki Murakami', '9780307476463');


CREATE TABLE checkouts (
  id serial PRIMARY KEY,
  user_id integer NOT NULL REFERENCES library_users (id),
  book_id integer NOT NULL REFERENCES books (id),
  checkout_date date NOT NULL,
  return_date date
);


INSERT INTO checkouts (user_id, book_id, checkout_date, return_date)
VALUES
(3, 1, '2016-02-15', '2016-03-11'),
(3, 2, '2016-03-11', '2016-05-02'),
(5, 5, '2017-11-25', '2017-12-18'),
(1, 4, '2017-12-22', NULL),
(4, 6, '2018-01-02', NULL);

SELECT DISTINCT library_users.name FROM checkouts
JOIN library_users ON checkouts.user_id = library_users.id;

SELECT library_users.name AS "User Name", books.name AS "Books Checked Out"
FROM library_users
LEFT JOIN checkouts ON library_users.id = checkouts.user_id
FULL JOIN books ON checkouts.book_id = books.id; -- FULL

