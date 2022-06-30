- sequences (CREATE SEQUENCE s_name)
- enum types (CREATE TYPE t_name AS ENUM ('joel', 'luke', ...))
  - -> (ALTER TABLE t_name ALTER c_name TYPE c_type USING c_type:t_name)

- in subqueries using `EXISTS` vs `IN` (subquery operators in general, should review them)
- row-wise comparison, row constructors

- multi column indices
- combined unique constraint

- types of entity relationships (one-to-one, ...)
- grouping by multiple columns

- sequences

- using count() in the ORDER BY clause
- `select NULL IS NOT NULL` -> returns f (false?)
- inserting null value into column with type boolean and default boolean

- using the `%` operator in where conditional
- working with dates and date functions (still shake-y)

- cardinality's usefulness (as represented in ERDs) for informing database design
- using a table constraint vs a column constraint (is there an impact on schema)


