show databases;
 -- DATA SUMMARIZATION.

create database if not exists data_summarization;

use data_summarization;


CREATE TABLE employees (
  emp_id           INT PRIMARY KEY,
  employee_name    VARCHAR(50) NOT NULL,
  project          VARCHAR(20) NOT NULL,
  years_experience DECIMAL(4,1) NULL,
  hours_logged     INT NULL,
  role             VARCHAR(20) NULL, 
  INDEX idx_project (project)
);

INSERT INTO employees (emp_id, employee_name, project, years_experience, hours_logged, role) VALUES
(1,  'Alice', 'Alpha', 3.0, 100, 'Developer'),
(2,  'Bob',   'Alpha', 5.0, 120, 'QA'),
(3,  'Carol', 'Alpha', 7.0, 105, 'Developer'),
(4,  'Dave',  'Alpha', NULL, 0, 'Manager'),
(5,  'Eve',   'Beta',  2.0,  80, 'Manager'),
(6,  'Frank', 'Beta',  3.0, 110, 'Developer'),
(7,  'Grace', 'Beta',  4.0, 130, 'Developer'),
(8,  'Hank',  'Beta',  3.0, NULL, 'Developer'),
(9,  'Heidi', 'Gamma', 5.0, 150, 'Developer'),
(10, 'Ivan',  'Gamma', 6.0, 140, 'QA');


-- 1.group by: divides rows into groups based on one or more columns and then aggregate fn is applied on each group

-- list all unique projects
select distinct(project) from employees;
-- OR
select project from employees
group by project;


-- group by project and role
select project, role
from employees
group by project, role;

-- all the roles
select role from employees
group by role;



-- 2. Min and Max: min returns minimum value in column , max returns maximum value in column

-- Minimum and maximum experience per project
select
project,
MIN(years_experience) as min_exp,
MAX(years_experience) as max_exp
from employees
group by project;




-- 3. SUM and AVG
-- SUM() returns the total of all numeric values in a column
-- AVG() computes the average (mean) of a numeric column.


-- Total hours logged & average experience per project
select project, SUM(hours_logged) as total_hours_logged,
AVG(years_experience) as avg_exp from employees
group by project;


-- 4. HAVING: HAVING filters groups after aggregation, similar to how WHERE filters individual rows before aggregation.

-- Projects with total hours greater than 300
select project,
sum(hours_logged) as total_hours
from employees
group by project
having total_hours > 300;


-- NEW DATA
CREATE TABLE registrations (
  reg_id      INT PRIMARY KEY,
  user_name   VARCHAR(50) NULL,
  email       VARCHAR(120) NULL,
  event       VARCHAR(50) NOT NULL,
  ticket_type ENUM('Free','Paid') NOT NULL,
  referrer    VARCHAR(50) NULL,
  INDEX idx_event (event)
);

INSERT INTO registrations (reg_id, user_name, email, event, ticket_type, referrer) VALUES
(1,  'Aisha',  'aisha@example.com',   'TechFest',  'Paid', 'Instagram'),
(2,  'Rohan',  'rohan@example.com',   'TechFest',  'Free', NULL),
(3,  'Aisha',  'aisha@example.com',   'CodeCamp',  'Paid', 'Instagram'),
(4,  'Mohit',  NULL,                  'TechFest',  'Free', 'LinkedIn'),
(5,  'Neha',   'neha@example.com',    'CodeCamp',  'Free', 'Instagram'),
(6,  NULL,     'unknown@example.com', 'DesignCon', 'Paid', 'Twitter'),
(7,  'Aisha',  'aisha@example.com',   'TechFest',  'Paid', 'Instagram'),
(8,  'Vishal', NULL,                  'DesignCon', 'Free', NULL),
(9,  'Rohan',  'rohan@example.com',   'TechFest',  'Free', 'Instagram'),
(10, 'Aisha',  'aisha@example.com',   'CodeCamp',  'Paid', NULL);





-- 5. COUNT: Returns the number of rows that matches the specified condition.
-- it SKIPS the NULL values
-- total registrations in the table
select count(*) as total_registrations from registrations;


-- total emails
select count(email) as total_email_provided from  registrations;


-- we want to know how many unique users exist
select count(distinct(user_name)) as total_user_names from registrations;

-- find the number of registrations for each event
select event, 
count(reg_id) as user_registered
from registrations
group by event;


-- count unique users per event.
select count(distinct(user_name)) as unique_users,
event from registrations
group by event;


-- event having greater than 3 registrations
select count(reg_id) as enrollments,
event from registrations
group by event
having enrollments > 3;