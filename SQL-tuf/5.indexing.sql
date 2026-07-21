-- creating indexes

use test_db;

create table new_users(
user_id int Primary key auto_increment,
name varchar(30) not null,
email varchar(30) not null,
is_active boolean default false,
account_balance decimal,
last_seen datetime,

index(email)
);


-- data entry
insert into new_users(name, email)
values ("dhyey", "dhyey@gmail.com"), ("rengoku","dhyey@gmail.com");


-- show the names
select name from new_users where email = 'dhyey@gmail.com';


-- assinging index after table creation
create index account_bal_index on new_users(account_balance);


-- to see all the indexes
show index from new_users;


-- delete index
drop index account_bal_index on new_users;