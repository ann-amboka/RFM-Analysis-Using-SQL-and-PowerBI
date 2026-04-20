--==============================================--
----- 'CALCULATE THE RECENCY, FREQUENCY, MONETARY AND RFM SCORE'-----
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
