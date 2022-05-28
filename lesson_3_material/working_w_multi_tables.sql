-- @block
SELECT count(id) FROM tickets;

-- @block
SELECT count(DISTINCT customer_id) FROM tickets;

SELECT count(DISTINCT c.id)
FROM customers AS c
FULL OUTER JOIN tickets AS t
ON c.id = t.customer_id
WHERE t.id IS NOT NULL;

-- @block
-- ticket_buyer / total customers
SELECT round(count(DISTINCT t.customer_id)
      / count(DISTINCT c.id), 2)
      AS percent
FROM customers AS c

LEFT JOIN tickets AS t ON c.id = t.customer_id;


-- @block
SELECT e.name, count(t.id) AS popularity
  FROM tickets AS t
  LEFT JOIN events AS e
  ON t.event_id = e.id
  GROUP BY e.name ORDER BY popularity DESC;

-- @block
-- customers, tickets
SELECT
  c.id,
  c.email,
  count(t.id),
  count(c.id)

FROM customers AS c

RIGHT JOIN tickets AS t
  ON c.id = t.customer_id

GROUP BY c.id ORDER BY c.id;
  -- HAVING count(t.id) = 3-- number_of_tickets = 3
-- @block
-- events, tickets, customers,  seats, sections,
SELECT
  e.name AS event,
  e.starts_at,
  sec.name AS section,
  s.row,
  s.number AS seat
FROM tickets AS t
JOIN customers AS c ON t.customer_id = c.id
JOIN events AS e ON t.event_id = e.id
JOIN seats AS s ON t.seat_id = s.id
JOIN sections AS sec ON s.section_id = sec.id
WHERE c.email = 'gennaro.rath@mcdermott.co';
