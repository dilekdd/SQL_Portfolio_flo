-- Calculate the cumulative sales value by product categories (Product level cumulative total)
WITH total_value AS (
    SELECT
        interested_in_categories_12,
        SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_sales
    FROM flo
    GROUP BY interested_in_categories_12
)
SELECT 
    interested_in_categories_12,
    total_sales,
    SUM(total_sales) OVER (ORDER BY total_sales ASC ROWS UNBOUNDED PRECEDING) AS cum_total
FROM total_value
ORDER BY total_sales;
