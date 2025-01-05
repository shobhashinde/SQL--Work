
-- Create the airline database if it does not already exist
CREATE DATABASE IF NOT EXISTS airline123;
USE airline123; -- Set the context to the airline database

-- ------------------------------------Table Queries --------------------------------------

-- Data Definition Language (DDL) {Create,Alter,Drop,Truncate,Rename,Comment}
-- Data Manipulation Language (DML) {Insert, Update, Delete}
-- Data Query Language (DQL) {select query}

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

 -- Select, Alter, delete & update Queries
 
 /*
 1. SELECT Query
The SELECT statement is used to retrieve data from a database table. 
It allows you to specify the columns you want to fetch and apply conditions to filter the results.

Syntax-

SELECT column1, column2, ...  
FROM table_name  
WHERE condition;  

2. ALTER Query
The ALTER statement is used to modify the structure of an existing table, 
such as adding, deleting, or modifying columns.
The ALTER query changes the table structure, not the data.

Syntax-

ALTER TABLE table_name  
ADD column_name datatype;  
-- or  
ALTER TABLE table_name  
DROP COLUMN column_name;  
-- or  
ALTER TABLE table_name  
MODIFY column_name new_datatype;  

3. DELETE Query
The DELETE statement is used to remove rows from a table based on a specified condition.

Syntax- 

DELETE FROM table_name  
WHERE condition;  

4. UPDATE Query
The UPDATE statement is used to modify existing records in a table.

Syntax:

UPDATE table_name  
SET column1 = value1, column2 = value2, ...  
WHERE condition;  


 */
 
 -- 1. Select Queries
 
 -- Select all records from Flights table
SELECT * FROM Flights;

-- Select flights that are delayed
SELECT * FROM Flights WHERE Status = 'Delayed';

-- Select distinct aircraft types used in flights
SELECT DISTINCT Aircraft_Type FROM Flights;
 
-- Select all flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY Departure_Time;

-- Count the number of flights per status
SELECT Status, COUNT(*) AS NumberOfFlights 
FROM Flights 
GROUP BY Status;

-- Select statuses with more than 5 flights
SELECT Status, COUNT(*) AS NumberOfFlights 
FROM Flights 
GROUP BY Status 
HAVING COUNT(*) > 5; 

-- Select Flights from a Specific Departure Airport
SELECT * FROM Flights WHERE Departure_Airport = 'Delhi (DEL)';

-- Select Flights with More Than 50 Seats Available
SELECT * FROM Flights WHERE Seats_Available > 50;

-- Select Flights Ordered by Arrival Time
SELECT * FROM Flights ORDER BY Arrival_Time;

-- Select Flights with a Duration Greater Than 120 Minutes
SELECT * FROM Flights WHERE Flight_Duration > 120;

-- Select Distinct Aircraft Types
SELECT DISTINCT Aircraft_Type FROM Flights;

-- Select Flights with Arrival Time After a Specific Date
SELECT * FROM Flights WHERE Arrival_Time > '2023-10-01 12:00:00';

-- Select Flights with a Specific Flight Number
SELECT * FROM Flights WHERE Flight_Number = 'AI101';


-- 2. Update Queries

-- Update the number of available seats for a specific flight
UPDATE Flights 
SET Seats_Available = 45 
WHERE Flight_ID = 1;

-- Update the Status of a Flight
UPDATE Flights SET Status = 'Cancelled' WHERE Flight_ID = 1;

-- Update the Arrival Airport for a Specific Flight
UPDATE Flights SET Arrival_Airport = 'Chennai (MAA)' WHERE Flight_ID = 3;

-- Update the Flight Duration for a Specific Flight
UPDATE Flights SET Flight_Duration = 130 WHERE Flight_ID = 4;

-- Update the Aircraft Type for a Specific Flight
UPDATE Flights SET Aircraft_Type = 'Boeing 777' WHERE Flight_ID = 5;

-- Update the Departure Time for a Specific Flight
UPDATE Flights SET Departure_Time = '2023-10-01 07:00:00' WHERE Flight_ID = 6;

-- Update Multiple Fields for a Specific Flight
UPDATE Flights SET Seats_Available = 60, Status = 'On Time' WHERE Flight_ID = 7;

-- Update Status for All Delayed Flights
UPDATE Flights SET Status = 'On Time' WHERE Status = 'Delayed';

-- Update the Flight Number for a Specific Flight
UPDATE Flights SET Flight_Number = 'AI201' WHERE Flight_ID = 8;

