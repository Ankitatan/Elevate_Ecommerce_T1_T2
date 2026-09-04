
/* ================================================================
   TASK 1: DATABASE SETUP AND SCHEMA DESIGN
   ================================================================
   Domain       : E-Commerce
   Database     : ecommerce_db
   Tool         : MySQL Workbench

   OBJECTIVE:
   - Create a database
   - Create tables
   - Define Primary Keys
   - Define Foreign Keys
   - Define constraints
   - Establish relationships between tables

   KEY CONCEPTS:
   - DDL (Data Definition Language)
   - Primary Key
   - Foreign Key
   - Constraints
   - Normalization
   - ER Diagram
   - Relationships
   - AUTO_INCREMENT
   ================================================================ */


/* ================================================================
   STEP 1: CREATE DATABASE
   ================================================================ */

-- Delete the database if it already exists.
-- WARNING: This removes all tables and data inside it.
DROP DATABASE IF EXISTS ecommerce_db;

-- Create a new E-commerce database.
CREATE DATABASE ecommerce_db;

-- Select the database for use.
USE tasks_elevate;



/* ================================================================
   STEP 2: CREATE CUSTOMER TABLE
   ================================================================ */

-- Stores information about customers.
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


/* ================================================================
   STEP 3: CREATE CATEGORY TABLE
   ================================================================ */

-- Stores product categories such as Electronics, Clothing, etc.
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);


/* ================================================================
   STEP 4: CREATE PRODUCT TABLE
   ================================================================ */

-- Stores products available in the E-commerce store.
-- Each product belongs to one category.
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,

    -- Price cannot be negative.
    CONSTRAINT chk_product_price
        CHECK (price >= 0),

    -- Stock quantity cannot be negative.
    CONSTRAINT chk_stock_quantity
        CHECK (stock_quantity >= 0),

    -- Foreign key connects Product with Category.
    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES Category(category_id)
);


/* ================================================================
   STEP 5: CREATE ORDERS TABLE
   ================================================================ */

-- Stores orders placed by customers.
-- One customer can place many orders.
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    order_status VARCHAR(30) DEFAULT 'Pending',

    -- Foreign key connects Orders with Customer.
    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
);


/* ================================================================
   STEP 6: CREATE ORDER_DETAILS TABLE
   ================================================================ */

-- Stores individual products included in each order.
-- This table resolves the many-to-many relationship
-- between Orders and Products.

CREATE TABLE Order_Details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    -- Quantity must be greater than zero.
    CONSTRAINT chk_order_quantity
        CHECK (quantity > 0),

    -- Unit price cannot be negative.
    CONSTRAINT chk_unit_price
        CHECK (unit_price >= 0),

    -- Connect Order_Details with Orders.
    CONSTRAINT fk_detail_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    -- Connect Order_Details with Product.
    CONSTRAINT fk_detail_product
        FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
);


/* ================================================================
   STEP 7: CREATE PAYMENT TABLE
   ================================================================ */

-- Stores payment information for orders.
-- An order can have a payment record.
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(30) NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(30) DEFAULT 'Pending',

    -- Payment amount cannot be negative.
    CONSTRAINT chk_payment_amount
        CHECK (payment_amount >= 0),

    -- Connect Payment with Orders.
    CONSTRAINT fk_payment_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
);


/* ================================================================
   STEP 8: VIEW DATABASE TABLES
   ================================================================ */

-- Display all tables created in the database.
SHOW TABLES;


/* ================================================================
   STEP 9: DESCRIBE TABLE STRUCTURES
   ================================================================ */

-- View the structure of each table.

DESCRIBE Customer;

DESCRIBE Category;

DESCRIBE Product;

DESCRIBE Orders;

DESCRIBE Order_Details;

DESCRIBE Payment;


/* ================================================================
   STEP 10: VIEW FOREIGN KEY RELATIONSHIPS
   ================================================================ */

-- Show the SQL used to create each table.
-- This helps verify Primary Keys and Foreign Keys.

SHOW CREATE TABLE Product;

SHOW CREATE TABLE Orders;

SHOW CREATE TABLE Order_Details;

SHOW CREATE TABLE Payment;


/* ================================================================
   DATABASE RELATIONSHIP SUMMARY
   ================================================================

   Customer
      |
      | 1 : Many
      ↓
   Orders
      |
      | 1 : Many
      ↓
   Order_Details
      ↑
      | Many : 1
      |
   Product
      ↑
      |
   Category

   Orders
      |
      | 1 : 1
      ↓
   Payment


   RELATIONSHIPS:

   1. Customer → Orders
      One customer can place many orders.

   2. Category → Product
      One category can contain many products.

   3. Orders → Order_Details
      One order can contain multiple products.

   4. Product → Order_Details
      One product can appear in multiple orders.

   5. Orders → Payment
      An order can have a payment record.

   ================================================================ */


/* ================================================================
   INTERVIEW QUESTIONS - QUICK NOTES
   ================================================================

   1. WHAT IS NORMALIZATION?
   ---------------------------------------------------------------
   Normalization is the process of organizing data into tables
   to reduce data redundancy and improve data consistency.


   2. PRIMARY KEY VS FOREIGN KEY
   ---------------------------------------------------------------
   Primary Key:
   - Uniquely identifies each record.
   - Cannot contain NULL.
   - Example: customer_id.

   Foreign Key:
   - Connects one table to another.
   - References the Primary Key of another table.
   - Example: customer_id in Orders.


   3. WHAT ARE CONSTRAINTS?
   ---------------------------------------------------------------
   Constraints are rules applied to table columns to maintain
   data accuracy and integrity.

   Examples:
   - PRIMARY KEY
   - FOREIGN KEY
   - NOT NULL
   - UNIQUE
   - CHECK
   - DEFAULT


   4. WHAT IS A SURROGATE KEY?
   ---------------------------------------------------------------
   A surrogate key is an artificial/system-generated key used
   to uniquely identify a record.

   Example:
   customer_id INT AUTO_INCREMENT PRIMARY KEY


   5. HOW DO YOU AVOID DATA REDUNDANCY?
   ---------------------------------------------------------------
   - Normalize the database.
   - Separate entities into different tables.
   - Use Primary Keys and Foreign Keys.
   - Avoid storing the same information repeatedly.


   6. WHAT IS AN ER DIAGRAM?
   ---------------------------------------------------------------
   ER Diagram (Entity Relationship Diagram) is a visual
   representation of entities, attributes and relationships
   in a database.


   7. TYPES OF RELATIONSHIPS IN DBMS
   ---------------------------------------------------------------
   - One-to-One (1:1)
   - One-to-Many (1:N)
   - Many-to-Many (M:N)


   8. PURPOSE OF AUTO_INCREMENT
   ---------------------------------------------------------------
   AUTO_INCREMENT automatically generates a unique numeric
   value for a new record.

   Example:
   customer_id INT AUTO_INCREMENT PRIMARY KEY


   9. DEFAULT STORAGE ENGINE IN MYSQL
   ---------------------------------------------------------------
   In modern MySQL versions, the default storage engine is
   InnoDB.

   InnoDB supports:
   - Transactions
   - Foreign Keys
   - Row-level locking
   - Crash recovery


   10. WHAT IS A COMPOSITE KEY?
   ---------------------------------------------------------------
   A composite key is a key made up of two or more columns
   that together uniquely identify a record.

   Example:

   PRIMARY KEY (order_id, product_id)

   ================================================================
   END OF TASK 1
   ================================================================ */
