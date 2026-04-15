--create a database for our data and analysis--
USE MASTER
GO
CREATE DATABASE RFM
GO
USE RFM
GO

--Create the tables for our data for all the 6 datasetes,data definition as well--
--My data is messy, so first cast everything to nvarchar then data manipulation after import--
TRUNCATE TABLE Online_Retail;
CREATE TABLE Online_Retail
( Invoice NVARCHAR (50),	
StockCode	NVARCHAR (50),
Description	NVARCHAR (50),
Quantity	NVARCHAR (50),
InvoiceDate	NVARCHAR (50),
Price	NVARCHAR (50),
CustomerID	NVARCHAR (50),
Country NVARCHAR (50)
)
;
BULK INSERT Online_Retail
FROM 'C:\Users\HP\Dropbox\My PC (DESKTOP-BT38IV3)\Desktop\donorschoosedata\online_retail_II.csv'
 WITH (
 FIRSTROW = 2,
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a',
    TABLOCK
)
