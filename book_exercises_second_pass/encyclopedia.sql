create table customers (
  id serial PRIMARY KEY,
  -- email_id varchar(50) REFERENCES email_addresses(id),
  name varchar(100)
);

create table email_addresses (
  id serial PRIMARY KEY,
  customer_id int REFERENCES customers(id),
  email varchar(100)
);

insert into customers (id, name, email_id) VALUES
(3, 'Natasha O''Shea', 'natasha@osheafamily.com')
(1, 'James Bergman' , 'james1998@email.com')
(4, 'Aaron Muller', NULL)
