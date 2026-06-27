-- CREATE TABLE---
create table retail_sales(
transactions_id	INT,
sale_date	DATE,
sale_time	TIME,
customer_id	INT,
gender	varchar(15),
age	int,
category	varchar(15),
quantiy	INT,
price_per_unit	Float,
cogs	Float,
total_sale Float

);


-- quantity column is wrong---

ALTER table retail_sales 
Rename column quantiy to quantity;