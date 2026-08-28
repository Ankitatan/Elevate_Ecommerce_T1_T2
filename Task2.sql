/* ================================================================
   TASK 2: DATA INSERTION AND HANDLING NULLS
   ================================================================
   Domain       : E-Commerce
   Database     : ecommerce_db
   Tool         : MySQL Workbench

   OBJECTIVE:
   Practice:
   - INSERT
   - UPDATE
   - DELETE
   - NULL handling
   - DEFAULT values
   - IS NULL / IS NOT NULL
   - INSERT INTO ... SELECT
   - ROLLBACK
   - ON DELETE CASCADE

   KEY CONCEPTS:
   - DML (Data Manipulation Language)
   - NULL Handling
   - Data Consistency
   ================================================================ */


/* ================================================================
   STEP 1: SELECT THE DATABASE
   ================================================================ */

-- Use the database created in Task 1.
USE ecommerce_db;


/* ================================================================
   STEP 2: INSERT DATA INTO CATEGORY
   ================================================================ */

-- Insert product categories.
INSERT INTO Category (category_name)
VALUES
('Electronics'),
('Clothing'),
('Books'),
('Home Appliances'),
('Sports');


/* ================================================================
   STEP 3: INSERT DATA INTO CUSTOMER
   ================================================================ */

-- Insert multiple customers.
INSERT INTO Customer
(customer_name, email, phone, address, city)
VALUES
('Ankita Taneja', 'ankita@gmail.com', '9876543210',
 'Sector 15', 'Delhi'),

('Rahul Sharma', 'rahul@gmail.com', '9876543211',
 'Andheri West', 'Mumbai'),

('Priya Singh', 'priya@gmail.com', '9876543212',
 'Sector 17', 'Chandigarh'),

('Neha Gupta', 'neha@gmail.com', NULL,
 'Model Town', 'Delhi'),

('Amit Kumar', 'amit@gmail.com', '9876543214',
 NULL, 'Gurgaon');


/* ================================================================
   STEP 4: INSERT DATA USING DEFAULT VALUES
   ================================================================ */

-- created_at has DEFAULT CURRENT_TIMESTAMP,
-- so we do not need to provide a value for created_at.

INSERT INTO Customer
(customer_name, email, phone, city)
VALUES
('Rohan Verma', 'rohan@gmail.com', '9876543215', 'Noida');


/* ================================================================
   STEP 5: INSERT DATA INTO PRODUCT
   ================================================================ */

-- Insert products.
INSERT INTO Product
(product_name, category_id, price, stock_quantity)
VALUES
('Laptop', 1, 65000.00, 10),
('Wireless Mouse', 1, 1200.00, 50),
('Keyboard', 1, 2500.00, 30),
('T-Shirt', 2, 999.00, 100),
('Jeans', 2, 1999.00, 60),
('Python Programming Book', 3, 799.00, 25),
('Air Fryer', 4, 5500.00, 15),
('Cricket Bat', 5, 3500.00, 20);


/* ================================================================
   STEP 6: INSERT DATA INTO ORDERS
   ================================================================ */

-- customer_id connects the order with a customer.
-- order_status has DEFAULT 'Pending'.

INSERT INTO Orders
(customer_id, order_status)
VALUES
(1, 'Completed'),
(2, 'Pending'),
(3, 'Shipped'),
(4, 'Completed'),
(5, 'Pending');


/* ================================================================
   STEP 7: INSERT DATA INTO ORDER_DETAILS
   ================================================================ */

-- Add products to orders.

INSERT INTO Order_Details
(order_id, product_id, quantity, unit_price)
VALUES
(1, 1, 1, 65000.00),
(1, 2, 1, 1200.00),
(2, 4, 2, 999.00),
(3, 6, 1, 799.00),
(4, 7, 1, 5500.00),
(5, 8, 1, 3500.00);


/* ================================================================
   STEP 8: INSERT DATA INTO PAYMENT
   ================================================================ */

-- Insert payment records.
-- payment_status has DEFAULT 'Pending'.

INSERT INTO Payment
(order_id, payment_method, payment_amount, payment_status)
VALUES
(1, 'Credit Card', 66200.00, 'Completed'),
(2, 'UPI', 1998.00, 'Completed'),
(3, 'Debit Card', 799.00, 'Completed'),
(4, 'Cash', 5500.00, 'Completed'),
(5, 'UPI', 3500.00, 'Pending');


/* ================================================================
   STEP 9: VIEW INSERTED DATA
   ================================================================ */

