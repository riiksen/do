-- +micrate Up
CREATE TABLE orders (
  id INTEGER NOT NULL PRIMARY KEY,
  user_id BIGINT,
  address VARCHAR,
  cost FLOAT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX order_user_id_idx ON orders (user_id);

-- +micrate Down
DROP TABLE IF EXISTS orders;
