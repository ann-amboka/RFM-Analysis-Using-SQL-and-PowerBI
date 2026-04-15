SELECT
Invoice, 
ISNULL(StockCode, 'N/A') AS StockCode,
ISNULL(Description, 'N/A') AS Description,
TRY_CAST(Quantity AS INT) AS Quantity,
ISNULL(InvoiceDate,'N/A') AS InvoiceDate,
ISNULL(Price, '0') AS Price,
ISnULL(CustomerID,'N/A') AS CustomerID,
ISNULL(Country, 'N/A') AS Country
FROM Online_Retail
;
--Now alter all the columns to the correct data type--
ALTER TABLE Online_Retail
ALTER COLUMN Invoice VARCHAR(50);

ALTER TABLE Online_Retail
ALTER COLUMN Quantity INT


ALTER TABLE Online_Retail
ALTER COLUMN InvoiceDate DATE;

ALTER TABLE Online_Retail
ALTER COLUMN Price FLOAT;

ALTER TABLE Online_Retail
ALTER COLUMN CustomerID VARCHAR (50);
