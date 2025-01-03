-- Calculate the total monthly revenue across all customers.

SELECT 
    DATE_TRUNC('month', last_order_date) AS month,
    SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_revenue
FROM flo
WHERE last_order_date IS NOT NULL
GROUP BY month
ORDER BY month;
