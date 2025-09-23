## HR Analytics

## 📌 Overview
This project analyzes employee data to understand salary distribution, tenure, and workforce composition.
The goal is to identify patterns across departments and employee bands using PostgreSQL and Power BI.

## 📊 Dataset
- Source: Sample HR dataset (public, anonymized)
- Size: small data 20 em ployees 5 departments (this repo includes the file used: HR_employee.csv and HR_departments.cvs)
- Privacy: Public, no sensitive information

## ⚙️ Tools
- PostgreSQL
- SQL (CTEs, window functions, ranking, aggregations)
- Power BI (dashboards & KPIs)

## ❓ Key Business Questions
- How many employees fall into High, Medium, and Low salary bands per department?
- What percentage of employees are in each salary band?
- How does tenure (New, Mid, Experienced) distribute across departments?
- Who are the employees in the top 10% salaries per department?
- Which employees earn above the company-wide average salary? (TOP 2)
- What is each employee’s rank within their department?

## 📂 Repository Structure

sql/        → database schema, load script, and analysis queries  
docs/       → sample dataset, ERD  
images/     → screenshots of dashboards (Power BI) and query results (pgAdmin)  
README.md   → project summary and instructions  


## 🚀 How to Reproduce
1. Create a new PostgreSQL database:
- Create a PostgreSQL database:
- In pgAdmin → right-click Databases → Create - Database → name it hr_analytics.
- Schema & Data Import
- Run the schema script in sql/schema.sql to create the employee table, can copy [SCHEMA](sql/SCHEMA.sql).
- Import the sample dataset HR_employee.csv and HR_departments.cvs.

## Analysis Queries
- Queries are in [Analysis](sql/Analysis.sql)
- Examples include: salary banding with NTILE(), tenure categorization with AGE(), and ranking using RANK().

## 📊 Power BI Integration
For the visualization layer, I connected Power BI directly to PostgreSQL:

- All SQL queries were first developed and validated in **pgAdmin**.  
- Using the native PostgreSQL connector, these queries were imported into Power BI.  
- This workflow allowed me to rely on **SQL for all data modeling and transformations**, keeping Power BI focused on the **visualization and storytelling** aspects.  

## Visualizations include:
- KPI Cards → Total employees, % in each salary band
- Stacked Column Chart → Salary bands per department
- Bar Charts → Top 10% salaries per department
- Ranking Charts → Salary rank within departments

## 📸 Images Shared
- Salary distribution by band per department [Salary Distribution](images/Salary_distribution.png)
- Tenure band analysis [Tenure band](images/ternure_bands.png)
- Ranking within departments [Rank](images/Rank_by_departments.png)
- Power BI dashboards overview [Overview](images/overview.png)

## 📑 Queries, Analysis & Insights
For detailed SQL queries and insights, see [Analysis Resume](Analysis_resume.md)
.

## Highlights:
- NTILE(10) → used for decile-based salary banding.
- Window functions (RANK(), SUM() OVER) → ranking and percentages.
- CASE WHEN → tenure bands and salary categorization.

## 🔥 Outcome
This project demonstrates the ability to:
- Apply SQL analytics techniques (window functions, ranking, banding).
- Combine tenure and salary analysis for HR decision-making.
- Build BI dashboards that reveal workforce composition and high performers.
