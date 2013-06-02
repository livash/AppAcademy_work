CREATE TABLE professors (
	id INTEGER PRIMARY KEY,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	department_id INTEGER NOT NULL,
	FOREIGN KEY(department_id) REFERENCES departments(id)
);

CREATE TABLE departments (
	id INTEGER PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

INSERT INTO departments ('name')
VALUES ('mathematics'), ('physics');

INSERT INTO professors ('first_name', 'last_name', 'department_id')
VALUES ('Albert', 'Einstein', 2), ('Max', 'Plank', 2),
('Kurt', 'Godel', 1), ('Isaac', 'Newton', 2), ('no_name', 'no_lname', 2),
('Nils', 'Bohr', 2), ('Marie', 'Kuri', 2), ('Olena', 'Iv', 2);