show databases;
create database Lilly;
connect lilly

create table passenger(pass_name varchar(255) not null, pass_ID int(20) primary key auto_increment, pass_phone int(20), pass_email varchar(255), ticket_no int(20) not null, flight_no int(20) not null, depart_time time, arrival_time time);

create table flight(flight_name varchar(255) not null, flight_no int(30) primary key, depart_time time, arrival_time time,price int not null, total_seats int(50));

create table ticket(ticket_ID int(50) primary key, foreign key(pass_ID) references passenger(pass_ID),foreign key(flight_no) references flight(flight_no), price int(20));


insert into passenger values('Anusha', '1','1234', 'anu@g', '11','111', '08:20', '10:20'),('Monica', '2','1234', 'anu@g', '22','222', '08:20', '10:20'),('Sharin', '3','1234', 'anu@g', '33','333', '08:20', '10:20'),('sruthi', '4','1234', 'anu@g', '44','444', '08:20', '10:20');
insert into flight values('Indigo','111','08:20', '10:20','1000','20'),('AirIndia','222','09:20', '11:20','2000','10'),('Indigo','333','10:20', '13:20','1500','30'),('GoAir','444','08:20', '16:20','3000','40');
insert into ticket values('5','1','111','1000'), ('6','2','222','2000'),('7','3','333','1500'),('8','4','444','3000');  

alter table ticket rename column flight_no to Flight_id;

select c.pass_ID, c.flight_no, c.pass_name, f.Flight_no,f.price, f.depart_time from passenger c, flight f, ticket b
where c.pass_ID = b.pass_ID AND f.flight_no=b.Flight_id;


select f.flight_no,count(b.Flight_id) from flight f, ticket b where f.flight_no = b.Flight_id group by b.Flight_id;

select f.flight_no, f.price * count(b.Flight_id) as revenue
from flight f, ticket b
where f.flight_no = b.Flight_id
GROUP BY b.Flight_id;


