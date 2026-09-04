# SQL Database & Query Practice — Tasks 1–5

## 📌 Project Overview

This repository contains a structured SQL learning project covering **database design, data manipulation, data retrieval, aggregation, and joins** using practical business datasets.

The project progresses from designing a normalized relational database to writing analytical SQL queries across multiple tables.

**Tools:** MySQL / MySQL Workbench
**Domains:** E-Commerce, Human Resources, Relational Order Management
**Database Engine:** InnoDB

---

## 📚 Tasks Covered

### 🔹 Task 1 — Database Setup & Schema Design

**Domain:** E-Commerce

Designed and implemented a normalized relational database containing:

* Customer
* Category
* Product
* Orders
* Order_Details
* Payment

### Key Concepts

* DDL
* CREATE DATABASE / CREATE TABLE
* Primary Keys
* Foreign Keys
* AUTO_INCREMENT
* NOT NULL
* UNIQUE
* DEFAULT
* CHECK constraints
* Referential Integrity
* Normalization — 1NF, 2NF, 3NF
* One-to-Many and One-to-One relationships
* Junction tables
* InnoDB storage engine
* ER Modeling

### Relationships

```text
Customer 1 ────────< Orders
Category 1 ────────< Product
Orders   1 ────────< Order_Details
Product  1 ────────< Order_Details
Orders   1 ────────── 1 Payment
```

**Deliverables:**

* `Task1.sql`
* `T1_ER_Diagram.mwb`
* `ecommerce_er_diagram.png`
* `Task1_Assessment.pdf`

---

### 🔹 Task 2 — Data Insertion & Handling NULLs

**Domain:** E-Commerce

Populated and managed the relational database while maintaining referential integrity and transaction safety.

### Key Concepts

* `INSERT INTO`
* Multi-row insertion
* Partial-column insertion
* `UPDATE`
* `DELETE`
* NULL vs. 0
* `IS NULL`
* `IS NOT NULL`
* `DEFAULT`
* `SQL_SAFE_UPDATES`
* `INSERT INTO ... SELECT`
* Transactions
* `START TRANSACTION`
* `COMMIT`
* `ROLLBACK`
* `ON DELETE CASCADE`
* Referential Integrity

**Deliverables:**

* `Task2.sql`
* `Task2_Assessment.pdf`

---

### 🔹 Task 3 — Basic SELECT Queries

**Domain:** Human Resources

Practiced fundamental SQL techniques for retrieving, filtering, projecting, and sorting employee data.

### Key Concepts

* `SELECT *`
* Specific column projection
* Column aliases using `AS`
* Table aliases
* `WHERE`
* `AND` / `OR`
* `LIKE`
* Wildcards `%`
* `BETWEEN`
* `IN`
* `ORDER BY`
* `ASC` / `DESC`
* Multi-column sorting
* `LIMIT`
* `DISTINCT`

**Deliverables:**

* `Task3.sql`
* `Task3_Assessment.pdf`

---

### 🔹 Task 4 — Aggregate Functions & Grouping

**Domain:** Human Resources

Performed exploratory data analysis and generated summarized analytical reports using SQL aggregate functions.

### Key Concepts

* `COUNT(*)`
* `COUNT(column)`
* `COUNT(DISTINCT column)`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`
* `ROUND()`
* `GROUP BY`
* Multiple-column grouping
* `HAVING`
* `WHERE` vs. `HAVING`
* Analytical query execution order

### Query Pipeline

```text
FROM
  ↓
WHERE
  ↓
GROUP BY
  ↓
HAVING
  ↓
SELECT
  ↓
ORDER BY
```

**Deliverables:**

* `Task4.sql`
* `Task4_Assessment.pdf`

---

### 🔹 Task 5 — SQL Joins

**Domain:** Relational Order & Management Systems

Combined information from multiple normalized tables using different SQL join techniques.

### Join Types Covered

* `INNER JOIN`
* `LEFT JOIN`
* `LEFT OUTER JOIN`
* `RIGHT JOIN`
* `RIGHT OUTER JOIN`
* `FULL OUTER JOIN` emulation using `UNION`
* Multi-table joins
* `SELF JOIN`
* `CROSS JOIN`
* `NATURAL JOIN`

### Additional Concepts

* Hierarchical employee-manager relationships
* Cartesian products
* Join conditions
* Referential relationships
* Query performance optimization
* Indexing
* Projection
* Predicate pushdown

**Deliverables:**

* `Task5.sql`
* `Task5_Assessment.pdf`

---

## 🗂️ Repository Structure

```text
SQL-Tasks/
│
├── Task1.sql
├── T1_ER_Diagram.mwb
├── ecommerce_er_diagram.png
├── Task1_Assessment.pdf
│
├── Task2.sql
├── Task2_Assessment.pdf
│
├── Task3.sql
├── Task3_Assessment.pdf
│
├── Task4.sql
├── Task4_Assessment.pdf
│
├── Task5.sql
├── Task5_Assessment.pdf
│
└── README.md
```

---

## 🎯 Learning Outcomes

By completing Tasks 1–5, the project demonstrates practical understanding of:

* Relational database design
* Database normalization
* Primary and foreign key relationships
* Data integrity and constraints
* SQL DDL and DML
* NULL handling
* Transaction management
* Data filtering and sorting
* SQL aggregation and analytical reporting
* Grouping and conditional aggregation
* Relational joins
* Hierarchical data relationships
* Query optimization fundamentals
* ER modeling
* MySQL database development

---

## 🛠️ Technologies Used

| Technology      | Purpose                             |
| --------------- | ----------------------------------- |
| MySQL           | Relational Database                 |
| MySQL Workbench | SQL Development & ER Modeling       |
| SQL             | Database Query Language             |
| InnoDB          | Storage Engine                      |
| GitHub          | Version Control & Project Portfolio |

---

## 👩‍💻 Project Purpose

This project was created as part of hands-on **SQL and Data Analytics practice**, progressing from database architecture and data management to analytical querying and relational data integration.

It demonstrates the ability to work with **real-world relational database concepts and business-oriented SQL problems**, forming a foundation for roles such as:

* Data Analyst
* SQL Developer
* Business Analyst
* MIS Analyst
* Junior Data Scientist
* Database Analyst
