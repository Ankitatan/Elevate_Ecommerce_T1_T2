# Task 1 - Database Setup and Schema Design

## Project: E-Commerce Database Management System

**Tool Used:** MySQL Workbench  
**Database:** MySQL  
**Domain:** E-Commerce

### Objective
To create a well-structured relational database by creating databases and tables, defining primary and foreign keys, applying constraints, establishing relationships, inserting sample data, and testing the schema using SQL queries.

### Tables
- **Customer** – Stores customer information.
- **Address** – Stores customer address details.
- **Category** – Stores product categories.
- **Product** – Stores product information, price, and stock.
- **Orders** – Stores customer orders.
- **Order_Item** – Stores products included in each order and acts as a junction table between Orders and Product.
- **Payment** – Stores payment details for orders.

### Relationships
- Customer → Address = One-to-Many
- Customer → Orders = One-to-Many
- Category → Product = One-to-Many
- Orders → Order_Item = One-to-Many
- Product → Order_Item = One-to-Many
- Orders → Payment = One-to-One

### Key Concepts
- DDL
- Database Schema
- Primary Key
- Foreign Key
- Constraints
- Normalization
- ER Diagram
- AUTO_INCREMENT
- One-to-One Relationship
- One-to-Many Relationship
- Many-to-Many Relationship
- Junction Table
- SQL JOIN

### Constraints Used
`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `DEFAULT`, and `CHECK` constraints are used to maintain data integrity and consistency.

### Project Files
- `ecommerce_schema.sql` – Complete SQL database creation and sample data script.
- `ecommerce_er_diagram.png` – ER diagram created using MySQL Workbench.
- `ecommerce_database.mwb` – MySQL Workbench database model.
- `README.md` – Project documentation.

### Learning Outcome
This task demonstrates the ability to design a normalized relational database, create tables with appropriate keys and constraints, establish table relationships, insert sample data, and retrieve related data using SQL JOIN queries.

# Task 2: Data Insertion and Handling NULLs

## Objective

Practice manipulating and maintaining data in a relational database using SQL **DML (Data Manipulation Language)** commands.

The task focuses on inserting new records, updating existing records, deleting records, and handling missing values using `NULL` and `DEFAULT`.

## Database

**Domain:** E-Commerce
**Database:** `ecommerce_db`
**Tool:** MySQL Workbench
**SQL Concepts:** DML, NULL Handling, Transactions, Referential Integrity

## Topics Covered

* `INSERT INTO`
* Multiple-row insertion
* Partial-column insertion
* `NULL` values
* `DEFAULT` values
* `IS NULL`
* `IS NOT NULL`
* `UPDATE`
* Updating multiple rows
* `DELETE`
* `INSERT INTO ... SELECT`
* `START TRANSACTION`
* `ROLLBACK`
* `COMMIT`
* `ON DELETE CASCADE`

## Tables Used

The task uses the database structure created in **Task 1: Database Setup and Schema Design**.

| Table           | Purpose                            |
| --------------- | ---------------------------------- |
| `Customer`      | Stores customer information        |
| `Category`      | Stores product categories          |
| `Product`       | Stores product information         |
| `Orders`        | Stores customer orders             |
| `Order_Details` | Stores products included in orders |
| `Payment`       | Stores payment information         |

## DML Operations

### INSERT

New customer, category, product, order, order-detail, and payment records were added using `INSERT INTO`.

Example:

```sql
INSERT INTO Customer
(customer_name, email, phone, city)
VALUES
('Ankita Taneja', 'ankita@gmail.com', '9876543210', 'Delhi');
```

### UPDATE

Existing records were modified using `UPDATE` with appropriate `WHERE` conditions.

Example:

```sql
UPDATE Customer
SET city = 'Noida'
WHERE customer_id = 1;
```

### DELETE

Specific records were removed using `DELETE` with a `WHERE` condition.

Example:

```sql
DELETE FROM Customer
WHERE customer_id = 7;
```

## NULL Handling

`NULL` represents a missing, unknown, or unavailable value.

Example:

```sql
SELECT *
FROM Customer
WHERE phone IS NULL;
```

For non-NULL values:

```sql
SELECT *
FROM Customer
WHERE phone IS NOT NULL;
```

`NULL` should not be compared using `= NULL`.

## DEFAULT Values

Default values automatically provide a value when one is not supplied.

Example:

```sql
order_status VARCHAR(30) DEFAULT 'Pending'
```

If no order status is provided, MySQL automatically stores `Pending`.

## INSERT INTO ... SELECT

Data was copied from one table into another using `INSERT INTO ... SELECT`.

Example:

```sql
INSERT INTO Customer_Backup
(customer_id, customer_name, email, city)
SELECT
    customer_id,
    customer_name,
    email,
    city
