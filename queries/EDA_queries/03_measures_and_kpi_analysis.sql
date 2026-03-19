-- Measures Exploration (Key Metrics)

-- Purpose:
    -- Analyze numerical behaviour and distribution 
    -- To identify overall trends or spot anomalies.
    
-- Unit price distribution
select min(Unit_Price) as min_price,
		max(Unit_Price) as max_price,
		round(avg(Unit_Price),2) as avg_price
from orders;

-- Discount distribution 
select min(Discount_Amount) as min_discount,
	   max(Discount_Amount) as max_discount,
	   avg(Discount_Amount) as average_discount
from orders;
     
-- customer rating distribution
select min(customer_rating) as min_customer_rating,
	   max(customer_rating) as max_customer_rating,
	 round(avg(customer_rating),2) as average_customer_rating
from orders;
    
    
-- quantity distribution
select min(quantity) as min_Quantity,
	  max(Quantity) as max_Quantity, 
	  sum(Quantity) as total_quantity
from orders;
    
-- Find the total number of products
select count( distinct Product_Category) as total_product
from orders;
    
-- Generate a report that shows all key metrics of the busniss
select "total revenue" as  measure_name , round(sum(Total_Amount))  measure_value from orders
union all
select "total orders" as  measure_name , count(distinct Order_ID)  measure_value from orders
union all
select "total customer" as  measure_name , count(distinct Customer_ID)  measure_value from customers
union all
select "average order value" as measure_name, round(sum(total_amount)/ count(distinct order_id),2)  measure_value from orders
union all
select "avg customer_rating" as measure_name, round(avg(Customer_Rating),2) measure_value from orders;

-- find the youngest, oldest and average customers age
select min(age) as youngest_customer,
       max(age) as  oldest_customers,
       round(avg(age)) as avg_age
from customers;
