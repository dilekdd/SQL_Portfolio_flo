--Write the query that retrieves the ID of the most recent shopper. 
--(There are multiple IDs with transactions on the maximum date. Retrieve those as well.)
WITH latest_date AS (
    SELECT MAX(last_order_date) AS max_date
    FROM flo
)

SELECT 
    master_id,
    last_order_date
FROM 
    flo,
    latest_date
WHERE 
    flo.last_order_date = latest_date.max_date;
