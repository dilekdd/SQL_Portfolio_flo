--Write the query that brings the ID of the person who shopped the most
SELECT 
    master_id, 
	SUM(order_num_total_ever_online + order_num_total_ever_offline) as total_order,
	SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_value
FROM flo
GROUP BY master_id
ORDER BY total_order DESC
LIMIT 1;