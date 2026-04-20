--================================================================================
---Segment the Customers based on Revenue---
SELECT * FROM Transactions

SELECT
    segment,
    COUNT(customer_id)                          AS total_customers,
    ROUND(COUNT(customer_id) * 100.0 
          / SUM(COUNT(customer_id)) OVER(), 2)  AS pct_of_customers,
    ROUND(SUM(Monetary), 2)                     AS total_revenue,
    ROUND(SUM(Monetary) * 100.0 
          / SUM(SUM(Monetary)) OVER(), 2)       AS pct_of_revenue,
    ROUND(AVG(Monetary), 2)                     AS avg_monetary,
    ROUND(AVG(Frequency), 2)                    AS avg_frequency,
    ROUND(AVG(Recency), 0)                 AS avg_recency_days
FROM vw_RFM
GROUP BY segment
ORDER BY total_revenue DESC;

--=======================================================---
-----------Segment by Acquisition Channel-------------------

SELECT
    c.acquisition_channel,
    COUNT(r.customer_id)        AS total_customers,
    ROUND(SUM(r.Monetary), 2)   AS total_revenue,
    ROUND(AVG(r.Monetary), 2)   AS avg_monetary
FROM vw_RFM r
LEFT JOIN Customers c 
ON r.customer_id = c.customer_id
GROUP BY c.acquisition_channel
ORDER BY total_revenue DESC;

--Check the Channel that produces the Champions and at risk clients----
SELECT
    c.acquisition_channel,
	r.segment,
    COUNT(r.customer_id)        AS total_customers
FROM vw_RFM r
LEFT JOIN Customers c 
ON r.customer_id = c.customer_id
GROUP BY c.acquisition_channel,r.segment
ORDER BY r.segment DESC;

--======================================================================--
---------------Segment by Country & Geography---------------------------
SELECT
    c.country,
    r.segment,
    COUNT(r.customer_id) AS total_customers,
    ROUND(SUM(r.Monetary), 2)AS total_revenue,
    ROUND(AVG(r.Monetary), 2)AS avg_order_value
FROM vw_RFM r
LEFT JOIN Customers c ON r.customer_id = c.customer_id
GROUP BY c.country, r.segment
ORDER BY c.country, total_revenue DESC;

--=========================================================================---
--------------------Campaign Effectiveness------------------------------------
SELECT
    r.segment,
    ca.campaign_type,
    ca.campaign_objective,
    COUNT(DISTINCT t.customer_id)       AS customers_reached,
    COUNT(t.transaction_id)             AS total_transactions,
    ROUND(SUM(t.total_amount_usd), 2)   AS revenue_driven,
    ROUND(AVG(t.total_amount_usd), 2)   AS avg_transaction_value
FROM Transactions t
LEFT JOIN vw_RFM r  
ON t.customer_id = r.customer_id
LEFT JOIN Campaigns ca   
ON t.campaign_id = ca.campaign_id
WHERE t.order_status = 'Completed'
AND t.campaign_id != 'NO_CAMPAIGN'
GROUP BY r.segment, ca.campaign_type, ca.campaign_objective
ORDER BY  revenue_driven DESC;

----Performance of each Campaign we ran-----
SELECT
    ca.campaign_type,
    COUNT(DISTINCT t.customer_id)       AS customers_reached,
    COUNT(t.transaction_id)             AS total_transactions,
    ROUND(SUM(t.total_amount_usd), 2)   AS revenue_driven
FROM Transactions t
LEFT JOIN vw_RFM r  
ON t.customer_id = r.customer_id
LEFT JOIN Campaigns ca   
ON t.campaign_id = ca.campaign_id
WHERE t.order_status = 'Completed'
AND t.campaign_id != 'NO_CAMPAIGN'
GROUP BY ca.campaign_type
ORDER BY  revenue_driven DESC;

--Performance of Organic Customers that didnnt come from any campaigns
SELECT
    ca.campaign_type,
    COUNT(DISTINCT t.customer_id)       AS customers_reached,
    COUNT(t.transaction_id)             AS total_transactions,
    ROUND(SUM(t.total_amount_usd), 2)   AS revenue_driven
FROM Transactions t
LEFT JOIN vw_RFM r  
ON t.customer_id = r.customer_id
LEFT JOIN Campaigns ca   
ON t.campaign_id = ca.campaign_id
WHERE t.order_status = 'Completed'
AND t.campaign_id = 'NO_CAMPAIGN'
GROUP BY ca.campaign_type 
ORDER BY  revenue_driven DESC;

---Performance of campaign objectives---------
SELECT
    ca.campaign_objective,
    COUNT(DISTINCT t.customer_id)       AS customers_reached,
    COUNT(t.transaction_id)             AS total_transactions,
    ROUND(SUM(t.total_amount_usd), 2)   AS revenue_driven,
    ROUND(AVG(t.total_amount_usd), 2)   AS avg_transaction_value
FROM Transactions t
LEFT JOIN vw_RFM r  
ON t.customer_id = r.customer_id
LEFT JOIN Campaigns ca   
ON t.campaign_id = ca.campaign_id
WHERE t.order_status = 'Completed'
AND t.campaign_id != 'NO_CAMPAIGN'
GROUP BY  ca.campaign_objective
ORDER BY  revenue_driven DESC;

--=============================================================================
--------------------Product Category Preferences---------------------------------
SELECT
    p.category,
    COUNT(t.transaction_id)             AS total_orders,
    ROUND(SUM(t.total_amount_usd), 2)   AS total_revenue,
    ROUND(AVG(t.total_amount_usd), 2)   AS avg_order_value,
    ROUND(AVG(t.gross_margin_pct), 1)   AS avg_margin_pct
FROM Transactions t
LEFT JOIN vw_RFM  r  
ON t.customer_id = r.customer_id
LEFT JOIN Products   as p
ON t.product_id = p.product_id
WHERE t.order_status = 'Completed'
GROUP BY p.category
ORDER BY total_revenue DESC;

---Performance of product categories among segments----------
SELECT
	r.segment,
    p.category,
    COUNT(t.transaction_id)             AS total_orders,
    ROUND(SUM(t.total_amount_usd), 2)   AS total_revenue
FROM Transactions t
LEFT JOIN vw_RFM  r  
ON t.customer_id = r.customer_id
LEFT JOIN Products   as p
ON t.product_id = p.product_id
WHERE t.order_status = 'Completed'
GROUP BY p.category,r.segment
ORDER BY total_revenue DESC;

--=========================================================================
----------------Payment Method & Channel Behaviour by Segment--------------
SELECT
    t.payment_method,
    COUNT(t.transaction_id)             AS total_transactions,
    ROUND(SUM(t.total_amount_usd), 2)   AS total_revenue,
    ROUND(AVG(t.total_amount_usd), 2)   AS avg_order_value
FROM Transactions t
LEFT JOIN vw_RFM  r 
ON t.customer_id = r.customer_id
WHERE t.order_status = 'Completed'
GROUP BY  t.payment_method
ORDER BY total_revenue DESC;

--Analyse the purchase channel-------
SELECT
    t.purchase_channel,
    COUNT(t.transaction_id)             AS total_transactions,
    ROUND(SUM(t.total_amount_usd), 2)   AS total_revenue,
    ROUND(AVG(t.total_amount_usd), 2)   AS avg_order_value
FROM Transactions t
LEFT JOIN vw_RFM  r 
ON t.customer_id = r.customer_id
WHERE t.order_status = 'Completed'
GROUP BY  t.purchase_channel
ORDER BY total_revenue DESC;
