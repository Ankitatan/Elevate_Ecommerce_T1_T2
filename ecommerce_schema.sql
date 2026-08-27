-- ============================================================
-- SQL DEVELOPER INTERNSHIP
-- TASK 1: DATABASE SETUP AND SCHEMA DESIGN
-- ============================================================
--
-- Project Title : E-Commerce Database Management System
-- Domain        : E-Commerce
-- Database      : ecommerce_db
-- Tool Used     : MySQL Workbench
-- Database      : MySQL
--
-- Objective:
-- To create a well-structured relational database by:
-- 1. Creating a database
-- 2. Creating tables
-- 3. Defining Primary Keys
-- 4. Defining Foreign Keys
-- 5. Applying constraints
-- 6. Establishing table relationships
-- 7. Inserting sample data
-- 8. Testing relationships using SQL queries
--
-- Key Concepts:
-- DDL, Primary Keys, Foreign Keys, Constraints,
-- Normalization, ER Diagrams, AUTO_INCREMENT
-- ============================================================

-- ============================================================
-- SECTION 1: DATABASE CREATION
-- ============================================================

CREATE DATABASE ecommerce_db;

USE ecommerce_db;

SHOW DATABASES;


-- ============================================================
-- SECTION 2: CUSTOMER TABLE
-- ============================================================
-- Stores customer information.
-- Relationships:
-- Customer 1:N Address
-- Customer 1:N Orders
-- ============================================================

CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- ============================================================
-- SECTION 3: ADDRESS TABLE
-- ============================================================
-- Stores customer address information.
-- customer_id is a foreign key referencing Customer.
-- ON DELETE CASCADE removes addresses when their customer
-- is deleted.
-- ============================================================

CREATE TABLE Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    address_line VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,

    CONSTRAINT fk_address_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
        ON DELETE CASCADE
);


-- ============================================================
-- SECTION 4: CATEGORY TABLE
-- ============================================================
-- Stores product categories.
-- Relationship:
-- Category 1:N Product
-- ============================================================

CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);


-- ============================================================
-- SECTION 5: PRODUCT TABLE
-- ============================================================
-- Stores products available in the e-commerce system.
-- category_id is a foreign key referencing Category.
-- CHECK constraints prevent negative prices and stock.
-- ============================================================

CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    description VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,

    CONSTRAINT chk_product_price
        CHECK (price >= 0),

    CONSTRAINT chk_stock_quantity
        CHECK (stock_quantity >= 0),

    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES Category(category_id)
);


-- ============================================================
-- SECTION 6: ORDERS TABLE
-- ============================================================
-- Stores orders placed by customers.
-- customer_id is a foreign key referencing Customer.
-- ============================================================

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    order_status VARCHAR(30) NOT NULL DEFAULT 'Pending',

    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
);


-- ============================================================
-- SECTION 7: ORDER_ITEM TABLE
-- ============================================================
-- Stores products belonging to an order.
--
-- This is a junction/bridge table that resolves the
-- many-to-many relationship between Orders and Product.
--
-- Orders 1:N Order_Item
-- Product 1:N Order_Item
-- ============================================================

CREATE TABLE Order_Item (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    CONSTRAINT chk_order_quantity
        CHECK (quantity > 0),

    CONSTRAINT chk_unit_price
        CHECK (unit_price >= 0),

    CONSTRAINT fk_order_item_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_order_item_product
        FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
);


-- ============================================================
-- SECTION 8: PAYMENT TABLE
-- ============================================================
-- Stores payment information.
-- order_id is UNIQUE, so each order has one payment record
-- in this database design.
-- ============================================================

CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(30) NOT NULL DEFAULT 'Pending',
    amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT chk_payment_amount
        CHECK (amount >= 0),

    CONSTRAINT fk_payment_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE
);


-- ============================================================
-- SECTION 9: VERIFY DATABASE TABLES
-- ============================================================

SHOW TABLES;


-- ============================================================
-- SECTION 10: DESCRIBE TABLE STRUCTURES
-- ============================================================

DESCRIBE Customer;
DESCRIBE Address;
DESCRIBE Category;
DESCRIBE Product;
DESCRIBE Orders;
DESCRIBE Order_Item;
DESCRIBE Payment;


-- ============================================================
-- SECTION 11: INSERT CUSTOMER DATA
-- ============================================================