-- Display all customers.
SELECT *
FROM Customer;

-- Display all categories.
SELECT *
FROM Category;

-- Display all products.
SELECT *
FROM Product;

-- Display all orders.
SELECT *
FROM Orders;

-- Display order details.
SELECT *
FROM Order_Details;

-- Display payments.
SELECT *
FROM Payment;


/* ================================================================
   STEP 10: INSERT NULL VALUES
   ================================================================ */

-- NULL means that the value is unknown, missing,
-- or not applicable.

-- Insert a customer without a phone number.
INSERT INTO Customer
(customer_name, email, phone, city)
VALUES
('Karan Mehta', 'karan@gmail.com', NULL, 'Jaipur');


/* ================================================================
   STEP 11: FIND NULL VALUES USING IS NULL
   ================================================================ */

-- Find customers whose phone number is missing.

SELECT *
FROM Customer
WHERE phone IS NULL;


-- Find customers whose address is missing.

SELECT *
FROM Customer
WHERE address IS NULL;


/* ================================================================
   STEP 12: FIND NON-NULL VALUES
   ================================================================ */

-- Find customers who have provided their phone number.

SELECT *
FROM Customer
WHERE phone IS NOT NULL;


/* ================================================================
   STEP 13: UPDATE ONE ROW
   ================================================================ */

-- Change Ankita's city from Delhi to Gurgaon.

UPDATE Customer
SET city = 'Gurgaon'
WHERE customer_id = 1;


/* ================================================================
   STEP 14: UPDATE MULTIPLE COLUMNS
   ================================================================ */

-- Update phone number and city for customer 1.

UPDATE Customer
SET phone = '9999999999',
    city = 'Noida'
WHERE customer_id = 1;


/* ================================================================
   STEP 15: UPDATE MULTIPLE ROWS
   ================================================================ */

-- Change all customers from Delhi to New Delhi.

UPDATE Customer
SET city = 'New Delhi'
WHERE city = 'Delhi';


/* ================================================================
   STEP 16: UPDATE NULL VALUES
   ================================================================ */

-- Replace missing phone numbers with 'Not Available'.

UPDATE Customer
SET phone = 'Not Available'
WHERE phone IS NULL;


/* ================================================================
   STEP 17: UPDATE PRODUCT STOCK
   ================================================================ */

-- Increase the stock of all products by 10.

UPDATE Product
SET stock_quantity = stock_quantity + 10;


/* ================================================================
   STEP 18: UPDATE ORDER STATUS
   ================================================================ */

-- Change all Pending orders to Shipped.

UPDATE Orders
SET order_status = 'Shipped'
WHERE order_status = 'Pending';


/* ================================================================
   STEP 19: INSERT USING SELECT
   ================================================================ */

-- Create a table for storing selected customers.

CREATE TABLE Customer_Backup (
    customer_id INT,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(50)
);


-- Copy selected customer data into Customer_Backup.
-- This demonstrates INSERT INTO ... SELECT.

INSERT INTO Customer_Backup
(customer_id, customer_name, email, city)
SELECT
    customer_id,
    customer_name,
    email,
    city
FROM Customer
WHERE city = 'New Delhi';


-- Check the copied data.

SELECT *
FROM Customer_Backup;


/* ================================================================
   STEP 20: DELETE ONE RECORD
   ================================================================ */

-- Delete the customer with customer_id = 7.
-- Always use WHERE when deleting specific records.

DELETE FROM Customer
WHERE customer_id = 7;


/* ================================================================
   STEP 21: TRANSACTION + ROLLBACK
   ================================================================ */

-- A transaction allows us to undo changes before COMMIT.

START TRANSACTION;

-- Delete customer 6 temporarily.
DELETE FROM Customer
WHERE customer_id = 6;

-- Undo the deletion.
ROLLBACK;

-- Customer 6 should still exist.
SELECT *
FROM Customer
WHERE customer_id = 6;


/* ================================================================
   STEP 22: TRANSACTION + COMMIT
   ================================================================ */

-- This time we permanently save the deletion.

START TRANSACTION;

DELETE FROM Customer
WHERE customer_id = 6;

-- COMMIT permanently saves the deletion.
COMMIT;


/* ================================================================
   STEP 23: ON DELETE CASCADE
   ================================================================ */

-- ON DELETE CASCADE means that when a parent record
-- is deleted, related child records are automatically deleted.

-- In Task 1, the foreign keys were created without
-- ON DELETE CASCADE, so we demonstrate the concept separately.

