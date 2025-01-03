--Write the query that retrieves the most popular category and the total amount of shopping done in that category,
--based on the last shopping channel (last_order_channel).
WITH category_totals AS (
    SELECT 
        last_order_channel,
        interested_in_categories_12,
        SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_value
    FROM flo
    GROUP BY last_order_channel, interested_in_categories_12
),
most_popular_categories AS (
    SELECT 
        last_order_channel,
        interested_in_categories_12,
        total_value,
        RANK() OVER (PARTITION BY last_order_channel ORDER BY total_value DESC) AS rank
    FROM category_totals
)
SELECT 
    last_order_channel,
    interested_in_categories_12 AS most_popular_category,
    total_value
FROM most_popular_categories
WHERE rank = 1
ORDER BY last_order_channel;
