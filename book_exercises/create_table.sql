createdb encyclopedia; psql -d encyclopedia
...

CREATE TABLE animals (
  id serial,
  name varchar(100) NOT NULL,
  binomial_name varchar(100) NOT NULL,
  max_weight_kg decimal(8, 3),
  max_age_years integer,
  conservation_status char(2)
);

\dt (from inside encyclopedia; psql console)

\d animals

createdb ls_burger; psql -d ls_burger

CREATE TABLE orders(
  id serial,
  customer_name varchar(100) NOT NULL,
  burger varchar(50),
  side varchar(50),
  drink varchar(50),
  order_total decimal(4, 2) NOT NULL
);