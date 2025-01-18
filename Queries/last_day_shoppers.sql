--Identify the customers that shopped on the last day in the dataset?
WITH max_date AS (
	SELECT 
		MAX(last_order_date) AS last_day
	FROM flo
)
SELECT
	master_id,
	last_order_date
FROM flo
WHERE last_order_date = (SELECT last_day FROM max_date)