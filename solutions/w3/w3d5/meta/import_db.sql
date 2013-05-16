CREATE TABLE owners (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL
);

CREATE TABLE cats (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  age INTEGER NOT NULL,
  owner INTEGER
);

INSERT INTO owners (fname, lname)
VALUES ("Devon", "Watts"), ("John", "Beck");

INSERT INTO cats (fname, lname, age, owner)
VALUES ("Earl", "Watts", 3, 1), ("Kiki", "Beck", 16, 2);
