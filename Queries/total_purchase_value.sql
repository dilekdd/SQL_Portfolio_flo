--Write the query that will bring up the total number of purchases and the value.
SELECT 
     SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_order,
	 SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_value
FROM flo;