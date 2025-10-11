create database coffee;
use coffee;

-- Transactional query language
create table cafe(
	item_id int primary key auto_increment,
	item_name varchar(30) UNIQUE NOT NULL,
    price decimal(10,2) NOT NULL
);
START TRANSACTION; -- to record insertions;

insert into cafe (item_name, price)
values
('Espresso',119.99),('Cappucino',60.00),('Hot chocolate',55.75),('Iced latte',40.00),('Mocha',110.00),('Hot coffee',30.00);

select * from cafe;

SAVEPOINT p1;
DELETE FROM cafe where item_id = 5;
select * from cafe;
ROLLBACK TO p1;
