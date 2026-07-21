-- Filtering essentials

-- getting the data ready
create database if not exists filtering_essentials; 
use filtering_essentials;

-- create table
CREATE TABLE users (
  id                INT PRIMARY KEY AUTO_INCREMENT,
  email             VARCHAR(120) NOT NULL,
  full_name         VARCHAR(80)  NOT NULL,
  city              VARCHAR(60)  NULL,          -- can be NULL / empty / spaces
  signup_at_utc     DATETIME     NOT NULL,      -- stored as UTC
  last_purchase_inr DECIMAL(10,2) NULL,          -- can be NULL (never purchased)
  last_coupon_code  VARCHAR(30)  NULL,          -- can be NULL
  is_active         TINYINT(1)   NOT NULL DEFAULT 1
);


-- creating index
create index idx_users_email on users(email);
create index idx_users_signup_at on users(signup_at_utc);
create index idx_users_city on users(city);


-- adding data to "users" table
INSERT INTO users
(email, full_name, city, signup_at_utc, last_purchase_inr, last_coupon_code, is_active)
VALUES
('raj@tuf.com',              'Raj',            'Bengaluru', '2025-12-01 00:00:00',  999.00, 'WELCOME10',    1),
('test_user1@gmail.com',     'Test User One',  'Delhi',     '2025-12-05 10:00:00',  499.00, NULL,          1),
('testXuser2@gmail.com',     'Test User Two',  'Delhi',     '2025-12-10 12:00:00',  750.00, 'WELCOME_2026', 1),
('aayush@company.com',       'Aayush',         NULL,        '2025-11-30 23:59:59',  NULL,   NULL,          1),
('neha@example.com',         'Neha',           '',          '2025-12-31 23:59:59',  1500.00,'TUF_50',       1),
('mohit@gmail.com',          'Mohit',          'Mumbai',    '2026-01-01 00:00:00',  299.00, 'NEWYEAR10',    1),
('sara@tuf.com',             'Sara',           'Bengaluru', '2025-10-10 05:00:00',  2000.00,NULL,          1),
('arjun@yahoo.com',          'Arjun',          'Pune',      '2025-12-20 09:00:00',  799.00, 'FLASH_SALE',   0),
('john.doe@gmail.com',       'John Doe',       'Chennai',   '2025-12-05 18:30:00',  300.00, NULL,          1),
('jane_doe@gmail.com',       'Jane Doe',       'Chennai',   '2025-12-06 18:30:00',  1200.00,'WELCOME_BACK',1),
('support+trial@tuf.com',    'Support Trial',  'Gurugram',  '2025-12-07 10:00:00',  NULL,   NULL,          1),
('priya@outlook.com',        'Priya',          'Hyderabad', '2025-12-08 10:00:00',  999.00, 'WELCOME10',    1),
('sameer@rediffmail.com',    'Sameer',         NULL,        '2025-12-09 10:00:00',  100.00, NULL,          1),
('emptycity@demo.com',       'Empty City',     ' ',       '2025-12-10 10:00:00',  499.00, NULL,          1),
('khushi@gmail.com',         'Khushi',         'Delhi',     '2025-12-11 10:00:00',  500.00, 'REFERRAL5',    1),
('promo@demo.com',           'Promo',          'Mumbai',    '2025-12-25 00:00:00',  1499.00,'TUF_50',       1),
('intern@tuf.com',           'Intern',         'Bengaluru', '2025-12-22 20:00:00',  899.00, 'WELCOME_BACK', 1),
('hello@sample.com',         'Hello',          'Delhi',     '2025-12-02 08:00:00',  NULL,   NULL,          1);



-- 1. IS NULL v/s IS NOT NULL
-- users with city not null
select full_name, city from users
where city is not null;


-- i want proper city names...not empty strings.
select full_name, city from users
where NULLIF (city,'') is not null;

-- No whitespaces as well
select full_name, city from users
where nullif(trim(city), '') is not null;   -- even after trimming city if spaces remain, then also consider it NULL.



-- 2. IN v/s NOT IN
-- IN checks if value matches any one value from the list
-- NOT IN checks if value matches none of the values from the list

-- People from delhi and mumbai
select full_name, email, city from users
where city in('Mumbai','Delhi');


-- People from other cities except Mumbai and Delhi
select full_name, email, city from users
where city not in ('Mumbai','Delhi') AND nullif(trim(city),'') is not null;



-- 3. BETWEEN v/s NOT BETWEEN
-- BETWEEN: checks if a value lies within a range(inclusive)
-- NOT BETWEEN: checks if a value lies outsite the inclusive range

-- users signed up in december 2025
SELECT full_name, email, signup_at_utc
FROM users
WHERE signup_at_utc >= '2025-12-01 00:00:00'
  AND signup_at_utc <  '2026-01-01 00:00:00';


-- OR
select full_name, email, signup_at_utc from users
where signup_at_utc BETWEEN '2025-12-01 00:00:00' AND '2025-12-31 23:59:59';



-- 4. LIKE and NOT LIKE
-- LIKE: matches text pattern
-- NOT LIKE: excludes the values matching text pattern

-- NOTE: % -> any number of characters
--       _ -> exactly one character

-- all the users having tuf email
select email, full_name from users
where email like "%@tuf.com"; -- here % means any number of characters are allowed before @tuf.com


-- all non-tuf emails
select email, full_name from users
where email not like "%@tuf.com";


-- all emails starting with 't'
select full_name, email from users
where email like 't%';


-- test emails
select full_name, email from users
where email like 'test_user_%';


-- all the email containing _
select full_name, email from users
where email like'%\_%';

