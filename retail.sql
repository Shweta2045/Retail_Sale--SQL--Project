use retail;

CREATE TABLE retail_sales
(
    transactions_id INT,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    cogs DECIMAL(10,2),
    total_sale DECIMAL(10,2)
);

SELECT * FROM retail_sales;

select*from retail_sales
limit 20;

SELECT count(*) 
FROM retail_sales;

-- data cleaning
SELECT * FROM retail_sales
WHERE transaction_id IS NULL;

SHOW COLUMNS FROM retail_sales;

# Rename the column name

ALTER TABLE retail_sales
RENAME COLUMN `ï»¿transactions_id` TO transaction_id;

ALTER TABLE retail_sales
RENAME COLUMN quantiy TO quantity;

SET SQL_SAFE_UPDATES = 0;
UPDATE retail_sales
SET sale_date = STR_TO_DATE(sale_date, '%d-%m-%Y');
SET SQL_SAFE_UPDATES = 1;

SELECT *
FROM retail_sales
WHERE sale_time IS NULL;


SELECT * 
FROM retail_sales
WHERE transaction_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
 
 
 DESC retail_sales;
 
 -- data exploration

-- How many total records are present in the dataset?

  SELECT
  count(*) as total_record
  FROM retail_sales
  
  
  
-- What are the unique product categories?
 SELECT DISTINCT(category) from retail_sales;
 
 -- How many unique customers are there?
 SELECT
 DISTINCT(customer_id) as unique_customer
 FROM retail_sales;

 
 -- Customer based analysis
 -- what is the average age of the customers?
 SELECT avg(age) as Avg_age
 FROM retail_sales;
 
-- calulate the total sales of each category?
 SELECT 
 category,
 sum(total_sale) AS net_sales
FROM retail_sales
 GROUP BY 1;
 
 -- which gender spend more money?
SELECT 
gender,
SUM(total_sale) AS total_spending
FROM retail_sales
GROUP BY gender;



-- Which customer spent the most money?
SELECT 
customer_id,
SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 2;


-- Product Analysis Questions
-- Which category has the highest number of orders?

 SELECT
 category,
 sum(transaction_id) as highest_order
 FROM retail_sales
 GROUP BY category
 ORDER BY highest_order
 DESC
 LIMIT 1;
 
 -- Which category sells the highest quantity?
 SELECT 
 category,
 sum(quantity) AS highest_quantity
 FROM retail_sales
 GROUP BY category 
 ORDER BY highest_quantity
 DESC
 LIMIT 1
 
 -- Time-Based EDA Questions
 -- Which month has the highest sales?
SELECT MONTH(sale_date) AS month,
Sum(total_sale) AS monthly_sales
FROM retail_sales
GROUP BY MONTH(sale_date)
ORDER BY monthly_sales DESC;



-- Which hour has the most transactions?
SELECT
HOUR(sale_time) AS hour,
Count(*) AS total_transactions
FROM retail_sales
GROUP BY HOUR(sale_time)
ORDER BY total_transactions DESC;


--  What are the daily sales trends?
SELECT sale_date,
Sum(total_sale) AS daily_sales
FROM retail_sales
GROUP BY sale_date
ORDER BY sale_date;


-- Find customers who purchased from multiple categories 
SELECT
count(DISTINCT category) AS categories_purchase ,
customer_id
FROM retail_sales
GROUP BY customer_id
HAVING categories_purchase>1;

SELECT customer_id,
       COUNT(DISTINCT category) AS categories_purchased
FROM retail_sales
GROUP BY customer_id
HAVING categories_purchased > 1;



-- Find low-performing categories 
SELECT category,
sum(total_sale) AS revenue
FROM retail_sales
GROUP BY category
ORDER BY revenue ASC;


--  Find repeat customers
SELECT customer_id,
count(*) AS purchase_count
FROM retail_sales
GROUP BY customer_id
HAVING purchase_count > 1;


--  Find duplicate transaction IDs
SELECT 
transaction_id,
count(*) AS duplicate_count
FROM retail_sales
GROUP BY transaction_id
HAVING count(*) > 1;

--  What is the total profit?
SELECT sum(total_sale - cogs) AS total_profit
FROM retail_sales;


-- Find Peak Sales Date
SELECT sale_date,
sum(total_sale) AS total_sales
FROM retail_sales
GROUP BY sale_date
ORDER BY total_sales DESC
LIMIT 1; 


SELECT 
    MONTH(sale_date) AS month,
    SUM(total_sale) AS monthly_revenue
FROM retail_sales
GROUP BY MONTH(sale_date)
ORDER BY month;




 
 

 









 
 
 
 

  
  
  
 
 



	








