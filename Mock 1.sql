/* ----------------------------------------------------------------------------------
                                Grocery shoppig management 
------------------------------------------------------------------------------------ */
-- create grocery shopping management
create database grocery_managemet;

use grocery_managemet;

-- Table 1 - Create store detail table
create table store_detail (store_id int not null primary key auto_increment,
store_name varchar(20) not null,
Store_address varchar(80) not null,
store_email varchar(30) unique,
store_phone varchar(20),
store_website varchar (80) default('https//:www.grocery.shopping_mart.com')
);

-- insert records into store detail table
insert into store_detail(store_name,Store_address,store_email,store_phone)
values ('jai mart','Jvp road mumbai maharashtra -98','jai_mart@mail.com',8976545674),
('shree fresh mart ','DN Dubey road first florr jj building mumbai maharashtra -93','shree_mart@Mail.com',8976545675),
('on hari mart','R mall ground floor ghatkopar mumbai maharashtra -92','on@gamil.com',8976545671),
('veg mart','dmart bhandup 2nd floormumbai maharashtra -91','veg-mart@mail.com',8976545689),
('fresh n joy mart','RR mall near polic stn mumbai maharashtra -90','freshnjoy@mail.com',8976545699);

-- drop table structure
drop table store_detail;

-- retrive table data 
select * from store_detail;

-- truncate records
truncate table store_detail;

-- alter query 
alter table store_detail rename stores_data;
alter table stores_data add column reviews varchar(30) check (reviews between 1 and 5);

-- update query 
update stores_data set phone = '987654655' where store_id =1;

-- delete query 
delete from stores_data;

-- ---------------------------------------------------------------------------------
--  Table 2 - Create grocery category list 
create table category(category_id int not null primary key auto_increment,
Category_name varchar(20) not null,
Items varchar(25) not null,
items_quantity varchar(10),
price decimal (5,2) check(price >=0)
);
 
 -- drop table structrue
 drop table category_details;
 
-- insert records into items
insert into category(Category_name,Items,items_quantity,price)
values ('fruit','Apple','1 bag',300.00),
('Meal','chicken','1 kilo',500.00),
('Meal','fish','3',300.87),
('vegtables','lady fingers','1 kilo',50.00),
('fruit','water-melon','1 bag',250.87);

-- retrive table data
select * from category;

-- truncate records
truncate table category;

-- alter query 
alter table category rename category_data;

alter table category_data
modify items_quantity varchar (15);

-- update query 
update category_data set price = '900.00' where category_name = 'fruit';

-- delete query 
delete from category_data;

-- Table 3 - create table budget table 
create table Budget (Budget_id int not null primary key auto_increment,
category_id int,
category_quantity varchar (10),
Budget decimal (7,2) check (Budget >=0),
ordered_date timestamp default current_timestamp,
foreign key (category_id) references category(category_id) on delete set null
on update cascade
);

drop table Budget;

-- insert records into items
insert into Budget(category_id,category_quantity,Budget)
values ('1','30 bag',3000.00),
('2','10 kilo',15000.00),
('3','5 kilo','29000.00'),
('4','10 kilo',5000.00),
('5','22 bag',6709.00); 

-- retrive table data
select * from Budget;

-- truncate records
truncate table Budget;

-- alter query 
alter table Budget rename Budget_data;

alter table Budget_data
modify items_quantity varchar (15);

-- update query 
update Budget_data set price = '1000.00' where category_quantity = '30 bag';

-- delete query 
delete from Budget_data where budget >= 100 ;



