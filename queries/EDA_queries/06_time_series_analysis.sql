-- Change Over Time Analysis

-- what is the MOM total sales, total_quantity, total_customer, total_orders, avg_order_value
select year, month,Month_number, 
	 round(sum(Total_Amount)) total_sales,count(distinct Customer_ID) total_customer,
      sum(quantity) total_quantity, count(distinct order_id) total_orders,
      round(sum(total_amount)/ count(distinct order_id),2) avg_order_value
from orders
group by year,month, Month_number
order by year, Month_number;

-- monthly revenue growth
with monthly_data as (
select year, month, Month_number,
	  round(sum(Total_Amount)) as total_revenue
from orders
group by year, month, month_number
order by year, month_number)
select year,month, Month_number, total_revenue,
       total_revenue - lag(total_revenue) over(order by year, Month_number) as growth_rate,
      round(( total_revenue - lag(total_revenue) over(order by year, Month_number))
      * 100 /  lag(total_revenue) over(order by year, Month_number),2) as growth_rate_percent
from monthly_data;