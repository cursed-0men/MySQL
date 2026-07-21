create database if not exists set_ops;

use set_ops;

create table dev_india(
  dev_id int primary key,
  dev_name varchar(50) not null,
  tech_stack varchar(50) not null
);

create table dev_usa(
  dev_id int primary key,
  dev_name varchar(50) not null,
  tech_stack varchar(50) not null
);


insert into dev_india (dev_id, dev_name, tech_stack) values
(101,'alice','backend'),
(102, 'bob', 'frontend'),
(103, 'charlie', 'devOps'),
(104, 'diya', 'data'),
(105, 'farhan', 'backend'),
(106, 'gita', 'QA');

insert into dev_usa (dev_id, dev_name, tech_stack) values
(201,'david','security'),
(102, 'bob', 'frontend'),
(103, 'charlie', 'platform'),
(202, 'eve', 'backend'),
(203, 'hannah', 'data'),
(204, 'ishan', 'devOps');

-- 1. UNION
-- UNION combines results from two or more SELECT statements and removes duplicate rows.
-- keep columns same and in same order
select dev_id, dev_name from dev_india
union
select dev_id, dev_name from dev_usa;

-- UNION ALL
-- UNION ALL merges results but does not remove duplicates.
-- So it’s faster. Why?
-- Because duplicate elimination is work. SQL must compare rows and filter them out.
select dev_id, dev_name from dev_india
union all
select dev_id, dev_name from dev_usa;


-- intersection:
-- no direct approach

with temp_data as(
select dev_id, dev_name from dev_india
union ALL
select dev_id, dev_name from dev_usa)
select dev_id, dev_name, count(*)
from temp_data
group by dev_id, dev_name
  having count(*) > 1;
