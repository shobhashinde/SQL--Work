-- single line comment
/* multiple line comment */

-- execute a database ctrl+ enter at the end of the query
create database Hospital; 

-- select database to work on it
Use Hospital;

-- DB will be created if not exist
Create Database if not exists Hospital;

-- DB gets deleted
Drop Database Hospital;
Drop Database if exists Hospital;
create database Hospital; 


-- create Patient table
create table Patient (patient_id int primary key,  -- primary key = not null+ unique,
fname varchar(50) not null,
lname varchar(50) not null,
email varchar(25) not null,
emergency_contact varchar(15) not  null,
dob date  not null
);


-- Multiple data insertion
Insert into patient values
(1,'deep','shah','deep@mail.com','7208747800','1990-09-15'),
(2,'deepika','jha','deepika_jha@mail.com','7208747801','1988-11-10'),
(3,'deepali','sharma','deepali-95@mail.com','7208747802','1995-12-31'),
(4,'dipesh','desai','dipesh_desai90@mail.com','7208747803','1990-01-26'),
(5,'sharvi','more','s_more@mail.com','7208747804','1985-08-15'),
(6,'hrithik','shinde','hrithik@yahoo.com','7208747805','1992-07-30'),
(7,'harshal','patil','harshal@mail.com','7208747806','1999-08-29'),
(8,'harsh','kolekar','harsh@mail.com','7208747807','2000-09-29'),
(9,'pranay','dalvi','pdalvi@gmail.com','7208747808','2010-09-30'),
(10,'pranali','deshmukh','deshmukh1@rocketmail.com','7208747809','2000-08-29');

Insert into patient values 
(11,'mayuri','vaidya','mvaidya95@mail.com','7208747810','1990-02-15');

Insert into patient (patient_id, fname, lname, email, emergency_contact, dob )
values(12,'jagruti','vaity','jagruti_test@mail.com','7208747811','1996-09-15');

-- show data
select * from patient;

-- delete complete structure of a table inclusing attributes & records
Drop table patient;

-- Removes all values from table
truncate table patient; 

-- -------------------------table 2 - doctor --------------------------------
-- create doctor table
create table doctor (doctor_id int primary key,  -- primary key = not null+ unique,
doctor_name varchar(50) not null,
experience varchar(50) not null,
specialist varchar(40) not null,
email varchar(20) not  null,
shift varchar(10) not  null
);


-- Multiple data insertion
Insert into doctor values
(1,'akash','5','Surgery','akash@mail.com','Night'),
(2,'advik','3','Surgery','advik@mail.com','Morning'),
(3,'advika','10','Pediatrics','advika@mail.com','Afternoon'),
(4,'kalpna','8','Dermatology','kalpna@mail.com','Night'),
(5,'utsav','4','Cardiology','utsav@mail.com','Night'),
(6,'umang','12.5','Radiology','umang@yahoo.com','Morning'),
(7,'gauri','9.6','Orthopedic','gauri@mail.com','Morning'),
(8,'shree','11','Urology','shree@mail.com','Afternoon'),
(9,'yash','13.4','Urology','yash@gmail.com','Afternoon'),
(10,'samuel','7','Dermatology','samuel@mail.com','Afternoon');

Insert into doctor values (11,'anika','8','Radiology','anika@mail.com','Morning');

Insert into doctor (doctor_id, doctor_name, experience,specialist, email, shift)
values(12,'amisha',3.3,'Cardiology','amisha@mail.com','Night');

-- show data
select * from doctor;

-- delete complete structure of a table inclusing attributes & records
Drop table doctor;

-- Removes all values from table
truncate table doctor; 

-- ----------------------------------table 3 - staff ----------------------------------
-- create staff table
create table staff (staff_id int primary key,  -- primary key = not null+ unique,
staff_name varchar(50) not null,
staff_Experience varchar(10) not null,
staff_email varchar(25) not null,
staff_salary varchar(15) not  null,
staff_shift varchar(10)  not null
);

