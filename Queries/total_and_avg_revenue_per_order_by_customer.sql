--Calculate the total revenue and the average revenue per transaction for each customer.

SELECT 
    master_id,
    SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_revenue,
    ROUND(
        SUM(customer_value_total_ever_online + customer_value_total_ever_offline) / 
        NULLIF(SUM(order_num_total_ever_online + order_num_total_ever_offline), 0), 
        2
    ) AS avg_revenue_per_order
FROM flo
GROUP BY master_id
ORDER BY total_revenue DESC;

