-- Create the airline database if it does not already exist
CREATE DATABASE IF NOT EXISTS airline123;
USE airline123; -- Set the context to the airline database

-- ------------------------------------Table Queries --------------------------------------

-- Data Definition Language (DDL) {Create,Alter,Drop,Truncate,Rename,Comment}
-- Data Manipulation Language (DML) {Insert, Update, Delete}
-- Data Query Language (DQL) {select query}

/* 
1.Select Query 
The SELECT statement is used to retrieve data from a database table.
It allows you to specify the columns you want to fetch and apply conditions to filter the results

Syntax:-
Select column1, column2, ....
from table_name
where condition;

2.Alter Query
The ALTER statement is used to modift the structure of an existing table, 
such as adding,deleting or modifying columns.
The ALTER query change  the table structure not the data.

Syntax:-
alter table table_name
add column_name datatype;
or
alter table table_name
drop column column_name;
or
alter table table_name
modify column_name new_datatype;

3.DELETE Query
The DELETE statement is used to remove rows from a table based on specified condition.

syntax:-
delete from table_name
where condition;

4.UPDATE Query
The UPDATE statement is used to modify existing records in table.

Syntax:-
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;


*/
-- Table-1 Create Flights table
CREATE TABLE Flights (
  Flight_ID INT PRIMARY KEY, -- Unique identifier for each flight (Primary Key)
  Flight_Number VARCHAR(10) NOT NULL, -- Flight number (e.g., AA123) (Not Null)
  Departure_Airport VARCHAR(100) NOT NULL, -- Name of the departure airport (Not Null)
  Arrival_Airport VARCHAR(100) NOT NULL, -- Name of the arrival airport (Not Null)
  Departure_Time DATETIME NOT NULL, -- Scheduled departure time (Not Null)
  Arrival_Time DATETIME NOT NULL, -- Scheduled arrival time (Not Null)
  Flight_Duration INT NOT NULL, -- Duration of the flight in minutes (Not Null)
  Seats_Available INT NOT NULL CHECK (Seats_Available >= 0), -- Number of available seats (Not Null, must be non-negative)
  Aircraft_Type VARCHAR(50) NOT NULL, -- Type of aircraft used for the flight (Not Null)
  Status ENUM('On Time', 'Delayed', 'Cancelled') NOT NULL DEFAULT 'On Time' -- Current status of the flight (Not Null, default is 'On Time')
);


-- Insert Records into Flights Table

