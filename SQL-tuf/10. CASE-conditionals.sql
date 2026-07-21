
-- case conditional logic

-- SYNTAX: 
-- CASE
--     When condition_1 then value_1
--     When condition_2 then value_2
--     Else fallback_value
-- END;

-- if none of the if, else condition matches then it returns NULL

SET @age = 18;

SELECT
    CASE
        WHEN @age >= 18 THEN 'ADULT'
        ELSE 'NOT ADULT'
    END AS age_check;




create database if not exists case_conditional;

use case_conditional;

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  price      INT NULL
);

INSERT INTO products (product_id, name, price) VALUES
  (1,  'Laptop Sleeve',        18),
  (2,  'Wireless Mouse',       32),
  (3,  'Keyboard',             55),
  (4,  'Monitor',              150),
  (5,  'USB Cable',            8),
  (6,  'Webcam',               60),
  (7,  'HDMI Cable',           20),
  (8,  'Mechanical Keyboard',  120),
  (9,  'Sticker Pack',         0),
  (10, 'Gift Card',            19),
  (11, 'Mystery Box',          NULL),
  (12, 'Refurb Monitor',       61);

-- Scenario:
-- Price-based product classification

-- If the price is NULL, it means the value is missing, so it should be labeled as Missing Price.
-- If the price is less than or equal to 20, it falls under the Budget category.
-- If the price is between 21 and 100, it is considered Mid Range.
-- If the price is greater than 100, it represents a Premium product.

select product_id, name, price,
case 
  when price is NULL then 'Missing Price'
  when price <= 20 then 'Budget'
  when price between 21 and 100 then 'Mid-Range'
  when price > 100 then 'Premium'
End as Price_category
from products;



-- Boolean based evaluation with CASE
CREATE TABLE rules (
  rule_id INT PRIMARY KEY,
  value   INT
);

INSERT INTO rules (rule_id, value) VALUES
  (1, 75),
  (2, 40),
  (3, 60),
  (4, NULL),
  (5, 95),
  (6, 59),
  (7, 0),
  (8, 61);

-- Scenario:
-- Evaluate whether a value passes a threshold
-- For each row in rules, we want a clear decision:
-- If value is NULL, Missing
-- Else if value >= 40, PASS
-- Else, FAIL

select rule_id, value,
case 
  when value is NULL then 'Missing'
  when value >= 40 then 'PASS'
  else 'FAIL'
END as 'verdict'
from rules;



-- NULL Comparisons
select NULL = NULL;  -- returns NULL
select NULL <=> NULL; -- returns TRUE ...<=> is NULL safety equality operator
select NULL = 5; -- returns NULL

select NULL <=> 5; -- returns FALSE
select NULL >= 60; -- returns NULL


-- Scenario:
-- Normalize usernames and label missing/empty values

-- For each row, SQL checks the username column and returns:

-- Not Filled, when username IS NULL
-- Empty, when username is an empty string ''
-- Otherwise, returns the actual username

CREATE TABLE users (
  user_id  INT PRIMARY KEY,
  username VARCHAR(60) NULL,
  INDEX idx_users_username (username)
);

INSERT INTO users (user_id, username) VALUES
  (1, 'Pro_User'),
  (2, 'guest123'),
  (3, 'PRO_member'),
  (4, 'ProXUser'),
  (5, 'pro_user99'),
  (6, ' Pro_User '),
  (7, ''),
  (8, NULL);

select user_id, username, 
case 
  when username <=> NULL then "NULL"
  when username = '' then 'EMPTY'
  else username
END as username_display
from users;



-- case and coalesce
-- Scenario:
-- Compute bonus with fallback performance score
CREATE TABLE employees (
  emp_id            INT PRIMARY KEY,
  salary            INT NOT NULL,
  performance_score INT NULL
);

INSERT INTO employees (emp_id, salary, performance_score) VALUES
  (101, 50000, 90),
  (102, 45000, NULL),
  (103, 60000, 74),
  (104, 70000, 75),
  (105, 80000, 89),
  (106, 0,     92),
  (107, 52000, 100),
  (108, 50000, 0),
  (109, 45000, 85),
  (110, 40000, NULL);

-- If performance_score is NULL, bonus = 0
-- If score >= 90, bonus = 20% of salary
-- Else if score >= 75, bonus = 10% of salary
-- Else, bonus = 5% of salary
select emp_id, salary, performance_score,
case
  when coalesce(performance_score, -1) = -1 then 0
  when performance_score >= 90 then salary * 0.2
  when performance_score >=75 then salary * 0.1
  else salary * 0.01
end as bonus_Amt
from employees
order by emp_id ASC;


-- node classification
-- Scenario:
-- Classify nodes based on parent relationships

-- In a tree structure:
-- ROOT: a node with no parent (parent_id IS NULL)
-- INTERNAL: a node that has at least one child
-- LEAF: a node that has no children

CREATE TABLE nodes (
  node_id   INT PRIMARY KEY,
  parent_id INT NULL,
  INDEX idx_nodes_parent_id (parent_id)
);

INSERT INTO nodes (node_id, parent_id) VALUES
  (1,  NULL),
  (2,  1),
  (3,  2),
  (4,  1),
  (5,  4),
  (6,  4),
  (7,  6),
  (8,  NULL),
  (9,  8),
  (10, 8),
  (11, 10),
  (12, 10);

select node_id, parent_id,
case 
  when parent_id is NULL then 'Root node'
  -- when node is no one's parent then its leaf node
  when not exists(select 1 from nodes n2 where n1.node_id = n2.parent_id) then 'Leaf node'
  -- else its internal node
  else 'Internal node'
end as node_class
from nodes as n1
  order by node_id ASC;


-- Conditional Aggregation
-- Apples versus oranges sales totals

-- Total quantity sold for apple
-- Total quantity sold for orange

CREATE TABLE  sales (
  item     VARCHAR(30) NOT NULL,
  quantity INT NULL
);

INSERT INTO sales (item, quantity) VALUES
  ('apple',  10),
  ('orange', 7),
  ('apple',  5),
  ('banana', 3),
  ('mango',  2),
  ('apple',  NULL),
  ('orange', NULL);

select 
  sum(quantity), item
from sales
group by item
  limit 2;


-- using 
select
  sum(case 
      when item = 'apple' then coalesce(quantity, 0)
      else 0 end) as apples_sold,

  sum(case
      when item = 'orange' then coalesce(quantity,0)
      else 0 end) as oranges_sold
from sales;

