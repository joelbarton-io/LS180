
CREATE TABLE renter_properties (
  id serial PRIMARY KEY, -- UNIQUE NOT NULL
  r_id integer REFERENCES renters(id),
  p_id integer,

  FOREIGN KEY (p_id) REFERENCES properties(id)
);


ALTER TABLE renter_properties
DROP CONSTRAINT renter_properties_r_id_fkey,
ADD FOREIGN KEY (r_id) REFERENCES renters(id) ON DELETE CASCADE;



ALTER TABLE renter_properties
DROP CONSTRAINT renter_properties_p_id_fkey,
ADD CONSTRAINT p_id_f_key FOREIGN KEY (p_id) REFERENCES properties(id) ON DELETE CASCADE;


DELETE FROM renter_properties WHERE id = 2;

ALTER TABLE renter_properties
DROP CONSTRAINT p_id_f_key,
ADD CONSTRAINT p_id_f_key FOREIGN KEY (p_id) REFERENCES properties(id);

ALTER TABLE renter_properties
ALTER COLUMN p_id
ADD CONSTRAINT on_delete ON DELETE CASCADE;


SELECT first_name, last_name, salary FROM employees
WHERE salary > (SELECT salary FROM employees WHERE last_name = 'Bull')