INSERT INTO Customer
(first_name, last_name, email, phone)
VALUES
('Ankita', 'Sharma', 'ankita@example.com', '9876543210'),
('Rahul', 'Verma', 'rahul@example.com', '9876543211'),
('Priya', 'Singh', 'priya@example.com', '9876543212');


-- ============================================================
-- SECTION 12: INSERT ADDRESS DATA
-- ============================================================

INSERT INTO Address
(customer_id, address_line, city, state, postal_code)
VALUES
(1, 'Sector 15', 'Chandigarh', 'Punjab', '160015'),
(2, 'Sector 62', 'Noida', 'Uttar Pradesh', '201301'),
(3, 'MG Road', 'Gurgaon', 'Haryana', '122001');


-- ============================================================
-- SECTION 13: INSERT CATEGORY DATA
-- ============================================================

INSERT INTO Category
(category_name, description)
VALUES
('Electronics', 'Electronic devices and accessories'),
('Books', 'Books and educational material'),
('Clothing', 'Men and women clothing');


-- ============================================================
-- SECTION 14: INSERT PRODUCT DATA
-- ============================================================
-- Category records must exist before products are inserted
-- because category_id is a foreign key.
-- ============================================================

INSERT INTO Product
(category_id, product_name, description, price, stock_quantity)
VALUES
(1, 'Wireless Headphones',
 'Bluetooth wireless headphones',
 2499.00, 50),

(1, 'Smart Watch',
 'Fitness and smart watch',
 3999.00, 30),

(2, 'SQL for Beginners',
 'Database learning book',
 599.00, 100),

(3, 'Cotton Shirt',
 'Casual cotton shirt',
 899.00, 40);


-- ============================================================
-- SECTION 15: INSERT ORDER DATA
-- ============================================================
-- customer_id must refer to an existing customer.
-- ============================================================

INSERT INTO Orders
(customer_id, order_status)
VALUES
(1, 'Confirmed'),
(2, 'Pending'),
(3, 'Delivered');


-- ============================================================
-- SECTION 16: INSERT ORDER ITEM DATA
-- ============================================================
-- Both order_id and product_id must already exist.
-- ============================================================

INSERT INTO Order_Item
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 2, 2499.00),
(1, 3, 1, 599.00),
(2, 2, 1, 3999.00),
(3, 4, 2, 899.00);


-- ============================================================
-- SECTION 17: INSERT PAYMENT DATA
-- ============================================================

INSERT INTO Payment
(order_id, payment_method, payment_status, amount)
VALUES
(1, 'UPI', 'Completed', 5597.00),
(2, 'Credit Card', 'Pending', 3999.00),
(3, 'Cash', 'Completed', 1798.00);


-- ============================================================
-- SECTION 18: BASIC DATA VERIFICATION
-- ============================================================

SELECT * FROM Customer;

SELECT * FROM Product;


-- ============================================================
-- SECTION 19: JOIN CUSTOMER AND ORDERS
-- ============================================================
-- Displays orders along with the customer who placed them.
-- ============================================================

SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.order_date,
    o.order_status
FROM Orders o
JOIN Customer c
    ON o.customer_id = c.customer_id;


-- ============================================================
-- SECTION 20: JOIN ORDERS, ORDER_ITEM AND PRODUCT
-- ============================================================
-- Displays products included in each order.
-- ============================================================

SELECT
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM Order_Item oi
JOIN Orders o
    ON oi.order_id = o.order_id
JOIN Product p
    ON oi.product_id = p.product_id;


-- ============================================================
-- SECTION 21: JOIN PRODUCT AND CATEGORY
-- ============================================================
-- Displays each product with its category and price.
-- ============================================================

SELECT
    p.product_name,
    c.category_name,
    p.price
FROM Product p
JOIN Category c
    ON p.category_id = c.category_id;


-- ============================================================
-- END OF SQL DEVELOPER INTERNSHIP TASK 1
-- ============================================================
-- Tool Used: MySQL Workbench
--
-- Concepts demonstrated:
-- DDL
-- CREATE DATABASE
-- CREATE TABLE
-- PRIMARY KEY
-- FOREIGN KEY
-- AUTO_INCREMENT
-- NOT NULL
-- UNIQUE
-- DEFAULT
-- CHECK
-- One-to-One relationship
-- One-to-Many relationship
-- Many-to-Many relationship
-- Junction table
-- Normalized relational design
-- SQL JOIN operations
-- ============================================================