INSERT INTO Flights (Flight_ID, Flight_Number, Departure_Airport, Arrival_Airport, Departure_Time, Arrival_Time, Flight_Duration, Seats_Available, Aircraft_Type, Status)
VALUES
(1, 'AI101', 'Delhi (DEL)', 'Mumbai (BOM)', '2023-10-01 06:00:00', '2023-10-01 08:00:00', 120, 50, 'Boeing 737', 'On Time'),
(2, 'AI102', 'Mumbai (BOM)', 'Delhi (DEL)', '2023-10-01 09:00:00', '2023-10-01 11:00:00', 120, 60, 'Airbus A320', 'On Time'),
(3, 'AI103', 'Delhi (DEL)', 'Bangalore (BLR)', '2023-10-01 07:00:00', '2023-10-01 09:30:00', 150, 70, 'Boeing 737', 'On Time'),
(4, 'AI104', 'Bangalore (BLR)', 'Delhi (DEL)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 80, 'Airbus A320', 'On Time'),
(5, 'AI105', 'Delhi (DEL)', 'Chennai (MAA)', '2023-10-01 08:00:00', '2023-10-01 10:30:00', 150, 40, 'Boeing 737', 'On Time'),
(6, 'AI106', 'Chennai (MAA)', 'Delhi (DEL)', '2023-10-01 11:00:00', '2023-10-01 13:30:00', 150, 50, 'Airbus A320', 'On Time'),
(7, 'AI107', 'Delhi (DEL)', 'Kolkata (CCU)', '2023-10-01 09:00:00', '2023-10-01 11:30:00', 150, 30, 'Boeing 737', 'On Time'),
(8, 'AI108', 'Kolkata (CCU)', 'Delhi (DEL)', '2023-10-01 12:00:00', '2023-10-01 14:30:00', 150, 20, 'Airbus A320', 'On Time'),
(9, 'AI109', 'Delhi (DEL)', 'Hyderabad (HYD)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 60, 'Boeing 737', 'On Time'),
(10, 'AI110', 'Hyderabad (HYD)', 'Delhi (DEL)', '2023-10-01 13:00:00', '2023-10-01 15:30:00', 150, 50, 'Airbus A320', 'On Time'),
(11, 'AI111', 'Delhi (DEL)', 'Pune (PNQ)', '2023-10-01 14:00:00', '2023-10-01 16:00:00', 120, 40, 'Boeing 737', 'On Time'),
(12, 'AI112', 'Pune (PNQ)', 'Delhi (DEL)', '2023-10-01 17:00:00', '2023-10-01 19:00:00', 120, 30, 'Airbus A320', 'On Time'),
(13, 'AI113', 'Delhi (DEL)', 'Ahmedabad (AMD)', '2023-10-01 15:00:00', '2023-10-01 17:00:00', 120, 50, 'Boeing 737', 'On Time'),
(14, 'AI114', 'Ahmedabad (AMD)', 'Delhi (DEL)', '2023-10-01 18:00:00', '2023-10-01 20:00:00', 120, 40, 'Airbus A320', 'On Time'),
(15, 'AI115', 'Delhi (DEL)', 'Jaipur (JAI)', '2023-10-01 16:00:00', '2023-10-01 17:30:00', 90,  60, 'Boeing 737', 'On Time');

INSERT INTO Flights (Flight_ID, Flight_Number, Departure_Airport, destination_airport, Departure_Time, Arrival_Time, Flight_Duration, Seats_Available, Aircraft_Type, Status)
VALUES
(1, 'AI101', 'Delhi (DEL)', 'Mumbai (BOM)', '2023-10-01 06:00:00', '2023-10-01 08:00:00', 120, 50, 'Boeing 737', 'On Time'),
(2, 'AI102', 'Mumbai (BOM)', 'Delhi (DEL)', '2023-10-01 09:00:00', '2023-10-01 11:00:00', 120, 60, 'Airbus A320', 'On Time'),
(4, 'AI104', 'Bangalore (BLR)', 'Delhi (DEL)', '2023-10-01 10:00:00', '2023-10-01 12:30:00', 150, 80, 'Airbus A320', 'On Time'),
(6, 'AI106', 'Chennai (MAA)', 'Delhi (DEL)', '2023-10-01 11:00:00', '2023-10-01 13:30:00', 150, 50, 'Airbus A320', 'On Time'),
(8, 'AI108', 'Kolkata (CCU)', 'Delhi (DEL)', '2023-10-01 12:00:00', '2023-10-01 14:30:00', 150, 20, 'Airbus A320', 'On Time'),
(10, 'AI110', 'Hyderabad (HYD)', 'Delhi (DEL)', '2023-10-01 13:00:00', '2023-10-01 15:30:00', 150, 50, 'Airbus A320', 'On Time'),
(12, 'AI112', 'Pune (PNQ)', 'Delhi (DEL)', '2023-10-01 17:00:00', '2023-10-01 19:00:00', 120, 30, 'Airbus A320', 'On Time'),
(14, 'AI114', 'Ahmedabad (AMD)', 'Delhi (DEL)', '2023-10-01 18:00:00', '2023-10-01 20:00:00', 120, 40, 'Airbus A320', 'On Time'),
(15, 'AI115', 'Delhi (DEL)', 'Jaipur (JAI)', '2023-10-01 16:00:00', '2023-10-01 17:30:00', 90,  60, 'Boeing 737', 'On Time');

-- Functions 

/*
Functions in MySQL are predefined operations that can be used to perform calculations, manipulate data, 
and retrieve specific information. These functions make it easier to work with strings, numbers, dates, and more. 
They are categorized as follows based on their functionality: 

1. String Functions
These functions are used to manipulate and process string data.

LENGTH(str): Returns the length of a string.

CONCAT(str1, str2, ...): Concatenates two or more strings.

UPPER(str): Converts a string to uppercase.

LOWER(str): Converts a string to lowercase.

SUBSTRING(str, start, length): Returns a substring from a string.


2. Numeric Functions
These functions perform operations on numeric data.

ROUND(number, decimals): Rounds a number to a specified number of decimal places.

FLOOR(number): Returns the largest integer less than or equal to a number.

CEIL(number): Returns the smallest integer greater than or equal to a number.

ABS(number): Returns the absolute value of a number.


3. Date and Time Functions
These functions are used to manipulate and format date and time values.

NOW(): Returns the current date and time.

CURDATE(): Returns the current date.

DATE_FORMAT(date, format): Formats a date according to a specified format.

DATEDIFF(date1, date2): Returns the difference in days between two dates.



4. Aggregate Functions
These functions perform calculations on a set of values and return a single value.

COUNT(expression): Returns the number of rows that match a specified condition.

SUM(column): Returns the sum of a numeric column.

AVG(column): Returns the average value of a numeric column.

MAX(column): Returns the maximum value of a column.

MIN(column): Returns the minimum value of a column.


5. Control Flow Functions
These functions allow for conditional logic in SQL queries.

IF(condition, true_value, false_value): Returns one value if the condition is true and another value 
if it is false.

CASE: Provides a way to perform conditional logic in a more complex manner.


6. Conversion Functions
These functions convert data from one type to another.

CAST(expression AS type): Converts an expression to a specified data type.

CONVERT(expression, type): Similar to CAST, but with different syntax.


7. JSON Functions
These functions are used to work with JSON data types.

JSON_EXTRACT(json_doc, path): Extracts data from a JSON document.

JSON_ARRAYAGG(value): Aggregates values into a JSON array.



8. User -Defined Functions (UDFs)
MySQL allows users to create their own functions for specific tasks.

*/

-- String Functions

select * from Flights;

-- Converts flight numbers to uppercase
SELECT UPPER(Flight_Number) AS Uppercase_Flight_Number FROM Flights; 

-- Converts departure airport names to lowercase
SELECT LOWER(Departure_Airport) AS Lowercase_Departure_Airport FROM Flights; 

-- Concatenates flight number and departure airport
SELECT CONCAT(Flight_Number, ' - ', Departure_Airport) AS Flight_Info FROM Flights; 

-- Numeric Functions

-- Calculates the average flight duration
SELECT AVG(Flight_Duration) AS Average_Flight_Duration FROM Flights;

-- Calculates the total number of seats available 
SELECT SUM(Seats_Available) AS Total_Seats_Available FROM Flights; 

-- Finds the longest flight duration
SELECT MAX(Flight_Duration) AS Longest_Flight_Duration FROM Flights;

-- Date and Time Functions

-- Extracts the date from the departure time
SELECT DATE(Departure_Time) AS Departure_Date FROM Flights; 

-- Extracts the time from the departure time
SELECT TIME(Departure_Time) AS Departure_Time FROM Flights; 

select * from flights;

-- Calculates the flight duration in minutes
SELECT TIMESTAMPDIFF(MINUTE, Departure_Time, Arrival_Time) AS Flight_Duration_Minutes FROM Flights; 
SELECT TIMESTAMPDIFF(HOUR, Departure_Time, Arrival_Time) AS Flight_Duration_hours FROM Flights; 
SELECT TIMESTAMPDIFF(SECOND, Departure_Time, Arrival_Time) AS Flight_Duration_second FROM Flights; 

-- Calculates the flight duration in date
SELECT TIMESTAMPDIFF(MONTH, Departure_Time, Arrival_Time) AS Flight_Duration_month FROM Flights; 
SELECT TIMESTAMPDIFF(DAY, Departure_Time, Arrival_Time) AS Flight_Duration_day FROM Flights; 
SELECT TIMESTAMPDIFF(YEAR, Departure_Time, Arrival_Time) AS Flight_Duration_year FROM Flights; 

-- Aggregate Functions

-- Counts the total number of flights
SELECT COUNT(*) AS Total_Flights FROM Flights; 

-- Counts the number of unique departure airports
SELECT COUNT(DISTINCT Departure_Airport) AS Unique_Departure_Airports FROM Flights; 

-- Concatenates distinct flight numbers
SELECT GROUP_CONCAT(DISTINCT Flight_Number) AS Flight_Numbers FROM Flights; 

-- Control Flow Functions

select * from flights;

-- Classifies flights as long haul or short haul based on duration
SELECT IF(Flight_Duration > 4, 'Long Haul', 'Short Haul') AS Flight_Type FROM Flights; 

-- Classifies flights as long haul or short haul based on duration using a case statement
SELECT CASE WHEN Flight_Duration > 4 THEN 'Long Haul' WHEN Flight_Duration <= 4 THEN 'Short Haul' END 
AS Flight_Type FROM Flights; 

-- other queries

CREATE TABLE Flights_Backup (
  Flight_ID int PRIMARY KEY,
  Flight_Number varchar(10) NOT NULL,
  Departure_Airport varchar(100) NOT NULL,
  Arrival_Airport varchar(100) NOT NULL,
  Departure_Time datetime NOT NULL,
  Arrival_Time datetime NOT NULL,
  Flight_Duration int NOT NULL,
  Seats_Available int NOT NULL
);

-- copy table data
INSERT INTO Flights_Backup SELECT * FROM Flights;

select * from Flights_Backup;
 


-- Table-2 Create Passengers table
CREATE TABLE Passengers (
  Passenger_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each passenger (Primary Key, Auto Increment)
  First_Name VARCHAR(50) NOT NULL, -- Passenger's first name (Not Null)
  Last_Name VARCHAR(50) NOT NULL, -- Passenger's last name (Not Null)
  Email VARCHAR(100) UNIQUE NOT NULL, -- Passenger's email address (Not Null, must be unique)
  Phone_Number VARCHAR(15), -- Passenger's phone number (Optional)
  Date_of_Birth DATE NOT NULL, -- Passenger's date of birth (Not Null)
  Frequent_Flyer_Number VARCHAR(20) UNIQUE, -- Frequent flyer number (Optional, must be unique)
  Nationality VARCHAR(50) NOT NULL -- Nationality of the passenger (Not Null)
);


-- Insert Records into Passengers Table
INSERT INTO Passengers (First_Name, Last_Name, Email, Phone_Number, Date_of_Birth, Frequent_Flyer_Number, Nationality)
VALUES
('Rahul', 'Sharma', 'rahul.sharma@example.com', '9876543210', '1990-01-15', 'FF001', 'India'),
('Priya', 'Verma', 'priya.verma@example.com', '8765432109', '1992-02-20', 'FF002', 'India'),
('Amit', 'Kumar', 'amit.kumar@example.com', '7654321098', '1988-03-25', 'FF003', 'India'),
('Sneha', 'Reddy', 'sneha.reddy@example.com', '6543210987', '1995-04-30', 'FF004', 'India'),
('Vikram', 'Singh', 'vikram.singh@example.com', '5432109876', '1985-05-05', 'FF005', 'India'),
('Neha', 'Gupta', 'neha.gupta@example.com', '4321098765', '1993-06-10', 'FF006', 'India'),
('Ravi', 'Patel', 'ravi.patel@example.com', '3210987654', '1987-07-15', 'FF007', 'India'),
('Anjali', 'Mehta', 'anjali.mehta@example.com', '2109876543', '1991-08-20', 'FF008', 'India'),
('Karan', 'Bansal', 'karan.bansal@example.com', '1098765432', '1989-09-25', 'FF009', 'India'),
('Pooja', 'Joshi', 'pooja.joshi@example.com', '0987654321', '1994-10-30', 'FF010', 'India'),
('Suresh', 'Nair', 'suresh.nair@example.com', '9876543210', '1986-11-05', 'FF011', 'India'),
('Tina', 'Chopra', 'tina.chopra@example.com', '8765432109', '1992-12-10', 'FF012', 'India'),
('Mohit', 'Agarwal', 'mohit.agarwal@example.com', '7654321098', '1988-01-15', 'FF013', 'India'),
('Ritika', 'Sethi', 'ritika.sethi@example.com', '6543210987', '1995-02-20', 'FF014', 'India'),
('Deepak', 'Kohli', 'deepak.kohli@example.com', '5432109876', '1985-03-25', 'FF015', 'India');


-- Table-3 Create Bookings table
CREATE TABLE Bookings (
  Booking_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each booking (Primary Key, Auto Increment)
  Flight_ID INT NOT NULL, -- Foreign key referencing Flights table (Not Null)
  Passenger_ID INT NOT NULL, -- Foreign key referencing Passengers table (Not Null)
  Booking_Date DATETIME NOT NULL, -- Date and time of booking (Not Null)
  Number_of_Seats INT NOT NULL CHECK (Number_of_Seats > 0), -- Number of seats booked (Not Null, must be greater than zero)
  Total_Price DECIMAL(10, 2) NOT NULL, -- Total price for the booking (Not Null)
  Booking_Status ENUM('Confirmed', 'Cancelled', 'Pending') NOT NULL DEFAULT 'Pending', -- Status of the booking (Not Null, default is 'Pending')
  FOREIGN KEY (Flight_ID) REFERENCES Flights(Flight_ID) ON DELETE CASCADE, -- Foreign key constraint linking to Flights table with cascading delete
  FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE -- Foreign key constraint linking to Passengers table with cascading delete
);

truncate Bookings;
-- Insert Records into Bookings Table

INSERT INTO Bookings (Flight_ID, Passenger_ID, Booking_Date, Number_of_Seats, Total_Price, Booking_Status)
VALUES
(1, 1, '2023-09-01 10:00:00', 1, 1500.00, 'Confirmed'),
(2, 2, '2023-09-02 11:00:00', 2, 3000.00, 'Confirmed'),
(3, 3, '2023-09-03 12:00:00', 1, 1500.00, 'Confirmed'),
(4, 4, '2023-09-04 13:00:00', 1, 1500.00, 'Confirmed'),
(5, 5, '2023-09-05 14:00:00', 1, 1500.00, 'Confirmed'),
(6, 6, '2023-09-06 15:00:00', 1, 1500.00, 'Confirmed'),
(7, 7, '2023-09-07 16:00:00', 1, 1500.00, 'Confirmed'),
(8, 8, '2023-09-08 17:00:00', 1, 1500.00, 'Confirmed'),
(9, 9, '2023-09-09 18:00:00', 1, 1500.00, 'Confirmed'),
(10, 10, '2023-09-10 19:00:00', 1, 1500.00, 'Confirmed'),
(11, 11, '2023-09-11 20:00:00', 1, 1500.00, 'Confirmed'),
(12, 12, '2023-09-12 21:00:00', 1, 1500.00, 'Confirmed'),
(13, 13, '2023-09-13 22:00:00', 1, 1500.00, 'Confirmed'),
(14, 14, '2023-09-14 23:00:00', 1, 1500.00, 'Confirmed'),
(15, 15, '2023-09-15 09:00:00', 1, 1500.00, 'Confirmed');


-- Table-4 Create Airlines table
CREATE TABLE Airlines (
  Airline_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each airline (Primary Key, Auto Increment)
  Airline_Name VARCHAR(100) NOT NULL, -- Name of the airline (Not Null)
  IATA_Code VARCHAR(3) UNIQUE NOT NULL, -- IATA code for the airline (Not Null, must be unique)
  Country VARCHAR(50) NOT NULL, -- Country where the airline is based (Not Null)
  Established_Year INT CHECK (Established_Year > 1900), -- Year the airline was established (Must be greater than 1900)
  Headquarter_Location VARCHAR(100) NOT NULL -- Location of the airline's headquarters (Not Null)
);

-- Insert Records into Airlines Table

INSERT INTO Airlines (Airline_Name, IATA_Code, Country, Established_Year, Headquarter_Location)
VALUES
('Air India', 'AI', 'India', 1932, 'Mumbai'),
('IndiGo', '6E', 'India', 2006, 'Gurgaon'),
('SpiceJet', 'SG', 'India', 2005, 'Gurgaon'),
('Vistara', 'UK', 'India', 2013, 'Gurgaon'),
('GoAir', 'G8', 'India', 2005, 'Mumbai'),
('AirAsia India', 'I5', 'India', 2014, 'Bangalore'),
('Alliance Air', '9I', 'India', 1996, 'Delhi'),
('Jet Airways', '9W', 'India', 1993, 'Mumbai'),
('Air India Express', 'IX', 'India', 2005, 'Kochi'),
('Star Air', 'S5', 'India', 2019, 'Bangalore'),
('Akasa Air', 'QP', 'India', 2022, 'Mumbai'),
('TruJet', '2T', 'India', 2015, 'Hyderabad'),
('Zoom Air', 'Z5', 'India', 2017, 'Delhi'),
('Flybig', 'FB', 'India', 2020, 'Indore'),
('Deccan Charters', 'DC', 'India', 1997, 'Bangalore');


-- Table-5 Create Tickets table
CREATE TABLE Tickets (
  Ticket_ID INT PRIMARY KEY AUTO_INCREMENT, -- Unique identifier for each ticket (Primary Key, Auto Increment)
  Booking_ID INT NOT NULL, -- Foreign key referencing Bookings table (Not Null)
  Ticket_Price DECIMAL(10, 2) NOT NULL, -- Price of the ticket (Not Null, with two decimal places)
  Ticket_Status ENUM('Confirmed', 'Cancelled', ' Pending') NOT NULL, -- Status of the ticket (Not Null, must be one of the specified values)
  Seat_Number VARCHAR(5) NOT NULL, -- Assigned seat number for the ticket (Not Null)
  Baggage_Allowance INT DEFAULT 0, -- Baggage allowance in kilograms (Default is 0)
  FOREIGN KEY (Booking_ID) REFERENCES Bookings(Booking_ID) ON DELETE CASCADE -- Foreign key constraint linking to Bookings table with cascading delete
);

-- Insert Records into Tickets Table
INSERT INTO Tickets (Booking_ID, Ticket_Price, Ticket_Status, Seat_Number, Baggage_Allowance)
VALUES
(1, 1500.00, 'Confirmed', '1A', 15),
(2, 1500.00, 'Confirmed', '1B', 20),
(3, 1500.00, 'Confirmed', '1C', 15),
(4, 1500.00, 'Confirmed', '1D', 15),
(5, 1500.00, 'Confirmed', '1E', 15),
(6, 1500.00, 'Confirmed', '1F', 15),
(7, 1500.00, 'Confirmed', '1G', 15),
(8, 1500.00, 'Confirmed', '1H', 15),
(9, 1500.00, 'Confirmed', '1I', 15),
(10, 1500.00, 'Confirmed', '1J', 15),
(11, 1500.00, 'Confirmed', '1K', 15),
(12, 1500.00, 'Confirmed', '1L', 15),
(13, 1500.00, 'Confirmed', '1M', 15),
(14, 1500.00, 'Confirmed', '1N', 15),
(15, 1500.00, 'Confirmed', '1O', 15);


-- 1. Select Queries

-- Select all records from Flights table
SELECT * FROM Flights;

-- Select flights that are delayed
select * from flights where status ='Delayed';

-- Select disctinct aircraft types used in flights
select distinct aircraft_type from flights;

-- Select all flights ordered by departure_time
select * from flights order by departure_time;

-- Count the number of flights per status
select status, count(*) as numberofflights
from flights group by status ;

select count(*) as numberofflights
from flights ;

select distinct count(*) as numberofflights
from flights ;

-- select statuses with more than 5 Flights
select status, count(*) as numberofflights
from flights 
group by status 
having count(*)>5; 

select status, count(*) as numberofflights
from flights 
group by status 
having count(*)<5; 

-- select flights from a specific departure airport
select * from flights where departure_airport = 'delhi (del)';

-- select flights with more than 50 seats available 
select * from flights where seats_available>50;

-- select flights ordered by arrival time 
Select * from flights order by arrival_time;

-- select flights with duration greater than 120 minutes
Select * from flights where flight_duration >120;

-- select distinct aircraft types
select distinct aircraft_type from flights;

-- select flights with arrival time after a specific date
Select * from flights where arrival_time>'2023-10-01 12:00:00';

-- select flights with specific flight number
Select * from flights where flight_number = 'AI101'

-- 2.UPDATE QUERY

-- Updtae the number of available seats for a specific flight
UPDATE flights
set seats_available = 45
where  flight_id =1; 

-- Update the status of a flight 
UPDATE flights
set status = 'Cancelled'
where  flight_id =1; 

-- Update the arrival airport for a specific flight
UPDATE flights
set arrival_airport = 'Chennai (MAA)'
where  flight_id =3; 

-- Update the flight duration for a specific flight
Update flights set Flight_Duration = 130 where flight_id = 4;

-- Update the aircraft type for a specific flight
update flights set aircraft_type = 'boeing 777' where flight_id = 5;

-- update the departure time for a specific flight 
update flights set Departure_Time = '2023-10-01 07:00:00' where flight_id = 6;

-- update multiple fields for a specific flight
update flights set seats_available = '60', status = 'on time' where flight_id = 7;

-- update status for all delayed flights
update flights set status = 'on time' where status = 'delayed';

-- update rge flight number for a specific flight
update flights set flight_number = 'AI201' where flight_id = 8

-- Update the departure airport for multiple flights
update flights set departure_airport = 'Delhi (DEL)' where arrival_airport = 'Mumbai (BOM)';

SET SQL_SAFE_UPDATES = 0;

-- 3. Delete Queries

-- Delete a specific flight
delete from flights 
where flight_id = 2;

-- delete all delayed flights
delete from flights where status = 'Delayed';

-- delete flights with no available seats 
delete from flights where seats_available = 0;

-- delete a flight by flight number
delete from flights where flight_number =  'AI101';

-- delete flights departing before specific date
delete from flights where departure_time < '2023-10-01 00:00:00'

-- delete all flights to a specific destination 
delete from flights where arrival_airport = 'jaipur (jai)';

-- delete flights with a duration less than a specific value
delete from flights where flight_duration <90;

-- delete flights with specific status
delete from flights where aircraft_type = 'Airbus A320';

-- delete all flights with leass than 30 seats available
delete from flights where  seats_available <30;

-- 4.Alter queries

-- add a new column for flight's terminal 
alter table flights
add column terminal varchar(10);

-- add a new column for flight's terminal 
alter table flights
add column terminal varchar(10);

-- drop the terminal column from flights table
alter table flights
drop column terminal;

-- add a new column for flight's airline
alter table flights
add column airline varchar (50);

-- change the data type of flight_number
alter table flights
modify flight_number varchar(15);

-- rename table arrival_airport column
alter table flights
rename column arrival_airport to destination_airport;

-- add a default value for seats_available 
alter table flight_schedules 
alter column seats_available set default 100;

alter table flight_schedules 
alter column seats_available set default 200;

-- rename the flight table 
alter table flights 
rename to flight_schedules;

alter table flight_schedules 
rename to flights;

desc flight_schedules;

-- 5.ADD & DROP Constraint queries

-- add a check constraint to ensure flight_duration is positive
alter table flight_schedules
add constraint chk_flight_duration check (flight_duration >0);

-- drop the check constatint on flight duration
alter table flight_schedules
drop constraint chk_flight_duration;

-- add check constraint on flight duration 
alter table flight_schedules
add constraint chk_flight_duration check (flight_duration >0);

-- drop the check constraint on flight duration 
alter table flight_schedules
drop constraint chk_flight_duration;

-- add a unique constraint on flight_number
alter table flight_schedules
add constraint unique_flight_number unique(flight_number);

-- add a check constraint for seats avilable
alter table flight_schedules
add constraint chk_seats_available check (seats_available >=0);

-- drop the check constraint on seats available
alter table flight_schedules
drop constraint chk_seats_available;

-- add a foreign key constraint (if applicable)
alter table flight_schedules
add constraint fk_airport foreign key (departure_airport) references airports(airport_name);

-- drop the foreign key constraint
alter table flight_schedules
drop constraint fk_airport;

--  add a not null constraint to flight_number
alter table flight_schedules
modify flight_number varchar(10) not null;

-- drop the not null constraint from flight_number
alter table flight_schedules
modify flight_number varchar(10);

-- add a default constraint for status
alter table flight_schedules
alter column status set default 'On Time';

-- drop the default constraint for status
alter table flight_schedules
alter column status drop default;

-- add a unique constraint on aircraft_type
alter table flight_schedules
add constraint unique_aircraft_type unique (Aircraft_type); -- Error Code: 1062. Duplicate entry 'Boeing 737' for key 'flight_schedules.unique_aircraft_type'

-- drop the unique constraint on aircraft_type
alter table flight_schedules
drop constraint unique_aircraft_type;

-- Clauses {where, Distinct, From, Order by, Group By, Having}
/* 
1.WHERE  Clause

*/


-- Select all records from Bookings table
SELECT * FROM Bookings;

-- Select all records from Airlines table
SELECT * FROM Airlines;

-- Select all records from Tickets table
SELECT * FROM Tickets;


-- 2. Truncate Each Table

-- Truncate the Tickets table
TRUNCATE TABLE Tickets;

-- Truncate the Bookings table
TRUNCATE TABLE Bookings;

-- Truncate the Passengers table
TRUNCATE TABLE Passengers;

-- Truncate the Flights table
TRUNCATE TABLE Flights;

-- Truncate the Airlines table
TRUNCATE TABLE Airlines;


-- 3. Drop Each Table

-- Drop the Tickets table
DROP TABLE IF EXISTS Tickets;

-- Drop the Bookings table
DROP TABLE IF EXISTS Bookings;

-- Drop the Passengers table
DROP TABLE IF EXISTS Passengers;

-- Drop the Flights table
DROP TABLE IF EXISTS Flights;

-- Drop the Airlines table
DROP TABLE IF EXISTS Airlines;


-- 4. Rename Each Table

-- Rename the Flights table to Flight_Details
ALTER TABLE Flights
RENAME TO Flight_Details;

-- Rename the Passengers table to Customer
ALTER TABLE Passengers
RENAME TO Customer;

-- Rename the Bookings table to Reservations
ALTER TABLE Bookings
RENAME TO Reservations;

-- Rename the Airlines table to Airline_Companies
ALTER TABLE Airlines
RENAME TO Airline_Companies;

-- Rename the Tickets table to Flight_Tickets
ALTER TABLE Tickets
RENAME TO Flight_Tickets;

-- MYSQL Alias
/*

In MYSQL, an alias is a temporary name assigned to table or column for the duration of a query
(wihin the scope of a query). Aliases are primarliy used to enhance the readability and clarity of
SQL statements, making it easier for users to understand the purpose of the data being retrived or manipulated

Key points about MYSQL Aliases:

1.Temporary Nature:
Aliases exist only for the duration of the query. Once the query execution is complete,
the alias ceases to exist.

2.Improved Readability:
By using aliases you can simplify complex colum names or provide more meaningful names
that better describe the data. This is particularly useful when dealing with long or complicated column names.

Syntax:

For column aliases, the syntax is:

SELECT column_name AS alias_name
FROM table_name;

For table aliases, the syntax is:

SELECT column_name
FROM table_name AS alias_name;

3. Usage in Queries: 
Aliases can be used in various SQL statements, including SELECT, UPDATE, and DELETE. 
They can also be used in conjunction with aggregate functions, joins, and subqueries.

4. No Impact on Database Structure: 
Using an alias does not change the actual table or column names in the database; 
it only affects how they are referenced in the query.

*/

select * from flights;

-- Table Alias
Select f.Flight_ID, f.Flight_number, f.departure_airport, f.Arrival_Time
from flights f;

-- Column alias
Select f.flight_id as ID, f.flight_number as Num, f.departure_airport as departure,
f.destination_airport as arrival 
from flights f;

-- Derived Table Alias
select *
from (
select f.flight_id, f.flight_number, f.Departure_Airport, f.destination_airport
from flights f
) as flightinfo;

select * from flights as flightinfo;

-- Flitering with alias
select f.flight_id, f.flight_number, f.Departure_Airport, f.destination_airport
from flights f
where f.departure_airport = 'JFK';

-- sorting with alias
select f.flight_id, f.flight_number, f.Departure_Airport, f.destination_airport
from flights f
ORDER BY f.Departure_Time;

-- Grouping with Alias
SELECT f.Departure_Airport, COUNT(f.Flight_ID) AS NumFlights
FROM Flights f
GROUP BY f.Departure_Airport;

-- Aggregate Functions with Alias
SELECT f.Departure_Airport, AVG(f.Flight_Duration) AS AvgDuration
FROM Flights f
GROUP BY f.Departure_Airport;

-- Having Clause with Alias
SELECT f.Departure_Airport, AVG(f.Flight_Duration) AS AvgDuration
FROM Flights f
GROUP BY f.Departure_Airport
HAVING AVG(f.Flight_Duration) >= 100;

SELECT f.Departure_Airport, f.flight_number, AVG(f.Flight_Duration) AS AvgDuration 
FROM Flights f
GROUP BY f.Departure_Airport, f.flight_number
HAVING AVG(f.Flight_Duration) = 140; 

select * from flights as flightinfo;

-- add a column then write a query to enter all details at 1 time
Alter table flights add flight_status varchar(20);

Update flights 
set flight_status = 'scheduled'
where flight_id in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);

Update flights set flight_status = 
Case 
when flight_id in (1,2,3) then 'Scheduled'
when flight_id in (4,5) then 'Departed'
when flight_id in (6,11,13) then 'Arrived'
when flight_id in (7,12) then 'Delayed'
when flight_id in (8,14,15) then 'Cancelled'
when flight_id in (9) then 'Diverted'
else 'unknown'
END
where flight_id in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);

