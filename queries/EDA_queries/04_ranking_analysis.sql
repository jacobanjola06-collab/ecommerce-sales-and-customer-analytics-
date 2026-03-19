-- Ranking Analysis

-- Identify top performing customer by total sales 
select customer_id,
      round(sum(total_amount)) as total_revenue,
      rank() over(order by round(sum(total_amount)) desc ) as customer_rank
from orders
group by Customer_ID
limit 10;

-- Identify best performing product by total_sales
select Product_Category, round(sum(total_amount)) as total_revenue
from orders
group by Product_Category
order by total_revenue desc
limit 5;

-- Worst performing products by total sales
select Product_Category, round(sum(total_amount)) as total_revenue
from orders
group by Product_Category
order by total_revenue asc
limit 3;

-- Best performing products by total orders
select Product_Category, count(order_id) as total_orders
from orders
group by Product_Category
order by total_orders desc
limit 5;


-- best performing city by sales
select city, round(sum(total_amount)) as total_revenue
from customers c 
left join  orders o 
on c.Customer_ID = o.Customer_ID
group by city
order by total_revenue desc
limit 10;

-- worst performing city by total sales
select city, round(sum(total_amount)) as total_revenue
from customers c 
left join  orders o 
on c.Customer_ID = o.Customer_ID
group by city
order by total_revenue asc
limit 5;

-- Best performing city by total orders
select city, count(order_id) as total_orders
from customers c 
left join  orders o 
on c.Customer_ID = o.Customer_ID
group by city
order by total_orders desc
limit 5;