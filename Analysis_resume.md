This section contains SQL [queries](sql/Analysis.sql) for analyzing employee data, focusing on salary, tenure, and performance metrics across departments. The queries demonstrate HR analytics skills and highlight insights for workforce planning and compensation strategies. 

# 1. Salary Distribution by Band
### 📝 Query Purpose:
Analyze employee salary distribution across departments by categorizing salaries into High, Medium, and Low bands.

### ⚙️ Steps:
- Assign each employee a decile within their department using NTILE(10).
- Categorize deciles into salary bands:
    * High: Deciles 1–3
    * Medium: Deciles 4–7
    * Low: Deciles 8–10
- Count the number of employees per department and salary band.

### 📊 Business Insight:
- Reveals salary structure per department.
- Identifies departments with retention risks or concentration of high salaries.
- Supports pay equity and compensation planning.

Sample img: [Salary bands](images/query_salary_bands.png)

# 2. Percentage of Employees in Each Salary Band
### 📝 Query Purpose:
Calculate the percentage of employees in each salary band per department.

### ⚙️ Steps:
- Assign deciles and categorize salary bands (High, Medium, Low).
- Count employees per department and band.
- Calculate the percentage of employees in each band relative to the department total.

### 📊 Business Insight:
- Provides a normalized view of salary distribution.
- Helps HR detect imbalances or inequities.
- Supports strategic compensation adjustments.

Sample img: [% of Employees on each salary band](images/query_salary_bands_percentage.png)

# 3.Tenure Distribution by Department
### 📝 Query Purpose:
Analyze employee tenure across departments, categorized as New, Mid, Experienced.

### ⚙️ Steps:
- Calculate tenure in years for each employee.
- Categorize employees:
    * New: 0–2 years
    * Mid: 2–5 years
    * Experienced: >5 years
- Count employees per department and tenure band.

### 📊 Business Insight:
- Highlights departments with high proportions of new hires or experienced staff.
- Supports onboarding, training, and succession planning.

Sample img: [Tenure distribution](images/query_tenure.png)

# 4.Top 10% Salaries per Department
### 📝 Query Purpose:
Identify employees in the top 10% of salaries within each department.

### ⚙️ Steps:
- Assign deciles and ranks to employees by salary per department.
- Filter for employees in decile 1 (top 10%).

### 📊 Business Insight:
- Reveals key high-earning talent.
- Helps with retention, succession planning, and budgeting.

Sample img: [top 10% salary](images/query_10%.png)

# 5.Top 2 Salaries per Department
### 📝 Query Purpose:
Find the top 2 highest-paid employees in each department.

### ⚙️ Steps:
- Calculate department-level salary ranks.
- Select employees with rank ≤ 2.
- Include department average salary for comparison.

### 📊 Business Insight:
- Identifies top earners and benchmarks them against departmental averages.
- Supports compensation strategy and talent recognition.

Sample img: [Top 2 salaries per department](images/query_top2.png)

# 6.Employee Rank Within Department
### 📝 Query Purpose:
Assign a salary-based rank to each employee within their department.

### ⚙️ Steps:
- Select employee details.
- Calculate rank using RANK() OVER (PARTITION BY department ORDER BY salary DESC).

### 📊 Business Insight:
- Provides insight into relative positioning of employees.
- Useful for performance reviews, promotions, and equity analysis.

Sample img: [Rank within department](images/query_rank.png)

# 7. Salary vs. Overall Average and Tenure
### 📝 Query Purpose:
Compare each employee’s salary to the company-wide average and calculate tenure.

### ⚙️ Steps:
- Calculate overall average salary.
- Compute tenure in years.
- Categorize salary as Above Average or At/Below Average.

## 📊 Business Insight:
- Assesses compensation equity relative to experience.
- Helps identify employees for potential salary adjustments or development opportunities.

Sample img: [Salary vs Avg and tenure](images/query_avg_tenure.png)

# 8.Employees Performance and salary status
### 📝 Query Purpose:
Identify top earners with significant experience in each department.

### ⚙️ Steps:
- Calculate salary rank per department.
- Compute tenure in years.
- Filter for rank ≤ 2 and tenure ≥ 5 years.

### 📊 Business Insight:
- Highlights high-performing, experienced employees.
- Supports succession planning and retention strategies.

Sample img: [Performance](images/query_performance.png)

# 9.Top 2 Highest-Paid Employees per Department with 5+ Years Tenure
### 📝 Query Purpose:
Identify the top 2 highest-paid employees in each department who have more than 5 years of tenure, combining compensation and experience to highlight key contributors.

### ⚙️ Steps:
- Create a CTE (result) to select employee details: employee ID, first name, last name, department, salary, hire date.
- Use a second CTE (ranked) to:
- Assign a salary rank within each department using:
- RANK() OVER (PARTITION BY department ORDER BY salary DESC)
- Calculate tenure in years using:
- EXTRACT(YEAR FROM AGE(CURRENT_DATE, hire_date))
- Filter for employees who are ranked in the top 2 salaries and have tenure ≥ 5 years.
- Output all relevant employee information for these top earners.

### 📊 Business Insight:
- Highlights experienced high performers critical to department success.
- Supports succession planning, retention strategies, and reward allocation.

Combines salary and tenure metrics for more nuanced workforce analysis.

For this sample as the data is totally syntetic, i modified from 5 years to 1 year in order to actually got a result, that way I tested that the query actually works.

Sample img: [Highest paid with tenure](images/query_highest_paid.png)
