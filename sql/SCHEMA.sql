CREATE TABLE IF NOT EXISTS employee (
	employee_id INTEGER,
	first_name TEXT,
	last_name TEXT,
	department TEXT,
	hire_date DATE,
	salary INT,
	performance_score INT
); --information about employees

CREATE TABLE IF NOT EXISTS department (
	deparment_id INTEGER,
	department_name TEXT,
	manager TEXT
); --information about departments

/* The data we use here was completly systemic, so some values makes no sense like hire_date on 2035, that´s why the fastest
way to just get the data correctly without going row by row changing the date was doing a simple update on hire_date like this:*/
UPDATE employee
SET hire_date = NULL
WHERE hire_date > CURRENT_DATE;

