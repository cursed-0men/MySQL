-- -------------------------
-- MODULE 7 : DATE FUNCTIONS
-- -------------------------


create database dates_demo;
use dates_demo;

CREATE TABLE Employee(
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    BirthDate DATE,
    HireDate DATE,
    Salary DECIMAL(10, 2),
    Department VARCHAR(255)
);
INSERT INTO Employee (EmployeeID, FirstName, LastName, BirthDate, HireDate, Salary, Department)
VALUES
(1, 'John', 'Doe', '1990-05-15', '2015-03-10', 55000.00, 'Sales'),
(2, 'Jane', 'Smith', '1985-08-21', '2016-01-22', 60000.00, 'Marketing'),
(3, 'Michael', 'Johnson', '1992-12-02', '2017-07-05', 52000.00, 'IT'),
(4, 'Emily', 'Davis', '1988-04-17', '2018-09-12', 65000.00, 'HR'),
(5, 'David', 'Wilson', '1995-07-09', '2019-02-28', 58000.00, 'Finance'),
(6, 'Sarah', 'Anderson', '1983-02-14', '2020-06-15', 70000.00, 'Sales'),
(7, 'Jennifer', 'Lee', '1991-11-30', '2021-04-20', 54000.00, 'Marketing'),
(8, 'Matthew', 'Brown', '1989-09-05', '2015-12-03', 61000.00, 'IT'),
(9, 'Olivia', 'Taylor', '1994-06-23', '2017-08-18', 59000.00, 'HR'),
(10, 'Daniel', 'Martinez', '1987-03-07', '2018-11-14', 66000.00, 'Finance'),
(11, 'Ava', 'Garcia', '1993-01-12', '2019-10-07', 57000.00, 'Sales'),
(12, 'William', 'Rodriguez', '1984-10-28', '2020-03-25', 63000.00, 'Marketing'),
(13, 'Sophia', 'Hernandez', '1996-04-03', '2021-07-09', 62000.00, 'IT'),
(14, 'James', 'Lopez', '1986-08-10', '2016-09-02', 67000.00, 'HR'),
(15, 'Emma', 'Clark', '1990-12-19', '2017-11-30', 60000.00, 'Finance'),
(16, 'Henry', 'Adams', '1988-03-11', '2010-07-19', 62000.00, 'Sales'),
(17, 'Chloe', 'Parker', '1990-11-04', '2011-02-23', 64000.00, 'Marketing'),
(18, 'Ethan', 'Stewart', '1987-01-27', '2012-09-14', 58000.00, 'IT'),
(19, 'Grace', 'Carter', '1989-05-08', '2013-03-30', 67000.00, 'HR'),
(20, 'Logan', 'Phillips', '1986-12-21', '2014-11-02', 69000.00, 'Finance'),
(21, 'Natalie', 'Evans', '1991-06-15', '2015-08-26', 63000.00, 'Sales'),
(22, 'Christopher', 'Turner', '1985-09-09', '2016-05-17', 71000.00, 'Marketing'),
(23, 'Isabella', 'Collins', '1992-04-29', '2017-10-13', 65000.00, 'IT'),
(24, 'Andrew', 'Bailey', '1988-07-18', '2018-04-09', 72000.00, 'HR'),
(25, 'Madison', 'Morgan', '1993-02-02', '2019-01-20', 66000.00, 'Finance'),
(26, 'Benjamin', 'Reed', '1990-10-11', '2011-06-05', 60000.00, 'Sales'),
(27, 'Ella', 'Cook', '1987-01-25', '2012-12-18', 64000.00, 'Marketing');



-- +-----------+
-- |🔰QUESTIONS|
-- +-----------+

-- NOTE: Dynamic Queries varies with current date.

-- 1. Write a query to find employees hired in the year 2017.
select EmployeeID, concat(FirstName,' ',LastName) as name, HireDate
from Employee where year(HireDate) = '2017';
-- OR
select * from employee where 
year(hiredate) = year(date_sub(curdate(), interval 8 year));

-- 2. Retrieve the employees whose birthdays are in the month of April.
select concat(FirstName,' ',LastName) as name, BirthDate from Employee
where month(BirthDate) = 4;
-- OR
select * from employee where 
month(birthdate) = month(date_sub(curdate(), interval 7 month));


-- 3. Find employees who were hired before January 1, 2018.
select concat(FirstName,' ',LastName) as name, HireDate from Employee
where year(HireDate) < 2018;
-- OR
select * from employee where 
hiredate < date_sub(date_format(curdate(),'%Y-01-01'), interval 7 year);

-- 4. Calculate the age of each employee as of today and display their names along with the age.
select
concat(FirstName,' ',LastName) as name,
floor(datediff(curdate(), BirthDate) / 365) as age
from Employee;

-- 5. Select employees with a hire date exactly 5 years after their birth date.
select * from Employee
where HireDate = date_add(BirthDate, interval 5 year); -- NONE

-- 6. List employees who have been hired for more than 5 years.
select * from employee 
where floor(datediff(curdate(), hiredate)/365) > 5;

-- 7. Find the employees whose birthdays fall on a weekend.
select BirthDate ,dayname(BirthDate), EmployeeID from Employee
where dayofweek(BirthDate) in (1,7);

-- 8. Show the employee names along with the number of days since they were hired.
select concat(FirstName,' ',LastName) as name, HireDate,
datediff(Curdate(), HireDate) as total_days from Employee;

-- 9. Return employees who were hired in the last 6 months.
SELECT * FROM Employee
WHERE HireDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH); -- NONE

-- 10. Find employees whose hire date and birth date fall in the same month.
select * from Employee
where month(BirthDate) = month(HireDate); -- NONE

-- 11. Average years employees have been working:
select ROUND(AVG(datediff(curdate(), HireDate) / 365))
from Employee;

-- 12. Employees older than 30 but hired in last 3 years:
select EmployeeID from Employee
where
(FLOOR(datediff(curdate(),BirthDate)) / 365) > 30 AND
HireDate >= date_sub(curdate(), interval 3 year); -- NONE

-- 13. Earliest and latest hire dates
select
Min(HireDate) as earliest_hire,
max(HireDate) as latest_hire
from Employee;

-- 14. Employees with birthdays in next 30 days:
select EmployeeID, Birthdate
from Employee
where
date_format(BirthDate, '%m-%d') BETWEEN
date_format(curdate(), '%m-%d') AND date_format(date_add(curdate(), interval 30 day), '%m-%d');

-- 15. Count employees grouped by hire year
select year(HireDate) as HireYear, count(*) from Employee
group by HireYear;



