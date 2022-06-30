SQL
- Identify the different types of JOINs and explain their differences.
  LEFT OUTER -> all data from LEFT table as well as the matched data based on ON clause
  INNER -> match records from two tables based on ON clause -> result table only has matches
  FULL OUTER -> combination of left/right joins
  CROSS -> every record combination from both tables (cartesian prod)


- Name and define the three sublanguages of SQL and be able to classify different statements by sublanguage.
- 1. DDL:CREATE, ALTER, DROP -> involves schema (physical level)
- 2. DML:SELECT, UPDATE, INSERT INTO, DELETE -> involves creation, reading, updating, and deleting DATA
- 3. DCL:GRANT, REVOKE -> involves security, permissions, users.


relation/entity VS schema

DATA integrity??

Three types of anomolies:
  - update/delete/__ anomolies
  - can be avoided with pkey/fkey

renter (id)
join table (id, r_id, p_id)
properties (id)

ADDING ON DELETE CASCADE constraint steps
  - drop constraint
  - added new foreign key with appropriate constraint

- Write SQL statements using INSERT, UPDATE, DELETE, CREATE/ALTER/DROP TABLE, ADD/ALTER/DROP COLUMN.

- Understand how to use GROUP BY, ORDER BY, WHERE, and HAVING.
  - count(), string_agg() -> aggregate functions

SELECT count(properties) FROM renters WHERE name = 'chris';

SELECT count(properties), name FROM renters WHERE price > 500,000 GROUP BY name;

- Understand how to create and remove constraints, including CHECK constraints
  - 
  -
- Be familiar with using subqueries







PostgreSQL
- Describe what a sequence is and what they are used for.
- Create an auto-incrementing column.
- Define a default value for a column.
- Be able to describe what primary, foreign, natural, and surrogate keys are.
- Create and remove CHECK constraints from a column.
- Create and remove foreign key constraints from a column.

Database Diagrams
- Talk about the different levels of schema.
- Define cardinality and modality.
- Be able to draw database diagrams using crow's foot notation.
