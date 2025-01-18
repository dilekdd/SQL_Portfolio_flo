-- Calculate a rolling 3-month sales total for each product
WITH monthly_sales AS (
    SELECT 
        interested_in_categories_12, 
        DATE_TRUNC('month', last_order_date) AS year_month,
        SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_sales
    FROM flo
    GROUP BY interested_in_categories_12, DATE_TRUNC('month', last_order_date)
)
SELECT 
    interested_in_categories_12, 
    year_month,
    total_sales,
    SUM(total_sales) OVER (
        PARTITION BY interested_in_categories_12 
        ORDER BY year_month 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_3_month_sales
FROM monthly_sales
ORDER BY interested_in_categories_12, year_month;