-- Update the Departure Airport for Multiple Flights
UPDATE Flights SET Departure_Airport = 'Delhi (DEL)' WHERE Arrival_Airport = 'Mumbai (BOM)';


-- 3. Delete Queries

-- Delete a specific flight
DELETE FROM Flights 
WHERE Flight_ID = 2;

-- Delete All Delayed Flights
DELETE FROM Flights WHERE Status = 'Delayed';

-- Delete Flights with No Available Seats
DELETE FROM Flights WHERE Seats_Available = 0;

-- Delete a Flight by Flight Number
DELETE FROM Flights WHERE Flight_Number = 'AI101';

-- Delete Flights Departing Before a Specific Date
DELETE FROM Flights WHERE Departure_Time < '2023-10-01 00:00:00';

-- Delete All Flights to a Specific Destination
DELETE FROM Flights WHERE Arrival_Airport = 'Jaipur (JAI)';

-- Delete Flights with a Duration Less Than a Specific Value
DELETE FROM Flights WHERE Flight_Duration < 90;

-- Delete Flights with a Specific Status
DELETE FROM Flights WHERE Status = 'Cancelled';

-- Delete Flights with a Specific Aircraft Type
DELETE FROM Flights WHERE Aircraft_Type = 'Airbus A320';

-- Delete All Flights with Less Than 30 Seats Available
DELETE FROM Flights WHERE Seats_Available < 30;


-- 4. Alter Queries

-- Add a new column for flight's terminal
ALTER TABLE Flights 
ADD COLUMN Terminal VARCHAR(10);

-- Drop the Terminal column from Flights table
ALTER TABLE Flights 
DROP COLUMN Terminal;

-- Add a New Column for Flight's Airline
ALTER TABLE Flights ADD COLUMN Airline VARCHAR(50);

-- Change the Data Type of Flight_Number
ALTER TABLE Flights MODIFY Flight_Number VARCHAR(15);

-- Rename the Arrival_Airport Column
ALTER TABLE Flights RENAME COLUMN Arrival_Airport TO Destination_Airport;

-- Add a Default Value for Seats_Available
ALTER TABLE Flights ALTER COLUMN Seats_Available SET DEFAULT 100;

-- Rename the Flights Table
ALTER TABLE Flights RENAME TO Flight_Schedules;

 
 -- 5. Add & drop Constraints Queries 
 
 -- Add a CHECK constraint to ensure Flight_Duration is positive
ALTER TABLE Flights 
ADD CONSTRAINT chk_flight_duration CHECK (Flight_Duration > 0);

-- Drop the CHECK constraint on Flight_Duration
ALTER TABLE Flights 
DROP CONSTRAINT chk_flight_duration;

-- Add a CHECK Constraint for Flight Duration
ALTER TABLE Flights ADD CONSTRAINT chk_flight_duration CHECK (Flight_Duration > 0);

-- Drop the CHECK Constraint on Flight Duration
ALTER TABLE Flights DROP CONSTRAINT chk_flight_duration;

-- Add a UNIQUE Constraint on Flight_Number
ALTER TABLE Flights ADD CONSTRAINT unique_flight_number UNIQUE (Flight_Number);

-- Add a CHECK Constraint for Seats Available
ALTER TABLE Flights ADD CONSTRAINT chk_seats_available CHECK (Seats_Available >= 0);

-- Drop the CHECK Constraint on Seats Available
ALTER TABLE Flights DROP CONSTRAINT chk_seats_available;

-- Add a FOREIGN KEY Constraint (if applicable)
ALTER TABLE Flights ADD CONSTRAINT fk_airport FOREIGN KEY (Departure_Airport) REFERENCES Airports(Airport_Name);

-- Drop the FOREIGN KEY Constraint
ALTER TABLE Flights DROP CONSTRAINT fk_airport;

-- Add a NOT NULL Constraint to Flight_Number
ALTER TABLE Flights MODIFY Flight_Number VARCHAR(10) NOT NULL;

-- Drop the NOT NULL Constraint from Flight_Number
ALTER TABLE Flights MODIFY Flight_Number VARCHAR(10);

-- Add a DEFAULT Constraint for Status
ALTER TABLE Flights ALTER COLUMN Status SET DEFAULT 'On Time';

-- Drop the DEFAULT Constraint for Status
ALTER TABLE Flights ALTER COLUMN Status DROP DEFAULT;

-- Add a UNIQUE Constraint on Aircraft_Type
ALTER TABLE Flights ADD CONSTRAINT unique_aircraft_type UNIQUE (Aircraft_Type);

