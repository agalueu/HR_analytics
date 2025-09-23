-- 1. How many employees fall into High, Medium, and Low salary bands per department?
WITH information AS (

	SELECT  employee_id,
			department,
			salary,
			NTILE(10) OVER (PARTITION BY department ORDER BY salary DESC) AS decile
	FROM employee
)

SELECT  COUNT(employee_id):: numeric AS "Employees", 
		department AS "Department",
		CASE 
			WHEN decile BETWEEN 1 AND 3 THEN 'High Salary'
			WHEN decile BETWEEN 4 AND 7 THEN 'Medium Salary'
			WHEN decile BETWEEN 8 AND 10 THEN 'Low Salary'
		END AS "Salary Bands"
FROM information
GROUP BY department, "Salary Bands"
ORDER BY "Salary Bands"


-- 2. What percentage of employees are in each salary band?
WITH information AS (

	SELECT  employee_id,
			department,
			salary,
			NTILE(10) OVER (PARTITION BY department ORDER BY salary DESC) AS decile
	FROM employee
),

bands AS (

	SELECT  COUNT(employee_id):: numeric AS employees, 
			department,
			CASE 
				WHEN decile BETWEEN 1 AND 3 THEN 'High Salary'
				WHEN decile BETWEEN 4 AND 7 THEN 'Medium Salary'
				WHEN decile BETWEEN 8 AND 10 THEN 'Low Salary'
			END AS Salary_bands
	FROM information
	GROUP BY department, salary_bands
)

SELECT  employees AS "Employees",
		department AS "Department",
		salary_bands AS "Salary Bands",
		ROUND((employees:: numeric / SUM(employees) OVER (PARTITION BY department)) * 100, 2) AS "Percentage per Band"
FROM bands
ORDER BY department, salary_bands;

-- 3. How does tenure (New, Mid, Experienced) distribute across departments?
WITH information AS (

	SELECT  employee_id,
			department,
			EXTRACT (YEAR FROM AGE(CURRENT_DATE, hire_date)) AS tenure
	FROM employee
),

bands AS (

	SELECT  COUNT(employee_id):: numeric AS employees, 
			department,
			CASE
				WHEN tenure BETWEEN 0 AND 2 THEN 'New'
				WHEN tenure BETWEEN 2 AND 5 THEN 'Mid'
				WHEN tenure > 5 THEN 'Experienced'
			ELSE
				'Unknown Hire date'
			END AS tenure_band
	FROM information
	GROUP BY department, tenure_band
)

SELECT  employees AS "Employees",
		department AS "Department",
		tenure_band AS "Tenure Band",
FROM bands
ORDER BY department, tenure_band;

-- 4. Who are the employees in the top 10% salaries per department?
WITH result AS(
	SELECT  first_name,
			last_name,
			department,
			salary,
			hire_date
	FROM employee
),

ranked AS (
	SELECT *, RANK () OVER (PARTITION BY department ORDER BY salary DESC) AS rank,
	NTILE(10) OVER (PARTITION BY department ORDER BY salary DESC) AS decile
	FROM result
)

SELECT *
FROM ranked
WHERE decile = 1
;

-- 5. Which employees earn above the company-wide average salary? (TOP 2)
WITH result AS(
	SELECT  first_name,
			last_name,
			department,
			salary,
			ROUND(AVG(salary) OVER (PARTITION BY department), 0) AS avg_department_salary
	FROM employee
),

ranked AS (
	SELECT *, RANK () OVER (PARTITION BY department ORDER BY salary DESC) AS rank
	FROM result
)

SELECT *
FROM ranked
WHERE rank <=2;


-- 6. What is each employee’s rank within their department?
SELECT  first_name AS "First Name",
		last_name AS "Last Name",
		department AS "Department",
		hire_date AS "Hire date",
		salary AS "Salary",
		RANK () OVER (PARTITION BY department ORDER BY salary DESC) AS "Rank by salary"
FROM employee;

--EXTRA QUERIES

-- 7. AVG salary and tenure
WITH overall_avg AS (
	SELECT  employee_id,
			first_name,
			last_name,
			salary,
			department,
			ROUND((SELECT (AVG(salary)) FROM employee), 2) AS avg_overall,
			hire_date
	FROM employee
)

SELECT  employee_id, first_name, last_name, salary, hire_date, department,
		EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) AS tenure_in_years,
		CASE
			WHEN salary > avg_overall THEN 'Above average'
			ELSE 'At or Below Average'
		END AS salary_status
FROM overall_avg
ORDER BY department;

-- 8. Employees Performance and salary status
WITH overall_avg AS (
	SELECT  employee_id,
			first_name,
			last_name,
			salary,
			department,
			ROUND((SELECT (AVG(salary)) FROM employee), 2) AS avg_overall,
			hire_date
	FROM employee
)

SELECT  employee_id, first_name, last_name, salary, hire_date, department,
		EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) AS tenure_in_years,
		CASE
			WHEN salary > avg_overall THEN 'Above average'
			ELSE 'At or Below Average'
		END AS salary_status
FROM overall_avg
ORDER BY tenure_in_years;

-- 9. Find top 2 highest-paid employees per department who also have more than 1 year of tenure.
WITH result AS(
	SELECT  employee_id,
			first_name,
			last_name,
			department,
			salary,
			hire_date
	FROM employee
),

ranked AS (
	SELECT *, RANK () OVER (PARTITION BY department ORDER BY salary DESC) AS rank,
	EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) AS tenure_in_years
	FROM result
)

SELECT *
FROM ranked
WHERE rank <=2 AND tenure_in_years >= 1;

