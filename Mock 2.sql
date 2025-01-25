-- create database ecommerce
create database ecommerce;

-- drop database if exist
drop database if exists ecommerce ;

-- create database if not exist
create database  if not exists ecommerce;

-- use database 
use ecommerce;

/* -------------------------------------------------
                  Customers
-----------------------------------------------------*/
create table customers (
customer_id int primary key auto_increment,
customer_fname varchar(30) not null,
customer_lname varchar(30) not null,
Customer_branchkey enum('UTWATF', 'WZ','INEECC') not null default 'UTWATF',
Dob date,
is_active enum( '1','0') not null default '1',
customer_created timestamp default current_timestamp ,
customer_last_updated timestamp default current_timestamp ,
is_exchange_only enum( '1','0') not null default '0'
);

-- Drop the structure of the table
drop table customers;

Insert into customers (customer_fname,customer_lname,dob)
values ('shobha','shinde','1996-01-12'),
('prachi','singh','1999-01-12'),
('kiran','rawat','2000-01-12'),
('pooja','uke','2001-01-12'),
('sachin','sharma','1990-01-12');

-- delete records from table 
truncate customers;

-- retrive the table data
select * from customers;

-- retrive the table data using alias
select customer_fname as first_name, customer_lname as last_name
from customers c;

-- retrive the customer data whose fname contain letter ac
select * from customers where  customer_fname like '%ac%';

-- update customer branchkey 
update customers set customer_branchkey = 
case
when customer_fname = 'pooja' then 'UTWATF'
when customer_fname = 'sachin' then  'INEECC'
end 
where customer_fname in ('pooja','sachin');

-- Update customer branchkey using opertors
SET SQL_SAFE_UPDATES = 0; 
update customers set customer_branchkey = 'WZ', is_exchange_only = 1 where dob >= '1996-01-12';

-- count the exchange only customer
select count(*) as total_exchang_only 
from customers where is_exchange_only = 1;

-- add column 
alter table customers
add customer_address varchar(100) not null;

-- add constraint
alter table customers
add website varchar(100);

alter table customers 
add constraint unique_web unique(website) ;

-- drop constraint
alter table customers
drop constraint unique_web;

/*-----------------------------------------------
                 category
------------------------------------------------- */

create table category (
category_id int primary key auto_increment,
category_name varchar(100)  not null,
box_category varchar(100) unique not null, -- use this field as foregin key into boxes table
is_stockable enum ('1','0') not null default '1',
is_deleted enum ('1','0') not null default '0',
created_date timestamp default current_timestamp,
last_updated timestamp default current_timestamp
);

-- drop the table structure
drop table category;

insert into category (category_name,box_category)
values ('phone','Android phone'),
('phone','Apple phone'),
('desktop','dell laptop'),
('desktop','Apple laptop'),
('Playstation','Playstation1'),
('Playstation','Prs-1'),
('Playstation','Prs-2'),
('Movies','DVD Movies');

-- retrive data 
select * from category ca;

-- update stock status for category 
UPDATE category SET is_stockable = '0' WHERE category_id in ('6','4','8');

-- check how many category are stockable
select sum(is_stockable) from category
where is_stockable= 1;

-- add column
alter table category 
add column price int check(price>0);


-- update price for box_category
update category set price = 40000
where box_category in ('Android phone','Prs-1');

-- update price of the category
update category set price = 1000*100
where box_category in ('Apple phone','Apple laptop');

-- find the average price
select avg(price) from category;

-- fetch unique category 
select distinct(category_name) from category;

-- show category name into upper & lower case 
select upper('category_name') as cat_name ,lower('box_categoryname') as box_name, concat('category_name','box_categoryname')
from category;

-- fetch unique records using functions 
select distinct (upper('category_name'))  as cat_name from category;
select distinct (lower('box_categoryname'))from category;
select distinct (concat('category_name','box_categoryname')) from category;

-- drop  column
alter table category
drop column price;

-- update customer branchkey (error)
update category set is_stockable = 
case
when category_id in ('1','2','3','8') then '1'
when category_id in ('4','5','6','7') then '0'
end 
where category_id in ('1','2','3','4','5','6','7','8') ;

/*-----------------------------------------------
                 box category
------------------------------------------------- */

