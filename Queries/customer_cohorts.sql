--Group customers by their first_order_date year and calculate total revenue for each cohort.
SELECT 
    EXTRACT(YEAR FROM first_order_date) AS cohort_year,
    COUNT(master_id) AS customer_count,
    SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_revenue
FROM flo
GROUP BY cohort_year
ORDER BY cohort_year;