-- Operators
/*
In MYSQL, Operators are special symbols or keywords that are used to perform operations on one or more operand
(values or variables). Operators are fundamental to constructing SQL queries, as they allow you to manipulates
data, compare values, and perform calculations. MYSQL supports several types of operators, which can be 
categories as follow:

*/

-- Arithmatic operators: +, -, *, /, %

-- calculate the total flight duration for flight AI101, adding 30 mintues for a layover
select *from flights;

select flight_number, flight_duration +30 as Total_duration
from flights
where flight_number = 'AI101';

-- calculate the remaining seats after booking 10 seats for flight AI102
select flight_number, Seats_Available - 10 as remaining_seats
from flights
where flight_number = 'AI102';

-- calculate the total available seats for all flights by suming the seats_available column
select sum(seats_available) as total_available_seats
from flights;

-- calculate the average flight duration across all flights
select avg(flight_duration) as avg_flight_duration 
from flights;

select Aircraft_Type, avg(flight_duration) as total_duration 
from flights
group by Aircraft_Type ;

-- calculate the flight duration in hours for each flight
select flight_number, flight_duration/60 as duration_hours
from flights;

-- calculate the percentage of available seats for each flight based on total of 100 seats
select flight_number,
(seats_available/100.0)*100 as percentage_available
from flights;

