									/* Create a healthcare_system database */
create database healthcare_system; -- healthcare_system database created using this query
use healthcare_system;

drop database if exists healthcare_system ; -- drop a database if created
create database if not exists healthcare_system ; -- create a database if not exist

 
                                               /* create Patient table */
create table Patients (Patient_ID INT AUTO_INCREMENT PRIMARY KEY, 
Name VARCHAR(50) NOT NULL, 
Age CHAR(2) NOT NULL check (age >=0), 
Gender char (1) NOT NULL, 
Contact VARCHAR(15) NOT NULL, 
Address VARCHAR(100) NOT NULL);

insert into Patients (Name , Age , Gender , Contact , Address ) -- insert records into patient table
values ('pratmesh rathore', 35, 'M', 9876543211, 'J.P. shah road Mumbai, Maharashtra - 81'),
('Mayuri shinde', 45,'F',9876543212, 'J.P. shah road Mumbai, Maharashtra - 82'),
('Amruta shinde', 33,'F',9876543213, 'L.p road Mumbai, Maharashtra - 83'),
('Rudraa singh', 20, 'F',9876543214, 'DN Dubey road Mumbai, Maharashtra - 84'),
('Kriyansh shah', 60, 'M',9876543215, '789 Elm St,Suite 300,Chicago,60601'),
('Ansh mane', 32,'M',9876543216,'456 Oak Ave Los Angeles,90001'),
('Anshika bijalani', 22, 'F',9876543217, '123 Main St, Apt. 2B,New York,10001'),
('Anushka deshmukh', 25, 'F',9876543218,'234 Maple Dr Miami,33101'),
('Aditya deshpande', 43, 'M',9876543219, 'RK Building, near JJ Hospital,Mumbai, Maharashtra - 89'),
('Omkar surve', 54, 'M',9876543220,'pennisula tower, RR St, Mumbai, Maharashtra - 90');

select * from Patients; -- retrive all records from patient table
truncate Patients; -- delete all records from Patients table

-- >1)select query
-- retrive records whose age greater than equal to 30 and gender is female
select * from Patients where age>=30 and gender = 'f'; 

-- retrive records whose address contain road word
select * from Patients where address like '%road%';

-- count records of patient whose age is less than equal to 25
select Name, age, count(*) as total_patient from Patients where age <= 25 group by Name,age order by name asc; 

-- count records of patient whose age is greter than equal to 25
select Name,gender,age, count(*) as total_patient from Patients where age >= 25 group by Name,gender,age order by name asc;

-- retrive Patients data where age is null
select * from Patients where age is null; 

-- retrive Patients data where age is not null
select * from Patients where age is not null; 

-- Select Patients with a patient_id between two values
select * from Patients where patient_id between 5 and 9; 

-- Disable safe update mode 
SET SQL_SAFE_UPDATES = 0; -- disable safe updates
SET SQL_SAFE_UPDATES = 1; -- Re-enable safe updates

-- >2)Update query
-- update patient age and contact details
update Patients set Age = 27 , contact = '9876643217' where patient_id = 7; 

-- update patient name
update Patients set name = 'om srivastva' where contact = '9876543220';  

-- >3)delete query
-- delete records from patients table based on name
delete from Patients where name like '%shinde';

-- delete records from patients table based on age
delete from Patients where age between '45' and '70';

-- delete records from patients table based on contact and address
delete from Patients where cotact = '9876543216' and address like '%Angeles%';

-- delete all records
delete from patients;

                                               /* create a Doctors table */
create table Doctors (Doctor_ID INT AUTO_INCREMENT PRIMARY KEY, 
doctor_Name VARCHAR(50) NOT NULL, 
Speciality VARCHAR(50) NOT NULL, 
Phone VARCHAR(15) NOT NULL, 
Email VARCHAR(40) NOT NULL,
unique (Phone ,Email) -- Ensure unique phone, email records for each doctor id
); 

