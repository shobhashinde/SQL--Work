1)Database - library management
student (student_id, name, emailid, phoneno,department)
staff (staff_id, staff_name,staff_email,staff_phoneno,position)
book(book_id,book_name,description,is_avilable,quantity,last_ordered)
author (author_id,author_name,publisher_name,publisher_date,book_id_details)
student_account (account_id,student_id_details,issued_book_id, issueddate,issued_by_staff)
payment(payment_id, payment_method, payment_type);

2)create 5 tables using proper attributes, datatypes & constraints
  create database library;
  use library;
  create table student (
  student_id int primary key auto_increment,
  name varchar(30) not null, 
  emailid varchar(30) not null,
  phoneno varchar(30) ,
  department varchar(30) not null);
  
  create table staff (
  staff_id int primary key auto_increment, 
  staff_name varchar(30) not null,
  staff_email varchar(30) not null,
  staff_phoneno varchar(30),
  position varchar(30) not null);
  
  create table book(
  book_id int primary key auto_increment,
  book_name varchar(30) not null,
  description varchar(50) not null,
  is_avilable varchar(5) ,
  quantity varchar(5) ,
  last_ordered datetime);
  
create table author (
author_id int primary key auto_increment,
author_name varchar(30) not null,
publisher_name varchar(30) not null,
publisher_date datetime,
book_id_details int,
foreign key (book_id_details) REFERENCES book(book_id) );

create table student_account (
account_id int primary key auto_increment,
student_id_details int,
foreign key (student_id_details) references student(student_id),
issued_book_id int, 
foreign key (issued_book_id) references book(book_id),
issueddate date,
issued_by_staff int,
foreign key (issued_by_staff) references staff(staff_id)
);
 select * from student_account;

3)Insert 5 records in each 
 insert into student ( name, emailid, phoneno,department)
 values ('shobha','shobha@mail.com',+02225635796,'Computer'),
  ('janvi','shobha@mail.com',+02225635796,'Computer'),
  ('rupa','shobha@mail.com',+02225635796,'Computer'),
  ('arwa','shobha@mail.com',+02225635796,'Computer'),
  ('shobha','shobha@mail.com',+02225635796,'Computer');

 select * from student;

-- staff table ---------------------------------------------------
insert into staff (staff_name,staff_email,staff_phoneno,position)
values ('ashish','abc@mail.com',9876543212,'sr.liberian'),
 ('ashish','abc@mail.com',9876543212,'sr.liberian'),
 ('ashish','abc@mail.com',9876543212,'sr.liberian'),
 ('ashish','abc@mail.com',9876543212,'sr.liberian'),
 ('ashish','abc@mail.com',9876543212,'sr.liberian');
 select * from staff;
 
-- book tbale -------------------------------------------------------

insert into book(book_name,description,is_avilable,quantity,last_ordered)
values ('science','it is useful for science student', 'Yes', 20, '2024-11-30 12:00:00'),
('science','it is useful for science student', 'Yes', 20, '2024-11-30 12:00:00'),
('science','it is useful for science student', 'Yes', 20, '2024-11-30 12:00:00'),
('science','it is useful for science student', 'Yes', 20, '2024-11-30 12:00:00'),
('science','it is useful for science student', 'Yes', 20, '2024-11-30 12:00:00');
 select * from book;
 
 -- author table ----------------------------------------------------
insert into author (author_name,publisher_name,publisher_date,book_id_details)
values('janvi singh','jp publication','2000-10-10 00:00:00',1),
('janvi singh','jp publication','2000-10-10 00:00:00',1),
('janvi singh','jp publication','2000-10-10 00:00:00',1),
('janvi singh','jp publication','2000-10-10 00:00:00',1),
('janvi singh','jp publication','2000-10-10 00:00:00',1);

 select * from author;

-- student_account table ----------------------------------------------
insert into student_account (student_id_details,issued_book_id, issueddate,issued_by_staff)
values (1,2,'2024,12-10',5),
  (1,2,'2024,12-10',5),
  (1,2,'2024,12-10',5),
  (1,2,'2024,12-10',5),
  (1,2,'2024,12-10',5);

select * from student_account;

4)all queries 

create table payment(
payment_id int primary key auto_increment, 
payment_method varchar(30) not null, 
payment_type varchar(30) not null);

select * from payment;
insert into payment (payment_method,payment_type)
values ('UPI', 'online');

drop table payment;
truncate table payment;

create database if not exists library ;
drop database if exists library;

select * from book where description like '%science%';
select * from book where description like '%student';

