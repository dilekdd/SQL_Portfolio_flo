--Write a query that will show how many unique customers made purchases.
select count(distinct master_id) as Distinct_customer_count from flo;