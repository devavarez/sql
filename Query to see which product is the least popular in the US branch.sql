

%%sql
with less_pop as(
      select
      fs.territory_id,
      dp.product_name,
      count(distinct order_detail_id) as sales
      from fact_sales fs
      join dim_product dp on fs.product_id = dp.product_id
      group by 1,2
)

select
    lp.product_name,
    dt.country,
    sales
from less_pop lp
      join dim_territory dt on lp.territory_id = dt.territory_id
      where country = 'United States'
group by 1,2,3
      order by sales asc
limit 3