insert into Doctors (doctor_Name , Speciality , Phone , Email)  -- insert records into Doctors table
values ('Rutja jha','Cardiologist','9876543310','rutja@mail.com'),
('Ravina sharma','Pediatrician','9876543311','Ravina@mail.com'),
('Ravi Varma','Dermatologist','9876543312','Ravi@mail.com'),
('Ritvik jadhv','Orthopedic Surgeon','9876543313','Ritvik@mail.com'),
('Vishal patil','Surgery','9876543314','Vishal@mail.com'),
('Vicky roy','Neurology','9876543315','Vicky@mail.com'),
('Veer shahu','radiology','9876543316','Veer@mail.com'),
('Tejas vagh','Dermatology','9876543317','Tejas@mail.com'),
('Tara chopra','Cardiology','9876543318','Tara@mail.com'),
('Tanish chavan','Hepatology','9876543319','Tanish@mail.com');

select * from Doctors;
truncate Doctors; -- delete all records from Doctors table

-- >1)Update query
-- update doctors data based on Doctors id
update Doctors set Speciality = 'Surgeon' , doctor_Name = 'Roohi kohli' where Doctor_ID = 4;

-- update doctors data based on Doctors name
update Doctors set Email = 'Roohi@mail.com' where doctor_Name = 'Roohi kohli';

-- >3) alter query
-- rename the doctors table name to doctors_details
alter table Doctors rename to doctors_details; 

-- rename Phone and email column name 
alter table doctors_details rename column Phone to Mobile_number, 
rename column email to email_id;

-- Add a new column with default constarint
alter table doctors_details  
add column Country varchar (5) Default 'INDIA';
select * from doctors_details;

-- modify column
alter table doctors__details
modify column email varchar(25) unique;


                                               /* create a Appointments table */
create table Appointments ( Appointment_ID INT AUTO_INCREMENT PRIMARY KEY, 
Patient_ID INT, -- refers patient id from patient table(parent table)
Doctor_ID  INT, -- refers doctor id from doctors table(parent table)
appointment_Date date not null, 
appointment_time Time not null, 
Status  VARCHAR(15) NOT NULL,
foreign key (Patient_ID) references Patients(Patient_ID) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(Doctor_ID) references Doctors(Doctor_ID) ON DELETE CASCADE ON UPDATE CASCADE ); -- insert records into Appointments table

insert into Appointments (Patient_ID, Doctor_ID, appointment_Date, appointment_time, Status) -- insert records into Appointments table
values ('1','1','2024-01-01','10:00:15','Canceled'),
('2','2','2024-01-01','15:30:15','No-show'),
('3','3','2024-03-27','17:00:00','Rescheduled'),
('4','4','2024-05-11','22:00:15','Completed'),
('5','5','2024-11-01','20:45:00','Completed'),
('6','6','2024-12-01','16:15:15','Completed'),
('7','7','2024-12-22','11:00:00','No-show'),
('8','8','2024-12-28','11:20:15','Scheduled'),
('9','9','2024-12-28','20:25:15','Pending'),
('10','10','2024-12-30','20:20:15','Confirmed');

select * from Appointments;
truncate Appointments; -- delete all records from Appointments table


-- 1) alter queries

-- 1.Add a new column
alter table Appointments           -- added Appointments_type column in Appointments table
add column Appointments_type varchar(18) ;
select * from Appointments;

-- 2. drop a column
alter table Appointments
drop column Appointments_type;

                                               /* create a Medical_History table */
create table Medical_History ( History_ID INT AUTO_INCREMENT PRIMARY KEY, 
Patient_ID  INT, -- refers patient id from patient table(parent table)
Diagnosis VARCHAR(80) NOT NULL, 
Treatment VARCHAR(300) NOT NULL, 
Notes VARCHAR(300) NOT NULL,
foreign key(Patient_ID) references Patients(Patient_ID)ON DELETE CASCADE ON UPDATE CASCADE);
drop table Medical_History;


