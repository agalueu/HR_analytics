This section contains SQL queries for analyzing employee data, focusing on salary, tenure, and performance metrics across departments. The queries demonstrate HR analytics skills and highlight insights for workforce planning and compensation strategies.

1️⃣ Salary Distribution by Band

Query Purpose:
Analyze employee salary distribution across departments by categorizing salaries into High, Medium, and Low bands.

Steps:

Assign each employee a decile within their department using NTILE(10).

Categorize deciles into salary bands:

High: Deciles 1–3

Medium: Deciles 4–7

Low: Deciles 8–10

Count the number of employees per department and salary band.

Business Insight:

Reveals salary structure per department.

Identifies departments with retention risks or concentration of high salaries.

Supports pay equity and compensation planning.

2️⃣ Percentage of Employees in Each Salary Band

Query Purpose:
Calculate the percentage of employees in each salary band per department.

Steps:

Assign deciles and categorize salary bands (High, Medium, Low).

Count employees per department and band.

Calculate the percentage of employees in each band relative to the department total.

Business Insight:

Provides a normalized view of salary distribution.

Helps HR detect imbalances or inequities.

Supports strategic compensation adjustments.

3️⃣ Tenure Distribution by Department

Query Purpose:
Analyze employee tenure across departments, categorized as New, Mid, Experienced.

Steps:

Calculate tenure in years for each employee.

Categorize employees:

New: 0–2 years

Mid: 2–5 years

Experienced: >5 years

Count employees per department and tenure band.

Business Insight:

Highlights departments with high proportions of new hires or experienced staff.

Supports onboarding, training, and succession planning.

4️⃣ Top 10% Salaries per Department

Query Purpose:
Identify employees in the top 10% of salaries within each department.

Steps:

Assign deciles and ranks to employees by salary per department.

Filter for employees in decile 1 (top 10%).

Business Insight:

Reveals key high-earning talent.

Helps with retention, succession planning, and budgeting.

5️⃣ Top 2 Salaries per Department

Query Purpose:
Find the top 2 highest-paid employees in each department.

Steps:

Calculate department-level salary ranks.

Select employees with rank ≤ 2.

Include department average salary for comparison.

Business Insight:

Identifies top earners and benchmarks them against departmental averages.

Supports compensation strategy and talent recognition.

6️⃣ Employee Rank Within Department

Query Purpose:
Assign a salary-based rank to each employee within their department.

Steps:

Select employee details.

Calculate rank using RANK() OVER (PARTITION BY department ORDER BY salary DESC).

Business Insight:

Provides insight into relative positioning of employees.

Useful for performance reviews, promotions, and equity analysis.

7️⃣ Salary vs. Overall Average and Tenure

Query Purpose:
Compare each employee’s salary to the company-wide average and calculate tenure.

Steps:

Calculate overall average salary.

Compute tenure in years.

Categorize salary as Above Average or At/Below Average.

Business Insight:

Assesses compensation equity relative to experience.

Helps identify employees for potential salary adjustments or development opportunities.

8️⃣ Top 2 Highest-Paid Employees with 5+ Years Tenure

Query Purpose:
Identify top earners with significant experience in each department.

Steps:

Calculate salary rank per department.

Compute tenure in years.

Filter for rank ≤ 2 and tenure ≥ 5 years.

Business Insight:

Highlights high-performing, experienced employees.

Supports succession planning and retention strategies.
