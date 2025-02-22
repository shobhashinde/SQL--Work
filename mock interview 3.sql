-- create company database
create database company; 

use company;

-- create table employee table 
create table employees (
empid  int primary key auto_increment,
fname varchar(100) not null,
lname varchar(100) not null,
email varchar(100) not null,
phone varchar(100) not null,
salary decimal (10,2)  not null check(salary>0));

-- delete table structure
drop table employees;

-- insert records into employee table
insert into employees
values(1,'shobha','shinde','test1@mail.com','9876543211',25000.99),
(2,'mansi','jadhav','test12@mail.com','9876543212','25000.99'),
(3,'harshal','dongare','test3@mail.com','9876543213','25000.99'),
(4,'jitesh','jadhav','test4@mail.com','9876543214','25000.99'),
(5,'riya','sarkar','test5@mail.com','9876543215','25000.99'),
(6,'richa','nabar','test6@mail.com','9876543216','25000.99'),
(7,'rupali','patil','test7@mail.com','9876543217','25000.99'),
(8,'rohan','sawant','test8@mail.com','9876543218','25000.99'),
(9,'ruhi','sha','test9@mail.com','9876543219','25000.99'),
(10,'pankti','jha','test10@mail.com','9876543210','25000.99');

-- fetch the records of employee table
select * from employees;

-- table2: create department table 
create table departments(
deptid int primary key auto_increment,
empid int,
department_name varchar(100),
mgr_id int,
mgr_position varchar(100),
foreign key departments(empid) references employees(empid)
on delete set null
on update cascade
 );

DROP TABLE departments;

-- insert records into departments table 
insert into departments
values(1,'1','IT-DEV','3','head of department'),
(2,'2','HR DEPARTMENT','5','HR MANAGER'),
(3,'3','IT-DEV','3','head of department'),
(4,'4','IT-DEV','3','head of department'),
(5,'5','HR DEPARTMENT','5','HR MANAGER'),
(6,'6','ADMIN DEPARTMENT','6','SR.ADMIN'),
(7,'7','ADMIN DEPARTMENT','6','R.ADMIN'),
(8,'8','ACCOUNTING','8','ASSOCIATE LEAD OF ACCOUNTING'),
(9,'9','ACCOUNTING','8','ASSOCIATE LEAD OF ACCOUNTING'),
(10,'10','ACCOUNTING','8','ASSOCIATE LEAD OF ACCOUNTING'),
(11,'1','IT-DEV','3','head of department');

-- COMMAND & CLAUSE /OPERATORS
-- RETRIVE EMPLOYEES & DEPARTMENTS TABLE DATA 
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- FETCH RECORDS WHOSE SLARY IS GREATER THAN 20000
SELECT * FROM EMPLOYEES WHERE SALARY > 20000;

-- FETCH RECORDS WHOSE SLARY IS not equal to
SELECT * FROM EMPLOYEES WHERE SALARY != 88989.22;

-- fetch employee records as per name
SELECT * FROM EMPLOYEES WHERE FNAME = 'SHOBHA';

-- ftech multiple records using in operator
SELECT * FROM EMPLOYEES WHERE LNAME IN ('SHINDE','JHA','SHA');

-- FETCH EMPLOYEE RECORDS WHOSE EMAIL ID IS MATCH WITH PATTERN
SELECT * FROM EMPLOYEES WHERE EMAIL LIKE 'test1%';

-- COUNT NO. OF ROWS 
SELECT COUNT(EMPID) FROM EMPLOYEES WHERE EMAIL LIKE 'test1%';

-- COUNT EMPLOYEES AVERAGE SALARY 
SELECT avg(salary) FROM EMPLOYEES WHERE EMAIL LIKE 'test1%';

-- convert characters into upper & lower case
SELECT UPPER(FNAME), lower(LNAME)
FROM EMPLOYEES;

-- CONCAT EMPLOYEE NAME 
SELECT CONCAT('ROHAN','   ','SAWANT') AS FULL_NAME 
FROM EMPLOYEES;

-- fetch empid records allocate to departments
SELECT COUNT(EMPID), MGR_ID FROM DEPARTMENTS
GROUP BY MGR_ID;

-- UPDATE SALARY
UPDATE EMPLOYEES SET SALARY = 
CASE
WHEN EMPID IN (1,2,3) THEN 88989.223
WHEN EMPID IN (4,5,6) THEN 76667.223
WHEN EMPID IN (7,8,9) THEN 99000.223
ELSE 25000.00
END
WHERE EMPID IN (1,2,3,4,5,6,7,8,9,10);

-- second highest salary 
select max(salary)
from employees 
where salary <=( select max(salary) from employees)
group by salary;

-- 2nd minimum salary
select min(salary),empid
from employees 
where salary <=( select min(salary) from employees)
group by salary,empid;

-- fetch records whose avg salary not equal to max salary
select avg(salary),empid
from employees 
where salary <>( select max(salary) from employees)
group by salary,empid;

 
-- add new column dob
alter table employees
add column dob date;

-- UPDATE dob
UPDATE EMPLOYEES SET dob = 
CASE
WHEN EMPID IN (1,2,3) THEN '1995-04-09'
WHEN EMPID IN (4,5,6) THEN '1990-04-09'
WHEN EMPID IN (7,8,9) THEN '2000-04-09'
ELSE '2002-04-09'
END
WHERE EMPID IN (1,2,3,4,5,6,7,8,9,10);

-- joins
select e1.*, d.deptid,d.empid
from employees e1
join departments d
on e1.empid = d.empid;

-- left join 
select e1.*, d.deptid,d.empid
from employees e1
left join departments d
on e1.empid = d.empid;

-- fetch records of those employee who is manager of dept
select e1.*,d.*
from employees e1
join departments d
on e1.empid = d.empid
where e1.empid= d.mgr_id;

-- fetch records of for specific department
select e1.*,d.*
from employees e1
inner join departments d
on e1.empid = d.empid
where mgr_position = 'head of department';

-- right join 
select e1.empid, d.deptid,d.empid
from employees e1
right join departments d
on e1.empid = d.empid;

-- create employee & department table views & CTE
create view employeeview as
(select empid,fname,lname
from employees 
where email like 'test1%');

select * from employeeview;

create view departmentview as
(select deptid,empid,department_name
from departments 
where mgr_id =3);

select * from departmentview;

with departmentview as
(select deptid,empid,department_name
from departments 
where mgr_id =3)
select * from departmentview;

select * from departmentview;

with employeeview as
(select empid,fname,lname
from employees 
where email like 'test1%')
select * from employeeview;

select * from employeeview;

-- stored procedure
-- create procedure for concat
delimiter //
create procedure emp(fname varchar(100),lname varchar(100)) 
          select concat('shobha','  ','shinde') from employees;
end // 
delimiter ;

-- drop procedure
drop procedure emp;

-- call procedure
call emp('shobha','shinde');


-- stored procedure
-- create procedure for upper
delimiter //
create procedure emp1(fname varchar(100)) 
          select upper('shobha')from employees;
end // 
delimiter ;

-- drop procedure
drop procedure emp1; 

-- call procedure
call emp1('shobha');





