-- +micrate Up
CREATE TABLE discount_codes (
  id INTEGER NOT NULL PRIMARY KEY,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS discount_codes;
