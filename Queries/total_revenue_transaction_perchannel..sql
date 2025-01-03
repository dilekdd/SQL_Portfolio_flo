--Write the query that will return the total revenue and the total number of transactions
--made through the last shopping channel (last_order_channel)
SELECT
    last_order_channel,
    SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_order,
	SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_value
FROM flo
GROUP BY last_order_channel;