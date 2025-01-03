--Write a query to retrieve the number of transactions broken down by year 
--(use the year of the customer's first order date (first_order_date) as the basis).

SELECT
    EXTRACT(YEAR FROM "first_order_date") AS year_extracted,
	SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_order
FROM flo
GROUP BY EXTRACT(YEAR FROM "first_order_date")
ORDER BY total_order DESC;

--OR

SELECT
    EXTRACT(YEAR FROM "first_order_date") AS year_extracted,
	SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_order
FROM flo
GROUP BY EXTRACT(YEAR FROM "first_order_date")
ORDER BY year_extracted ASC;