-- customer behaviour and operational performance
-- purpose
-- This section investigate behavioural and operational drivers
-- that influences customer retention, satisfaction and return rates.

create view returning_vs_unreturning as 
with  customer_retention as 
	  ( select c.Customer_ID,count(distinct Order_ID) total_order
from customers c 
left join orders o 
on c.Customer_ID = o.Customer_ID
group by c.Customer_ID),
 customer_retention_summary  as  (select customer_id, 
		case
            when  total_order > 1 then "Returning customer"
            else "Non Returning customer"
            END as customer_status
from customer_retention)
select customer_id,customer_status,count(*)as customers, round(count(*) *100/ sum(count(*))over(),2)
as customer_percentage 
from customer_retention_summary
group by customer_id,customer_status;

select customer_status, sum(customer_percentage) as  percentage_customer
from returning_vs_unreturning
group by customer_status;


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

-- session_duration vs customer rating
select  case
          when Session_Duration_Minutes <= 11 then "short"
          when Session_Duration_Minutes between 12 and 19 then "medium"
          else "long"
end as session_length,
round(avg(customer_rating),2) as avg_rating
from orders
group by session_length
order by avg_rating desc;

select count(distinct Customer_ID)
from customer_discounts;


-- find dicount impact on customer revenue
create view customer_discounts as
with customer_discount_flag as (
select customer_id, max( case
        when discount_amount > 0 then 1
        else 0
end) as received_discount
from orders
group by customer_id)
select o.Customer_ID, case
      when cdf.received_discount = 1 then "Received Discount"
      else "No Discount"
end as customer_group,
count(distinct o.Customer_ID) customers,
round(sum(total_amount)/ count(distinct o.customer_id),2) revenue_per_customer
from orders o
left join  customer_discount_flag cdf
on o.Customer_ID = cdf.Customer_ID
group by o.Customer_ID, customer_group;

select customer_group, sum(customers) as total_customer, 
       round(avg(revenue_per_customer),2) as avg_revenue_per_customer
from customer_discounts
group by customer_group;