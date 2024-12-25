use mnc;

-- Table-2: Create the Departments table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    company_id INT NOT NULL,
    manager_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Track when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Track when the record was last updated
    FOREIGN KEY (company_id) REFERENCES multinationalcompanies(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (manager_id) REFERENCES Employees(employee_id) ON DELETE SET NULL ON UPDATE CASCADE,
    UNIQUE (department_name, company_id) -- Ensure department names are unique within a company
);

-- insert record into departments table 
insert into Departments (department_name ,company_id,manager_id )
values ('Marketing department',31,1),
('sales',32,2),
('support department',33,3),
('IT department',34,4),
('accoutant Department',35,5),
('admin department',36,6),
('UI/UX department',37,7),
('HR department',38,8),
('Finance department',39,9),
('Admin department',40,10);

insert into Departments (department_name ,company_id,manager_id )
values ('Cusstomer relationship department',32,2),
('procurment department',31,1),
('Business analyst department',34,4),
('QA department department',35,NULL),
('DevOps',35,NULL);

select * from multinationalcompanies;
select * from Departments;
truncate Departments;

-- 1.select specific columns
select department_name, company_id, manager_id from Departments;
select department_name, company_id, manager_id from Departments where department_name = 'it department';


-- 2. retrive department data using like operator 
select * from Departments where department_name like 'admin%';


-- 3. retrive department data where manager id is null
select * from Departments where manager_id is null;

-- 4. retrive department data where manager id is not null
select * from Departments where manager_id is not null;

-- 5.select departments ordered by company id in descending/ ascending order
select * from Departments where company_id in (31,32,34) order by company_id desc;
select * from Departments where company_id in (31,32,34) order by company_id asc;

-- 6. select departments wih manager count greter than a certain number
select * from Departments where manager_id>5;


-- 7. select Departments with a manager_id between two values
select * from Departments where manager_id between 3 and 7;

-- 8. Count the number of Departments in each company
select company_id, count(*) as total_department_count  from Departments group by company_id; 
select company_id, count(*) as total_department_count , department_name  from Departments group by company_id, department_name order by 1 asc;  

-- Disable safe update mode 
SET SQL_SAFE_UPDATES = 0; -- disable safe updates
SET SQL_SAFE_UPDATES = 1; -- Re-enable safe updates

-- 2.ALTER queries

-- 1.Add a new column
alter table Departments 
add column department_budget decimal(13,3);

alter table Departments 
add column head_count varchar (5);
select * from Departments;

-- 2.modify an existing column
alter table Departments
modify column department_name varchar(110) ;
desc Departments;

-- 3. drop a column
alter table Departments
drop column department_budget;

-- 4.rename a column
alter table Departments
change column department_name name varchar(100);

alter table Departments
change column name department_name varchar(100);

-- 5.add a new column with a default value
alter table Departments 
add column department_budget varchar(10.3) default '500000.876';

-- 6.drop a column if it exists
alter table Departments 
drop if exists department_budget ;

-- 7.add a unique constraint
alter table Departments
add constraint unique_headcount unique (head_count);
desc Departments;

-- 8.change the data type of a column
alter table Departments
modify column head_count char(5);

-- 9.add a foreign key constraint
alter table Departments
add constraint fk_headcount foreign key (head_count) references multinationalcompanies(employee_count);
desc Departments;

-- 3.delete queries

-- 1.delete a specifc record
delete from Departments
where Department_name = 'QA department department';
select * from Departments;

-- 2.delete records based on a condition
delete from Departments
where manager_id = '4';

-- 3.delete records with department_budget less than 500000.876 amount 
delete from departments 
where department_budget <'500000.876';

-- 4. delete records with a company_id
delete from departments 
where company_id = '31';
select * from departments;

-- 5. delete all records (use with caution)
delete from departments;

-- 6, delete records with a specific name pattern
delete from departments
where department_name like 'hr%';

-- 4.rename query

-- 1.rename the database
alter database mnc rename to multinationalcompanies;

-- 2.rename the companies table
alter table departments rename to multinaltionaldepartments_details;
alter table multinaltionaldepartments_details rename to departments;
select * from multinaltionaldepartments_details;

-- 3.rename the company_id column
alter table multinaltionaldepartments_details rename column company_id to id;

-- 4.rename the department_name column
alter table multinaltionaldepartments_details rename column department_name to name;

-- 5.rename the department_budget column
alter table multinaltionaldepartments_details rename column department_budget to budget;

-- 6. rename multiple columns
alter table multinaltionaldepartments_details
rename column manager_id to mgrid,
rename column head_count to head_emp_count;

select * from multinaltionaldepartments_details;

-- 5. UPDATE Query
-- 1.update specific record
update multinaltionaldepartments_details
set budget = 399999.00, head_emp_count = 30
where name = 'Marketing department';

-- 2.update multiple records
/* getting duplicate entry error for below query 
 update multinaltionaldepartments_details
set name = 'AI/ML department'
where department_id in ('39','40');

-- 3.update a revenue for all companies in a specific industry
update multinaltionaldepartments_details
set budget = budget*1.00
where name = 'sales'; */


