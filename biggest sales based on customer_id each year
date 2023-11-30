%%sql
with cust_list as (
              select
              date_part('year', date(fs.order_date)) as year,
              dc.customer_id,
              dg.city,
              dc.gender,
              dt.country,
              count(distinct order_detail_id) as sales
              from fact_sales fs
              join dim_customer dc on dc.customer_id = fs.customer_id
              join dim_territory dt on dt.territory_id = fs.territory_id
              join dim_geography dg on dg.geography_id = dc.geography_id
              group by 1,2,3,4,5
)

select
      year,
      customer_id,
      gender,
      city,
      country,
      sales
from(
            select
            year,
            customer_id,
            gender,
            city,
            country,
            sales,
            row_number() over(partition by year
                              order by sales desc ) as rownum
            from cust_list
) as ranked_list
where rownum = 1
          order by sales

