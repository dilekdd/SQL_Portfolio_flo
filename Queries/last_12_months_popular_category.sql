-- Write the query that brought up the most popular category in the last 12 months.

WITH max_date_cte AS (
    SELECT MAX(last_order_date) + INTERVAL '2 days' AS analysis_date
    FROM flo)

SELECT 
    interested_in_categories_12,
	SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_order	
FROM flo, max_date_cte
WHERE last_order_date >= analysis_date - INTERVAL '12 months'
GROUP BY interested_in_categories_12
ORDER BY total_order desc;