-- Multiple data insertion
Insert into staff values
(1,'rishi','5','rishi@mail.com',29000,'Night'),
(2,'rushikesh','3','rushikesh@mail.com',39999,'Morning'),
(3,'ritu','10','ritu@mail.com',20000,'Afternoon'),
(4,'kalyani','8','kalyani@mail.com',15000,'Night'),
(5,'prem','4','prem@mail.com',22999,'Night'),
(6,'pankaj','12.5','pankaj@yahoo.com',19000,'Morning'),
(7,'pankti','9.6','pankti@mail.com',17000.100,'Morning'),
(8,'devanshi','11','devanshi@mail.com',35000,'Afternoon'),
(9,'devika','13.4','devika@gmail.com',40000,'Afternoon'),
(10,'dev','7','dev@mail.com',47000,'Afternoon');

Insert into staff values (11,'anika','8','anika@mail.com',39000,'Morning');

Insert into staff (staff_id, staff_name, staff_experience,staff_email, staff_salary,staff_shift)
values(12,'amisha',3.3,'amisha@mail.com',45989,'Night');

-- show data
select * from staff;

-- delete complete structure of a table inclusing attributes & records
Drop table staff;

-- Removes all values from table
truncate table staff; 

-- ----------------------------------------------table 4- Ward-------------------------------
-- create Ward table
create table Ward (Ward_id int primary key,  -- primary key = not null+ unique,
Ward_type varchar(50) not null,
Ward_Charges varchar(10) not null,
Ward_availabilty varchar(25) not null,
Ward_EntryDate date not  null,
Ward_ExitDate date not null
);

-- Multiple data insertion
Insert into Ward values
(1,'General',29000,'Available','2023-09-15','2023-09-20'),
(2,'ICU',39999,'Unavailable','2024-12-15','2024-12-25'),
(3,'Maternity',20000,'Available','2023-01-15','2023-01-20'),
(4,'Pediatric',15000,'Available','2023-02-15','2023-02-20'),
(5,'Oncology',22999,'Available','2023-03-15','2023-03-20'),
(6,'Geriatrics',19000,'Unavailable','2024-12-15','2024-12-25'),
(7,'CCU',17000.100,'Unavailable','2024-12-15','2024-12-25'),
(8,'HDU',35000,'Unavailable','2024-12-15','2024-12-25'),
(9,'male ward',40000,'Available','2023-04-15','2023-04-20'),
(10,'female ward',47000,'Available','2023-05-15','2023-06-10');

Insert into Ward values (11,'VIP',39000,'Available','2024-12-01','2024-12-11');

Insert into Ward (ward_id, Ward_type,Ward_Charges,Ward_availabilty,Ward_EntryDate ,Ward_ExitDate)
values(12,'special',45989,'Unavailable','2024-12-15','2024-12-25');

-- show data
select * from Ward;

-- delete complete structure of a table inclusing attributes & records
Drop table Ward;

-- Removes all values from table
truncate table Ward; 

-- -------------------------------------table 5 - medicine -----------------------------------------------------
-- create medicine table
create table Medicine (medicine_id int primary key,  -- primary key = not null+ unique,
medicine_name varchar(50) not null,
price varchar(10) not null,
last_ordered date not null,
Stockable varchar(15) not  null, -- stockable 1 instock  & 0 - Not in stock
quantity varchar(10)  not null 
);

-- Multiple data insertion
Insert into medicine values
(1,'medicine 1','100','2024-10-20','1',290),
(2,'medicine 2','99.45','2024-10-20','1',39),
(3,'medicine 3','40,56','2024-10-20','1',20),
(4,'medicine 4','120,78','2024-10-20','0',150),
(5,'medicine 5','455,99','2024-10-20','0',229),
(6,'medicine 6','120.5','2024-10-20','0',190),
(7,'medicine 7','90.6','2024-10-20','0',170.100),
(8,'medicine 8','110','2024-10-20','1',35),
(9,'medicine 9','13.40','2024-10-20','1',40),
(10,'medicine 10','70','2024-10-20','0',47);

Insert into medicine values (11,'medicine 11','80','2024-10-20','100',390);

Insert into medicine (medicine_id, medicine_name,price,last_ordered,Stockable ,quantity )
values(12,'medicine 12',300.3,'2024-10-20','100',45);

-- show data
select * from medicine;

-- delete complete structure of a table inclusing attributes & records
Drop table medicine;

-- Removes all values from table
truncate table medicine; 
