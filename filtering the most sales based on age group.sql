%%sql
with grouping_age as(
          select
          customer_id,
          customer_name,
          birthdate,
          gender,
          case
          when age <= 20 then  'Group <=20'
          when age between 21 and 40 then 'Group 21 - 40'
          when age between 41 and 60 then 'Group 41 - 60'
          else'Group >60'
          end as age_group
          from dim_customer

)

select
    ga.age_group,
    ga.gender,
    count(distinct fs.order_detail_id) as sales
from grouping_age ga
join fact_sales fs on fs.customer_id = ga.customer_id
group by 1, 2
order by sales desc
limit 1
