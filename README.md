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


**Author:** Ankita Taneja
