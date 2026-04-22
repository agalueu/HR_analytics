# 👥 HR Analytics

## 📌 Overview
This project analyzes employee data to understand salary distribution, tenure, and workforce composition.

The objective is to identify patterns across departments using PostgreSQL for data analysis and Power BI for visualization.

---

## 📊 Dataset
- Source: Synthetic HR dataset (public, anonymized)
- Size: 20 employees, 5 departments
- Files included:
  - HR_employee.csv
  - HR_departments.csv

---

## 🛠️ Tools & Technologies
- PostgreSQL
- SQL (CTEs, window functions, ranking, aggregations)
- Power BI

---

## ❓ Key Business Questions
- Salary distribution across departments
- Percentage of employees per salary band
- Tenure distribution
- Top earners per department
- Ranking employees by salary
- Salary vs experience analysis

---

## 📂 Repository Structure

sql/        → schema + analysis queries  
docs/       → dataset + ERD  
images/     → dashboards & query outputs  
README.md   → documentation  

---

## 🗄 Database Schema

### employee
- employee_id (PK)
- first_name, last_name
- department (FK → department.department_name)
- hire_date
- salary
- performance_score

### department
- department_id (PK)
- department_name (unique)
- manager

---

## 🔄 How to Reproduce

1. Create database:
