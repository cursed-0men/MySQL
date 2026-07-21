i-- constraints

create database if not exists test_db;

use test_db;

-- table creation
create table users(
	user_id int primary key auto_increment, -- primary keys is automtically assigned and increases as well.
	name varchar(30),
	email varchar(30) unique not null, -- not null ensures that the column data is entered
    -- unique ensures well...unique values...its not a primary identifier.
	is_active boolean default false, -- if value is not entered then it will show "false" by default.
	account_bal decimal,
	last_seen datetime,
    age int not null,
    check (age > 18) -- enforces a condition for data entry
);

-- data entry
insert into users(name, email, age, is_active) values ('dhyey','dhyeysavalia01@gmail.com',22, true),
('inosuke','boar01@gmail.com',22, true),
('zenitsu','thunder01@gmail.com',21, true),
('tanjiro','yorichi01@gmail.com',23,true); 

-- failed query for not null
-- insert into users(name,email) values ('tengen','dhyeysavalia01@gmail.com'); -- ERROR: email field doesn't have a default value.(for not null)
-- duplicate error
insert into users(name,email) values ('giyu','dhyeysavalia01@gmail.com'); 

-- check verification
insert into users(name,email,age) values ('muichiro','misthashira@gmail.com',15);  -- error: check ins voilated

-- default value
insert into users(name,email,age) values ('rengoku','flamehashira@gmail.com',25);

drop table users;