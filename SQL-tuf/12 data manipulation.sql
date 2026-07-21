create database if not exists data_manipulation_dml;

use data_manipulation_dml;


-- INSERT
create table employees(
  emp_id int primary key,
  name varchar(100) not null,
  department varchar(50) null,
  salary decimal (10,2) not null,
  hire_date date not null,
  is_active boolean not null default true,

  constraint non_negative_salary check(salary >= 0)
);



-- adding record
insert into employees(emp_id, name, department, salary, hire_date, is_active)
values (301,'Neha sharma','Sales',55000.00,'2024-03-11',TRUE);

-- NOTE: If we don't define the order then it takes the order defined from table creation

-- adding multiple records
INSERT INTO employees (emp_id, name, department, salary, hire_date, is_active) VALUES
(302, 'Ishan Gupta',  'Engineering' ,110000.00, '2023-08-20', TRUE),
(303, 'Priya Singh',  'Support'     ,45000.00, '2024-07-01', TRUE),
(304, 'Karan Joshi',  'Engineering' ,95000.00, '2022-02-14', FALSE),
(305, 'Meera Nair',   ''            ,50000.00, '2025-03-01', TRUE),
(306, 'Omar Farooq',  NULL          ,62000.00, '2025-04-18', TRUE),
(307, 'Ananya Das',   'Finance'     ,72000.00, '2024-10-05', TRUE);

-- giving same emp_id to another employee as previous is leaving
insert into employees (emp_id, name, department, salary, hire_date, is_active) VALUES
(301, 'Dhyey S',  'Engineering' ,150000.00, '2025-08-08', TRUE) as new_record
on duplicate key update
name = new_record.name,
department = new_record.department,
salary = new_record.salary,
hire_date = new_record.hire_date,
is_active = new_record.is_active;


-- UPDATE: Changes values in existing rows

-- employee_id 305 was inserted with no Department, lets assign him a department
update employees
set department = 'Engineering'
where emp_id = 305;

update employees 
set department = 'AI', salary = 2000000.00
where emp_id = 301;

-- 50% hike to all Finance dept employees
update employees
set salary = salary + (0.5 * salary)
where department = 'Finance';


-- DELETE: DELETE removes one or more rows from a table.
delete from employees
where emp_id = 305;

-- DELETE Multiple Rows Using IN
DELETE FROM employees
WHERE emp_id IN (301, 302);

-- delete all data
delete from employees;


-- adding new data for next operations
INSERT INTO employees (emp_id, name, department, salary, hire_date, is_active) VALUES
(1, 'Alice Johnson', 'Engineering', 85000.00, '2020-01-15', true),
(2, 'Bob Smith', 'Marketing', 62000.00, '2021-03-22', true),
(3, 'Charlie Brown', 'Engineering', 92000.00, '2019-11-05', true),
(4, 'Diana Prince', 'Human Resources', 55000.00, '2022-07-12', true),
(5, 'Edward Norton', 'Sales', 70000.00, '2020-05-18', true),
(6, 'Fiona Glenanne', 'Engineering', 88000.00, '2021-09-30', true),
(7, 'George Miller', 'Finance', 95000.00, '2018-02-14', true),
(8, 'Hannah Abbott', 'Marketing', 58000.00, '2023-01-10', true),
(9, 'Ian Wright', 'Sales', 65000.00, '2022-04-25', true),
(10, 'Jane Doe', 'Engineering', 91000.00, '2020-12-01', true),
(11, 'Kevin Hart', 'Marketing', 61000.00, '2021-06-15', true),
(12, 'Laura Palmer', 'Finance', 72000.00, '2019-08-20', true),
(13, 'Mike Ross', 'Legal', 110000.00, '2017-05-10', true),
(14, 'Nina Simone', 'Engineering', 94000.00, '2020-03-03', true),
(15, 'Oscar Isaac', 'Sales', 68000.00, '2022-11-11', true),
(16, 'Peter Parker', 'Engineering', 75000.00, '2023-02-28', true),
(17, 'Quinn Fabray', 'Human Resources', 53000.00, '2021-12-12', true),
(18, 'Riley Reid', 'Marketing', 59000.00, '2020-07-07', true),
(19, 'Steve Rogers', 'Engineering', 98000.00, '2016-04-01', true),
(20, 'Tina Fey', 'Finance', 82000.00, '2019-10-20', true),
(21, 'Ursula K. Le Guin', 'Engineering', 99000.00, '2015-09-09', true),
(22, 'Victor Hugo', 'Legal', 105000.00, '2018-01-25', true),
(23, 'Wendy Darling', 'Sales', 62000.00, '2022-05-05', true),
(24, 'Xavier Woods', 'Engineering', 87000.00, '2021-08-14', true);


-- ALTER: The ALTER statement is used to modify the structure of an existing table without deleting the table or its data.
-- adding a new column
alter table employees
add column temp_check INT NULL;

-- filling the column
update employees
set temp_check = 10;

desc employees;


-- deleting a column
alter table employees
drop temp_check;

-- rename table
alter table employees
rename to employees_v2;


-- change the column name
alter table employees_v2
rename column department to dept;

-- change column name and datatype
alter table employees_v2
change name full_name varchar(200);

-- change datatype of full_name to 60;
alter table employees_v2
modify full_name varchar(60);

desc employees_v2;

select * from employees_v2;



