%%sql
with gender_sales as(
  select
  dc.gender,
  count(distinct case when gender in ('M', 'F') then dc.customer_id end) as buyers,
  count(distinct order_detail_id) as sales
  from fact_sales fs
  join dim_customer dc on dc.customer_id = fs.customer_id
  group by 1
)

select
gender,
buyers,
sales
from gender_sales
order by sales desc
