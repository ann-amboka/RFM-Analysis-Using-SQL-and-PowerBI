-- ============================================================
-- ONLINE RETAIL - DATA CLEANING & STANDARDIZATION
-- ============================================================

-- STEP 1: Fix bad Quantity values
-- ============================================================
UPDATE Online_Retail
SET Quantity = NULL
WHERE ISNUMERIC(Quantity) = 0
  AND Quantity IS NOT NULL;

-- STEP 2: Fix bad InvoiceDate values
-- ============================================================
UPDATE Online_Retail
SET InvoiceDate = NULL
WHERE TRY_CAST(InvoiceDate AS DATETIME) IS NULL;

-- STEP 3: Fix bad Price values
-- ============================================================
UPDATE Online_Retail
SET Price = NULL
WHERE TRY_CAST(Price AS FLOAT) IS NULL;

-- STEP 4: Trim whitespace from all text columns
-- ============================================================
UPDATE Online_Retail
SET 
    Invoice     = TRIM(Invoice),
    StockCode   = TRIM(StockCode),
    Description = TRIM(Description),
    Country     = TRIM(Country),
    CustomerID  = TRIM(CustomerID);

-- STEP 5: Alter all columns to correct data types
-- ============================================================
ALTER TABLE Online_Retail ALTER COLUMN Quantity    INT;
ALTER TABLE Online_Retail ALTER COLUMN Invoice     VARCHAR(50);
ALTER TABLE Online_Retail ALTER COLUMN InvoiceDate DATETIME;
ALTER TABLE Online_Retail ALTER COLUMN Price       FLOAT;
ALTER TABLE Online_Retail ALTER COLUMN CustomerID  VARCHAR(50);

-- STEP 6: Final cleaned SELECT with NULL handling
-- ============================================================
SELECT
    Invoice,
    ISNULL(StockCode,                        'N/A') AS StockCode,
    ISNULL(Description,                      'N/A') AS Description,
    Quantity,
    ISNULL(CONVERT(VARCHAR, InvoiceDate, 120),'N/A') AS InvoiceDate,
    ISNULL(CAST(Price AS VARCHAR),           '0'  ) AS Price,
    ISNULL(CustomerID,                       'N/A') AS CustomerID,
    ISNULL(Country,                          'N/A') AS Country
FROM Online_Retail;

