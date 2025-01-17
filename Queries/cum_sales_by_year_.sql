-- Calculate cumulative sales and cumulative Sales Percentage by year
WITH yearly_sales AS (
	SELECT
		EXTRACT(YEAR FROM last_order_date) AS year_,
		SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_sales
	FROM flo
	GROUP BY EXTRACT(YEAR FROM last_order_date)
),
ranked_sales AS (
	SELECT
		year_,
		total_sales,
		SUM(total_sales) OVER (ORDER BY year_) AS cumulative_sales,
		SUM(total_sales) OVER () AS overall_sales
	FROM yearly_sales
)
SELECT
	year_,
	total_sales,
	cumulative_sales,
	round((total_sales * 100.0 / overall_sales), 2) AS yearly_percenteage,
	round((cumulative_sales * 100.0 / overall_sales), 2) AS cumulative_percentage
FROM ranked_sales
ORDER BY year_;