FROM Customer
WHERE city = 'Delhi';
```

## Transactions and ROLLBACK

Transactions were used to demonstrate how changes can be reversed before they are committed.

```sql
START TRANSACTION;

DELETE FROM Customer
WHERE customer_id = 6;

ROLLBACK;
```

`ROLLBACK` cancels the uncommitted deletion.

`COMMIT` permanently saves the changes.

## ON DELETE CASCADE

`ON DELETE CASCADE` automatically removes related child records when the referenced parent record is deleted.

Example:

```sql
FOREIGN KEY (customer_id)
REFERENCES Cascade_Customer(customer_id)
ON DELETE CASCADE
```

This helps maintain referential integrity between related tables.

## Key Learning Outcomes

After completing this task, I learned how to:

* Insert single and multiple records.
* Insert values into selected columns.
* Handle missing data using `NULL`.
* Use `DEFAULT` values.
* Find missing values using `IS NULL`.
* Update one or multiple records.
* Delete records safely using `WHERE`.
* Copy data using `INSERT INTO ... SELECT`.
* Use transactions and `ROLLBACK`.
* Understand cascading deletes.
* Maintain data consistency and integrity.

## Interview Questions Covered

1. Difference between `NULL` and `0`
2. What is a `DEFAULT` constraint?
3. How does `IS NULL` work?
4. How do you update multiple rows?
5. Can we insert partial values?
6. What happens if a `NOT NULL` field is left empty?
7. How do you rollback a deletion?
8. Can we insert values into specific columns only?
9. How do you insert values using `SELECT`?
10. What is `ON DELETE CASCADE`?

## Files

```text
Task_02_Data_Insertion_Null_Handling/
│
├── Task_02.sql
└── README.md
```

## Conclusion

This task provided practical experience with **DML operations and NULL handling** in MySQL. It demonstrated how to populate, modify, remove, and manage database records while maintaining data consistency and referential integrity.


# Task 3: Writing Basic SELECT Queries

## 🎯 Objective

The objective of this task is to understand how to retrieve and filter data from one or more database tables using basic SQL `SELECT` queries.

## 🛠️ Tools Used

* **MySQL Workbench**
* **DB Browser for SQLite** *(optional)*

## 📌 Topics Covered

This task focuses on the fundamental SQL commands and clauses used for data retrieval:

* `SELECT *` – Retrieve all columns from a table
* Selecting specific columns
* `WHERE` – Filter records based on conditions
* `AND` / `OR` – Combine multiple conditions
* `LIKE` – Search for matching text patterns
* `BETWEEN` – Filter values within a specified range
* `ORDER BY` – Sort query results
* `LIMIT` – Restrict the number of returned rows
* `DISTINCT` – Retrieve unique values
* Aliasing using `AS`
* `IN` – Match values against a list of options

## 🔍 SQL Concepts Practiced

### 1. SELECT All Columns

```sql
SELECT *
FROM employees;
```

### 2. SELECT Specific Columns

```sql
SELECT employee_id, name, department
FROM employees;
```

### 3. Filtering with WHERE

```sql
SELECT *
FROM employees
WHERE department = 'IT';
```

### 4. Using AND / OR

```sql
SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 40000;
```

```sql
SELECT *
FROM employees
WHERE department = 'IT'
OR department = 'HR';
```

### 5. Pattern Matching with LIKE

```sql
SELECT *
FROM employees
WHERE name LIKE '%an%';
```

`LIKE '%value%'` finds records where the specified value appears **anywhere within the text**.

### 6. Using BETWEEN

```sql
SELECT *
FROM employees
WHERE salary BETWEEN 30000 AND 60000;
```

`BETWEEN` is used to filter values within a specified range.

### 7. Sorting with ORDER BY

```sql
SELECT *
FROM employees
ORDER BY salary ASC;
```

Descending order:

```sql
SELECT *
FROM employees
ORDER BY salary DESC;
```

### 8. Limiting Results

```sql
SELECT *
FROM employees
LIMIT 5;
```

This returns only the first 5 rows from the query result.

### 9. Using DISTINCT

```sql
SELECT DISTINCT department
FROM employees;
```

`DISTINCT` removes duplicate values from the result.

### 10. Aliasing

```sql
SELECT name AS employee_name,
       salary AS monthly_salary
