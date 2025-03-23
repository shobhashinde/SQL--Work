-- 1 create database travelagent
CREATE DATABASE travelagency;

USE travelagency;

-- 2.drop database if exists
DROP DATABASE IF EXISTS travelagency;

/* ------------------------------------------------------------
                        Customers
--------------------------------------------------------------*/                    
-- 3.create table customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL,
    DateOfBirth DATE NOT NULL
);

-- 4. insert 10 records into customers table
INSERT INTO Customers (FirstName, LastName, Email, Phone, DateOfBirth) 
VALUES('shobha', 'shinde', 'shobha.shinde@example.com', '1234567890', '1990-05-15'),
('jasmin', 'Smith', 'jasmin.smith@example.com', '2345678901', '1985-08-22'),
('alia', 'dsouza', 'alia.dsouza@example.com', '3456789012', '1995-03-10'),
('david', 'daniel', 'david.daniel@example.com', '4567890123', '1980-11-30'),
('dev', 'methri', 'dev.methri@example.com', '5678901234', '1992-07-25'),
('anu', 'sharma', 'anu.sharma@example.com', '6789012345', '1988-09-12'),
('pooja', 'uke', 'pooja.uke@example.com', '7890123456', '1998-01-20'),
('pooja', 'varma', 'pooja.varma@example.com', '8901234567', '1993-04-05'),
('furkan', 'samnkey', 'furkan.samnkey@example.com', '9012345678', '1987-12-18'),
('lily', 'brown', 'lily.brown@example.com', '0123456789', '1991-06-28');


-- 5.delete records from customers table
TRUNCATE Customers;

-- 6. drop table
DROP TABLE Customers;

/* ------------------------------------------------------------
                        Bookings
--------------------------------------------------------------*/  
-- 7.create table Bookings
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    Destination VARCHAR(100) NOT NULL,
    BookingDate DATE NOT NULL,
    TravelDate DATE NOT NULL,
    TotalCost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- 6. insert 10 records into bookings table
INSERT INTO Bookings (CustomerID, Destination, BookingDate, TravelDate, TotalCost) VALUES
(1, 'Paris', '2023-10-01', '2023-12-15', 1200.50),
(2, 'Tokyo', '2023-09-25', '2024-01-10', 1500.75),
(3, 'New York', '2023-10-05', '2023-11-20', 900.00),
(4, 'London', '2023-09-30', '2023-12-01', 1100.25),
(5, 'Sydney', '2023-10-10', '2024-02-05', 1800.00),
(6, 'Dubai', '2023-10-15', '2023-12-25', 1300.50),
(7, 'Rome', '2023-10-20', '2024-01-15', 950.75),
(8, 'Berlin', '2023-10-25', '2024-03-01', 1000.00),
(9, 'Bangkok', '2023-11-01', '2024-04-10', 1400.25),
(10, 'Toronto', '2023-11-05', '2024-05-20', 1600.50);

-- 7.Retrieve records from table
SELECT * FROM  bookings;

/* ------------------------------------------------------------
                        Hotels
--------------------------------------------------------------*/  

-- 8.Create table Hotels
CREATE TABLE Hotels (
    HotelID INT PRIMARY KEY AUTO_INCREMENT,
    HotelName VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    ADDRESS TEXT,
    Rating DECIMAL(3, 2)
);

-- 9.Insert 10 records into the Hotels table
INSERT INTO Hotels (HotelName, City, Country, Address, Rating) VALUES
('Grand Hyatt', 'New York', 'USA', '123 Park Avenue', 4.5),
('The Ritz-Carlton', 'Paris', 'France', '15 Place Vendôme', 4.8),
('Marina Bay Sands', 'Singapore', 'Singapore', '10 Bayfront Avenue', 4.7),
('Burj Al Arab', 'Dubai', 'UAE', 'Jumeirah Street', 4.9),
('The Savoy', 'London', 'UK', 'Strand', 4.6),
('Taj Mahal Palace', 'Mumbai', 'India', 'Apollo Bunder', 4.7),
('Shangri-La Hotel', 'Tokyo', 'Japan', '1-8-1 Marunouchi', 4.6),
('Four Seasons', 'Sydney', 'Australia', '199 George Street', 4.8),
('Hotel del Coronado', 'San Diego', 'USA', '1500 Orange Avenue', 4.4),
('Fairmont Banff Springs', 'Banff', 'Canada', '405 Spray Avenue', 4.7);


/* ------------------------------------------------------------
		20 MISLENOUS QUEIES
--------------------------------------------------------------*/  
-- 10. Alter table to add a new column
ALTER TABLE Hotels ADD COLUMN POSTCODE VARCHAR(10);


-- 11. Drop a column from the table
ALTER TABLE Hotels DROP COLUMN POSTCODE;

-- 12. Rename a table NAME
ALTER TABLE Hotels RENAME TO Accommodations;

-- 13. Create an index on the City column
CREATE INDEX idx_city ON Accommodations(City);

