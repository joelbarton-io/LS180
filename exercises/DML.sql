CREATE TABLE devices (
  id serial PRIMARY KEY,
  name varchar(255) NOT NULL, -- text
  created_at timestamp DEFAULT now() -- CURRENT_TIMESTAMP
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer UNIQUE NOT NULL,
  device_id integer REFERENCES devices (id)
);

INSERT INTO devices (name) VALUES ('Accelerometer'), ('Gyroscope');

INSERT INTO parts (part_number, device_id)
  VALUES (23, 1), (24, 1), (25, 1),
         (26, 2), (27, 2), (28, 2), (29, 2), (30, 2);

INSERT INTO parts (part_number)
  VALUES (31), (32);

SELECT d.name, p.part_number FROM devices AS d
  JOIN parts AS p
  ON d.id = p.device_id;

SELECT * FROM parts AS p
WHERE p.part_number::varchar(255) LIKE '3%';

SELECT d.name, count(p.device_id) FROM devices AS d
LEFT JOIN parts AS p ON d.id = p.device_id GROUP BY d.name;

SELECT d.name, count(p.device_id) AS part_count FROM devices AS d
LEFT JOIN parts AS p ON d.id = p.device_id
GROUP BY d.name ORDER BY d.name DESC;

SELECT part_number, device_id FROM parts
WHERE device_id IS NULL;

INSERT INTO devices (name) VALUES ('Magnetometer');
INSERT INTO parts (part_number, device_id) VALUES (33, 3);

SELECT name FROM devices
-- GROUP BY name
ORDER BY created_at ASC LIMIT 1;

UPDATE parts
SET device_id = 1
WHERE id in(7, 8);

UPDATE parts
SET device_id = 2
WHERE part_number = (
  SELECT min(part_number)
  FROM parts
  );

DELETE FROM devices
WHERE name = 'Accelerometer'
CASCADE;