create table boxes
(box_id int primary key auto_increment,
box_name varchar(100) unique not null,
box_category varchar(100),
category_id int,
is_stockable enum ('1','0') not null default '1',
is_deleted enum ('1','0') not null default '0',
created_date timestamp default current_timestamp,
last_updated timestamp default current_timestamp,
foreign key (box_category) references category (box_category),
foreign key (category_id) references category (category_id)
);


insert into boxes (box_name, box_category,category_id)
values('samsung galaxy s21','Android phone', '1'),
('Iphone 14 pro max','Apple phone', '2'),
('Dell i5 processor 24gb ram','dell laptop', '3'),
('Witch','DVD Movies', '8'),
('one-plus nord 21','Android phone', '1'),
('Redmi note 3','Android phone', '1');

-- drop table structure 
drop table boxes;

-- retrive data
select * from boxes;

-- add column 
alter table boxes
add column price int check(price>0);

-- fetch unique records for item which stock level is not null
select distinct(box_name), box_category from boxes b
where is_stockable is not null ;

-- add box price
update boxes set price = 10*100 
where price is null; 

-- fetch max & min category id 
select max(category_id), min(category_id)
from boxes;

-- fetch category for price greater than 100
select category_id, max(price)
from boxes
group by category_id
having max(price) > 100;

-- fetch category for price greater than 100
select category_id, min(price*100-100)
from boxes
group by category_id
having max(price) > 100;

-- fetch uniqiue category 
select distinct(category_id), avg(price) from boxes group by category_id;



/*-----------------------------------------------
                orders
------------------------------------------------- */
create table orders(
id int primary key auto_increment,
customer_id int,
box_id int,
price int,
is_processed enum('1','0') default '0' not null,
created_date timestamp default current_timestamp,
last_updated timestamp default current_timestamp,
foreign key (customer_id) references customers(customer_id) 
on update  cascade
on delete set null ,
foreign key (box_id) references boxes(box_id)
on update  cascade
on delete set null
);

-- drop table structure
drop table orders;


insert into orders (customer_id,box_id,price)
values (1,19,0),
(2,20,0),
(3,21,0),
(4,22,0),
(5,23,0);

-- retrive data 
select * from orders;

-- delete records
truncate table orders;

-- update table price
update orders set price = 10*100;

-- update cuurent price for boxes by multiplying 10
update orders set price = price*10 
where box_id in(19,20);

-- select max, min & avg price of the boxes
select max(price), min(price), avg(price)
from orders;

-- fetch boxes whose price greter than max price
select max(price), box_id
from orders
group by box_id
having max(price)>1000;


-- update records
update orders set is_processed = 1 where box_id between 20 and  23;

-- add column
alter table orders
add column cash_or_exchange enum ('1','0')  default '1' not null;

-- count boxes where prcie 1000
select (count(case when price = 1000 then 1 end)*10) as box_price from orders;

update orders set price = (case when price = 1000 then 1 end)*10
where price >=1000;


/*------------------------------------------
                order details
---------------------------------------------*/

create table orderdetails(
details_id int primary key auto_increment,
customer_id int,
box_id int,
category_id int,
id int,
is_refunded enum('1','0') default '0' not null,
created_date timestamp default current_timestamp,
last_updated timestamp default current_timestamp,
foreign key (customer_id) references customers(customer_id) 
on update  cascade
on delete set null ,
foreign key (box_id) references boxes(box_id)
on update  cascade
on delete set null,
foreign key (category_id) references category(category_id)
on update  cascade
on delete set null,
foreign key (id) references orders(id) 
on update  cascade
on delete set null
);

-- check table is created or not
select * from orderdetails;

-- drop the structure
drop table orderdetails;

insert into orderdetails (customer_id, box_id, category_id,id)
values (1,19,1,1),
(2,20,2,2),
(3,21,3,3),
(4,22,8,4),
(5,23,1,5);

-- retrive data based on condition
select * from orderdetails where id in(1,4,5);

-- update records
update orderdetails set is_refunded = 1 where id in (2,3);

-- add column
alter table orderdetails
add column payment_status int;

-- drop column
alter table orderdetails
drop column payment_status;

-- add multiple column
alter table orderdetails
add column payment_status int,
add column payment_method varchar(20);

-- update status
update orderdetails set payment_status = '1'
where id in (1,2);

-- update payment methos
update orderdetails set payment_method = 'card'
where id in (1,2);

select count(*) total_order  from orderdetails where is_refunded = '0';