Insert into Medical_History ( Patient_ID,Diagnosis, Treatment, Notes) -- insert records into Medical_History table
values (1,'Anxiety disorders','Treatments include cognitive behavioral therapy (CBT) and medications','These include generalized anxiety disorder, panic disorder, and phobias. Anxiety can be caused by fears of loss, separation'),
(2,'Obsessive-compulsive disorder (OCD)',' Treatments include CBT and medications.','This anxiety disorder involves unwanted, intrusive thoughts, images, or impulses, as well as repetitive rituals. '),
(3,'Bipolar disorder','Treatments include medication, psychoeducation, stress reduction, and strengthening social functioning.','This disorder involves alternating depressive episodes with manic symptoms.'),
(4,'Infectious diseases','Knowing what type of germ is causing your illness makes it easier for your doctor to choose appropriate treatment.','variety of tests to diagnose infectious diseases, including blood tests, urine tests, throat swabs, stool samples, and imaging scans.'),
(5,'Fevers','prevent a fever is to avoid being exposed to infectious agents. This can be done by practicing good hygiene – washing hands regularly, avoid touching your face, and by avoiding the sharing of eating utensils.','Fevers are usually a symptom of another condition, such as a lung or ear infection, and typically go away after a few days of rest. However, fevers can also be caused by dehydration, sunburn, certain medications, or more serious conditions like autoimmune disorders or hormone disorders'),
(6,'stomach flu','Its important to stay hydrated for rapid recovery. Medications may be prescribed to relieve other symptoms, such as fever and vomiting.','Bacteria and viruses are the most common causes of gastroenteritis. Sometimes it can also be attributed to parasites, food allergies, antibiotics and toxins.'),
(7,'bruise','To reduce your risk of bruising, keep your surrounding clear of tripping hazards and place furniture appropriately so you don not bump into their corners. You can also wear protective gear like helmets and knee pads when playing contact sports or cycling.','ontusions can result from a fall, accident, sports injury or medical procedure. It happens due to the pooling of blood under the skin after an internal blood vessel injury, resulting in discolouration and inflammation. Older people are more likely to have a contusion. '),
(8,'Dysmenorrhoea','Treatment may include pain medications, such as aspirin or paracetamol, heating pads, and abdominal massage.','Dysmenorrhoea may be caused by a chemical imbalance in the body that results in abnormal contractions of the uterus.'),
(9,'urinary tract infection','Antibiotics are typically used to treat cystitis. Practicing good hygiene and drinking plenty of water can help to prevent a urinary tract infection.','Cystitis is usually caused by bacteria, most commonly E. coli that enters the urinary tract and bladder resulting in an infection'),
(10,'stiff joint','Stiffness in the joints that make movements difficult. This may be accompanied by pain, swelling and inflammation in the joints.','Ankylosis basically refers to the stiffening of a joint in your body, commonly caused by a history of previous injury.');

select * from Medical_History;
truncate Medical_History; -- delete all records from Medical_History table

-- 1) alter query
-- add column doctor id
alter table Medical_History
add column Doctor_ID int not null;

-- add constraint 
alter table Medical_History
add constraint fk_Medical_History foreign key (Doctor_ID) references doctors(Doctor_ID); 

                                               /* Create a Medications table */
create table Medications ( Medication_ID INT AUTO_INCREMENT PRIMARY KEY, 
medication_Name VARCHAR(70) NOT NULL, 
Type VARCHAR(30) NOT NULL, 
Price decimal(5,2) NOT NULL check (price >=0), 
Description VARCHAR(300) NOT NULL ); 

drop table Medications;