-- calculae the remaining flight duration after 30 minutes for each flight
select flight_number,
Flight_Duration - 30 as remaining_duration
from flights;

-- calculate the total number of seats for flights that have more than 50 available seats
select sum(seats_available) as total_seats
from flights
where seats_available > 50;

-- Calculate the total duration of flights that are delayed
select sum(Flight_Duration) as total_duration_delayed
from flights
where status = 'delayed';

select sum(Flight_Duration) as total_duration_on_time
from flights
where status = 'on time';

-- calculate the total flight time for flights departing from delhi
select sum(flight_duration) as total_flight_time
from flights
where departure_airport = 'delhi (del)';

-- Assuming a hypothetical cost of $2 per minute, calculate total cost for each flight
select flight_number, 
flight_duration * 2 as total_duration
from flights;

-- Calculate the total available seats for flights with a duration greater than 120 minutes
select sum(seats_available)  as total_seats_over_120
from flights where Flight_Duration >120;

-- calculate remaining seats afetr booking 5 seats for each flight
select seats_available - 5 as total_seats_available, flight_number
from flights ;

-- calculate total revenue from flights assuming a ticket price of $100 per seat
select flight_number,
seats_available *100 as total_revenue
from flights;

-- calculate the total flight duration for flights arriving in mumbai
select sum(flight_duration) as total_duration_mumbai
from flights
where destination_airport = 'Mumbai (BOM)';

