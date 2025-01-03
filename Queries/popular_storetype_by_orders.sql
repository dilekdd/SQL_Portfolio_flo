---- Write the query that returns the most preferred store_type information by total orders.

SELECT  
    store_type, 
	SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_order	
FROM flo
GROUP BY store_type
ORDER BY total_order DESC;

--by total_value
-- SELECT  
--     store_type, 
-- 	SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_value
-- FROM flo
-- GROUP BY store_type
-- ORDER BY total_value DESC;