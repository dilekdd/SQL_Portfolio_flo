--Segment customers into "high spenders" and "low spenders" based on their total revenue.
SELECT 
    master_id,
    SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_revenue,
    CASE 
        WHEN SUM(customer_value_total_ever_online + customer_value_total_ever_offline) > 1000 THEN 'High Spender'
        ELSE 'Low Spender'
    END AS spending_category
FROM flo
GROUP BY master_id
ORDER BY total_revenue DESC;