-- calculate the total number of available seats for flights that are on time
select sum(seats_available)  as total_seats_on_time
from flights
where Status = 'on time';

-- calcualte the total flight duration for flights that have more than 100 available seats
select sum(flight_duration) as total_duration_over_100
from flights
where Seats_Available >100;

-- calculate the percentage of flights that are delayed compared to  total flights
select (count(case when status = 'delayed' then 1 end)*100)/count(*) as  percentage_delayed --- 500/5=100
from flights;

select * from flights;

select (count(case when status = 'On Time' then 1 end)*100)/count(*) as  percentage_on_time
from flights;

select (count(case when flight_status = 'Scheduled' then 1 end)*100)/count(*) as  percentage_Scheduled  -- 3*100/15 -->3 scheduled records * 100/ total records in table
from flights;

select (count(case when flight_status = 'halt' then 'no' end)*100)/count(*) as  percentage_Scheduled  -- 0*100/15 --> 0 halt records * 100/ total records in table {o/p - 0}
from flights;


-- calcualte the total number of seats for flights with a duration of less than 30 minutes
select sum(seats_available) as total_seats_under_30
from flights
where flight_duration>30;

-- Functions
 /*
 Functions in MYSQL are predefined operations that can be used to perform calcualtions, manipulates data
 and retrieve specific information. These functions make it easier to work with strings, numbers, dates, and more
 They are categorized as follows based on their functionality:
 
 1.String functions
 These functions are used to manipulate and process string data.
 
 LENGHT(str) : returns the lenght of string
 
 CONCAT(str1, str2, ....): Concantenates two or more strings
 
 UPPER(str: Converts a string to uppercase
 
 LOWER(str): Converts a string to lowercase
 
 SUBSTRING(str, strat,length): Returns the 
 */
 -- string functions
 
 select * from flights;
 
 -- Converts flight number to uppercase
 Select upper(flight_number) as uppearcase_flight_number 
 from flights;
 
 Select upper(Departure_Airport) as uppearcase_Departure_Airport
 from flights;
 
 -- converts departure airport names to lowercase
  Select upper(Departure_Airport) as lowercase_Departure_Airport
 from flights;
 
 -- concatenates flight number and departure airport
 select concat(flight_number, ' - ', departure_airport) as flight_info
 from flights;
 
 -- Numeric Functions
 
 -- calculates the average flight duration
 select avg(flight_duration) as average_flight_duration 
 from flights;
 
 -- calculates the total number of seats available
 select sum(seats_available) as total_seats_available 
 from flights;
 
 -- finds the longest flight duration
 select max(flight_duration) as longest_flight_duration
 from flights;
 
 -- date and time functions
 -- extracts the date from the departure time
 select date(departure_time) as departure_date from flights;
 
 -- extracts the time from the departure time
 select time(departure_time) as departure_time 
 from flights;
 
 -- Operators
 /*
 In MySQL, operators are special symbols or keywords that are used to perform operations on one or more operands
 (values or variables). Operators are fundamental to constructing SQL queries, as they allow you to manipulate 
 data, compare values, and perform calculations. MySQL supports several types of operators, which can be 
 categorized as follows:
 
*/

