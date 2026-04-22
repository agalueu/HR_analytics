DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS department CASCADE;

CREATE TABLE department (
    department_id SERIAL PRIMARY KEY,
    department_name TEXT UNIQUE,
    manager TEXT
);

CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    department TEXT,
    hire_date DATE,
    salary INT,
    performance_score INT,
    CONSTRAINT fk_department
        FOREIGN KEY (department)
        REFERENCES department(department_name)
);

-- Fix invalid future dates
UPDATE employee
SET hire_date = NULL
WHERE hire_date > CURRENT_DATE;
