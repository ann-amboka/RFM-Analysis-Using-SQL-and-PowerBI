
--===================================================================--
---------------------CUSTOMER SEGMENTATION----------------------------
SELECT
customer_id,
RFMScore,
CASE
        WHEN RFMScore >= 12 THEN 'Champions'
        WHEN RFMScore >= 9 THEN 'Loyal'
        WHEN RFMScore >= 6 THEN 'Potential'
        ELSE 'At Risk'
    END AS segment
FROM
(
SELECT
customer_id,
recency_score,
frequency_score,
monetary_score,
recency_score+frequency_score+monetary_score AS RFMScore
FROM
(
	SELECT
		customer_id,
		Recency,
		Frequency,
		Monetary,
		NTILE(5) OVER (ORDER BY Recency) AS recency_score,
		NTILE(5) OVER (ORDER BY Frequency) AS frequency_score,
		NTILE(5) OVER (ORDER BY Monetary) AS monetary_score
	FROM
(
	SELECT
	customer_id,
	DATEDIFF(day,MAX(transaction_date), GETDATE()) AS Recency,
	COUNT(order_id) AS Frequency,
	SUM(total_amount_usd) AS Monetary
	FROM Transactions
	WHERE order_status = 'Completed'
	GROUP  BY customer_id
)T
)T
)T
