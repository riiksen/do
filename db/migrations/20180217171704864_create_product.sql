-- +micrate Up
CREATE TABLE products (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR,
  cost FLOAT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS products;
