-- Task 4: Aggregate Functions and Grouping
-- Objective: Summarize tabular data using aggregate functions and GROUP BY.
-- Compatible with SQLite and MySQL for the queries below.

-- 1. Count all employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- 2. Count employees in each department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 3. Calculate average salary by department
SELECT department, ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department;

-- 4. Calculate total salary/payroll by department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 5. Find departments with more than 5 employees
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- 6. Find departments whose average salary is above 50000
SELECT department, ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

-- 7. Group by multiple columns
SELECT department, job_title, COUNT(*) AS employee_count
FROM employees
GROUP BY department, job_title;

-- 8. Find the highest salary by department
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;

-- 9. Find the lowest salary by department
SELECT department, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;

-- 10. Count distinct departments
SELECT COUNT(DISTINCT department) AS distinct_departments
FROM employees;

-- 11. Count employees with a non-NULL salary
SELECT COUNT(salary) AS employees_with_salary
FROM employees;

-- 12. Count all rows and compare with COUNT(column)
SELECT COUNT(*) AS all_rows,
       COUNT(salary) AS non_null_salary_rows
FROM employees;

-- 13. Overall salary statistics
SELECT COUNT(*) AS employee_count,
       SUM(salary) AS total_salary,
       ROUND(AVG(salary), 2) AS average_salary,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employees;

-- 14. Example: filter rows before grouping using WHERE
SELECT department, ROUND(AVG(salary), 2) AS average_salary
FROM employees
WHERE salary >= 30000
GROUP BY department;

-- 15. Example: WHERE + GROUP BY + HAVING
SELECT department,
       COUNT(*) AS employee_count,
       ROUND(AVG(salary), 2) AS average_salary,
       SUM(salary) AS total_salary
FROM employees
WHERE salary >= 30000
GROUP BY department
HAVING COUNT(*) >= 2
ORDER BY average_salary DESC;
