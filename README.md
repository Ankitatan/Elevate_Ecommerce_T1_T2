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

**Author:** Ankita Taneja
