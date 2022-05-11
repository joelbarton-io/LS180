createdb database_one
psql -d database_one
CREATE DATABASE database_two;
\c database_two
\list
DROP DATABASE database_two;
dropdb database_one; dropdb ls_burger