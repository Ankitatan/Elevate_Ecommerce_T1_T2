-- =====================================================================
-- Task 3: Writing Basic SELECT Queries
-- Objective: Extract data from one or more tables
-- Tools: SQLite / MySQL Workbench
-- =====================================================================

-- ---------------------------------------------------------------------
-- 1. DDL: Create Sample Schema
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL
);

-- ---------------------------------------------------------------------
-- 2. DML: Insert Sample Data
-- ---------------------------------------------------------------------
INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date) VALUES
(1, 'Alice', 'Smith', 'Engineering', 95000.00, '2021-03-15'),
(2, 'Bob', 'Johnson', 'Marketing', 62000.00, '2020-07-22'),
(3, 'Charlie', 'Williams', 'Engineering', 88000.00, '2019-11-01'),
(4, 'Diana', 'Brown', 'Finance', 75000.00, '2022-01-10'),
(5, 'Evan', 'Davis', 'Engineering', 105000.00, '2018-05-19'),
(6, 'Fiona', 'Miller', 'Marketing', 58000.00, '2023-04-12'),
(7, 'George', 'Wilson', 'Finance', 82000.00, '2021-09-30');

-- ---------------------------------------------------------------------
-- 3. Core SELECT Queries
-- ---------------------------------------------------------------------

-- Query A: Retrieve all records and columns
SELECT * 
FROM employees;

-- Query B: Retrieve specific columns with column aliasing (AS)
SELECT 
    first_name AS given_name, 
    last_name AS family_name,
    salary AS annual_compensation
FROM employees;

-- Query C: Unique values using DISTINCT
SELECT DISTINCT department 
FROM employees;

-- ---------------------------------------------------------------------
-- 4. Filtering with WHERE and Logical Operators
-- ---------------------------------------------------------------------

-- Query D: Filter using AND
-- Find employees in Engineering earning strictly more than 90,000
SELECT employee_id, first_name, salary
FROM employees
WHERE department = 'Engineering' 
  AND salary > 90000;

-- Query E: Filter using OR
-- Find employees in Finance OR those earning under 60,000
SELECT first_name, department, salary
FROM employees
WHERE department = 'Finance' 
   OR salary < 60000;

-- Query F: Pattern matching using LIKE (Wildcard %)
-- Find employees whose last name contains 'son' anywhere
SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%son%';

-- Query G: Range filtering using BETWEEN (Inclusive)
-- Find employees earning between 70,000 and 90,000 inclusive
SELECT first_name, salary
FROM employees
WHERE salary BETWEEN 70000 AND 90000;

-- ---------------------------------------------------------------------
-- 5. Sorting (ORDER BY) and Limiting (LIMIT)
-- ---------------------------------------------------------------------

-- Query H: Descending sort (DESC) with LIMIT
-- Retrieve the top 3 highest-earning employees
SELECT first_name, last_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Query I: Multi-column sorting (Ascending default + Descending secondary)
-- Sort primarily by department (A-Z), secondarily by salary highest to lowest
SELECT department, first_name, salary
FROM employees
ORDER BY department ASC, salary DESC;