-- Drop the UNIQUE Constraint on Aircraft_Type
ALTER TABLE Flights DROP CONSTRAINT unique_aircraft_type;


 -- Clauses {Where, Distinct, From, Order By, Group By, Having}
 
 /*
 
 1. WHERE Clause
The WHERE clause is used to filter records in a table based on specific conditions. 
It is typically used with SELECT, UPDATE, and DELETE statements.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE condition;  

2. DISTINCT Clause
The DISTINCT clause is used to return unique values from a column by removing duplicates 
in the result set.

Syntax:

SELECT DISTINCT column1  
FROM table_name;  

3. FROM Clause
The FROM clause specifies the table or tables from which the data is retrieved. 
It is a mandatory part of the SELECT statement and can also be used with joins for 
combining data from multiple tables.

Syntax:

SELECT column1, column2  
FROM table_name; 

4. ORDER BY Clause
The ORDER BY clause is used to sort the result set in ascending (ASC) or descending (DESC) order 
based on one or more columns.

Syntax:

SELECT column1, column2  
FROM table_name  
ORDER BY column_name [ASC|DESC];  

5. GROUP BY Clause
The GROUP BY clause groups rows with the same values into summary rows, 
often used with aggregate functions (e.g., COUNT, SUM, AVG).

Syntax:

SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1;

6. HAVING Clause
The HAVING clause is used to filter grouped data after the GROUP BY clause. 
It works similarly to the WHERE clause but is applied to aggregated results.

Syntax:

SELECT column1, aggregate_function(column2)  
FROM table_name  
GROUP BY column1  
HAVING condition;  

7. LIMIT (or FETCH or TOP) Clause
The LIMIT clause is used to restrict the number of rows returned by a query. 
Different databases may use variations like FETCH or TOP.

Syntax (MySQL):

SELECT column1, column2  
FROM table_name  
LIMIT number_of_rows;  

8. JOIN Clause
The JOIN clause is used to combine rows from two or more tables based on a related column.

Syntax:

SELECT columns  
FROM table1  
JOIN table2  
ON table1.common_column = table2.common_column;  

9. UNION Clause
The UNION clause is used to combine the results of two or more SELECT statements. 
Duplicate rows are removed by default.

Syntax:

SELECT column1, column2  
FROM table1  
UNION  
SELECT column1, column2  
FROM table2;  

10.INTO Clause
The INTO clause is used to insert query results into a new table or export data.

Syntax:

SELECT columns  
INTO new_table_name  
FROM table_name  
WHERE condition;  

11.CASE Clause
The CASE clause allows conditional logic in SQL queries, similar to an if-else statement.

Syntax:

SELECT column1,  
       CASE  
           WHEN condition1 THEN result1  
           WHEN condition2 THEN result2  
           ELSE result3  
       END AS alias_name  
FROM table_name; 

12. IN Clause
The IN clause is used to filter records based on a list of values.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name IN (value1, value2, ...);  

13. BETWEEN Clause
The BETWEEN clause filters data within a specified range, inclusive of the boundaries.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name BETWEEN value1 AND value2;  

14. LIKE Clause
The LIKE clause is used to search for a specified pattern in a column. Wildcards include % (any number of characters) and _ (a single character).

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE column_name LIKE pattern;  

15. EXISTS Clause
The EXISTS clause checks for the existence of rows in a subquery.

Syntax:

SELECT column1, column2  
FROM table_name  
WHERE EXISTS (subquery); 

16. AS Clause
The AS clause is used to provide an alias (temporary name) for columns or tables, 
improving query readability.

Syntax:

SELECT column_name AS alias_name  
FROM table_name;    
 
 */
 
 -- 1. WHERE Clause Queries
 
 -- Select flights that are delayed
 SELECT * FROM Flights WHERE Status = 'Delayed';
 
 -- Select flights departing from Delhi
 SELECT * FROM Flights WHERE Departure_Airport = 'Delhi (DEL)';
 
 -- Select flights arriving in Mumbai
 SELECT * FROM Flights WHERE Arrival_Airport = 'Mumbai (BOM)';
 
 -- Select flights with a duration greater than 120 minutes
 SELECT * FROM Flights WHERE Flight_Duration > 120;
 
 -- Select flights with available seats less than 30
 SELECT * FROM Flights WHERE Seats_Available < 30;
 
 -- Select flights that departed after a specific date
 SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 00:00:00';
 
 -- Select flights with a specific flight number
 SELECT * FROM Flights WHERE Flight_Number = 'AI101';
 
 -- Select flights that are either cancelled or delayed
