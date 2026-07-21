a-- primary key and foreign key

use learn_sql;

show tables;

-- create table
create table users(
	user_id int primary key,
    name varchar(30),
    email varchar(40),
    is_active boolean,
    account_bal decimal,
    signup_datetime datetime,
	last_seen datetime
);

-- foreign key
create table orders(
	order_id int primary key,
	user_who_ordered int,
	amount decimal,
	order_date date,
    foreign key(user_who_ordered) references users(user_id)
);

drop table orders;
drop table users;


-- multiple primary keys...combination of 2 columns must be unique
-- AKA composite primary key
create table users(
	user_id int,
    name varchar(30),
    email varchar(40),
    is_active boolean,
    account_bal decimal,
    signup_datetime datetime,
	last_seen datetime,
    
    primary key(user_id, email) -- multiple users can have same email...but combination of user_id and email is different and hence it works
);


-- adding entries
insert into users (user_id, name, email) values (1,"dhyey","dhyeysavalia01@gmail.com"), (1,"tanjiro","dhyeysavalia01@gmail.com");


