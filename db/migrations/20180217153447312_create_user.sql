-- +micrate Up
CREATE TABLE users (
  id INTEGER NOT NULL PRIMARY KEY,
  email VARCHAR,
  username VARCHAR,
  name VARCHAR,
  address VARCHAR,
  hashed_password VARCHAR,
  verified BIT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS users;
