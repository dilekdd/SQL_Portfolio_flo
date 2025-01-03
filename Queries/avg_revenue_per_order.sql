--Write the query that will return the average revenue per transaction.
SELECT 
    SUM(customer_value_total_ever_online + customer_value_total_ever_offline) / 
    NULLIF(SUM(order_num_total_ever_online + order_num_total_ever_offline), 0) AS avg_revenue_per_order
FROM flo;

--NULLIF is used here as a safeguard to handle cases where the total number of orders is 0, 
--avoiding a runtime error caused by division by zero.