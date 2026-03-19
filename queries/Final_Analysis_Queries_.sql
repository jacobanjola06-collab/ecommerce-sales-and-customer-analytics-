-- kpi
select "total revenue" as  measure_name , round(sum(Total_Amount))  measure_value from orders
union all
select "total orders" as  measure_name , count(distinct Order_ID)  measure_value from orders
union all
select "total customer" as  measure_name , count(distinct Customer_ID)  measure_value from customers
union all
select "average order value" as measure_name, round(sum(total_amount)/ count(distinct order_id),2)  measure_value from orders
union all
select "avg customer_rating" as measure_name, round(avg(Customer_Rating),2) measure_value from orders;

-- monthly revenue growth
with monthly_data as (
select month, Month_number,
	  round(sum(Total_Amount)) as total_revenue
from orders
group by month, month_number
order by month_number)
select month, Month_number, total_revenue,
       total_revenue - lag(total_revenue) over(order by Month_number) as growth_rate,
      round(( total_revenue - lag(total_revenue) over(order by Month_number))
      * 100 /  lag(total_revenue) over(order by Month_number),2) as growth_rate_percent
from monthly_data;

-- best performing city by sales
select city, round(sum(total_amount)) as total_revenue
from customers c 
left join  orders o 
on c.Customer_ID = o.Customer_ID
group by city
order by total_revenue desc
limit 10;

-- Identify best performing product category by total_sales
select Product_Category, round(sum(total_amount)) as total_revenue
from orders
group by Product_Category
order by total_revenue desc
limit 5;


-- find customer loyalty status 
with  customer_retention as 
	  ( select c.Customer_ID,count(distinct Order_ID) total_order
from customers c 
left join orders o 
on c.Customer_ID = o.Customer_ID
group by c.Customer_ID),
 customer_retention_summary  as  (select 
		case
            when  total_order > 1 then "Returning customer"
            else "Non Returning customer"
            END as customer_status
from customer_retention)
select customer_status,count(*)as customers, round(count(*) *100/ sum(count(*))over(),2)
as customer_percentage 
from customer_retention_summary
group by customer_status;


-- Discount vs non_discount
with customer_discount_flag as (
select customer_id, max( case
        when discount_amount > 0 then 1
        else 0
end) as received_discount
from orders
group by customer_id)
select case
      when cdf.received_discount = 1 then "Received Discount"
      else "No Discount"
end as customer_group,
count(distinct o.Customer_ID) customers,
round(sum(total_amount)/ count(distinct o.customer_id),2) revenue_per_customer
from orders o
left join  customer_discount_flag cdf
on o.Customer_ID = cdf.Customer_ID
group by customer_group;

-- delivary speed vs satisfaction
select case
        when Delivery_Time_Days  <=5 then "fast (<=5 day)"
        when Delivery_Time_Days  <=10 then "medium (6-10 day)"
        else "slow (11+ days)"
end as delivary_speed,
count(distinct order_id) total_orders,
round(avg(customer_rating), 2) avg_rating
from orders
group by delivary_speed;