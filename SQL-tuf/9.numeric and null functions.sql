create database if not exists new_db;

use new_db;


show tables;

-- getting data ready
CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(40) NOT NULL,
  city VARCHAR(30) NULL,
  phone VARCHAR(20) NULL,

  fee_paid DECIMAL(10,2) NULL,     -- for ROUND()
  score_change DECIMAL(10,2) NULL, -- for ABS()

  test1 INT NULL,                  -- for GREATEST/LEAST
  test2 INT NULL,
  test3 INT NULL
); 

INSERT INTO students (id, name, city, phone, fee_paid, score_change, test1, test2, test3) VALUES
(1,  'Aisha',   'Delhi',     NULL,           2804.45,  -12.25, 55, 60, 58),
(2,  'Rohan',   'Mumbai',    '',             3303.06,  -80.00, 40, NULL, 52),
(3,  'Meenal',  NULL,        '8888000004',   7999.00,   NULL,  NULL, NULL, 35),
(4,  'Arjun',   'Pune',      '9777000005',   3717.94,   10.00, 72, 70, 75),
(5,  'Neha',    'Jaipur',    NULL,           3499.00,  -30.75, 10, 15, 12),
(6,  'Vikas',   'Hyderabad', '9666000007',   5099.00,  120.75, 88, 91, 95),
(7,  'Sana',    'Ahmedabad', NULL,           7085.13,  -15.00, 65, 64, NULL),
(8,  'Imran',   'Kolkata',   '',             3303.06,   -1.00, 50, 49, 51),
(9,  'Pallavi', '',          '9555000010',   3303.06,    5.25, 92, 90, 91),
(10, 'Deepak',  'Chennai',   NULL,           NULL,     -22.00, 33, 40, 38),
(11, 'Ananya',  'Bengaluru', '9444000012',   3504.16,   18.50, 78, NULL, NULL),
(12, 'Tanya',   'Kolkata',   '',             3303.06,  -10.00, 45, 42, 48);

select * from students;


-- 1. ROUND(number,decimal): rounds a given number to given decimal places.
-- if decimal is not given, it rounds to nearest integer.

select id, name, fee_paid
from students
order by id asc;

-- 1 decimal place rounding
select id, name, round(fee_paid, 1)
from students
order by id asc;

-- 0 decimal place rounding
select id, name, round(fee_paid), fee_paid as actual_fees
from students
order by id asc;


-- 2. ABS(): returns the absolute values
-- -ve becomes +ve, +ve stays +ve

select id, name, city, score_change, ABS(score_change) as ABS_SCORE_CHANGE
from students
order by id;


-- 3. GREATEST(a,b,c...): returns the largest value from given list in paranthesis
-- 4. LEAST(a,b,c...): returns the smallest value from given list in paranthesis
-- If NULL IS there it will consider NULL greatest/least

-- fetch the highest and least test score for each student
select
id, name, test1, test2, test3,
GREATEST(test1, test2, test3) as max_score,
LEAST(test1, test2, test3) as min_score
from students
order by id;



-- 5. IF NULL() is a function that checks a value, and:

-- if the value is NOT NULL, it returns the value
-- if the value is NULL, it returns the replacement/default you provide
-- IFNULL(expression/value, replacement_value) only, accepts 2 arguments

-- print id, name and phone number of all students
-- print "Not provided" for NULL contact info.
select
id, 
name,
ifnull(phone, 'NOT PROVIDED') as contact_no
from students 
order by id;



-- fetch the highest and least test score for each student
-- return -1 if student has NULL for tests
select 
id, name, 
test1, test2, test3,
greatest(ifnull(test1,-1), ifnull(test2,-1), ifnull(test3,-1)) as max_score,
least(ifnull(test1,-1), ifnull(test2,-1), ifnull(test3,-1)) as min_score
from students
order by id asc;



-- 6. COALESCE(): returns first non-NULL value from list.
-- if value is null, it returns replacement.
CREATE TABLE coalesce_demo (
  id INT PRIMARY KEY,
  primary_email   VARCHAR(80),
  work_email      VARCHAR(80),
  personal_email  VARCHAR(80),
  hours_logged    DECIMAL(10,2),
  default_hours   DECIMAL(10,2)
);

INSERT INTO coalesce_demo VALUES
(1, 'aisha@company.com', NULL,              'aisha@gmail.com',  5.0,  0.0),
(2, NULL,               'rohan@company.com',NULL,               NULL, 0.0),
(3, NULL,               NULL,               'meera@yahoo.com',  2.5,  0.0),
(4, NULL,               NULL,               NULL,              NULL, 0.0),
(5, '',                 NULL,               'raj@gmail.com',   5.0,  0.0);


select * from coalesce_demo;

-- Basic COALESCE to Get First Non-NULL Email
select id, 
coalesce(primary_email, work_email, personal_email) as email 
from coalesce_demo;
-- For id = 4, all email columns are NULL, so the result is NULL.
-- For id = 5, primary_email is an empty string (not NULL), so it is returned as-is.


-- COALESCE with Default Email
-- default email: 'hello@tuf'
select id,
coalesce(primary_email, work_email, personal_email, 'hello@tuf')
as email from coalesce_demo;

-- COALESCE with NULLIF and TRIM...getting proper emails.
select id,
coalesce(nullif(trim(primary_email), ""), work_email, personal_email) as e_mail 
from coalesce_demo;