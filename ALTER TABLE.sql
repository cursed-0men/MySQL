create database rough;
use rough;

create table student(rollno int PRIMARY KEY,
					 name varchar(10) NOT NULL,
                     marks int NOT NULL,
                     grade varchar(2) NOT NULL,
                     city varchar(20) NOT NULL);
                     
insert into student(rollno, name, marks, grade, city)values(101,'Anil',78,'C','Pune'),
														   (102,'bhumika',93,'A','Mumbai'),
														   (103,'chetan',85,'B','Mumbai'),
													       (104,'dhruv',96,'A','Delhi'),
														   (105,'emanuel',12,'F','Delhi'),
														   (106,'farah',82,'B','Delhi');
desc student;
select * from student;
alter table student
change column name FULL_NAME varchar(10) NOT NULL;

alter table student
drop column grade;

-- adding age column
alter table student
add column age int NOT NULL;

-- adding data to age
update student
set age = 19;


-- deleting a column
alter table student
drop column age;


-- rename table
alter table student
rename to students;

-- resetting
alter table students
rename to student;

-- renaming a column
-- FULL_NAME to name
alter table student
change column FULL_NAME name varchar(20) NOT NULL;

-- modifying column
-- varchar 20 to 25 for city
alter table student
modify city varchar(25);

alter table student
modify city varchar(20) NOT NULL;

truncate table student;
show tables;
drop table student;

drop database rough;

