--Identify customers who haven’t made a transaction in the last 3 months.
--Analysis date is 10 days after the max date of last_order_date
WITH max_date_cte AS (
    SELECT MAX(last_order_date) + INTERVAL '10 days' AS analysis_date
    FROM flo
)
SELECT 
    master_id,
    last_order_date,
    AGE((SELECT analysis_date FROM max_date_cte), last_order_date) AS time_since_last_order
FROM flo, max_date_cte
WHERE last_order_date < (SELECT analysis_date FROM max_date_cte) - INTERVAL '3 months'
ORDER BY time_since_last_order DESC;
