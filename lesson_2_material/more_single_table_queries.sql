-- @block
SELECT DISTINCT state, count(state)
FROM people
GROUP BY state
ORDER BY count(state) DESC LIMIT 10;

-- @block
SELECT substr('PennyJGuerrero@teleworm.us', position('@' in 'PennyJGuerrero@teleworm.us'));

SELECT substr(email, position('@' in email) + 1) as domain, count(id)
FROM people
GROUP BY domain
ORDER BY count DESC
LIMIT 10;

-- @block
DELETE FROM people WHERE id = 3399;
-- @block
SELECT given_name, id FROM people WHERE state = 'CA';

DELETE FROM people WHERE state = 'CA';

SELECT state, count(id) FROM people
WHERE state = 'CA' GROUP BY state ORDER BY count;
-- @block
UPDATE people SET given_name = upper(given_name)
WHERE email LIKE '%teleworm.us';

SELECT given_name FROM people
WHERE email LIKE '%teleworm.us';
-- @block
TRUNCATE people;