SELECT * FROM Flights WHERE Status IN ('Cancelled', 'Delayed');

-- Select flights with a flight duration between 90 and 150 minutes
SELECT * FROM Flights WHERE Flight_Duration BETWEEN 90 AND 150;

-- Select flights with more than 50 available seats
SELECT * FROM Flights WHERE Seats_Available > 50;



-- 2. DISTINCT Clause Queries

-- Select distinct aircraft types used in flights
SELECT DISTINCT Aircraft_Type FROM Flights;

-- Select distinct departure airports
SELECT DISTINCT Departure_Airport FROM Flights;

-- Select distinct arrival airports
SELECT DISTINCT Arrival_Airport FROM Flights;

-- Select distinct flight statuses
SELECT DISTINCT Status FROM Flights;

-- Select distinct flight numbers
SELECT DISTINCT Flight_Number FROM Flights;

-- Select distinct combinations of departure and arrival airports
SELECT DISTINCT Departure_Airport, Arrival_Airport FROM Flights;

-- Select distinct flight durations
SELECT DISTINCT Flight_Duration FROM Flights;

-- Select distinct departure times
SELECT DISTINCT Departure_Time FROM Flights;

-- Select distinct arrival times
SELECT DISTINCT Arrival_Time FROM Flights;

-- Select distinct seat availability counts
SELECT DISTINCT Seats_Available FROM Flights;


-- 3. FROM Clause Queries

-- Select all records from Flights table
SELECT * FROM Flights;

-- Select flight numbers and statuses from Flights table
SELECT Flight_Number, Status FROM Flights;

-- Select departure and arrival airports from Flights table
SELECT Departure_Airport, Arrival_Airport FROM Flights;

-- Select flight ID and duration from Flights table
SELECT Flight_ID, Flight_Duration FROM Flights;

-- Select all columns from Flights table where status is 'On Time'
SELECT * FROM Flights WHERE Status = 'On Time';

-- Select all flights with a specific aircraft type
SELECT * FROM Flights WHERE Aircraft_Type = 'Boeing 737';

-- Select all flights departing after a specific time
SELECT * FROM Flights WHERE Departure_Time > '2023-10-01 12:00:00';

-- Select all flights arriving in a specific city
SELECT * FROM Flights WHERE Arrival_Airport = 'Chennai (MAA)';

-- Select all flights with available seats greater than 40
SELECT * FROM Flights WHERE Seats_Available > 40;

-- Select all flights with a specific flight duration
SELECT * FROM Flights WHERE Flight_Duration = 120;


-- 4. ORDER BY Clause Queries

-- Select all flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY Departure_Time;

-- Select all flights ordered by Flight_Duration in descending order
SELECT * FROM Flights ORDER BY Flight_Duration DESC;

-- Select all flights ordered by Seats_Available
SELECT * FROM Flights ORDER BY Seats_Available;

-- Select all flights ordered by Status and then by Departure_Time
SELECT * FROM Flights ORDER BY Status, Departure_Time;

-- Select all flights ordered by Arrival_Airport
SELECT * FROM Flights ORDER BY Arrival_Airport;

-- Select all flights ordered by Flight_Number in descending order
SELECT * FROM Flights ORDER BY Flight_Number DESC;

-- Select all flights ordered by Departure_Airport and then by Flight_Duration
SELECT * FROM Flights ORDER BY Departure_Airport, Flight_Duration;

-- Select all flights ordered by Arrival_Time in descending order
SELECT * FROM Flights ORDER BY Arrival_Time DESC;

-- Select all flights ordered by Flight_ID
SELECT * FROM Flights ORDER BY Flight_ID;

-- Select all flights ordered by Arrival_Time
SELECT * FROM Flights ORDER BY Arrival_Time;



-- 5. GROUP BY Clause Queries

-- Count flights grouped by status
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status;

-- Group flights by Departure_Airport and count them
SELECT Departure_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Departure_Airport;

-- Group flights by Arrival_Airport and count them
SELECT Arrival_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Arrival_Airport;

-- Group flights by Aircraft_Type and calculate average duration
SELECT Aircraft_Type, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Aircraft_Type;

-- Group flights by Flight_Number and count them
SELECT Flight_Number, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Flight_Number;

-- Group flights by Departure_Airport and calculate total available seats
SELECT Departure_Airport, SUM(Seats_Available) AS TotalSeats FROM Flights GROUP BY Departure_Airport;