-- Arithmetic operators: +, -, *, /, %

-- Calculate the total flight duration for Flight AI101, adding 30 minutes for a layover
SELECT Flight_Number, Flight_Duration + 30 AS Total_Duration 
FROM Flights 
WHERE Flight_Number = 'AI101';

-- Calculate the remaining seats after booking 10 seats for Flight AI102
SELECT Flight_Number, Seats_Available - 10 AS Remaining_Seats 
FROM Flights 
WHERE Flight_Number = 'AI102';

-- Calculate the total available seats for all flights by summing the Seats_Available column
SELECT SUM(Seats_Available) AS Total_Available_Seats 
FROM Flights;

-- Calculate the average flight duration across all flights
SELECT AVG(Flight_Duration) AS Average_Flight_Duration 
FROM Flights;

-- Calculate the flight duration in hours for each flight
SELECT Flight_Number, Flight_Duration / 60 AS Duration_Hours 
FROM Flights;

-- Calculate the percentage of available seats for each flight based on a total of 100 seats
SELECT Flight_Number, 
       (Seats_Available / 100.0) * 100 AS Percentage_Available 
FROM Flights;

-- Calculate the remaining flight duration after 30 minutes for each flight
SELECT Flight_Number, 
       Flight_Duration - 30 AS Remaining_Duration 
