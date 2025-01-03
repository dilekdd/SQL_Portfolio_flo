--Find the day of the week when the most transactions occur.

SELECT 
    TO_CHAR(last_order_date, 'Day') AS day_of_week,
    COUNT(*) AS transaction_count
FROM flo
WHERE last_order_date IS NOT NULL
GROUP BY day_of_week
ORDER BY transaction_count DESC;
