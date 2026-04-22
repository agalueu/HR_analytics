This section contains SQL queries for HR analytics, focusing on salary, tenure, and workforce insights.

---

# 1. Salary Distribution by Band
Categorizes employees into High, Medium, and Low salary bands using NTILE(10).

Insight:
Identifies salary concentration and potential compensation imbalances.

---

# 2. Percentage per Salary Band
Calculates the proportion of employees in each salary band per department.

Insight:
Provides normalized comparison across departments.

---

# 3. Tenure Distribution
Groups employees into:
- New (<2 years)
- Mid (2–5 years)
- Experienced (>5 years)

Insight:
Supports workforce planning and retention strategies.

---

# 4. Top 10% Salaries
Identifies highest earners using deciles.

Insight:
Highlights key talent.

---

# 5. Top 2 Salaries per Department
Uses RANK() to identify top earners.

Insight:
Supports compensation benchmarking.

---

# 6. Rank Within Department
Ranks employees by salary.

Insight:
Useful for internal comparisons and promotions.

---

# 7. Salary vs Company Average
Compares salary against company-wide average and includes tenure.

Insight:
Detects potential pay gaps.

---

# 8. Top Earners with Tenure
Filters top 2 earners with at least 1 year tenure.

Insight:
Combines compensation and experience for better decision-making.
