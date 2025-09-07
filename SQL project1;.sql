Create Database SQL_project_1;
Use SQL_project_1;

Create Table retail_sales
(
   transactions_id int Primary Key,
    sale_date Date,
    sale_time Time,	
	customer_id int,	
    gender Varchar(15),
    age int Not Null,
    category Varchar(20),	
    quantiy int,
    price_per_unit Float,
    cogs Float,	
    total_sale Float
);

Select *
  From retail_sales
Where transactions_id is Null ;

Select *
  From retail_sales
Where price_per_unit is Null;

Select  *
  From retail_sales
Where quantiy is Null;

Select  *
  From retail_sales
Where total_sale is Null;

Select  *
   From retail_sales
Where 
   transactions_id is Null
or
   sale_date is Null
or
   sale_time is Null
or	
   customer_id	is Null
or
   gender	is Null
or
   age	is Null
or
  category is Null
or
  quantiy is Null
or
  price_per_unit is Null
or
  cogs is Null
or
  total_sale is Null;
  
Select count(*)
as total_sale 
From  retail_sales;

Select count(*)
as transactions_id
From  retail_sales;

Select count(customer_id)
as transactions_id
From  retail_sales;

-- Data Analysis & Business Key Problems & Answers
-- My Analysis & Findings

#Q1 Write a SQL query to retrieve all columns for sales made on '2022-11-05?
Select * 
From retail_sales
Where sale_date= '2022-11-05';  

Select 
    category,
	sum(quantiy)
From retail_sales
Where category='Clothing'
Group by 1;

#Q2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022?
Select *
From retail_sales
Where 
   category='Clothing'
   and
   sale_date Between'2022-11-01' and '2022-11-30';
   
Select *
From retail_sales
Where 
   category='Clothing'
   and
   sale_date Between'2022-11-01' and '2022-11-30'
   AND 
   quantiy<=4;
   
Select *
From retail_sales
Where 
   category='Clothing'
   and
   sale_date Between'2022-11-01' and'2022-11-30'
   and
   quantiy>=4;
   
#Q3	Write a SQL query to calculate the total sales (total_sale) for each category?
SELECT
   category,
   sum(total_sale) as net_sale
From  retail_sales
Group by 1;

SELECT
   category,
   sum(total_sale) as net_sale,
   count(*) as total_order
From  retail_sales
Group by 1;

#Q4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category?
Select 
  age
From  retail_sales;

Select *
From  retail_sales
Where  category='Beauty';

Select 
avg(age) as avg_age
From  retail_sales
Where  category='Beauty';

Select 
ROUND(avg(age),2) as avg_age
From  retail_sales
Where  category='Beauty';

#Q5 Write a SQL query to find all transactions where the total_sale is greater than 1000?
s
Select *
From  retail_sales
Where total_sale >1000;

#Q6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category?
SELECT
   category,
   gender,
   count(*) as total_trans
From  retail_sales
Group by
   category,
   gender
Order by 1;

#Q7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year?
Select 
    Extract(Year from sale_date)as Year,
	Extract(Month from sale_date)as Month,
    Sum(total_sale)
From retail_sales
Group by 1,2;
Select 
    Extract(Year from sale_date)as Year,
	Extract(Month from sale_date)as Month,
    avg(total_sale) as avg_sale
From retail_sales
Group by 1,2
Order by 1,2;
Select 
    Extract(Year from sale_date)as Year,
	Extract(Month from sale_date)as Month,
    avg(total_sale) as avg_sale
From retail_sales
Group by 1,2
Order by 1,3 desc;
SELECT 
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(total_sale)
FROM
    retail_sales
GROUP BY 1,2
Order by 1,2;
SELECT 
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(total_sale)
FROM
    retail_sales
GROUP BY 1,2
Order by 1,2,3 desc;
SELECT 
    EXTRACT(YEAR FROM sale_date) AS year,
    EXTRACT(MONTH FROM sale_date) AS month,
    SUM(total_sale)
FROM
    retail_sales
GROUP BY 1,2
Order by 1,3 desc;

#Q8 Write a SQL query to find the top 5 customers based on the highest total sales ?
Select 
  customer_id,
  sum(total_sale) as total_sales
From retail_sales
GROUP BY 1
Order by 2 desc;
Select 
  customer_id,
  sum(total_sale) as total_sales
From retail_sales
GROUP BY 1
Order by 2 desc
Limit 5;

#Q9 Write a SQL query to find the number of unique customers who purchased items from each category?
Select 
  category,
  customer_id
From retail_sales
GROUP BY category;
Select 
  category,
  count(customer_id)
from retail_sales
GROUP BY category;
Select 
  category,
  count(customer_id) as unique_customer
From retail_sales
GROUP BY category;

#Q10  Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
Select *,
  Case
     When extract(hour from sale_time) < 12 Then'Morning'
     When extract(hour from sale_time) Between 12 and 17 Then 'Afternoon'
     else 'Eavening'
  end as shift   
 From retail_sales;
Select extract(hour from current_time)

with hourly_sales
as
(
select *,
  case
     when extract(hour from sale_time) < 12 then'Morning'
     when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
     else 'Eavening'
  end as shift   
 from retail_sales)
select * from hourly_sales ;

with hourly_sales
as
(
select *,
  case
     when extract(hour from sale_time) < 12 then'Morning'
     when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
     else 'Eavening'
  end as shift   
 from retail_sales)
select 
  count(transactions_id)
from hourly_sales
group by shift ;

with hourly_sales
as
(
select *,
  case
     when extract(hour from sale_time) < 12 then'Morning'
     when extract(hour from sale_time) between 12 and 17 then 'Afternoon'
     else 'Eavening'
  end as shift   
 from retail_sales)
select 
  shift,
  count(*) as total_orders
from hourly_sales
group by shift ;
select * from retail_sales;
#END OF PROJECT!!!