Insert into Medications ( medication_Name,Type, Price, Description) -- insert records into Medications table
values ('Nonsteroidal anti-inflammatory drugs (NSAIDs)','Antibiotics','345.90','Some over-the-counter cold and flu medications, as well as some sleep aids and acid-reflux medications, contain antihistamines.'),
('Antihistamines','Antibiotics','445.88','Some over-the-counter cold and flu medications, as well as some sleep aids and acid-reflux medications, contain antihistamines.'),
('Decongestants','Prescription medications','299.00','he generic version of Lexapro'),
('Bismuth subsalicylate (Pepto-Bismol)','Over-the-counter medications','100.00','Can help with mild diarrhea symptoms by reducing gas and nausea. It can also help with digestive symptoms like heartburn and indigestion.'),
('Loperamide (Imodium)','Over-the-counter medications','45.98','Can help with diarrhea by slowing gut movement. However, it can cause side effects like constipation, fatigue, and changes in heart rhythm. You should not take Imodium if you have an irregular or slow heartbeat, low potassium levels, or if you take amiodarone or methadone.'),
('Nonsteroidal anti-inflammatory drugs (NSAIDs)','Prescription medications','500.98','hese are often the first line of treatment for dysmenorrhea. They work by reducing the amount of prostaglandins in your body.'),
('Amlodipine','Generic medications','700.00','The generic version of Norvasc and Amvaz'),
('Levothyroxine','Brand-name medications','877.09','The generic version of Synthroid, Unithroid, Levoxyl, Levo-T, and Euthyrox'),
('Busulfan','Oncology medications','345.00','Used to treat certain types of breast and prostate cancer. Some examples include leuprolide (Lupron), anastrozole (Arimidex), letrozole (Femara), tamoxifen (Nolvadex), and fulvestrant (Faslodex).'),
('Lomustine','Oncology medications','343.99','Used to treat various types of cancer, including lung, colorectal, breast, ovarian, skin, stomach, and oesophagal cancers. Pembrolizumab is an example of an immunotherapy drug');

select * from Medications;
truncate Medications; -- delete all records from Medications table


                                               /* Create a Prescriptions table */
create table Prescriptions ( Prescription_ID INT AUTO_INCREMENT PRIMARY KEY, 
Patient_ID int , -- refers patient id from patient table(parent table)
Medication_ID  int , -- refers Medications id from Medications table(parent table)
Date_Provided TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
Dosage VARCHAR(25) NOT NULL,
foreign key(Patient_ID) references Patients(Patient_ID) ON DELETE CASCADE ON UPDATE CASCADE,
foreign key(Medication_ID) references Medications(Medication_ID) ON DELETE CASCADE ON UPDATE CASCADE);

Insert into Prescriptions ( Patient_ID,Medication_ID, Dosage) -- insert records into Prescriptions table
values (1,2,'500 mg'),
(1,1,'500 mg'),
(3,3,'500 mg'),
(4,4,'10 units'),
(5,5,'10 units'),
(6,6,'5 units'), 
(8,7,'400 mg'), 
(9,8,'400 mg'), 
(10,9,'400 mg'), 
(10,10,'100 mg');

select * from Prescriptions;
truncate Prescriptions; -- delete all records from Prescriptions table


                                               /* create a Bills table */

create table Bills ( Bill_ID INT AUTO_INCREMENT PRIMARY KEY, 
Patient_ID INT,  -- refers patient id from patient table(parent table)
Total_Amount decimal(10,2) NOT NULL check(Total_Amount >=0), 
Payment_Status VARCHAR(15) NOT NULL , 
Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
foreign key(Patient_ID) references Patients(Patient_ID) ON DELETE CASCADE ON UPDATE CASCADE);

drop table Bills;

Insert into Bills ( Patient_ID,Total_Amount, Payment_Status)-- insert records into Bills table
values (1,1000.00,'Completed'),
(2,10000.00,'Completed'),
(3,10000.00,'Partially Paid'),
(4,12999.87,'Overdue'),
(5,25000.00,'Refunded'),
(6,48000.32,'Completed'),
(7,9999.00,'Completed'),
(8,23456.00,'Completed'),
(9,3333.99,'Pending'),
(10,5436.78,'Pending');
select * from Bills;
truncate Bills; -- delete all records from Bills table
                                               /* Staff table */