FROM employees;
```

Aliasing gives a column or table a temporary, more readable name.

## 📂 Deliverables

The repository contains:

```text
Task-3-Basic-SELECT-Queries/
│
├── task3_select_queries.sql
└── README.md
```

### SQL Script Includes

* Basic `SELECT` queries
* `SELECT *`
* Specific column selection
* `WHERE`
* `AND`
* `OR`
* `LIKE`
* `BETWEEN`
* `IN`
* `ORDER BY`
* `LIMIT`
* `DISTINCT`
* Column aliasing

## 💡 Interview Questions & Answers

### 1. What does `SELECT *` do?

It retrieves **all columns** from the specified table.

### 2. How do you filter rows?

Using the `WHERE` clause.

```sql
SELECT *
FROM employees
WHERE salary > 50000;
```

### 3. What is `LIKE '%value%'`?

It searches for rows where `value` occurs **anywhere in a text column**.

### 4. What is `BETWEEN` used for?

It filters values within a specified range, including the boundary values.

```sql
WHERE salary BETWEEN 30000 AND 50000
```

### 5. How do you limit output rows?

Use the `LIMIT` clause.

```sql
SELECT *
FROM employees
LIMIT 10;
```

### 6. Difference between `=` and `IN`

`=` compares a value with **one specific value**:

```sql
WHERE department = 'IT'
```

`IN` compares a value against **multiple possible values**:

```sql
WHERE department IN ('IT', 'HR', 'Finance')
```

### 7. How do you sort in descending order?

Use:

```sql
ORDER BY column_name DESC;
```

### 8. What is aliasing?

Aliasing assigns a temporary name to a column or table using `AS`.

```sql
SELECT salary AS monthly_salary
FROM employees;
```

### 9. Explain `DISTINCT`.

`DISTINCT` returns only unique values and removes duplicates from the query result.

### 10. What is the default sort order?

The default sort order of `ORDER BY` is **ascending (`ASC`)**.

## ✅ Outcome

After completing this task, I gained a clear understanding of how to:

* Retrieve data using `SELECT`
* Select all or specific columns
* Filter records using different conditions
* Search text using `LIKE`
* Filter ranges using `BETWEEN`
* Match multiple values using `IN`
* Sort data using `ORDER BY`
* Restrict results using `LIMIT`
* Remove duplicates using `DISTINCT`
* Improve query readability using aliases

This task establishes the foundation for more advanced SQL concepts such as **JOINs, GROUP BY, aggregate functions, subqueries, and database analysis**.

# Task 4: Aggregate Functions and Grouping

## 🎯 Objective

Use SQL aggregate functions and grouping techniques to summarize, analyze, and extract meaningful insights from tabular data.

## 🛠️ Tools Used

* **MySQL Workbench**
* **DB Browser for SQLite** *(optional)*

## 📌 Topics Covered

This task focuses on SQL aggregation and grouping:

* `COUNT()`
* `SUM()`
* `AVG()`
* `MAX()`
* `MIN()`
* `ROUND()`
* `GROUP BY`
* `HAVING`
* `COUNT(DISTINCT)`
* Grouping by multiple columns
* `WHERE` vs `HAVING`
* Aggregate functions

## 🔍 SQL Concepts Practiced

### 1. Count Total Employees

```sql
SELECT COUNT(*) AS total_employees
FROM employees;
```

### 2. Count Employees by Department

```sql
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department;
```

### 3. Calculate Average Salary by Department

```sql
SELECT department,
       ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department;
```

### 4. Calculate Total Salary by Department

```sql
SELECT department,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department;
```

### 5. Filter Groups Using HAVING

```sql
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

`HAVING` filters the results after the data has been grouped and aggregated.

### 6. Departments with Average Salary Above 50,000

```sql
SELECT department,
       ROUND(AVG(salary), 2) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
```

### 7. Group by Multiple Columns

```sql
SELECT department,
       job_title,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department, job_title;
```

SQL allows grouping by multiple columns to create summaries for each unique combination of values.

### 8. Find the Highest Salary by Department

```sql
SELECT department,
       MAX(salary) AS highest_salary
FROM employees
GROUP BY department;
```

### 9. Count Distinct Departments

```sql
SELECT COUNT(DISTINCT department) AS distinct_departments
FROM employees;
```

`COUNT(DISTINCT column)` counts only unique, non-NULL values.

### 10. Calculate Overall Salary Statistics

```sql
SELECT COUNT(*) AS employee_count,
       SUM(salary) AS total_salary,
       ROUND(AVG(salary), 2) AS average_salary,
       MAX(salary) AS highest_salary,
       MIN(salary) AS lowest_salary
FROM employees;
```

This query combines multiple aggregate functions to generate an overall summary of employee salaries.

## 📊 WHERE vs HAVING

One of the key concepts practiced in this task is the difference between `WHERE` and `HAVING`.

### WHERE

`WHERE` filters individual rows **before grouping**.

```sql
SELECT department,
       ROUND(AVG(salary), 2) AS average_salary
FROM employees
WHERE salary >= 30000
GROUP BY department;
```