-- 14. Update a record in the Accommodations table
UPDATE Accommodations SET Address = '456 Rue de Rivoli' WHERE HotelID = 1;

-- 15. Delete a record from the Accommodations table
DELETE FROM Accommodations WHERE HotelID = 1;

-- 16. Select all records from the Accommodations table
SELECT * FROM Accommodations;

-- 17. Select records with a specific condition
SELECT * FROM Accommodations WHERE City = 'Paris';

-- 18. Create user & grant insert select permission
CREATE USER 'empl_user'@'localhost' IDENTIFIED BY 'pwd123';
GRANT SELECT,INSERT ON Accommodations TO 'empl_user'@'localhost';

-- 19. Revoke SELECT permission on Accommodations table from a user
REVOKE SELECT ON Accommodations FROM 'username'@'localhost';


-- 20. Use AND operator to filter records
SELECT * FROM Bookings WHERE TotalCost > 1000 AND TravelDate > '2024-01-01';

-- 21. Use OR operator to filter records
SELECT * FROM Bookings WHERE Destination = 'Paris' OR Destination = 'London';

-- 22. Use IN operator to filter records
SELECT * FROM Bookings WHERE Destination IN ('Paris', 'Tokyo', 'New York');

-- 23. Use HAVING clause to filter groups
SELECT Destination, COUNT(*) AS NumberOfBookings 
FROM Bookings 
GROUP BY Destination 
HAVING COUNT(*) > 1;


-- 24.Find the total cost of all bookings
SELECT SUM(TotalCost) AS TotalCostOfAllBookings
FROM Bookings;

-- 25.Find the average rating of all hotels
SELECT AVG(Rating) AS AverageHotelRating
FROM Accommodations;

-- 26.Find the number of bookings per destination
SELECT Destination, COUNT(*) AS NumberOfBookings
FROM Bookings
GROUP BY Destination;

-- 27. Create a view to show customers with their booking details
CREATE VIEW CustomerBookings AS
SELECT c.FirstName, c.LastName, b.Destination, b.BookingDate, b.TravelDate, b.TotalCost
FROM Customers c
JOIN Bookings b ON c.CustomerID = b.CustomerID;

SELECT * FROM CustomerBookings;

-- 28 Create a view of customers table
CREATE VIEW CustomerView AS
SELECT FirstName, LastName,Email 
FROM Customers;

SELECT * FROM CustomerView;

-- 29 Create a view of bookings table
CREATE VIEW bookingsView AS
SELECT BookingID, CustomerID,Destination,BookingDate
FROM bookings;

SELECT * FROM bookingsView;

-- 29 Create a view of bookings table
CREATE VIEW AccommodationsView AS
SELECT HotelName, ADDRESS,Country,Rating
FROM Accommodations
where rating >3;

SELECT * FROM AccommodationsView;

-- 30.Drop the view
drop view if exists AccommodationsView;

-- 31.Create CTE for accomdation table
with AccommodationsView as (
select HotelName, City, ADDRESS
from accommodations
where rating >= 4)
select * from AccommodationsView;

-- 32.Create CTE for customers table
with customersView as (
select FirstName, LastName, Email
from customers
where DateOfBirth >= '1990-05-15')
select * from customersView;

-- 33.Create CTE for booking table
with bookingsView as (
select CustomerID, BookingID, Destination
from bookings
where TotalCost between 1200.50 and 1800.00)
select * from bookingsView;

-- 34.Create CTE for booking table
with customersView as (
select CustomerID, FirstName, LastName
from customers
where FirstName like '%in%')
select * from customersView;

-- 35.Create CTE for booking table
with bookingsView as (
select CustomerID, BookingID, Destination
from bookings
where bookingdate between '2023-10-25' and '2023-11-05')
select * from bookingsView;

-- 36.Create a stored procedure to retrieves all records from the Customers table
DELIMITER //
CREATE PROCEDURE GetAllCustomers()
BEGIN
    SELECT * FROM Customers;
END //
DELIMITER ;

-- Call the stored procedure to insert a new customer
CALL GetAllCustomers();

DELIMITER //
CREATE PROCEDURE GetAllaccommodations()
BEGIN
    SELECT * FROM accommodations;
END //
DELIMITER ;

-- Call the stored procedure to insert a new customer
CALL GetAllaccommodations();


DELIMITER //
CREATE PROCEDURE GetAllbookings()
BEGIN
    SELECT * FROM bookings;
END //
DELIMITER ;

-- Call the stored procedure to insert a new customer
CALL GetAllbookings();


