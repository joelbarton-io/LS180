-- ALTER TABLE films ALTER COLUMN * SET NOT NULL;
ALTER TABLE films ALTER COLUMN title SET NOT NULL,
                  ALTER COLUMN year SET NOT NULL,
                  ALTER COLUMN genre SET NOT NULL,
                  ALTER COLUMN director SET NOT NULL,
                  ALTER COLUMN duration SET NOT NULL;

-- @block
ALTER TABLE films ADD CONSTRAINT title_unique UNIQUE (title);

-- @block
ALTER TABLE films DROP CONSTRAINT title_unique;

-- @block
ALTER TABLE films
ADD CONSTRAINT at_least_one
CHECK (length(title) > 0);

-- @block
INSERT INTO films (title, year, genre, director, duration) VALUES ('', 2022, 'fantasy', 'somebody_dumb', 123456);

-- @block
ALTER TABLE films DROP CONSTRAINT at_least_one;

-- @block
ALTER TABLE films
ADD CONSTRAINT proper_range
CHECK(year BETWEEN 1900 AND 2100);

-- @block
ALTER TABLE films
ADD CONSTRAINT at_least_three
CHECK(char_length(director) >= 3 AND position(' ' in director) <> 0);

-- @block
UPDATE films
SET director = 'Johnny'
WHERE title = 'Die Hard';

-- @block
CREATE TABLE testing (
  id serial,
  attribute varchar(255) DEFAULT NULL
);

ALTER TABLE testing
ADD CONSTRAINT not_null
CHECK(attribute IS NOT NULL);