-- Table-3: Create the Employees table ------------------------------------------------------------------------
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15),
    hire_date DATE NOT NULL,
    job_title VARCHAR(50),
    department_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Track when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Track when the record was last updated
     /* FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL ON UPDATE CASCADE -->getting error >>Failed to open the refernece 
     table departments because we added foreign key in both table before creation so will add this column using alter command. */
);

-- insert record into employees table
insert into Employees (first_name ,last_name ,email ,phone_number ,hire_date ,job_title ,department_id)
values ('shobha','shinde','shobha@mail.com',+02225636790,'2000-01-28','Head of marketing',1),
('shobha','jha','shobha1@mail.com',+02225635790,'2000-01-28','head of sales',2),
('rushikesh','patil','rushikesh@mail.com',+02225635791,'2000-09-28','head of support',3),
('reva','jadhav','reva@mail.com',+02225635792,'2017-01-28','product owner',4),
('nitesh','sharma','nitesh@mail.com',7208476790,'2016-01-28','senior accountant manager',5),
('rohit','shetty','rohit@mail.com',7208476791,'2002-11-28','head of admin',6),
('asha','mane','asha@mail.com',7208476792,'2000-12-12','UI/UX manager',7),
('ashwin','patil','ashwin@mail.com',7208476793,'2000-10-28','HR manager',8),
('ashwini','patil','ashwini@mail.com',7208476794,'2005-01-28','Senior accountant',9),
('ansh','singh','ansh@mail.com',7208476795,'1998-01-28','Admin manager',10),
('anshika','singhania','anshika@mail.com',7208476796,'1997-01-28','senior manager of data analyst',11);

insert into Employees (first_name ,last_name ,email ,phone_number ,hire_date ,job_title ,department_id)
values ('shital','jha','shital@mail.com',+02225635990,'2023-01-28','senior developer',4),
('ritvik','patil','ritvik@mail.com',+02225635891,'2021-09-28','senior accountant', 5),
('radha','jadhav','radha@mail.com',+02225635892,'2020-01-28','trainee admin',10);

select * from Employees;

-- 3.delete queries

-- 1.delete a specifc record
delete from Employees
where phone_number = '2225636790';

-- 2.delete records based on a condition
delete from Employees
where job_title = 'senior accountant';

-- 3.delete records of employees whose hire date greater than equal to mentioned date 
delete from Employees 
where hire_date >= '2023-01-28';

-- 4.delete records of employees based on department id & job title
delete from Employees 
where department_id = 10 and job_title = 'admin%';

-- 5. delete all records (use with caution)
delete from Employees;

-- 4.rename query

-- 1.rename the database
alter database mnc rename to multinationalcompanies;

-- 2.rename the Employees table
alter table Employees rename to mnc_Employees;
alter table mnc_Employees rename to Employees;

select * from mnc_Employees;
select * from multinationalcompanies;

-- 3.rename the employee_id column
alter table mnc_Employees rename column  employee_id to emp_id;
alter table mnc_Employees rename column  emp_id to employee_id;

-- 4.rename the first_name column
alter table mnc_Employees rename column first_name to fname;
alter table mnc_Employees rename column fname to first_name;

-- 5.rename the hire_date column
alter table mnc_Employees rename column hire_date to joining_date;
alter table mnc_Employees rename column joining_date to hire_date;

-- 6. rename multiple columns
alter table mnc_Employees
rename column last_name to lname,
rename column job_title to position;

alter table mnc_Employees
rename column lname to last_name,
rename column position to job_title;
select * from mnc_employees;

-- 5. UPDATE Query
-- 1.update specific record
update mnc_employees
set fname = 'girija', phone_number = '8976546754'
where name = 'emp_id';

-- 2.update multiple records
update mnc_employees
set position = 'admin manager'
where fname in ('ritvik','radha');

-- 3. update joining date of employees
update mnc_employees
set joining_date = '2024-11-11'
where position = 'admin manager';


-- select query 
select * from mnc_employees where joining_date > '2000-01-28';
select * from mnc_employees where joining_date < '2000-01-28';
select * from mnc_employees where joining_date between '2000-01-28' and '2005-01-28';
select * from mnc_employees where position like  '%manager%';
select * from mnc_employees where position like  'manager%';
select * from mnc_employees where position like  '%manager';


-- count no. of employee in each position
select position, count(*) as no_of_emp from mnc_employees  group by position order by position asc;
select position, count(*) as no_of_emp, fname from mnc_employees  group by position, fname order by position asc;



-- Table-4: Create the Projects table ----------------------------------------------------------------------------------
CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget DECIMAL(15, 2) CHECK (budget >= 0), -- Ensure budget is non-negative
    company_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Track when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Track when the record was last updated
    FOREIGN KEY (company_id) REFERENCES multinationalcompanies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- insert record into project table