-- 39.Create a trigger to log insert operations in the Customers table
CREATE TABLE CustomerLogs (
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    Action VARCHAR(50),
    ActionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER AfterCustomerInsert
AFTER INSERT ON Customers
FOR EACH ROW
BEGIN
    INSERT INTO CustomerLogs (CustomerID, Action)
    VALUES (NEW.CustomerID, 'INSERT');
END //
DELIMITER ;

-- Insert a new customer to trigger the above trigger
INSERT INTO Customers (FirstName, LastName, Email, Phone, DateOfBirth)
VALUES ('john', 'jha', 'john.jha@example.com', '1234567890', '1995-07-14');


-- 40. Create a trigger to prevent deletion of bookings with a TotalCost greater than 1000
DELIMITER //
CREATE TRIGGER PreventBookingDelete
BEFORE DELETE ON Bookings
FOR EACH ROW
BEGIN
    IF OLD.TotalCost > 1000 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete booking with TotalCost > 1000';
    END IF;
END //
DELIMITER ;

-- Attempt to delete a booking with TotalCost > 1000 (will trigger the above trigger)
DELETE FROM Bookings WHERE BookingID = 1;

-- 41. Create a trigger to automatically update the BookingDate when a booking is modified
DELIMITER //
CREATE TRIGGER UpdateBookingDate
BEFORE UPDATE ON Bookings
FOR EACH ROW
BEGIN
    SET NEW.BookingDate = CURRENT_DATE();
END //
DELIMITER ;

-- Update a booking to trigger the above trigger
UPDATE Bookings SET Destination = 'Amsterdam' WHERE BookingID = 3;

-- 42.Calculate the cumulative total cost of bookings for each customer
SELECT CustomerID, BookingID, Destination, TotalCost,SUM(TotalCost) OVER (PARTITION BY CustomerID ORDER BY BookingID) AS CumulativeTotalCost
FROM Bookings;

-- 43. Rank customers based on the total cost of their bookings
SELECT CustomerID, BookingID, Destination, TotalCost,RANK() OVER (ORDER BY TotalCost DESC) AS BookingRank
FROM Bookings;

-- 44. Calculate the moving average of the total cost for the last 3 bookings
SELECT BookingID, Destination, TotalCost,AVG(TotalCost) OVER (ORDER BY BookingID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS MovingAvgCost
FROM Bookings;

-- 45. Find the difference between each booking's total cost and the average total cost of all bookings
SELECT BookingID, Destination, TotalCost,TotalCost - AVG(TotalCost) OVER () AS CostDifferenceFromAvg
FROM Bookings;

-- 46.Assign a dense rank to hotels based on their rating
SELECT HotelID, HotelName, City, Rating,DENSE_RANK() OVER (ORDER BY Rating DESC) AS HotelRatingRank
FROM Accommodations;

-- 47. Inner Join: Retrieve customer details along with their booking details
SELECT c.CustomerID, c.FirstName, c.LastName, b.BookingID, b.Destination, b.TravelDate
FROM Customers c
INNER JOIN Bookings b ON c.CustomerID = b.CustomerID;

-- 48. Left Join: Retrieve all customers and their bookings (if any)
SELECT c.CustomerID, c.FirstName, c.LastName, b.BookingID, b.Destination
FROM Customers c
LEFT JOIN Bookings b ON c.CustomerID = b.CustomerID;

-- 49. Right Join: Retrieve all bookings and the corresponding customer details (if any)
SELECT b.BookingID, b.Destination, c.CustomerID, c.FirstName, c.LastName
FROM Bookings b
RIGHT JOIN Customers c ON b.CustomerID = c.CustomerID;

-- 50. Full Outer Join (Simulated using UNION): Retrieve all customers and all bookings, matching where possible
SELECT c.CustomerID, c.FirstName, c.LastName, b.BookingID, b.Destination
FROM Customers c
LEFT JOIN Bookings b ON c.CustomerID = b.CustomerID
UNION
SELECT c.CustomerID, c.FirstName, c.LastName, b.BookingID, b.Destination
FROM Customers c
RIGHT JOIN Bookings b ON c.CustomerID = b.CustomerID;

-- 51. Cross Join: Retrieve all possible combinations of customers and bookings
SELECT c.CustomerID, c.FirstName, c.LastName, b.BookingID, b.Destination
FROM Customers c
CROSS JOIN Bookings b;

-- 52. Find customers who have made bookings
SELECT FirstName, LastName
FROM Customers
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Bookings);

-- 53. Find the hotel with the lowest rating
SELECT HotelName, City, Country, Rating
FROM Accommodations
WHERE Rating = (SELECT MIN(Rating) FROM Accommodations);

-- 54. Find the destination with the highest total cost
SELECT Destination, TotalCost
FROM Bookings
WHERE TotalCost = (SELECT MAX(TotalCost) FROM Bookings);

-- 55.Find hotels with a rating higher than the average rating
SELECT HotelName, City, Country, Rating
FROM Accommodations
WHERE Rating > (SELECT AVG(Rating) FROM Accommodations);

-- 56. Find bookings where the total cost is above the average total cost
SELECT BookingID, CustomerID, Destination, TotalCost
FROM Bookings
WHERE TotalCost > (SELECT AVG(TotalCost) FROM Bookings);

