%%sql
with country_less as(
  select
  dt.country,
  count(distinct order_detail_id) as sales,
  row_number() over(partition by dt.country
                    order by count(distinct order_detail_id) asc) as rownum
  from fact_sales  fs
  join dim_territory dt on dt.territory_id = fs.territory_id
  group by 1
  order by sales
)

select
*
from country_less
where rownum = 1
