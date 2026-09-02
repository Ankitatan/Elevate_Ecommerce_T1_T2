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


**Author:** Ankita Taneja