CREATE TABLE Cascade_Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);


CREATE TABLE Cascade_Order (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_name VARCHAR(100),

    FOREIGN KEY (customer_id)
        REFERENCES Cascade_Customer(customer_id)
        ON DELETE CASCADE
);


/* ================================================================
   STEP 24: INSERT CASCADE EXAMPLE DATA
   ================================================================ */

INSERT INTO Cascade_Customer
(customer_id, customer_name)
VALUES
(1, 'Test Customer');


INSERT INTO Cascade_Order
(order_id, customer_id, product_name)
VALUES
(101, 1, 'Laptop'),
(102, 1, 'Mouse');


/* ================================================================
   STEP 25: DELETE PARENT RECORD
   ================================================================ */

-- Enable foreign key checking.
SET FOREIGN_KEY_CHECKS = 1;

-- Delete the customer.
-- The related orders will automatically be deleted
-- because ON DELETE CASCADE is defined.

DELETE FROM Cascade_Customer
WHERE customer_id = 1;


/* ================================================================
   STEP 26: VERIFY CASCADE DELETE
   ================================================================ */

-- Customer record should be deleted.
SELECT *
FROM Cascade_Customer;

-- Related orders should also be deleted.
SELECT *
FROM Cascade_Order;


/* ================================================================
   STEP 27: FINAL DATA CHECK
   ================================================================ */

SELECT *
FROM Customer;

SELECT *
FROM Product;

SELECT *
FROM Orders;

SELECT *
FROM Order_Details;

SELECT *
FROM Payment;


/* ================================================================
   INTERVIEW QUESTIONS & ANSWERS
   ================================================================

   1. DIFFERENCE BETWEEN NULL AND 0?
   ---------------------------------------------------------------
   NULL means the value is missing, unknown, or not applicable.

   0 is an actual numeric value.

   Example:
   salary = NULL → Salary is unknown.
   salary = 0    → Salary is actually zero.


   2. WHAT IS A DEFAULT CONSTRAINT?
   ---------------------------------------------------------------
   DEFAULT automatically provides a value when no value
   is supplied.

   Example:
   order_status VARCHAR(30) DEFAULT 'Pending'


   3. HOW DOES IS NULL WORK?
   ---------------------------------------------------------------
   IS NULL is used to find records containing NULL.

   Example:
   SELECT *
   FROM Customer
   WHERE phone IS NULL;


   4. HOW DO YOU UPDATE MULTIPLE ROWS?
   ---------------------------------------------------------------
   Use UPDATE with a WHERE condition that matches multiple
   records.

   Example:
   UPDATE Customer
   SET city = 'Delhi'
   WHERE city = 'New Delhi';


   5. CAN WE INSERT PARTIAL VALUES?
   ---------------------------------------------------------------
   Yes.

   We can insert values into selected columns if the
   remaining columns allow NULL or have DEFAULT values.

   Example:
   INSERT INTO Customer(customer_name, email)
   VALUES ('Riya', 'riya@gmail.com');


   6. WHAT HAPPENS IF A NOT NULL FIELD IS LEFT EMPTY?
   ---------------------------------------------------------------
   The INSERT or UPDATE operation will fail because
   the column requires a value.

   Example:
   customer_name VARCHAR(100) NOT NULL


   7. HOW DO YOU ROLLBACK A DELETION?
   ---------------------------------------------------------------
   Use a transaction.

   Example:
   START TRANSACTION;

   DELETE FROM Customer
   WHERE customer_id = 5;

   ROLLBACK;


   8. CAN WE INSERT VALUES INTO SPECIFIC COLUMNS ONLY?
   ---------------------------------------------------------------
   Yes.

   Example:
   INSERT INTO Customer(customer_name, email)
   VALUES ('Riya', 'riya@gmail.com');


   9. HOW TO INSERT VALUES USING SELECT?
   ---------------------------------------------------------------
   Use INSERT INTO ... SELECT.

   Example:
   INSERT INTO Customer_Backup
   (customer_id, customer_name, email, city)
   SELECT customer_id, customer_name, email, city
   FROM Customer
   WHERE city = 'Delhi';


   10. WHAT IS ON DELETE CASCADE?
   ---------------------------------------------------------------
   ON DELETE CASCADE automatically deletes related child
   records when the parent record is deleted.

   Example:

   Customer
       |
       | 1:N
       ↓
   Orders

   If a customer is deleted, their related orders are
   automatically deleted.


   ================================================================
   END OF TASK 2
   ================================================================ */