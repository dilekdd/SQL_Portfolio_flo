-- Calculate the transaction level cumulative total sales value by product
SELECT 
    interested_in_categories_12,
    customer_value_total_ever_online + customer_value_total_ever_offline AS total_sales,
    SUM(customer_value_total_ever_online + customer_value_total_ever_offline) 
        OVER (PARTITION BY interested_in_categories_12 ORDER BY (customer_value_total_ever_online + customer_value_total_ever_offline) ASC) AS cum_total
FROM flo
ORDER BY interested_in_categories_12, total_sales;