FROM Flights 
WHERE Flight_Duration > 30;  -- Ensure we don't get negative durations

-- Calculate the total number of seats for flights that have more than 50 available seats
SELECT SUM(Seats_Available) AS Total_Seats 
FROM Flights 
WHERE Seats_Available > 50;

-- Calculate the total duration of flights that are delayed
SELECT SUM(Flight_Duration) AS Total_Duration_Delayed 
FROM Flights 
WHERE Status = 'Delayed';

-- Calculate the total flight time for flights departing from Delhi
SELECT SUM(Flight_Duration) AS Total_Flight_Time 
FROM Flights 
WHERE Departure_Airport = 'Delhi (DEL)';

-- Assuming a hypothetical cost of $2 per minute, calculate total cost for each flight
SELECT Flight_Number, 
       Flight_Duration * 2 AS Total_Cost 
FROM Flights;

-- Calculate the total available seats for flights with a duration greater than 120 minutes
SELECT SUM(Seats_Available) AS Total_Seats_Over_120 
FROM Flights 
WHERE Flight_Duration > 120;

-- Calculate remaining seats after booking 5 seats for each flight
SELECT Flight_Number, 
       Seats_Available - 5 AS Remaining_After_Booking 
FROM Flights;

-- Calculate total revenue from flights assuming a ticket price of $100 per seat
SELECT Flight_Number, 
       Seats_Available * 100 AS Total_Revenue 
FROM Flights;

-- Calculate the total flight duration for flights arriving in Mumbai
SELECT SUM(Flight_Duration) AS Total_Duration_Mumbai 
FROM Flights 
WHERE Arrival_Airport = 'Mumbai (BOM)';

-- Calculate the total number of available seats for flights that are on time
SELECT SUM(Seats_Available) AS Total_Seats_On_Time 
FROM Flights 
WHERE Status = 'On Time';

-- Calculate the total flight duration for flights that have more than 100 available seats
SELECT SUM(Flight_Duration) AS Total_Duration_Over_100 
FROM Flights 
WHERE Seats_Available > 100;

-- Calculate the percentage of flights that are delayed compared to total flights
SELECT (COUNT(CASE WHEN Status = 'Delayed' THEN 1 END) * 100) / COUNT(*) AS Percentage_Delayed 
FROM Flights;

-- Calculate the total number of seats for flights with a duration of less than 30 minutes
SELECT SUM(Seats_Available) AS Total_Seats_Under_30 
FROM Flights 
WHERE Flight_Duration < 30;



-- Comparison operators: =, <, >, <=, >=, != or <> (not equal to)

-- Select all details for the flight with Flight_Number 'AI101'
SELECT * 
FROM Flights 
WHERE Flight_Number = 'AI101';  -- Using '=' operator

-- Select all flights with a duration less than 120 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration < 120;  -- Using '<' operator

