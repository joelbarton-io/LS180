-- select students.name from students
-- full join classes on students.class_id = classes.id
-- where (date_part('year', year_of_birth) BETWEEN 1990 AND 1999)
-- AND students.class_id = 2;

-- create table students (
--   id serial primary key,
--   name varchar(255),
--   year_of_birth date,
--   phone_num char(10),
--   class_id int
-- );

-- insert into students (name, year_of_birth, phone_num, class_id) values
-- ('Harry', '1987-02-04', 909432987, 1),
-- ('Ben  ', '1976-11-13', 099876567, 2),
-- ('Marry', '1995-03-21', 098787654, 3),
-- ('Marry', '1995-03-21', 908675356, 2);


-- alter table students
-- alter column name
-- SET DEFAULT 'anonymous';

-- alter table students
-- add Check(class_id > 0);

-- alter table students
-- add unique (phone_num);

-- alter table students
-- alter column year_of_birth
-- SET NOT NULL;

-- CREATE TABLE some_table(
--   name varchar(50) CHECK(length(name)> 1),
--   last_name varchar(100)
-- );

-- alter table students
-- add column average_points integer;



-- update students
-- set average_points = 6 where id = 2;
-- update students
-- set average_points = 7 where id = 3;
-- update students
-- set average_points = 0 where id = 4;

-- create type grade AS enum ('A', 'B', 'C', 'D', 'F');

-- alter table students
-- alter column highest_grade TYPE grade
-- USING highest_grade::grade;

-- alter table students alter column highest_grade drop default;

-- update students
-- set highest_grade = 'F'
-- where id = 1;


-- alter table students
-- add check(average_points BETWEEN 0.0 AND 9.9);

-- alter table students
-- alter column highest_grade
-- drop not null;

-- insert into students (name, year_of_birth) VALUES
-- ('John', now()),
-- ('Jon', CURRENT_TIMESTAMP);

-- create table ex_1 (
--   id serial primary key,
--   name varchar(255),
--   age INT
--   check(name IS NOT NULL),
--   check(age IS NOT NULL)
-- );

-- insert into ex_1 (name, age) values ('joel', DEFAULT);

-- alter table ex_1
-- alter column age
-- SET Default NULL;










































-- create table a (
--   name text
-- );

-- create table b (
--   age text,
--   name text references a
-- );

psql -d residents < resi.sql







-- select distinct split_part(email, '@', 2) as domain, count(id) from people
-- group by domain
-- order by count desc;




-- insert into users (name) values ('bruce');











select orders.ord_no, purch_amt, ord_date, customer_id, salesman_id from salesman
full join orders on salesman.salesman_id = orders.salesman_id
where salesman.name = 'Paul Adam';