-- 1. Salary bands per department
WITH info AS (
    SELECT employee_id,
           department,
           salary,
           NTILE(10) OVER (PARTITION BY department ORDER BY salary DESC) AS decile
    FROM employee
)
SELECT COUNT(*) AS employees,
       department,
       CASE 
           WHEN decile BETWEEN 1 AND 3 THEN 'High Salary'
           WHEN decile BETWEEN 4 AND 7 THEN 'Medium Salary'
           ELSE 'Low Salary'
       END AS salary_band
FROM info
GROUP BY department, salary_band
ORDER BY department, salary_band;


-- 2. Percentage per salary band
WITH info AS (
    SELECT department,
           NTILE(10) OVER (PARTITION BY department ORDER BY salary DESC) AS decile
    FROM employee
),
bands AS (
    SELECT department,
           CASE 
               WHEN decile BETWEEN 1 AND 3 THEN 'High Salary'
               WHEN decile BETWEEN 4 AND 7 THEN 'Medium Salary'
               ELSE 'Low Salary'
           END AS salary_band,
           COUNT(*) AS employees
    FROM info
    GROUP BY department, salary_band
)
SELECT department,
       salary_band,
       employees,
       ROUND(100.0 * employees / SUM(employees) OVER (PARTITION BY department), 2) AS percentage
FROM bands
ORDER BY department, salary_band;


-- 3. Tenure distribution
WITH info AS (
    SELECT department,
           EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) AS tenure
    FROM employee
)
SELECT department,
       CASE
           WHEN tenure IS NULL THEN 'Unknown'
           WHEN tenure < 2 THEN 'New'
           WHEN tenure < 5 THEN 'Mid'
           ELSE 'Experienced'
       END AS tenure_band,
       COUNT(*) AS employees
FROM info
GROUP BY department, tenure_band
ORDER BY department, tenure_band;


-- 4. Top 10% salaries per department
WITH ranked AS (
    SELECT *,
           NTILE(10) OVER (PARTITION BY department ORDER BY salary DESC) AS decile
    FROM employee
)
SELECT *
FROM ranked
WHERE decile = 1;


-- 5. Top 2 salaries per department
WITH ranked AS (
    SELECT *,
           RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
    FROM employee
)
SELECT *
FROM ranked
WHERE rank <= 2;


-- 6. Rank within department
SELECT first_name,
       last_name,
       department,
       salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank
FROM employee;


-- 7. Salary vs company average + tenure
WITH avg_salary AS (
    SELECT AVG(salary) AS avg_company FROM employee
)
SELECT e.*,
       EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) AS tenure,
       CASE 
           WHEN salary > avg_company THEN 'Above Average'
           ELSE 'Below Average'
       END AS salary_status
FROM employee e, avg_salary;


-- 8. Top 2 salaries + tenure > 1 year
WITH ranked AS (
    SELECT *,
           RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank,
           EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date)) AS tenure
    FROM employee
)
SELECT *
FROM ranked
WHERE rank <= 2 AND tenure >= 1;
