
show databases; -- shows all existing databases
create database learn_sql; -- create database
use learn_sql; -- use the database


-- table creation
create table users(
	user_id int,
    name varchar(30),
    email varchar(40),
    is_active boolean,
    account_balance decimal,
    signup_date_time datetime,
    last_seen datetime,
    dob date
    );
    -- here is users table, there is not data check

desc users; -- shows table structure

-- delete table
-- drop table users;


-- adding data
insert into users(user_id, name, email) values (1032220948, "dhyey","dhyeysavalia01@gmail.com");

-- seeing whole table
select * from users;

-- adding another entry
insert into users(name, user_id, email) values ("tanjiro", 1032220000, "tanjirok@demonslayer.com");


-- adding multiple entries
insert into users(user_id, name, email) values (1032221111, "inosuke","moutainking@demonslayer.com"), (1032222222, "zenitsu","thunder@demonslayer.com");


-- display all names
select name from users;

-- giving alias
select name, email as email_address from users; 







