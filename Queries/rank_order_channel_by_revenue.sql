--Rank order_channel by its total revenue contribution.

SELECT 
    order_channel,
    SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_revenue,
    RANK() OVER (ORDER BY SUM(customer_value_total_ever_online + customer_value_total_ever_offline) DESC) AS revenue_rank
FROM flo
GROUP BY order_channel
ORDER BY revenue_rank;