create table Staff ( Staff_ID INT AUTO_INCREMENT PRIMARY KEY, 
staff_Name VARCHAR(50) NOT NULL, 
Role VARCHAR(50) NOT NULL, 
Contact VARCHAR(15) NOT NULL, 
Shift VARCHAR(15) NOT NULL ) ;

drop table Staff;

Insert into Staff ( staff_Name,Role, Contact,Shift)-- insert records into table
values ('pratik gawas','Wound Care',9876543410,'Night shifft'),
('jagruti vaity','Medication Administration',9876543411,'Night shifft'),
('mayuri dhanavade','Medication Administration',9876543412,'Night shifft'),
('prem chopra','Sr.Oncology Nurse',9876543413,'Night shifft'),
('ashwin sawant','Sr.Critical Care Nurse',9876543414,'Afternoon Shift'),
('arshi jha','Wound Care',9876543415,'Afternoon Shift'),
('avni sharma','Pediatric Nurse',9876543416,'Afternoon Shift'),
('aditya chopra','Sr.Critical Care Nurse',9876543417,'Day Shift'),
('aarti poojary','Patient Education',9876543418,'Day Shift'),
('pooja uke','Patient Education',9876543419,'Day Shift');
select * from Staff;
truncate Staff;-- delete all records from table



                                               /* Departments table */
create table Departments ( Department_ID INT AUTO_INCREMENT PRIMARY KEY, 
department_Name VARCHAR(50) NOT NULL, 
Location VARCHAR(50) NOT NULL, 
Phone VARCHAR(15) NOT NULL,
unique (phone));

drop table Departments;

Insert into Departments ( department_Name,Location, Phone)-- insert records into table
values ('Cardiology','Mumbai Maharashtra',9976543410),
('Cardiology','Mumbai Maharashtra',9976543411),
('Neurology','Mumbai Maharashtra',9976543412),
('Oncology','Mumbai Maharashtra',9976543413),
('Pediatrics','Mumbai Maharashtra',9976543414),
('Psychiatry','Pune Maharashtra',9976543415),
('Oncology','Pune Maharashtra',9976543416),
('Radiology','Karjat Maharashtra',9976543417),
('Surgery ','Nagpur Maharashtra',9976543418),
('Surgery ','Nashik Maharashtra',9976543419);

select * from Departments;
truncate Departments;-- delete all records from table
                                               /* Facilities table */
create table Facilities ( Facility_ID INT AUTO_INCREMENT PRIMARY KEY, 
Facilities_Name VARCHAR(50) NOT NULL, 
Type VARCHAR(30) NOT NULL, 
Cost DECIMAL(15, 2) CHECK (cost >= 0), 
Availability_Status VARCHAR(20) );

drop table Facilities;

Insert into Facilities (Facilities_Name,Type, Cost,Availability_Status)-- insert records into table
values ('Inpatient Units','General Wards',45000.98,'Available'),
('Inpatient Units','Neonatal Intensive Care Units',15000.98,'Available'),
('Inpatient Units','Maternity Wards',25000.98,'Available'),
('Inpatient Units','Laboratories',35000.98,'Available'),
('Other','Medical Records Department',55000.98,'Under Construction'),
('Other','Administrative Offices',65000.98,'Not Available'),
('Other','Laboratories',75000.98,'Not Available'),
('Diagnostic and Treatment','Emergency Department',85000.98,'Not Available'),
('Diagnostic and Treatment','Emergency Department',95000.98,'Available'),
('Diagnostic and Treatment','Recovery Rooms',96876.98,'Available');

select * from Facilities;
truncate Facilities;-- delete all records from table


									/* Update/ Rename/ Alter queries for above tabel */ 
                                    
-- Retrive all table data using select query
select * from patients;
select * from doctors;
select * from Appointments;
select * from Medical_History;
select * from Medications;
select * from Prescriptions;
select * from Bills;
select * from Staff;
select * from Departments;
select * from Facilities;


