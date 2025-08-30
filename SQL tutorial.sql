-- Database: organized and systematic collection of data, controlled by DBMS.
-- TYPES: Relational(Tabular and uses SQL) & Non-Relational(Other than tables and uses NoSQL - JSON, key-value pairs)



-- 🔰 creating a database:
-- CREATE DATABASE NAME;
create database myDB;

-- See existing databases
show databases;

-- switch to current working database
-- USE NAME;
use myDB;

-- set database to read only
-- ALTER DATABASE NAME READ ONLY = 1;
-- ALTER database myDB READ ONLY = 1; 

-- 🔰 TABLES 
-- 1. Creating table
create table employee(
	employee_id INT PRIMARY KEY auto_increment,
    first_name VARCHAR(10),
    last_name VARCHAR(10),
    hourly_pay DECIMAL(5,2),  -- max digits, precision
    hire_date DATE
);
--  2. Showing all tables in Database
show tables;

-- 3. Showing contents of table
SELECT * FROM employee;

-- 4. Rename table
-- RENAME TABLE old_name TO new_name
RENAME TABLE employee TO employees;

-- 5. Deleting a table
-- DELETE TABLE table_name;

-- 6. ADDING A COLUMN TO TABLE
ALTER TABLE employees ADD phone_number VARCHAR(15);

-- 7. Structure of a table
desc employees;

-- 8. Changing column name
ALTER TABLE employees RENAME COLUMN phone_number to email;

ALTER TABLE employees MODIFY COLUMN email VARCHAR(50); -- updated the data type as well...

-- 9. Changing the order of column 
ALTER table employees MODIFY email VARCHAR(50) after last_name; -- To move column to first position, remove after and write FIRST.

-- 10. Delete a column
ALTER TABLE employees DROP COLUMN email;

-- 11. Delete all data and set auto increment to 1
TRUNCATE TABLE employees;


-- 🔰 INSERTING DATA INTO TABLES 
ALTER TABLE employees MODIFY column first_name VARCHAR(20);
ALTER TABLE employees MODIFY column last_name VARCHAR(20);

INSERT INTO employees (first_name,last_name, Hourly_pay,hire_date) VALUES("Eugene","Krabs",25.50,"2023-01-02"), 
							("Squidward","Tentacles",15.00,"2023-01-03"), 
                            ("Spongebob","Squarepants",12.50,"2023-01-04"), 
                            ("Patrick","Star",12.50,"2023-01-05"),
                            ("Sandy","Cheeks",17.25,"2023-01-06");

-- 🔰 The SELECT Query 
SELECT * FROM employees; -- shows all data inside a table.

-- full name of all employees
SELECT first_name, last_name from employees;

-- 🔰 WHERE clause 
-- employee id = 1, only the full name
SELECT employee_id ,first_name, last_name FROM employees WHERE employee_id = 1;

-- Hourly pay >= 15
SELECT * FROM employees WHERE hourly_pay >= 15;

-- != operator (not equal)
-- employee id is not 1
SELECT * FROM employees WHERE employee_id != 1;

INSERT INTO employees (first_name, last_name) VALUES ("Sheldon","Plankton");

-- 🔰 UPDATE AND DELETE 
-- filling data for sheldon
UPDATE employees SET hourly_pay = 12.00, hire_date = "2023-01-07" WHERE employee_id = 6;
-- NOTE: remove the where clause to apply changes to all rows.

DELETE FROM employees WHERE employee_id = 6;


-- 🔰 URRENT_DATE() and CURRENT_TIME() 
CREATE TABLE test(
	my_date DATE,
    my_time TIME,
    my_datetime DATETIME
    ); 

INSERT INTO test VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW());
SELECT * FROM test;
DROP TABLE test;


-- 🔰 UNIQUE Constraint 
CREATE TABLE products(
		product_id INT PRIMARY KEY auto_increment,
        product_name VARCHAR(25) UNIQUE, -- no two product name can be the same.
        price DECIMAL(4,2)
    );

-- adding unique constraint manuallt: ALTER TABLE table_name ADD CONSTRAINT UNIQUE(column_name);

INSERT INTO products (product_name, price) VALUES ("Hamburger",3.99),
												  ("Fries",1.89),
												  ("Soda",1.00),
                                                  ("Ice-cream",1.49);
SELECT * FROM products;

-- 🔰 NOT NULL constraint 
ALTER TABLE products MODIFY price DECIMAL(4,2) NOT NULL;
desc products;

-- 🔰 CHECK Constraint: to limit what values can be put in columns.  
-- Adding it while table creation: CONSTRAINT check_pay CHECK(hourly_pay >= 10.00). -> AT last , before ending.

-- Adding it after table creation...
ALTER TABLE employees ADD CONSTRAINT check_pay CHECK(hourly_pay >= 10.00);

INSERT INTO employees (first_name, last_name, hourly_pay, hire_date) VALUES ("Sheldon", "Plankton", 5.00, "2023-01-07"); -- Will show error
INSERT INTO employees (first_name, last_name, hourly_pay, hire_date) VALUES ("Sheldon", "Plankton", 10.00, "2023-01-07"); -- WORKS ✅
SELECT * from employees;

-- Removing the CHECK constraint
ALTER TABLE employees DROP CHECK check_pay;

-- 🔰 DEFAULT Constraint
-- If we don't specify a value during inserting a tuple, then default values will be assigned automatically.
-- While creating the table: price DECIMAL(4,2) DEFAULT 0

-- After making the table: ALTER TABLE tab_name ALTER price SET DEFAULT 0.
ALTER TABLE products ALTER price SET DEFAULT 0;
INSERT INTO products (product_name) VALUES ("Straw"),("Napkin"),("Fork"),("Spoon");

SELECT * FROM products;
-- Eg:
CREATE TABLE transactions(
	t_id INT PRIMARY KEY auto_increment,
    amount DECIMAL (5,2),
    transaction_date DATETIME DEFAULT NOW()
);
INSERT INTO transactions (amount) VALUES (50.00),(100.00),(57.00),(30.00);
SELECT * FROM transactions;
DROP TABLE transactions;

-- 🔰 FOREIGN KEY






-- Deleting the database
-- DROP DATABASE NAME;
-- drop database myDB;