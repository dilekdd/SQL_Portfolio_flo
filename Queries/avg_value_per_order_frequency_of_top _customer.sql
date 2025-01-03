--Write the query that retrieves the average revenue per transaction and the average shopping frequency 
--(average number of days between transactions) for the person who shops the most, (based on averages).

SELECT 
    master_id, 
    ROUND(SUM(customer_value_total_ever_online + customer_value_total_ever_offline) / 
          NULLIF(SUM(order_num_total_ever_online + order_num_total_ever_offline), 0), 2) AS avg_value_per_order,
    ROUND(EXTRACT(EPOCH FROM AGE(last_order_date, first_order_date)) / 86400 / 
          NULLIF(SUM(order_num_total_ever_online + order_num_total_ever_offline), 0), 2) AS avg_order_frequency
FROM flo
GROUP BY master_id
ORDER BY avg_value_per_order DESC
LIMIT 1;