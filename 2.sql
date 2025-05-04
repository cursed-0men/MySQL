-- JOINS
-- INNER JOIN
-- SELECT column(s) from table_a INNER JOIN table_b ON table_a.column = table_b.column

create database joinns;
use joinns;

create table student(
std_id int PRIMARY KEY,
name varchar(10)
);

insert into student(std_id, name) values (101,'Adam'),(102,'Bob'),(103,'Casey');
select * from student;

create table course(
std_id int,
course varchar(20)
);

insert into course (std_id, course) values (102,'English'),(105,'Maths'),(103,'Science'),(107,'CS');
select * from course;

-- inner join query
select * from student INNER JOIN course
ON student.std_id = course.std_id;

-- left join query
select * from student LEFT JOIN course
ON student.std_id = course.std_id;

-- right join query
select * from student RIGHT JOIN course
ON student.std_id = course.std_id;

-- Full join query
select * from student LEFT JOIN course
ON student.std_id = course.std_id
union
select * from student RIGHT JOIN course
ON student.std_id = course.std_id;

drop database joinns;