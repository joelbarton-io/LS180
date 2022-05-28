CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(25) NOT NULL UNIQUE,
  distance integer NOT NULL,
  spectral_type char(1),
  companions integer NOT NULL

  CONSTRAINT distance_non_zero CHECK (distance > 0)
  CONSTRAINT spectral_is_uppercase CHECK (spectral_type = upper(spectral_type))
  CONSTRAINT non_negative_companion_count CHECK (companions > 0)
);

CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1) UNIQUE,
  mass integer

  CONSTRAINT designation_is_lowercase CHECK (designation = lower(designation))
);

ALTER TABLE planets
  ADD COLUMN star_id integer NOT NULL REFERENCES stars (id);

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

ALTER TABLE stars
ALTER COLUMN distance TYPE numeric;

ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;

CREATE TYPE spectrals AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check;

CREATE TYPE spectrals AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
ALTER COLUMN spectral_type TYPE spectrals
USING spectral_type::spectrals;


ALTER TABLE planets
ALTER COLUMN mass TYPE numeric,
ALTER COLUMN mass SET NOT NULL,
ALTER COLUMN designation SET NOT NULL,
ADD CONSTRAINT mass_is_positive CHECK (mass > 0.0);

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation integer NOT NULL CHECK (designation > 0),
  semi_major_axis numeric CHECK (semi_major_axis > 0.0),
  mass numeric CHECK (mass > 0.0),
  planet_id integer NOT NULL REFERENCES planets (id)
);