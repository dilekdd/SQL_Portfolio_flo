--Write the query that will calculate the average revenue per purchase in the last shopping channel breakdown.

SELECT last_order_channel, 
       ROUND(SUM(customer_value_total_ever_offline + customer_value_total_ever_online),2) total_revenue,
	   SUM(order_num_total_ever_offline + order_num_total_ever_online) total_order,
       ROUND(SUM(customer_value_total_ever_offline + customer_value_total_ever_online) / SUM(order_num_total_ever_offline + order_num_total_ever_online),2) AS productivity
FROM FLO
GROUP BY last_order_channel;