-- Calculate the cumulative sales by product and year
WITH total_value AS (
    SELECT
        EXTRACT(YEAR FROM last_order_date) AS year_, 
        interested_in_categories_12,
        SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_sales
    FROM flo
    GROUP BY EXTRACT(YEAR FROM last_order_date), interested_in_categories_12
)

SELECT 
    year_,
    interested_in_categories_12,
    SUM(total_sales) OVER (PARTITION BY interested_in_categories_12 ORDER BY year_ ASC ROWS UNBOUNDED PRECEDING) AS cum_total
FROM total_value
ORDER BY interested_in_categories_12, year_;