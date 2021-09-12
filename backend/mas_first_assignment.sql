
DROP TABLE IF EXISTS users;

CREATE TABLE users (
username VARCHAR(20) NOT NULL UNIQUE,
password VARBINARY(100)
);

INSERT INTO users VALUES ("admin", "admin");
