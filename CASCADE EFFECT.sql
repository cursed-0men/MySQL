create database trip;
use trip;

create table hotel(hotel_id int PRIMARY KEY,
				   hotel_name varchar(10) NOT NULL,
				   rating varchar(10) NOT NULL);

insert into hotel (hotel_id, hotel_name,rating) values (1,'Krishna','*****'),
													   (2,'Lords','***'),
													   (3,'Leo','**'),
													   (4,'Fern','****');

select * from hotel;

   -- testing on delete/update cascade
create table guests(guest_id int PRIMARY KEY,
					hotel_id int,
					FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
                    ON UPDATE CASCADE
                    ON DELETE CASCADE);

insert into guests(guest_id, hotel_id) values (101,1),
											  (203,3),
											  (506,2),
											  (444,4);
update hotel
set hotel_id = 33
where hotel_id = 3;

select * from guests;
drop database trip;