--Identify customers who have the longest gaps between their first and last orders.
SELECT 
    master_id,
    (last_order_date - first_order_date) AS days_between_orders
FROM flo
WHERE last_order_date IS NOT NULL AND first_order_date IS NOT NULL
ORDER BY days_between_orders DESC
LIMIT 10;
