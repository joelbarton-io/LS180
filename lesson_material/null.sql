CREATE TABLE employees (
    first_name character varying(100),
    last_name character varying(100),
    department character varying(100),
    vacation_remaining integer
);

ALTER TABLE employees ALTER COLUMN department SET DEFAULT 'unassigned';
UPDATE employees SET department = 'unassigned' WHERE department IS NULL;
ALTER TABLE employees ALTER COLUMN department SET NOT NULL;

-- @block
CREATE TABLE temperatures (
  date date NOT NULL,
  low int NOT NULL,
  high int NOT NULL
);

-- @block
INSERT INTO temperatures --(date, low, high)
  VALUES
    ('2016-03-01', 34, 43),
    ('2016-03-02', 32, 44),
    ('2016-03-03', 31, 47),
    ('2016-03-04', 33, 42),
    ('2016-03-05', 39, 46),
    ('2016-03-06', 32, 43),
    ('2016-03-07', 29, 32),
    ('2016-03-08', 23, 31),
    ('2016-03-09', 17, 28);

-- @block
SELECT date, round((low + high) / 2.0, 1) as average
FROM temperatures WHERE date BETWEEN '2016-03-02' AND '2016-03-08';

-- @block
ALTER TABLE temperatures
ALTER COLUMN rainfall TYPE numeric(6,3);

INSERT INTO temperatures (rainfall)
  VALUES
    CASE
      WHEN (round((low + high) / 2.0, 1) - 35) > 0 THEN
        (round((low + high) / 2.0, 1) - 35)
      ELSE
        (0)
    END;

UPDATE temperatures
  SET rainfall = (high + low) / 2 - 35
  WHERE (high + low) / 2 > 35;

-- @block
UPDATE temperatures
  SET rainfall = round(((high + low) / 2 - 35) / 25.400, 3)
  WHERE (high + low) / 2 > 35;

-- @block
ALTER TABLE temperatures RENAME TO weather;

ALTER TABLE temperatures RENAME COLUMN x TO y;