-- Select all flights with a duration greater than 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 150;  -- Using '>' operator

-- Select all flights with a duration less than or equal to 90 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration <= 90;  -- Using '<=' operator

-- Select all flights with a duration greater than or equal to 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration >= 180;  -- Using '>=' operator

-- Select all flights that are not arriving at Delhi (DEL)
SELECT * 
FROM Flights 
WHERE Arrival_Airport != 'Delhi (DEL)';  -- Using '!=' operator

-- Select all flights where the status is not equal to 'Cancelled'
SELECT * 
FROM Flights 
WHERE Status <> 'Cancelled';  -- Using '<>' operator

-- Select all flights departing from Mumbai (BOM)
SELECT * 
FROM Flights 
WHERE Departure_Airport = 'Mumbai (BOM)';  -- Using '=' operator

-- Select all flights that have more than 50 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available > 50;  -- Using '>' operator

-- Select all flights that have fewer than 30 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available < 30;  -- Using '<' operator

-- Select all flights that have exactly 60 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available = 60;  -- Using '=' operator

-- Select all flights that do not have a duration of 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration != 150;  -- Using '!=' operator

-- Select all flights with a duration greater than 120 and less than 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 120 AND Flight_Duration < 180;  -- Using '>' and '<' operators

-- Select all flights that are currently 'On Time'
SELECT * 
FROM Flights 
WHERE Status = 'On Time';  -- Using '=' operator

-- Select all flights that arrive after October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time > '2023-10-01 00:00:00';  -- Using '>' operator

-- Select all flights that depart before October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time < '2023-10-01 00:00:00';  -- Using '<' operator

-- Select all flights that have seats available greater than or equal to 40
SELECT * 
FROM Flights 
WHERE Seats_Available >= 40;  -- Using '>=' operator

-- Select all flights that have seats available less than or equal to 20
SELECT * 
FROM Flights 
WHERE Seats_Available <= 20;  -- Using '<=' operator

-- Select all flights with a duration between 60 and 120 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration >= 60 AND Flight_Duration <= 120;  -- Using '>=' and '<=' operators

-- Select all flights where the status is not equal to 'Delayed'
SELECT * 
FROM Flights 
WHERE Status <> 'Delayed';  -- Using '<>' operator


-- Logical operators: AND, OR, NOT




-- String operators: LIKE, REGEXP, NOT LIKE



-- Set operators: UNION, UNION All, INTERSECT, EXCEPT or DIFFERENCE



-- Bitwise operators: &, |, ^, ~



-- Control flow operators: IF, CASE

select * from flights;


-- 7. LIMIT (or FETCH or TOP) Clause

/*

In MySQL, the LIMIT clause is used to restrict the number of rows returned by a query. 
Unlike some other SQL databases (e.g., SQL Server or PostgreSQL) that use TOP or FETCH, 
MySQL exclusively supports LIMIT. 

Syntax for LIMIT

SELECT column1, column2, ...
FROM table_name
LIMIT [offset,] row_count;

Key Components

1. row_count: Specifies the number of rows to return.
2. offset (optional): Specifies the starting point from which rows are returned. If omitted, 
the default is 0 (start from the first row).
3. LIMIT: Used to specify the maximum number of records to return.
4. Using LIMIT with a comma: An alternative way to specify both the offset and the limit in a single clause.
5. ROW_COUNT(): While not directly applicable, you can use SQL_CALC_FOUND_ROWS and FOUND_ROWS() to get the 
total count of rows.

*/

-- Select the first 5 flights
SELECT * FROM Flights LIMIT 5;

SELECT * FROM Flights LIMIT 5 offset 2;

-- Select the first 10 flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY Departure_Time LIMIT 10;

-- Select the last 3 flights based on Flight_ID
SELECT * FROM Flights ORDER BY Flight_ID DESC LIMIT 3;

-- Select the first 7 flights that are delayed
SELECT * FROM Flights WHERE Status = 'Delayed' LIMIT 7,5;
SELECT * FROM Flights WHERE Status = 'on time' LIMIT 7,5;

-- Select the first 5 flights departing from Delhi
SELECT * FROM Flights WHERE Departure_Airport = 'Delhi (DEL)' LIMIT 5;

-- Select the first 10 flights with available seats greater than 50
SELECT * FROM Flights WHERE Seats_Available > 50 LIMIT 10;

-- Select the first 5 flights arriving in Mumbai
SELECT * FROM Flights WHERE Arrival_Airport = 'Mumbai (BOM)' LIMIT 5;

-- Select the first 10 flights with a flight duration greater than 120 minutes
SELECT * FROM Flights WHERE Flight_Duration > 120 LIMIT 10;

-- Select the first 5 flights ordered by Flight_Number
SELECT * FROM Flights ORDER BY Flight_Number LIMIT 5;

-- Select the first 3 flights that departed after a specific date
SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 00:00:00' LIMIT 3;

-- Select 5 flights starting from the 10th record (OFFSET)
SELECT * FROM Flights LIMIT 5 OFFSET 10;

-- Select 10 flights starting from the 20th record
SELECT * FROM Flights LIMIT 10 OFFSET 20;

-- Select 3 flights starting from the 5th record
SELECT * FROM Flights LIMIT 3 OFFSET 5;

-- Select 7 flights starting from the 15th record
SELECT * FROM Flights LIMIT 7 OFFSET 15;

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM Flights LIMIT 4 OFFSET 0;

-- Select 5 flights starting from the 10th record
SELECT * FROM Flights LIMIT 10, 5;  -- This means skip 10 records and then return the next 5

-- Select 10 flights starting from the 20th record
SELECT * FROM Flights LIMIT 20, 10;  -- Skip 20 records and return the next 10

-- Select 3 flights starting from the 5th record
SELECT * FROM Flights LIMIT 5, 3;  -- Skip 5 records and return the next 3

-- Select 7 flights starting from the 15th record
SELECT * FROM Flights LIMIT 15, 7;  -- Skip 15 records and return the next 7

-- Select 4 flights starting from the 0th record (first record)
SELECT * FROM Flights LIMIT 0, 4;  -- Skip 0 records and return the first 4

-- Get the total number of flights and limit the results
SELECT SQL_CALC_FOUND_ROWS * FROM Flights LIMIT 5; 
SELECT FOUND_ROWS();  -- This will return the total number of rows without the LIMIT
 
 
 
 