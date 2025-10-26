-- CASE Expression Practice (1)
-- NOTE: 🔥(TO BE REVISED)


create database case_practice_db;
use case_practice_db;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    experience INT,
    city VARCHAR(50)
);

INSERT INTO employees (emp_name, department, salary, experience, city) VALUES
('Aarav', 'HR', 30000, 2, 'Mumbai'),
('Riya', 'IT', 80000, 5, 'Bangalore'),
('Karan', 'Finance', 60000, 4, 'Delhi'),
('Meena', 'IT', 55000, 3, 'Bangalore'),
('Vivek', 'Marketing', 40000, 2, 'Pune'),
('Priya', 'HR', 75000, 6, 'Mumbai'),
('Neha', 'Finance', 95000, 9, 'Delhi'),
('Arjun', 'IT', 120000, 10, 'Hyderabad'),
('Rohit', 'Marketing', 30000, 1, 'Pune');


-- ------------------------------------
-- ⚡️ Level 1: Easy (Concept Building)
-- ------------------------------------

-- 1. Salary Level: Label each employee as 'Low', 'Medium', or 'High' based on salary.
-- salary < 50000 : low
-- 50000 < salary < 90000 : medium
--  salary > 90000 : High

select emp_name, salary,
case 
	when salary < 50000 then 'Low'
    when salary between 50000 and 90000 then 'Medium'
    else 'High'
end as Salary_level
from employees;

-- 2. Bonus by Department: Assign bonus percent
-- HR : 5%
-- IT : 10%
-- Finance : 8%
-- Marketing : 6%
select emp_name, department, 
case department
	when 'HR' then 5
    when 'IT' then 10
    when 'Finance' then 8
    When 'Marketing' then 6
end as Bonus_percent
from employees;

-- OR

select department,
case department
	when 'HR' then 5
    when 'IT' then 10
    when 'Finance' then 8
    when 'Marketing' then 6
end as bonus_percent
from employees
group by department;


-- 3. Experience Category : Categorize employees by years of experience
-- ≤2 → Junior
-- 3–5 → Mid-Level
-- 6–9 → Senior
-- ≥10 → Expert
select emp_name, experience, 
case 
	when experience <= 2 then 'Junior'
    when experience between 3 and 5 then 'Mid-Level'
    when experience between 6 and 9 then 'Senior'
    else 'Expert'
end as Experience_lvl_category
from employees;

-- --------------------------------------
-- ⚡️⚡️ Level 2: Easy (Concept Building)
-- --------------------------------------

-- 4.  Promotion Eligibility: Recommend status based on salary and experience
-- salary > 70000 & experience > 5 → “Promote”
-- salary < 40000 → “Training Required”
-- otherwise → “Stable”
select emp_name, salary, experience,
case 
	when salary > 70000 and experience > 5 then 'Promote'
    when salary < 40000 then 'Training Required'
    else 'Stable'
end as Promotion_eligibility
from employees;

-- 🔥 5. High Earners per Department
-- Count how many employees earn > ₹70,000 in each department.
select department,
sum(case when salary > 70000 then 1 else 0 end) as 'High_Earners'
from employees
group by department;

-- 🔥 6. Experience Grade Count : Show how many employees fall into each experience level.
-- key: 
-- ≤2 → Junior
-- 3–5 → Mid-Level
-- 6–9 → Senior
-- ≥10 → Expert
select
sum(case when experience <= 2 then 1 else 0 end) as 'Junior',
sum(case when experience between 3 and 5 then 1 else 0 end) as 'Mid-level',
sum(case when experience between 6 and 9 then 1 else 0 end) as 'Senior',
sum(case when experience >= 10 then 1 else 0 end) as 'Expert'
from employees;

-- 🔥 7. Conditional Aggregation by City
-- For each city, count:
-- employees with salary < 50000 (less_paid)
-- employees with salary ≥ 50000 (highly_paid)
select city,
sum(case when salary < 50000 then 1 else 0 end) as 'less_paid',
sum(case when salary >= 50000 then 1 else 0 end) as 'highly_paid'
from employees
group by city;

-- 🔥🔥 8.  Label Top 3 Salaries
-- Mark top 3 highest-paid employees as 'Top Earner', rest 'Regular'.
-- (Use subquery for threshold)
select emp_name, salary,
case when salary >= (select min(salary) from (select salary from employees order by salary desc limit 3) as top3) then 'Top_earner' else 'regular'
end as category
from employees;

-- ----------------------------------------
-- ⚡️⚡️⚡️ Level 3: Advanced / LeetCode-Style Problems
-- ----------------------------------------

-- 🔥🔥 9. Salary Raise Recommendation
-- If salary < 50000 → 15% raise
-- If salary 50k–80k → 10%
-- Else → 5%
-- Show new salary
select emp_name,salary,
case
	when salary < 50000 then '15%'
    when salary between 50000 and 80000 then '10%'
    else '5%'
end as salary_raise, (salary + salary * 
case
	when salary < 50000 then 0.15
    when salary between 50000 and 80000 then 0.10
    else 0.05
end) as new_salary
from employees;

-- 10. Department Classification : Based on average salary
-- 80k → Overpaid
-- 50k–80k → Balanced
-- <50k → Underpaid
select department, avg(salary),
case
	when avg(salary) > 80000 then 'Overpaid'
    when avg(salary) between 50000 and 80000 then 'Balanced'
    when avg(salary) < 50000 then 'Underpaid'
end as dept_classification
from employees
group by department;
 
-- 🔥 11. City-Based Bonus Calculation
-- Bangalore/Hyderabad → ₹10,000
-- Mumbai → ₹5,000
-- Else → ₹2,000
-- Show total compensation.
select emp_name, city, salary, salary + 
case
	when city in ('Banglore','Hyderabad') then 10000
    when city = 'Mumbai' then 5000
    else 2000
end as salary_plus_compensation
from employees;

-- 🔥 12. Performance Grading
-- Grade by experience:
-- ≥8 years → A
-- 5–7 years → B
-- 3–4 → C
-- ≤2 → D
select emp_name, experience, 
case
	when experience >= 8 then 'A'
    when experience between 5 and 7 then 'B'
    when experience between 3 and 4 then 'C'
    else 'D'
end as performance_grading
from employees;

-- 13. Salary Distribution Summary
-- Show department-wise counts of:
-- salary < 50000 (low_salary)
-- 50000–80000 (mid_Salary)
-- 80000 (high_salary)
select department,
sum(case when salary < 50000 then 1 else 0 end) as 'Low_Salary',
sum(case when salary between 50000 and 80000 then 1 else 0 end) as 'Mid_salary',
sum(case when salary > 80000 then 1 else 0 end) as 'High_salary'
from employees
group by department;

-- 🔥🔥🔥 14. Top Performer Detection
-- Label each employee:
-- “Top Performer” if salary > dept average and experience ≥ 5
-- Else “Below Avg” 
select e.emp_name, e.salary, e.experience,
case
	when e.salary > (select avg(salary) from employees where department = e.department) and e.experience >= 5 then 'Top performer'
    else 'Below avg.'
end as performance_status
from employees e;


-- 🔥🔥 15. Bonus Pool by Department (Complex Aggregation)
-- Each department’s total bonus:
-- 10% of salaries for employees earning < 60000
-- 5% of salaries otherwise
select department,
sum(case when salary < 60000 then salary * 0.1
	else salary * 0.05
    end) as bonus_pool
from employees
group by department;



