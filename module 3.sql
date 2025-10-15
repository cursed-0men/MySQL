create database Ecommerce;

use Ecommerce;

create table customers(
	customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
	country VARCHAR(50),
    zip_code VARCHAR(10)
);


CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100),
  category VARCHAR(50),
  price DECIMAL(10, 2),
  stock INT
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE payment (
  payment_id INT PRIMARY KEY,
  order_id INT,
  payment_date DATE,
  payment_amount DECIMAL(10, 2),
  payment_method VARCHAR(50),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers (customer_id, first_name, last_name, email, phone, address, city, state, country, zip_code)
VALUES
     (1, 'John', 'Doe', 'john.doe@example.com', '+1 (123) 456-7890', '123 Main Street', 'New York', 'NY', 'USA', '10001'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '+1 (234) 567-8901', '456 Elm Avenue', 'Los Angeles', 'CA', 'USA', '90001'),
    (3, 'Michael', 'Johnson', 'michael.johnson@example.com', '+1 (345) 678-9012', '789 Oak Road', 'Chicago', 'IL', 'USA', '60601'),
    (4, 'Emily', 'Williams', 'emily.williams@example.com', '+1 (456) 789-0123', '101 Pine Street', 'Houston', 'TX', 'USA', '77001'),
    (5, 'William', 'Brown', 'william.brown@example.com', '+1 (567) 890-1234', '202 Maple Lane', 'Phoenix', 'AZ', 'USA', '85001'),
    (6, 'Olivia', 'Jones', 'olivia.jones@example.com', '+1 (678) 901-2345', '303 Cedar Street', 'Philadelphia', 'PA', 'USA', '19101'),
    (7, 'James', 'Miller', 'james.miller@example.com', '+1 (789) 012-3456', '404 Birch Avenue', 'San Antonio', 'TX', 'USA', '78201'),
    (8, 'Sophia', 'Davis', 'sophia.davis@example.com', '+1 (890) 123-4567', '505 Willow Road', 'San Diego', 'CA', 'USA', '92101'),
    (9, 'Liam', 'Garcia', 'liam.garcia@example.com', '+1 (901) 234-5678', '606 Spruce Court', 'Dallas', 'TX', 'USA', '75201'),
    (10, 'Ava', 'Rodriguez', 'ava.rodriguez@example.com', '+1 (012) 345-6789', '707 Oak Lane', 'San Jose', 'CA', 'USA', '95101'),
    (11, 'Noah', 'Martinez', 'noah.martinez@example.com', '+1 (123) 456-7890', '808 Pine Avenue', 'Austin', 'TX', 'USA', '78701'),
    (12, 'Isabella', 'Lopez', 'isabella.lopez@example.com', '+1 (234) 567-8901', '909 Maple Street', 'Jacksonville', 'FL', 'USA', '32201'),
    (13, 'Ethan', 'Hernandez', 'ethan.hernandez@example.com', '+1 (345) 678-9012', '1010 Cedar Road', 'Charlotte', 'NC', 'USA', '28201'),
    (14, 'Mia', 'Harris', 'mia.harris@example.com', '+1 (456) 789-0123', '1111 Elm Court', 'San Francisco', 'CA', 'USA', '94101'),
    (15, 'Sebastian', 'Clark', 'sebastian.clark@example.com', '+1 (567) 890-1234', '1212 Birch Lane', 'Seattle', 'WA', 'USA', '98101');

INSERT INTO products (product_id, product_name, category, price, stock)
VALUES
    (1, 'Smartphone', 'Electronics', 499.99, 100),
    (2, 'Laptop', 'Electronics', 899.99, 50),
    (3, 'Tablet', 'Electronics', 200.00, 100),
    (4, 'Smart TV', 'Electronics', 2000.00, 50),
    (5, 'Headphones', 'Electronics', 200.00, 100),
    (6, 'Dress Shirt', 'Clothing', 150.00, 100),
    (7, 'Jeans', 'Clothing', 500.00, 500),
    (8, 'Sneakers', 'Footwear', 1500.00, 200),
    (9, 'Backpack', 'Accessories', 1000.00, 800),
    (10, 'Watch', 'Accessories', 5000.00, 500),
    (11, 'Home Speaker', 'Electronics', 2000.00, 200),
    (12, 'Winter Coat', 'Clothing', 2500.00, 200),
    (13, 'Running Shoes', 'Footwear', 1500.00, 100),
    (14, 'Sunglasses', 'Accessories', 8000.00, 100),
    (15, 'Gaming Console', 'Electronics', 600.00, 200);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1001, 1, '2023-07-18', 999.98);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1002, 2, '2023-07-19', 3000.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1003, 4, '2023-07-20', 5200.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1004, 7, '2023-07-20', 1700.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1005, 5, '2023-07-20', 3000.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1006, 15, '2023-07-21', 9000.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1007, 3, '2023-07-22', 15300.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1008, 10, '2023-07-23', 2500.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1009, 2, '2023-07-23', 1800.28);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1010, 6, '2023-07-23', 349.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1011, 13, '2023-07-23', 24000.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1012, 9, '2023-07-24', 6500.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1013, 2, '2023-07-25', 4500.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1014, 3, '2023-07-26', 500.00);


INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1015, 8, '2023-07-26', 3000.00);


INSERT INTO order_items (order_item_id, order_id, product_id, quantity, price)
VALUES
    (5001, 1001, 1, 2, 999.98),
    (5002, 1002, 2, 3, 1800.00),
    (5003, 1003, 3, 4, 800.00),
    (5004, 1003, 4, 1, 2000.00),
    (5005, 1002, 5, 6, 1200.00),
    (5006, 1004, 6, 8, 1200.00),
    (5007, 1004, 7, 1, 500.00),
    (5008, 1007, 8, 3, 4500.00),
    (5009, 1007, 9, 1, 800.00),
    (5010, 1007, 10, 2, 10000.00),
    (5011, 1013, 11, 1, 2000.00),
    (5012, 1013, 12, 1, 2500.00),
    (5013, 1015, 13, 2, 3000.00),
    (5014, 1011, 14, 3, 24000.00),
    (5015, 1003, 15, 4, 2400.00);


INSERT INTO payment (payment_id, order_id, payment_date, payment_amount, payment_method)
VALUES
    (9001, 1001, '2023-07-18', 999.98, 'Credit Card'),
    (9002, 1002, '2023-07-19', 3000.00, 'PayPal'),
    (9003, 1003, '2023-07-20', 5200.00, 'Debit Card'),
    (9004, 1004, '2023-07-20', 1700.00, 'GPay'),
    (9005, 1005, '2023-07-20', 3000.00, 'GPay'),
    (9006, 1006, '2023-07-21', 9000.00, 'COD'),
    (9007, 1007, '2023-07-22', 15300.00, 'PayPal'),
    (9008, 1008, '2023-07-23', 2500.00, 'Credit Card'),
    (9009, 1009, '2023-07-23', 1800.28, 'COD'),
    (9010, 1010, '2023-07-23', 349.00, 'PayPal'),
    (9011, 1011, '2023-07-23', 24000.00, 'GPay'),
    (9012, 1012, '2023-07-24', 6500.00, 'Debit Card'),
    (9013, 1013, '2023-07-25', 4500.00, 'Credit Card'),
    (9014, 1014, '2023-07-26', 500.00, 'GPay'),
    (9015, 1015, '2023-07-26', 3000.00, 'COD');
    
-- DQL queries

select * from customers order by first_name ASC;

select * from products order by price DESC;

select * from orders order by order_date ASC;

select * from orders order by order_date DESC LIMIT 10;

select category from products;

select distinct category from products;

select first_name as CUSTOMERS from customers;

select * from products where category = 'Electronics';

select * from products where category <> 'Clothing';

select concat(first_name," ",last_name) as CA_RESIDENTS from customers where state = 'CA';

select first_name,last_name, phone from customers where first_name = 'Jane';

select product_name, price from products where price>1000 order by price ASC;

select product_name,price from products where price BETWEEN 500 AND 1000;

select product_name,price from products where category = 'Accessories' AND price>1500;

select product_name, category from products where category = 'Clothing' OR category = 'Footwear';

select * from products where category <> 'Electronics';

select email from customers where email LIKE '%example.com';

select * from products where product_name LIKE 'L%';

select * from customers where first_name LIKE '___';

SELECT UPPER(CONCAT(first_name," ",last_name)) as FULL_NAME from customers;

SELECT first_name, last_name, length(concat(first_name,last_name)) from customers;

SELECT city from customers
WHERE LENGTH(city) - LENGTH(REPLACE(city," ","")) + 1 > 1;

SELECT COUNT(*)
FROM customers
WHERE SUBSTRING(email, LOCATE("@", email)) = "@example.com";

SELECT substring_index('HELLO CLASS'," ",-3);