-- Group flights by Status and calculate maximum duration
SELECT Status, MAX(Flight_Duration) AS MaxDuration FROM Flights GROUP BY Status;

-- Group flights by Arrival_Airport and calculate minimum duration
SELECT Arrival_Airport, MIN(Flight_Duration) AS MinDuration FROM Flights GROUP BY Arrival_Airport;

-- Group flights by Departure_Airport and calculate average available seats
SELECT Departure_Airport, AVG(Seats_Available) AS AverageSeats FROM Flights GROUP BY Departure_Airport;

-- Group flights by Aircraft_Type and count distinct statuses
SELECT Aircraft_Type, COUNT(DISTINCT Status) AS DistinctStatusCount FROM Flights GROUP BY Aircraft_Type;


-- 6. HAVING Clause Queries

-- Select statuses with more than 5 flights
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status HAVING COUNT(*) > 5;

-- Select departure airports with more than 3 flights
SELECT Departure_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Departure_Airport HAVING COUNT(*) > 3;

-- Select aircraft types with an average flight duration greater than 120 minutes
SELECT Aircraft_Type, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Aircraft_Type HAVING AVG(Flight_Duration) > 120;

-- Select arrival airports with less than 2 flights
SELECT Arrival_Airport, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Arrival_Airport HAVING COUNT(*) < 2;

-- Select statuses with a total of available seats greater than 200
SELECT Status, SUM(Seats_Available) AS TotalSeats FROM Flights GROUP BY Status HAVING SUM(Seats_Available) > 200;

-- Select flight numbers with more than 1 occurrence
SELECT Flight_Number, COUNT(*) AS Occurrences FROM Flights GROUP BY Flight_Number HAVING COUNT(*) > 1;

-- Select departure airports with an average available seat count less than 50
SELECT Departure_Airport, AVG(Seats_Available) AS AverageSeats FROM Flights GROUP BY Departure_Airport HAVING AVG(Seats_Available) < 50;

-- Select aircraft types with a maximum flight duration of less than 150 minutes
SELECT Aircraft_Type, MAX(Flight_Duration) AS MaxDuration FROM Flights GROUP BY Aircraft_Type HAVING MAX(Flight_Duration) < 150;

-- Select statuses with a count of flights equal to 1
SELECT Status, COUNT(*) AS NumberOfFlights FROM Flights GROUP BY Status HAVING COUNT(*) = 1;

-- Select arrival airports with an average flight duration greater than 100 minutes
SELECT Arrival_Airport, AVG(Flight_Duration) AS AverageDuration FROM Flights GROUP BY Arrival_Airport HAVING AVG(Flight_Duration) > 100;


-- 7. LIMIT (or FETCH or TOP) Clause

/*

In MySQL, the LIMIT clause is used to restrict the number of rows returned by a query. Unlike some other SQL databases (e.g., SQL Server or PostgreSQL) that use TOP or FETCH, MySQL exclusively supports LIMIT. 

Syntax for LIMIT

SELECT column1, column2, ...
FROM table_name
LIMIT [offset,] row_count;

Key Components

1. row_count: Specifies the number of rows to return.
2. offset (optional): Specifies the starting point from which rows are returned. If omitted, the default is 0 (start from the first row).
3. LIMIT: Used to specify the maximum number of records to return.
4. Using LIMIT with a comma: An alternative way to specify both the offset and the limit in a single clause.
5. ROW_COUNT(): While not directly applicable, you can use SQL_CALC_FOUND_ROWS and FOUND_ROWS() to get the total count of rows.

*/

-- Select the first 5 flights
SELECT * FROM Flights LIMIT 5;

-- Select the first 10 flights ordered by Departure_Time
SELECT * FROM Flights ORDER BY Departure_Time LIMIT 10;

-- Select the last 3 flights based on Flight_ID
SELECT * FROM Flights ORDER BY Flight_ID DESC LIMIT 3;

-- Select the first 7 flights that are delayed
SELECT * FROM Flights WHERE Status = 'Delayed' LIMIT 7;

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


--  IN Clause

-- Select all flights arriving at Mumbai (BOM) or Delhi (DEL)
SELECT * 
FROM Flights 
WHERE Arrival_Airport IN ('Mumbai (BOM)', 'Delhi (DEL)');

-- Select all flights departing from Delhi (DEL), Chennai (MAA), or Bangalore (BLR)
SELECT * 
FROM Flights 
WHERE Departure_Airport IN ('Delhi (DEL)', 'Chennai (MAA)', 'Bangalore (BLR)');