insert into Projects (project_name ,start_date ,end_date ,budget, company_id )
values ('Market growth analysis','2000-01-01','2000-12-30',100000,31),
('Sales analysis','2001-01-01','2002-12-30',200000,32),
('server management','2010-09-01','2010-12-30',300000,33),
('AI technology','1990-01-01','1991-03-30',150000,34),
('Budget analysis','2017-01-01','2019-12-30',70000,35),
('Low Bugdet office event','2000-01-01','2001-09-30',89000,36),
('New application design launch 2012','2011-01-01','2011-06-30',155099,37),
('Resource management','2013-05-01','2014-12-30',99999,38),
('Office fund analysis and usage','2014-01-01','2014-10-30',102999,39),
('Dev day event','2016-11-01','2017-08-30',230000,40),
('product analysis','2021-01-01','2022-12-30',100000,31);

select * from Projects;
-- 3.delete queries

-- 1.delete a specifc record
delete from projects
where project_name = 'Dev day event';
select * from projects;

-- 2.delete records based on a condition
delete from projects
where budget >= '100000.00';

-- 3.delete records with budget and start_Date
delete from projects 
where start_date = '2017-01-01' and budget >55000;

-- 4.delete records with a specific company id
delete from projects
where company_id = 36;

-- 7. delete all records (use with caution)
delete from projects;

-- 10, delete records with a specific name pattern
delete from projects
where project_name like 'low%';

-- 4.rename query

-- 1.rename the companies table
alter table projects rename to mnc_projects;
select * from mnc_projects;

-- 2.rename the company_id column
alter table mnc_projects rename column project_id to id;

-- 2.rename the company_name column
alter table mnc_projects rename column project_name to name;

-- 4.rename the headquarters_location column
alter table mnc_projects rename column budget to project_budget;

-- 5. rename multiple columns
alter table mnc_projects
rename column company_id to cmp_id,
rename column start_date to project_start_date,
rename column end_date to project_end_date;

select * from mnc_projects;

-- 5. UPDATE Query
-- 1.update specific record
update mnc_projects
set budget = 85000.00, project_name = 'Budget & market analysis'
where project_id = '27';

-- 2.update multiple records
update mnc_projects
set project_start_date = '2007-01-01' , project_end_date = '2008-01-01'
where project_name in ('AI technology','Sales analysis');

-- 3.update a revenue for all companies in a specific industry
update mnc_projects
set budget = budget*1.10
where cmp_id between 31 and 34;

-- select query 
select * from mnc_projects where project_name like '%analysis';
select * from mnc_projects where project_start_date = '2000-01-01' ;
select * from mnc_projects where project_end_date <= '2007-01-01' ;
select * from mnc_projects where project_name like '%analysis' and project_start_date > '2007-01-01';
select * from mnc_projects where budget >= '85000.00' and cmp_id in (31,35,40);

-- Table-5: Create the Salaries table ------------------------------------------------------------------------------------
CREATE TABLE Salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    salary_amount DECIMAL(15, 2) NOT NULL CHECK (salary_amount >= 0), -- Ensure salary amount is non-negative
    effective_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Track when the record was created
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Track when the record was last updated
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (employee_id, effective_date) -- Ensure unique salary records for each employee on a specific date
);
drop table Salaries;

-- insert record into salaries
insert into Salaries (employee_id,salary_amount,effective_date)
values (29,250000.00,'2001-01-28'),
 (30,250000.00,'2002-12-28'),
 (31,100000.00,'2001-06-28'),
 (32,200000.00,'2017-01-28'),
 (33,91000.00,'2016-01-28'),
 (34,120000.00,'2003-01-28'),
 (35,95000.00,'2001-01-28'),
 (36,80000.00,'2002-12-28'),
 (37,93999.00,'2007-01-28'),
 (38,80000.00,'2007-01-28'),
 (39,288000.00,'2024-04-28'),
 (40,130000.00,'2024-01-28'),
 (41,109000.00,'2023-09-28'),
 (42,45000.00,'2021-01-28');
 
 select * from Salaries;

-- 3.delete queries

-- 1.delete a specifc record
delete from Salaries
where salary_amount = '100000.00';
select * from Salaries;

-- 2.delete records based on a condition
delete from Salaries
where employee_id = '33';

-- 3.delete records with salary_amount
delete from Salaries 
where salary_amount < 91000.00;

-- 4. delete records based on effective_date
delete from Salaries 
where effective_date < '2003-12-28';

-- 5. delete all records (use with caution)
delete from Salaries;
select * from Salaries;

-- 4.rename query

-- 1.rename the companies table
alter table Salaries rename to multinational_Salaries;
select * from Salaries;
select * from multinational_Salaries;

-- rename the salary_id column
alter table multinational_Salaries rename column salary_id to id;

/*-- Error  - Check constraint 'multinational_salaries_chk_1' uses column 'salary_amount', hence column cannot be dropped or renamed.
rename multiple columns
alter table multinational_Salaries
rename column salary_amount to salary,
rename column employee_id to emp_id; */

select * from multinational_Salaries;

-- 5. UPDATE Query
-- 1.update specific record
update multinational_Salaries
set salary_amount = 80000.00
where employee_id  in (38,36);

-- 2.update effective_date records
update multinational_Salaries
set effective_date = '2024-11-30'
where salary_amount in ('93999.00','45000.00');

-- 3.update a salary amount
update multinational_Salaries
set salary_amount = salary_amount*2.10
where id between '44' and '49';


