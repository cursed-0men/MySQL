create database IF NOT EXISTS college;
use college;

-- creating student table
create table student(rollno int PRIMARY KEY,
					 name varchar(10) NOT NULL,
                     marks int NOT NULL,
                     grade varchar(2) NOT NULL,
                     city varchar(20) NOT NULL);
                     
-- schema of table
desc student;

-- inserting data into table
insert into student(rollno, name, marks, grade, city)values(101,'Anil',78,'C','Pune'),
														   (102,'bhumika',93,'A','Mumbai'),
														   (103,'chetan',85,'B','Mumbai'),
													       (104,'dhruv',96,'A','Delhi'),
														   (105,'emanuel',12,'F','Delhi'),
														   (106,'farah',82,'B','Delhi');

-- showing whole table with all contents
select * from student;

-- showing name, rollno columns
select rollno, name from student;

-- showing rollno, name and city
select rollno, name, city from student;

-- where clause
-- students from pune
select rollno from student
where city = 'Delhi';

-- student with marks above 75
select rollno, name from student
where marks >= 75;

-- student with marks less than 33
select rollno, name from student
where marks < 33;

-- OPERATORS WITH WHERE CLAUSE
-- Arithmetic : + - * / % 
-- Comparison : = != > >= < <= 
-- Logical : AND OR NOT IN BETWEEN ALL LIKE ANY
-- Bitwise : &(bitwise AND) |(bitwise OR)

-- students with marks = 96
select rollno, name from student
where marks = 96;

-- AND 
-- students from delhi with marks above 80
select * from student
WHERE city = "Delhi" AND marks > 80;

-- OR
-- students from pune or marks less than 33
select * from student
where city = "Pune" OR marks < 33;

-- IN : List
-- students from mumbai and pune
select * from student
where city IN ('Mumbai','Pune');

-- NOT
-- students not from pune
select * from student
where city NOT in ('Pune');

-- LIMIT CLAUSE
-- sets an upper limit on number of tuples
-- displays few upper tuples as specifies.

-- 3 students from whole database
select * from student
limit 3;

-- 2 from delhi
select * from student
where city = "Delhi"
limit 2;

-- top 3 students marks above 45
select * from student
where marks > 45
limit 3;

-- ORDER BY CLAUSE 
-- To sort in ascending or descending order

-- displaying top 3 students according to marks
select * from student
ORDER BY marks desc
limit 3;


-- AGGREGATE FUNCTIONS
-- count() = get number of somethings
-- max() = get maximum of somethings
-- min() = get minimum of somethings
-- sum() = get sum of somethings
-- avg() = get average of somethings

-- max()
-- display maximum marks
select max(marks) from student;

-- min()
-- displaying minimum marks
select min(marks) from student;

-- avg()
-- displaying average of all marks
select avg(marks) from student;

-- count()
-- displaying total number of students
select count(rollno) from student;


-- GROUP BY CLAUSE
-- it collects data from multiple records and groups the result by one or more columns

-- count number of students in each city
select count(rollno)
from student
group by city;
-- this will make different groups of different cities

-- this will mention numbers as well as group names(cities)
select count(name), city
from student
GROUP BY city;

-- displaying average marks of students city wise
select city, avg(marks)
from student
group by city;

-- displaying average marks of students city wise in descending order
select city, avg(marks)
from student
group by city
ORDER BY avg(marks) DESC;


-- displaying top 2 average marks of students city wise in descending order 
select city, avg(marks)
from student
group by city
ORDER BY avg(marks) DESC
limit 2;

-- Group on the basis of grade starting from A
select grade, count(rollno)
from student
group by grade
order by grade asc;


-- HAVING CLAUSE
-- used when we want to apply conditions after grouping.

-- count the number of students in each city where max marks > 90.
select city, count(rollno)
from student
GROUP BY city
HAVING max(marks) > 90;

-- **********GENERAL ORDER OF CLAUSES**********

-- select column(s)
-- FROM tbale_name
-- WHERE Condition
-- GROUP BY column_name
-- HAVING Condition
--  ORDER BY column ASC/DESC


-- UPDATE
-- To update existing rows
-- safe mode error SOLUTION = SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 0;


--  Set grade A to O
update student
set grade = "O"
where grade = "A";

-- resetting the table
update student
set grade = "A"
where grade = "O";

-- Updating marks of emanuel
update student
set marks = 30
where rollno = 105;

-- resetting the table
update student
set marks = 12
where rollno = 105;

-- grade students B whose marks are between 80 to 
select rollno,name,marks,grade from student
where marks between 70 and 90; 

-- give 1 extra mark to each student for bonus question
update student
set marks = marks + 1;

-- resetting the table
update student 
set marks = marks - 1;


-- DELETE 
-- DELETE FROM table_name WHERE condition;

-- delete student tuple whose marks < 33.
delete from student
where marks < 33;

-- deleting students with marks below 100;
delete from student
where marks < 100;


-- ALTER

-- ADDING COLUMN 
-- ALTER TABLE table_name
-- ***ADD column column_name datatype constraint;

-- ***Adding age column
-- add column age
ALTER TABLE student
add column age int NOT NULL;

-- adding data to age column
-- add age 19 to age column for all
update student
set age = 19;

-- ***deleting column
-- delete age column
alter table student
drop column age;

-- ***RENAME TABLE
alter table student
RENAME TO students;

-- resetting the table
alter table students
rename to student;

-- RENAME COLUMN
-- alter table table_name change column old_name new_name datatype constraint.

-- rename column city to location
alter table student
change column city location varchar(20) NOT NULL;

-- resetting the table
alter table student
change column location city varchar(20) NOT NULL;

-- modify column (datatype/constraint)
alter table student
modify city varchar(25) NOT NULL;

-- resetting the table
alter table student
modify city varchar(20) NOT NULL;

-- TRUNCATE : Delete all data from table
-- TRUNCATE TABLE table_name;




-- viewing table
select * from student;

-- deleting table
drop table student;