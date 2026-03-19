-- Database Exploration

-- understand the structure of each database and inspect tables 
show tables;
describe orders;
describe customers;

-- understand the data
select * from customers;
select * from orders ;

-- check number of records in each table
select count(*) as total_order from orders;
select count(*) as total_customer from customers;

-- check for null values in key coluums
select 
   count(*) - count(Customer_ID)  as missing_customer_id,
   count(*) - count(product_category) as missing_product,
   count(*) - count(total_amount) as missing_total_amount
from orders;

-- check negative or abnormal value 
select*
from orders 
where Total_Amount < 0
or Unit_Price < 0
or Quantity < 0;

-- Understand dataset time coverage and overall duration
select min(str_to_date(date, '%m/%d/%y'))  as first_order_date,
       max(str_to_date(date, '%m/%d/%y'))  as last_order_date,
       datediff(max(str_to_date(date, '%m/%d/%y')) ,
       min(str_to_date(date, '%m/%d/%y'))) as total_days
from orders