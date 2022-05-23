-- @block
CREATE TABLE Users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  email VARCHAR(255),
  bio TEXT,
  country CHAR(2)
);

-- @block
INSERT INTO Users (email, bio, country)
VALUES (
  'joelbarton@gmail.com',
  'blogger',
  'US'
);

-- @block
INSERT INTO Users (email, bio, country)
VALUES (
  'rich@hotmail.com',
  'doctor',
  'RU'
);

-- @block
SELECT * FROM Users;

-- @block
SELECT id, email, country FROM Users
WHERE email LIKE '%gmail%';

-- @block

CREATE TABLE Rooms (
  id INT AUTO_INCREMENT,
  street VARCHAR(255),
  owner_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (owner_id) REFERENCES Users(id)
);

-- @block
INSERT INTO Rooms (owner_id, street)
VALUES
    (1, 'san diego sailboat'),
    (1, 'nantucket cottage'),
    (1, 'vail cabin'),
    (1, 'sf cardboard box');

-- @block
SELECT * FROM USERS
LEFT JOIN ROOMS
ON Rooms.owner_id = Users.id;

-- @block
SELECT * FROm Users;