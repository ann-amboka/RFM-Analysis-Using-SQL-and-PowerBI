--create a database for our data and analysis--
USE MASTER
GO
CREATE DATABASE RFMANALYSIS
GO
USE RFMANALYSIS
GO
--Create the tables for our data for all 6 datasets, data definition as well--
--My data is messy, so first cast everything to nvarchar, then data manipulation after import--

CREATE TABLE Categories
(categoryID INT,
categoryName NVARCHAR(100),
description NVARCHAR(100)
)
;
CREATE TABLE Customers
(customerID NVARCHAR(100),
companyName NVARCHAR(100),
contactName NVARCHAR(100),
contactTitle NVARCHAR(100),
city NVARCHAR(100),
country NVARCHAR(100)
)
;
CREATE TABLE Employees
(employeeID INT,
employeeName NVARCHAR(100),
title NVARCHAR(100),
city NVARCHAR(100),
country NVARCHAR(100),
reportsTo INT
)
;
CREATE TABLE OrderDetails
(orderID VARCHAR (50),
productID INT,
unitPrice DECIMAL (10,2),
quantity INT,
discount DECIMAL (10,2)
)
;
CREATE TABLE Orders
(orderID VARCHAR(50),
customerID NVARCHAR(50),
employeeID INT,
orderDate DATE,
requiredDate DATE,
shippedDate DATE,
shipperID INT,
freight DECIMAL(10,2)
)
;
CREATE TABLE Products
(productID INT,
productName NVARCHAR(100),
quantityPerUnit NVARCHAR(100),
unitPrice DECIMAL (10,2),
discontinued INT,
categoryID INT
)
;
CREATE TABLE Shippers
(shipperID INT,
companyName NVARCHAR(50)
)
;
BULK INSERT Categories
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\donorschoosedata\Northwind Traders\categories.csv'
WITH 
(FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
)
;
BULK INSERT Customers
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\donorschoosedata\Northwind Traders\customers.csv'
WITH 
(FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
)
;
BULK INSERT Employees
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\donorschoosedata\Northwind Traders\employees.csv'
WITH 
(FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
)
;
BULK INSERT OrderDetails
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\donorschoosedata\Northwind Traders\order_details.csv'
WITH 
(FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
)
;
BULK INSERT Orders
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\donorschoosedata\Northwind Traders\orders.csv'
WITH
(FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
)
;
BULK INSERT Products
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\donorschoosedata\Northwind Traders\products.csv'
WITH 
(FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
)
;
BULK INSERT Shippers
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\donorschoosedata\Northwind Traders\shippers.csv'
WITH 
(FIRSTROW=2,
FIELDTERMINATOR=',',
TABLOCK
)
