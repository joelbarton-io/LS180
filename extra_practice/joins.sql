-- @block
SELECT firstname, surname, joindate
  FROM cd.members WHERE joindate =
  (SELECT MAX(joindate) FROM cd.members);

-- @block

SELECT starttime
  FROM cd.bookings AS b
  JOIN cd.members AS m
  ON m.memid = b.memid
  WHERE m.firstname = 'David'
    AND m.surname = 'Farrell';

SELECT starttime
  FROM
    cd.bookings b
    cd.members m
  WHERE
    m.memid = b.memid
    AND m.firstname = 'David'
    AND m.surname = 'Farrell';

-- @block
SELECT b.starttime, f.name
        FROM
                cd.facilities f
                JOIN cd.bookings b
                        ON f.facid = b.facid
        WHERE
                f.name in ('Tennis Court 2','Tennis Court 1')
                AND b.starttime >= '2012-09-21'
                AND b.starttime < '2012-09-22'
ORDER BY b.starttime;


-- @block
SELECT DISTINCT recs.firstname, recs.surname
  FROM cd.members mems
    INNER JOIN cd.members recs
      ON recs.memid = mems.recommendedby
ORDER BY surname, firstname;

-- @block
SELECT mems.firstname as memfname, mems.surname as memsname, recs.firstname as recfname, recs.surname as recsname
  FROM cd.members mems
    LEFT OUTER JOIN cd.members recs
      ON recs.memid = mems.recommendedby
ORDER BY memsname, memfname;

select mems.firstname as memfname, mems.surname as memsname, recs.firstname as recfname, recs.surname as recsname
	from
		cd.members mems
		left outer join cd.members recs
			on recs.memid = mems.recommendedby
order by memsname, memfname;

-- @block
SELECT DISTINCT mem.firstname || ' ' || mem.surname as member,
fac.name as facility
  FROM cd.bookings bk

  INNER JOIN cd.members mem
    ON bk.memid = mem.memid
  INNER JOIN  cd.facilities fac
    ON bk.facid = fac.facid
  WHERE fac.name LIKE 'Tennis Court %'
ORDER BY member, facility;

-- @block

SELECT m.firstname || ' ' || m.surname as member, f.name facility,
cost =
CASE
  WHEN
FROM cd.members m
INNER JOIN cd.bookings b
  ON m.memid = b.memid
INNER JOIN cd.facilities f
  ON b.facid = f.facid;




-- @block
SELECT DISTINCT m.firstname ||' '|| m.surname as member,
  (SELECT r.firstname ||' '|| r.surname as recommender
    FROM cd.members r
    WHERE r.memid = m.recommendedby
  )
  FROM cd.members m
ORDER BY member;
