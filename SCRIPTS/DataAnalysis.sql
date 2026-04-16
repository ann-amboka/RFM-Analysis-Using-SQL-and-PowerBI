--Create a Fact Table for easy analysis--------------------------------------------------
CREATE VIEW vw_FactSales AS
SELECT
O.customerID,
O.orderID,
OD.productID,
P.categoryID,
P.productName,
O.orderDate,
O.shippedDate,
OD.quantity,
OD.unitPrice,
OD.discount,
S.companyName,
CS.country
FROM Orders AS O
LEFT JOIN Shippers AS S
ON O.shipperID = S.shipperID
LEFT JOIN Customers AS CS
ON O.customerID=CS.customerID
LEFT JOIN OrderDetails AS OD
ON OD.orderID = O.orderID
LEFT JOIN Products AS P
ON P.productID = OD.productID
;
--=====================================================================================--
--{DATA ANALYSIS}-- Calculate the Recency, Frequency and Monetary & RFM SCORE------------------------
CREATE VIEW vw_rfmscore AS
SELECT
customerID,
recency_score,
frequency_score,
monetary_score,
recency_score + frequency_score + monetary_score AS rfm_score
FROM
(
SELECT
    customerID,
    Recency,
    Frequency,
    Monetary,
    NTILE(5) OVER (ORDER BY Recency ASC) AS recency_score,   -- lower recency = better
    NTILE(5) OVER (ORDER BY Frequency DESC) AS frequency_score, -- higher frequency = better
    NTILE(5) OVER (ORDER BY Monetary DESC) AS monetary_score -- higher monetary = better
FROM
(
SELECT
customerID,
DATEDIFF(day,MAX(orderDate), GETDATE()) AS Recency,
COUNT(orderID) AS Frequency,
SUM(quantity * (unitPrice- discount)) AS Monetary
FROM vw_FactSales
GROUP BY customerID
)T
)T
;
--Segment our customers based on the RFM SCORES-------
SELECT 
COUNT('Champions') AS ChampCount,
COUNT('Loyal') AS LoyalCount,
COUNT('Potential') AS PotCount,
COUNT('At Risk') AS RiskCount
FROM
(
SELECT
    customerID,
    rfm_score,
    CASE
        WHEN rfm_score >= 12 THEN 'Champions'
        WHEN rfm_score >= 9 THEN 'Loyal'
        WHEN rfm_score >= 5 THEN 'Potential'
        ELSE 'At Risk'
    END AS segment
FROM vw_rfmscore
)T
