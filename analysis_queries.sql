--DATA ANALYSIS & FINDINGS---

--how many sales we have?
select count(*) from retail_sales;
-- how many customers we have?
select count(DISTINCT customer_id) from retail_sales

---how many catgeories we have and what are they ?
select count(DISTINCT category) from retail_sales
select distinct category from retail_sales


--Business key problems

--1. Write a SQL query to retrieve all columns for sales made on '2022-11-05:
select * from retail_sales where sale_date='2022-11-05'


--2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
select * from retail_sales 
where category='Clothing' 
and quantity>=4 and 
sale_date between '2022-11-01' and '2022-11-30'

--3.Write a SQL query to calculate the total sales (total_sale) for each category.:
select category,sum(total_sale) as total_sales from retail_sales
group  by category


--4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
select avg(age) as average_age from retail_sales where category='Beauty'


--5.Write a SQL query to find all transactions where the total_sale is greater than 1000.:
select * from retail_sales where total_sale>1000
--6.Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
select gender,category,count(*) as total_transactions from retail_sales 
group by gender,category

--7.Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
select extract(month from sale_date) as month,
extract(year from sale_date) as year,
avg(total_sale) from retail_sales 
group by extract(year from sale_date),extract(month from sale_date) 
order by year,month 


--8.Write a SQL query to find the top 5 customers based on the highest total sales :
select customer_id, sum(total_sale) as total_sales from retail_sales
group by customer_id
order by sum(total_sale) desc limit 5

--9.Write a SQL query to find the number of unique customers who purchased items from each category.
select count(distinct customer_id),category from retail_sales 
group by category

--10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
select 
case 
when extract(hour from sale_time)<12 then 'Morning'
when extract(hour from sale_time)between 12 and 17 then 'Afternoon'
else 'Evening'
end as shift,
count(*) as no_of_orders
from retail_sales
group by 
case
when extract(hour from sale_time)<12 then 'Morning'
when extract(hour from sale_time)between 12 and 17 then 'Afternoon'
else 'Evening'
end
order by no_of_orders desc
