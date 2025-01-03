--Write the query that retrieves the total revenue broken down by store type
SELECT store_type,
    SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_value
FROM flo
GROUP BY store_type;