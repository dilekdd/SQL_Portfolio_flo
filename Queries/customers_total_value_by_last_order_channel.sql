--Write the query that retrieves the customer who made the most purchases,
--broken down by the last shopping channel (last_order_channel)


WITH ranked_orders AS (
    SELECT 
        last_order_channel,
        master_id,
        SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_value,
        ROW_NUMBER() OVER (PARTITION BY last_order_channel ORDER BY SUM(customer_value_total_ever_online + customer_value_total_ever_offline) DESC) AS rn
    FROM flo
    GROUP BY last_order_channel, master_id
)
SELECT 
    last_order_channel,
    master_id,
    total_value
FROM ranked_orders
WHERE rn = 1
ORDER BY total_value DESC;