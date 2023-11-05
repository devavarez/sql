%%sql
with color_group as(
  select
  date_part('year', date(fs.order_date)) as year,
  dp.color,
  count(order_detail_id) as sales
  from fact_sales fs
  join dim_product dp on fs.product_id = dp.product_id
  group by 1,2
)
select
    year,
    color,
    sales
from (
    select
        year,
        color,
        sales,
        row_number() over (partition by year
                            order by sales desc) as rownum
    from color_group
) ranked_colors
where rownum = 1
order by year
