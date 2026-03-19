-- Dimensions Exploration
-- Purpose:
    -- To explore the structure of dimension tables.
    
-- Retrieve a list of unique countries from which customers originate
select distinct city
from customers;

-- Retrieve a list of unique product categories
select distinct product_category
from orders;

-- Retrieve a list of unique payment methods
select distinct Payment_Method
from orders;

-- Retrieve a list of unique device types
select distinct Device_Type
from orders;

-- Retrieve a list of unique age groups
select distinct Age_group
from customers;


-- Magnitude Analysis
-- Purpose:
    -- For understanding data distribution across categories.

-- gender distribution
select  Gender,
       count(order_id) as total_orders,
       count(distinct c.Customer_ID) as Total_customer,
       round(sum(Total_Amount)) as Total_revenue
from customers c
left join orders o 
on c.customer_id = o.customer_id
group by Gender
;

-- Age group distribution 
select  Age_group,
      count(*) as total_orders,
      count(distinct c.Customer_ID) as Total_customer,
      round(sum(total_amount)) as Total_revenue
from customers c
left join orders o 
on c.customer_id = o.customer_id
group by Age_group
order by Total_revenue desc;


-- orders by city 
select  city, 
    count(order_id) as total_orders,
    count(distinct c.Customer_ID) as Total_customer,
    round(sum(total_amount)) as Total_revenue
from customers c
left join orders o 
on c.customer_id = o.customer_id
group by city;

-- orders by product category 
select  product_category,
        count(Order_ID) as total_order,
        count(distinct c.Customer_ID) as Total_customer,
        round(sum(total_amount)) as Total_revenue
from orders o
left join customers c
on c.customer_id = o.customer_id
group by product_category;

-- orders by payment method
select  Payment_Method, count(Order_ID) as total_order
from orders
group by Payment_Method;

-- orders by device type 
select  Device_Type, count(Order_ID) as total_order
from orders
group by Device_Type;

