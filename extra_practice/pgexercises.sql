-- @block
SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE joindate >= '2012-09-01';

-- @block
SELECT surname FROM cd.members
WHERE surname IS UNIQUE
LIMIT 10;

-- @block
SELECT m.surname FROM cd.members AS m
UNION
SELECT f.name FROM cd.facilities AS f;
