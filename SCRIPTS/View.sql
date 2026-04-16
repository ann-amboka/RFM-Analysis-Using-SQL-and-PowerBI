-- ============================================================
-- CREATE CLEAN VIEW
-- ============================================================

CREATE VIEW vw_Online_Retail_Clean AS
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
