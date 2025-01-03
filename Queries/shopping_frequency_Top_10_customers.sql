--Write the query that retrieves the average number of days between transactions (shopping frequency) 
--for the top 100 people with the highest total revenue (based on revenue).

WITH top_customers AS (
    SELECT 
        master_id, 
        SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_value,
        SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_order,
        last_order_date,
        first_order_date
    FROM flo
    GROUP BY master_id
    ORDER BY total_value DESC
    LIMIT 100
)
SELECT 
    master_id,
    ROUND(EXTRACT(EPOCH FROM AGE(last_order_date, first_order_date)) / 86400 / 
          NULLIF(total_order, 0), 2) AS avg_shopping_frequency
FROM top_customers
ORDER BY avg_shopping_frequency;

