-- MODULE 2.1

-- see all databases
show databases;

-- create database
create database test;

-- use database
use test;

-- create table 1
create table customer(
	customer_id INT PRIMARY KEY auto_increment,
	first_name VARCHAR(20),
    last_name VARCHAR(20),
    email VARCHAR(50),
    phone VARCHAR(50) NOT NULL,
    address VARCHAR(100) DEFAULT "not provided!!!",
    city VARCHAR(20) DEFAULT "not provided!!!",
    country VARCHAR(20),
    zip_code INT
);

-- create table 2
-- where primary key of 'customer' is linked to foreign key of 'order' table.
create table orders(
	order_id INT PRIMARY KEY auto_increment,
    customer_id INT,
    order_date VARCHAR(50) DEFAULT "Date missing",
    total_amt DECIMAL(10,2) NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- show tables in database
show tables;

-- show table structure
desc customer;
desc orders;


-- insert data into tables
-- customer
INSERT INTO customer(first_name, last_name, email, phone, address, city, country, zip_code) 
VALUES 
('John','Doe','jd@example.com', '1111111111', '123 Main st.','New York', 'USA',1),
('Jane','Smith','js@example.com', '2222222222', '223 Main st.','Los Angeles', 'USA',2),
('Alice','Brown','ab@example.com', '3333333333', '323 Main st.','Chicago', 'USA',3),
('Robert','White','rw@example.com', '4444444444', '423 Main st.','New Jersey', 'USA',4),
('Emily','Davis','ed@example.com', '5555555555', '523 Main st.','Texas', 'USA',5);

-- orders
INSERT INTO orders(customer_id, order_date, total_amt)
VALUES
(1, '2025-12-31', 150.00),
(2, '2025-12-30',117.99),
(3, '2025-12-15',55.45),
(4, '2025-12-7',1000.99),
(5, '2025-12-01', 999.75);

-- display all data of tables
SELECT * FROM customer;
SELECT * FROM orders;

-- Update records.
UPDATE customer
SET first_name = 'Vlad', last_name = 'Dracula'
WHERE customer_id = 1;

UPDATE customer
SET email = 'vd@example.com', country = 'Romania', city = 'Brasov', address = 'Bran castle'
WHERE customer_id = 1;


-- delete data
DELETE from orders WHERE customer_id = 1;
DELETE from customer WHERE customer_id = 1;

-- delete all data from table
TRUNCATE table orders;
TRUNCATE table customer;

-- ALTER queries
-- 1. ADD 
-- 2. MODIFY 
-- 3. RENAME
-- 4. DROP ...all for columns

ALTER TABLE customer 
ADD DOB INT; -- DOB can't be in int format...hence modifying it.
 
ALTER TABLE customer
MODIFY DOB Date;

ALTER TABLE customer
RENAME COLUMN DOB to date_of_birth;

ALTER TABLE customer
DROP COLUMN date_of_birth;


-- Data query language
-- GRANT: GRANT SELECT,UPDATE...TO tom,jerry;
-- GERANT sysdba TO tom,jerry; ....superuser privileges of the dbms
-- REVOKE: REVOKE SELECT,UPDATE..ON table_name tom,jerry;






-- delete table: DROP TABLE IF EXISTS table_name;
-- NOTE: For deleting data/entire table, we must remove the foreign constraints first.


