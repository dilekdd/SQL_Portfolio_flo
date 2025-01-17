-- Calculate cumulative sales and cumulative Sales Percentage by year
with yearly_sales as (
	select
		extract(YEAR from last_order_date) as year_,
		sum(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_sales
	from flo
	group by extract(YEAR from last_order_date)
),
ranked_sales as (
	select
		year_,
		total_sales,
		sum(total_sales) over (order by year_) as cumulative_sales,
		sum(total_sales) over () as overall_sales
	from yearly_sales
)
select
	year_,
	total_sales,
	cumulative_sales,
	(total_sales * 100.0 / overall_sales) as yearly_percenteage,
	(cumulative_sales * 100.0 / overall_sales) as cumulative_percentage
from ranked_sales
order by year_;