-- Select flights with specific flight numbers AI101, AI102, and AI103
SELECT * 
FROM Flights 
WHERE Flight_Number IN ('AI101', 'AI102', 'AI103');

-- Select all flights that are either Delayed or Cancelled
SELECT * 
FROM Flights 
WHERE Status IN ('Delayed', 'Cancelled');

-- Select flights that use either Boeing 737 or Airbus A320 aircraft
SELECT * 
FROM Flights 
WHERE Aircraft_Type IN ('Boeing 737', 'Airbus A320');

-- Select flights that depart at specific times
SELECT * 
FROM Flights 
WHERE Departure_Time IN ('2023-10-01 06:00:00', '2023-10-01 09:00:00');

-- Select flights that have a duration of either 120 or 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration IN (120, 150);

-- Select flights that have either 30 or 50 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available IN (30, 50);

-- Select flights arriving at major cities: Mumbai, Delhi, Kolkata, or Chennai
SELECT * 
FROM Flights 
WHERE Arrival_Airport IN ('Mumbai (BOM)', 'Delhi (DEL)', 'Kolkata (CCU)', 'Chennai (MAA)');

-- Select flights that arrive at specific times
SELECT * 
FROM Flights 
WHERE Arrival_Time IN ('2023-10-01 08:00:00', '2023-10-01 10:30:00');


-- 13. BETWEEN Clause

 -- Select all flights with a duration between 120 and 150 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration BETWEEN 120 AND 150;

-- Select flights that depart between 8 AM and 12 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 08:00:00' AND '2023-10-01 12:00:00';

-- Select flights that arrive between 10 AM and 2 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time BETWEEN '2023-10-01 10:00:00' AND '2023-10-01 14:00:00';

-- Select flights that have between 20 and 60 available seats
SELECT * 
FROM Flights 
WHERE Seats_Available BETWEEN 20 AND 60;

-- Select flights with Flight_IDs between 5 and 10
SELECT * 
FROM Flights 
WHERE Flight_ID BETWEEN 5 AND 10;

-- Select flights with a duration less than 90 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration < 90;  -- Using < instead of BETWEEN for clarity

-- Select flights that depart between 12 PM and 6 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 12:00:00' AND '2023-10-01 18:00:00';

-- Select flights that arrive between 6 PM and 10 PM on October 1, 2023
SELECT * 
FROM Flights 
WHERE Arrival_Time BETWEEN '2023-10-01 18:00:00' AND '2023-10-01 22:00:00';

-- Select flights with a duration greater than 180 minutes
SELECT * 
FROM Flights 
WHERE Flight_Duration > 180;  -- Using > instead of BETWEEN for clarity

-- Select flights that were scheduled to depart between 1 PM and 3 PM
SELECT * 
FROM Flights 
WHERE Departure_Time BETWEEN '2023-10-01 13:00:00' AND '2023-10-01 15:00:00';


-- LIKE Clause

-- Select all flights where the flight number starts with 'AI'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE 'AI%';

-- Select all flights where the flight number ends with '101'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE '%101';

-- Select all flights where the flight number contains '10'
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE '%10%';

-- Select all flights departing from airports that have 'Delhi' in their name
SELECT * 
FROM Flights 
WHERE Departure_Airport LIKE '%Delhi%';

-- Select all flights arriving at airports that have 'BOM' in their code
SELECT * 
FROM Flights 
WHERE Arrival_Airport LIKE '%BOM%';

-- Select all flights that use aircraft types starting with 'Airbus'
SELECT * 
FROM Flights 
WHERE Aircraft_Type LIKE 'Airbus%';

-- Select all flights where the status contains the word 'Delayed'
SELECT * 
FROM Flights 
WHERE Status LIKE '%Delayed%';

-- Select all flights where the flight number matches the pattern 'AI1__'
-- (where '_' represents a single character)
SELECT * 
FROM Flights 
WHERE Flight_Number LIKE 'AI1__';

-- Select all flights departing from airports that have 'MAA' in their code
SELECT * 
FROM Flights 
WHERE Departure_Airport LIKE '%MAA%';

-- Select all flights arriving at airports that start with the letter 'K'
SELECT * 
FROM Flights 
WHERE Arrival_Airport LIKE 'K%';


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


-- 1. Select All Records from Each Table

-- Select all records from Flights table
SELECT * FROM Flights;

-- Select all records from Passengers table
SELECT * FROM Passengers;

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
