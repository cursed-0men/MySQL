

CREATE DATABASE company_practice_db;
USE company_practice_db;

-- 1️⃣ EMPLOYEES TABLE
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dept_id INT,
  job_id INT,
  manager_id INT,
  salary DECIMAL(10,2)
);

-- 2️⃣ DEPARTMENTS TABLE
CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50),
  location_id INT
);

-- 3️⃣ LOCATIONS TABLE
CREATE TABLE locations (
  location_id INT PRIMARY KEY,
  city VARCHAR(50),
  country VARCHAR(50)
);

-- 4️⃣ JOBS TABLE
CREATE TABLE jobs (
  job_id INT PRIMARY KEY,
  job_title VARCHAR(50),
  min_salary DECIMAL(10,2),
  max_salary DECIMAL(10,2)
);

INSERT INTO locations VALUES
(1, 'New York', 'USA'),
(2, 'London', 'UK'),
(3, 'Mumbai', 'India'),
(4, 'Tokyo', 'Japan');

INSERT INTO departments VALUES
(10, 'HR', 1),
(20, 'Finance', 1),
(30, 'Engineering', 3),
(40, 'Marketing', 2),
(50, 'Sales', 4);

INSERT INTO jobs VALUES
(101, 'HR Manager', 50000, 80000),
(102, 'Accountant', 40000, 70000),
(103, 'Software Engineer', 60000, 100000),
(104, 'Marketing Lead', 45000, 85000),
(105, 'Sales Executive', 30000, 60000);

INSERT INTO employees VALUES
(1, 'John', 'Doe', 10, 101, NULL, 75000),
(2, 'Jane', 'Smith', 20, 102, 1, 60000),
(3, 'Amit', 'Patel', 30, 103, 1, 95000),
(4, 'Sara', 'Lee', 30, 103, 3, 85000),
(5, 'Tom', 'Hanks', 40, 104, 1, 70000),
(6, 'Emily', 'Clark', 50, 105, 5, 50000),
(7, 'Raj', 'Singh', 50, 105, 5, 55000),
(8, 'Mei', 'Tanaka', 40, 104, 5, 68000),
(9, 'David', 'Jones', 20, 102, 2, 62000),
(10, 'Priya', 'Iyer', 30, 103, 3, 90000);


-- 🔰 JOINS Queries

-- 🔥 Level 1 - BASIC INNER JOIN
-- 1️⃣ List employee names with their department names.
select concat(e.first_name, " ", e.last_name) as FULL_NAME, d.dept_name
from employees e
inner join departments d
on e.dept_id = d.dept_id;

-- 2️⃣ Show employees along with their job titles.
select concat(e.first_name, " ", e.last_name) as FULL_NAME, j.job_title
from employees e
inner join jobs j
on e.job_id = j.job_id;

-- 3️⃣ Display employee names, department names, and job titles together.
select concat(e.first_name, " ", e.last_name) as full_name, d.dept_name, j.job_title
from employees e
inner join departments d on e.dept_id = d.dept_id
inner join jobs j on e.job_id = j.job_id;

-- 4️⃣ List all employees who work in the ‘Engineering’ department.
select concat(e.first_name, " ", e.last_name)as full_name, d.dept_name
from employees e
inner join departments d
on e.dept_id = d.dept_id
WHERE d.dept_name = 'Engineering';

-- 5️⃣ Show employee names and their manager names.
select concat(e.first_name," ", e.last_name) as employee_name, concat(m.first_name," ", m.last_name) as manager_name
from employees e
inner join employees m
on e.manager_id = m.emp_id;

-- 🔥 Level 2 - Multiple JOINs
-- 6️⃣ List employees with department name and location city.
select concat(e.first_name," ",e.last_name) as full_name, d.dept_name, l.city
from employees e
join departments d on e.dept_id = d.dept_id
join locations l on l.location_id = d.location_id;

-- 7️⃣ Show employees with job title and the department they belong to.
select concat(e.first_name," ",e.last_name) as full_name, j.job_title, d.dept_name
from employees e
join jobs j on j.job_id = e.job_id
join departments d on d.dept_id = e.dept_id;

-- 8️⃣ Display all employees who work in departments located in ‘India’.
select concat(e.first_name," ",e.last_name) as full_name, d.dept_name, l.country
from employees e
join departments d on d.dept_id = e.dept_id
join locations l on l.location_id = d.location_id
WHERE l.country = 'India';

-- 9️⃣ Find employees whose salary is less than the min_salary of their job.
select concat(e.first_name," ",e.last_name) as full_name, e.salary, j.min_salary
from employees e
join jobs j
on e.job_id = j.job_id
where e.salary < j.min_salary; 		-- THERE'S NONE

-- 🔟 List all employees who report to ‘John Doe’.
select concat(e.first_name," ",e.last_name) as employee_name, concat(m.first_name," ", m.last_name) as manager_name
from employees e
inner join employees m
on e.manager_id = m.emp_id
WHERE m.first_name = "John" and m.last_name = 'Doe';


-- 🔥 Level 3 – LEFT / RIGHT / FULL JOIN concepts
-- 1️⃣1️⃣ Show all departments and their employees (including departments with no employees).
select d.dept_name as department_name, concat(e.first_name," ",e.last_name) as full_name
from departments d
left join employees e
on e.dept_id = d.dept_id; 

-- 1️⃣2️⃣ List all employees and their departments, even if the department does not exist (simulate with LEFT JOIN).
select d.dept_name as department_name, concat(e.first_name," ",e.last_name) as full_name
from departments d
left join employees e
on e.dept_id = d.dept_id; 

-- 1️⃣3️⃣ Display all job titles and their assigned employees (even if no one has that job).
select j.job_title as JOB_TITLE, concat(e.first_name, " ", e.last_name)
from jobs j
left join employees e
on j.job_id = e.job_id;

-- 1️⃣4️⃣ List all employees and their managers — include employees without managers.
select concat(e.first_name," ",e.last_name) as employee, concat(m.first_name," ", m.last_name) as manager
from employees e
left join employees m 
on e.manager_id = m.emp_id;

-- 1️⃣5️⃣ Find departments which do not have any employees.
select d.dept_name as department_name, concat(e.first_name," ",e.last_name) as employee_name
from departments d
left join employees e
on d.dept_id = e.dept_id
where e.emp_id is NULL; -- EMPTY SET.


-- 🔥 Level 4 – Aggregation with JOIN
-- 1️⃣6️⃣ Show each department with total salary of its employees.
select d.dept_name, sum(e.salary)
from departments d
join employees e on
d.dept_id = e.dept_id
group by d.dept_name;

-- 1️⃣7️⃣ Display the highest salary per department along with department name.
select d.dept_name, max(e.salary) as max_salary_in_dept
from departments d
join employees e on
d.dept_id = e.dept_id
group by d.dept_name;

-- 1️⃣8️⃣ Show the number of employees in each location (city).
select count(e.emp_id) as Employee_count, l.city as city_name
from employees e
join departments d on d.dept_id = e.dept_id
join locations l on d.location_id = l.location_id
group by l.city;

-- 1️⃣9️⃣ Display average salary per job title.
select j.job_title as JOB_TITLE, AVG(e.salary) as AVG_salary
from jobs j
join employees e on
j.job_id = e.job_id
group by j.job_title;

-- 2️⃣0️⃣ Find the department and city of the employee who earns the highest salary.
select e.first_name, d.dept_name, l.city, e.salary
from employees e
join departments d on d.dept_id = e.dept_id
join locations l on l.location_id = d.location_id
where e.salary = (SELECT max(salary) from employees);



