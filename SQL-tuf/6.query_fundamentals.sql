-- Querying fundamentals

show databases;

drop database test_db;

create database if not exists test_db;
use test_db;


-- countries table
create table countries(
  id int primary key auto_increment,
  country varchar(64) not null,
  population bigint null, -- null for missing data case
  area int not null, -- sq km
  region varchar(64) not null
);


-- adding data to table;
insert into countries (country, population, area, region) values
("India", 1463900000, 3287000, "Asia"),
("China", 1405000000, 9597000, "Asia"),
("Brazil", 221400000, 8516000, "South America"),
("Australia", 27000000, 7692000, "Oceania"),
("USA", 342000000, 9834000, "North America");



-- NOTE:
-- select -> which columns to display
-- from -> where to read data from
-- where -> which rows to KEEP
-- order by -> how to sort
-- limit/offset -> how many rows to RETURN
-- distinct -> to remove duplicates
-- as(asias) -> rename column/tables in OUTPUT.


-- NOTE: comparison operators
-- < (less than)
-- > (greater than)
-- <= (less than or equal to)
-- >= (greater than or equal to)
-- = (equal to)
-- <>/!= (not equal to)


-- NOTE : Logical operators
-- AND (all conditions must be true)
-- OR (one condition must be true)
-- NOT (negates a condition) ... write condition in paranthesis


-- NOTE : arithmeric operators
-- +,-,*,/,%, DIV(quotient without decimal)

-- all data 
select * from countries;


-- country names
select country as nations from countries;


-- oceania region data
select * from countries
where region = 'oceania';

-- all countries whose population is less than 1200000000
select country,population from countries
where population < 1200000000;

-- all the non-Asian countries
select country from countries
where region != "Asia";

-- Countries in Asia with population greater than 1 billion
select country from countries
where region = 'Asia'
AND 
population > 1000000000;


-- Countries with population greater than 1 billion or area greater than 9 million km
select country from countries
where population > 1000000000
OR 
area > 9000000;


-- Exclude all northe american countries
select * from countries
where not(region = 'North America');



-- arithmeric operators practice.
-- direct queries
select 10 + 5 as result;
select 10 - 5 as result;
select 10 * 5 as result;
select 10 / 5 as result;
select 10 % 5 as result;
select 10 DIV 3 as result;


-- display the population density
select country, population/area as population_density
from countries;

show warnings;

-- optimized query : select country, population/nullif(area,0) as population_density from countries;
-- if area becomes 0 then it throws warning, but this query will eliminate all warnings.



-- order by and limit

-- top 3 nations by area
select country,area as top_3 from countries
order by area DESC
limit 3;

-- distinct
-- display all the regions
select region from countries;
select distinct(region) from countries;

