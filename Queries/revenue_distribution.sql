--Find the percentage contribution of online and offline revenue to total revenue.
SELECT 
    SUM(customer_value_total_ever_online) AS online_revenue,
    SUM(customer_value_total_ever_offline) AS offline_revenue,
    ROUND(
        SUM(customer_value_total_ever_online) * 100.0 / 
        NULLIF(SUM(customer_value_total_ever_online + customer_value_total_ever_offline), 0), 2
    ) AS online_revenue_percentage,
    ROUND(
        SUM(customer_value_total_ever_offline) * 100.0 / 
        NULLIF(SUM(customer_value_total_ever_online + customer_value_total_ever_offline), 0), 2
    ) AS offline_revenue_percentage
FROM flo;