### HAVING

`HAVING` filters groups **after aggregation**.

```sql
SELECT department,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
```

### Simple Rule

**WHERE → filters rows**

**GROUP BY → creates groups**

**HAVING → filters groups**

## 📂 Deliverables

The repository contains:

```text
Task-4-Aggregate-Functions-Grouping/
│
├── Task_4_Aggregate_Functions_Grouping.sql
├── Task_4_Interview_Answers.pdf
└── README.md
```

### SQL Script Includes

* `COUNT()`
* `SUM()`
* `AVG()`
* `MAX()`
* `MIN()`
* `ROUND()`
* `GROUP BY`
* `HAVING`
* `COUNT(DISTINCT)`
* Multiple-column grouping
* `WHERE` with aggregation

## 💡 Interview Questions & Answers

### 1. What is GROUP BY?

`GROUP BY` groups rows with the same values in one or more columns and is commonly used with aggregate functions.

### 2. Difference between WHERE and HAVING?

`WHERE` filters individual rows before grouping, while `HAVING` filters groups after aggregation.

### 3. How does COUNT(*) differ from COUNT(column)?

`COUNT(*)` counts all rows, including rows containing NULL values.

`COUNT(column)` counts only rows where the specified column is not NULL.

### 4. Can you group by multiple columns?

Yes. Multiple columns can be specified:

```sql
GROUP BY department, job_title;
```

### 5. What is ROUND() used for?

`ROUND()` rounds a numeric value to a specified number of decimal places.

```sql
ROUND(AVG(salary), 2)
```

### 6. How do you find the highest salary by department?

Use `MAX()` with `GROUP BY`:

```sql
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;
```

### 7. What is the default behavior of GROUP BY?

`GROUP BY` creates one result group for each unique combination of the specified grouping columns.

### 8. Explain AVG() and SUM().

`AVG()` calculates the average of non-NULL numeric values.

`SUM()` calculates the total of non-NULL numeric values.

### 9. How do you count distinct values?

Use:

```sql
COUNT(DISTINCT column_name)
```

Example:

```sql
SELECT COUNT(DISTINCT department)
FROM employees;
```

### 10. What is an aggregate function?

An aggregate function performs a calculation across multiple rows and returns a summary value.

Common aggregate functions include:

* `COUNT()`
* `SUM()`
* `AVG()`
* `MAX()`
* `MIN()`

## ✅ Learning Outcome

After completing this task, I gained practical experience in:

* Summarizing data using aggregate functions.
* Counting records using `COUNT()`.
* Calculating totals using `SUM()`.
* Calculating averages using `AVG()`.
* Finding maximum and minimum values.
* Rounding numerical results using `ROUND()`.
* Grouping records using `GROUP BY`.
* Grouping data using multiple columns.
* Filtering aggregated results using `HAVING`.
* Counting unique values using `COUNT(DISTINCT)`.
* Understanding the difference between `WHERE` and `HAVING`.
* Understanding how `COUNT(*)` handles rows compared with `COUNT(column)`.

## 🎯 Outcome

This task demonstrates the ability to transform detailed row-level data into meaningful summaries using SQL aggregation and grouping. These concepts form an important foundation for **data analysis, reporting, dashboards, business intelligence, and advanced SQL queries**.

## 📁 Project Files

* `Task_4_Aggregate_Functions_Grouping.sql` — SQL queries demonstrating aggregate functions and grouping.
* `Task_4_Interview_Answers.pdf` — Interview questions and model answers.
* `README.md` — Task documentation.

---

**Author:** Ankita Taneja
across multiple records, while `GROUP BY` organizes the results into meaningful categories.

`WHERE` is used to filter rows **before** grouping, whereas `HAVING` is used to filter groups **after** aggregation.

### Outcome

* Learned to summarize numerical data using aggregate functions.
* Practiced grouping records by one or multiple columns.
* Learned to filter aggregated results using `HAVING`.
* Practiced identifying maximum, minimum, total, and average values.
* Learned how to count distinct values and handle `NULL` values with `COUNT()`.

### Interview Questions Covered

1. What is `GROUP BY`?
2. What is the difference between `WHERE` and `HAVING`?
3. How does `COUNT(*)` differ from `COUNT(column)`?
4. Can you group by multiple columns?
5. What is `ROUND()` used for?
6. How do you find the highest salary by department?
7. What is the default behavior of `GROUP BY`?
8. Explain `AVG()` and `SUM()`.
9. How do you count distinct values?
10. What is an aggregate function?

### Files

* `Task_4_Aggregate_Functions_Grouping.sql` — SQL queries for the task
* `Task_4_Interview_Answers.pdf` — Interview questions and model answers


**Author:** Ankita Taneja
