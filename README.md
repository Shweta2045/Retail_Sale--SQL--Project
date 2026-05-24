# 🛒 E-Commerce Retail Sales Analysis using MySQL

![MySQL](https://img.shields.io/badge/MySQL-Database-blue)
![SQL](https://img.shields.io/badge/SQL-Data%20Analysis-orange)
![Project](https://img.shields.io/badge/Project-ECommerce-success)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

# 📌 Project Overview

This project focuses on analyzing an **E-Commerce Retail Sales Dataset** using **MySQL**.
The project includes:

* Data Cleaning
* Exploratory Data Analysis (EDA)
* Sales Analysis
* Customer Behavior Analysis
* Profit Analysis
* Time-Based Trend Analysis
* Advanced SQL Queries

The main goal of this project is to generate meaningful business insights from raw retail sales data.

---

# 🎯 Project Objectives

* Analyze overall sales performance
* Identify customer purchasing behavior
* Find best-selling product categories
* Perform data cleaning and handle NULL values
* Analyze monthly and hourly sales trends
* Calculate business profit and revenue
* Generate business insights using SQL queries

---

# 🛠️ Technologies Used

| Technology      | Purpose             |
| --------------- | ------------------- |
| MySQL           | Database Management |
| SQL             | Data Analysis       |
| MySQL Workbench | Query Execution     |
| GitHub          | Project Hosting     |

---

# 📂 Dataset Information

The dataset contains retail sales transaction details.

## Dataset Columns

| Column Name    | Description              |
| -------------- | ------------------------ |
| transaction_id | Unique transaction ID    |
| sale_date      | Date of sale             |
| sale_time      | Time of sale             |
| customer_id    | Customer ID              |
| gender         | Gender of customer       |
| age            | Customer age             |
| category       | Product category         |
| quantiy        | Quantity purchased       |
| price_per_unit | Price per unit           |
| cogs           | Cost of goods sold       |
| total_sale     | Total transaction amount |

---

# 🧹 Data Cleaning

## Checking NULL Values

```sql
SELECT *
FROM retail_sales
WHERE transaction_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
```
<img width="1155" height="651" alt="image" src="https://github.com/user-attachments/assets/0d30479a-5a99-4ae5-9be0-de4144468858" />

---


## Rename the column name

```sql
ALTER TABLE retail_sales
RENAME COLUMN `ï»¿transactions_id` TO transaction_id;
```

```sql
ALTER TABLE retail_sales
RENAME COLUMN quantiy TO quantity;
```

---

# 📊 Exploratory Data Analysis (EDA)

## 1️⃣ How many total records are present in the dataset?

```sql
 SELECT
  count(*) as total_record
  FROM retail_sales
```

<img width="1152" height="663" alt="image" src="https://github.com/user-attachments/assets/7502e25f-ce8d-4644-a5e0-4d2107928316" />

---

## 2️⃣ What are the unique product categories?

```sql
 SELECT DISTINCT(category) from retail_sales;
```

<img width="1147" height="667" alt="image" src="https://github.com/user-attachments/assets/8bda9c6c-1965-4acf-b9b7-2aae43eb48d1" />


---

## 3️⃣ How many unique customers are there?

```sql
 SELECT
 DISTINCT(customer_id) as unique_customer
 FROM retail_sales;
```

<img width="1157" height="692" alt="image" src="https://github.com/user-attachments/assets/3641cf22-08bc-4efd-8e5b-d8273f123520" />

---

## Customer Based Analysis

---

## 4️⃣ what is the average age of the customers?

```sql
SELECT avg(age) as Avg_age
 FROM retail_sales;
```

<img width="1148" height="663" alt="image" src="https://github.com/user-attachments/assets/109c46e3-ea57-456a-9222-8a353a0abe20" />


---

## 5️⃣ calulate the total sales of each category?

```sql
 SELECT 
 category,
 sum(total_sale) AS net_sales
FROM retail_sales
 GROUP BY 1;
```


<img width="1158" height="708" alt="image" src="https://github.com/user-attachments/assets/a03793d4-92a0-4db8-b14a-7a61581ded93" />


---


## which gender spend more money?

```sql
SELECT 
gender,
SUM(total_sale) AS total_spending
FROM retail_sales
GROUP BY gender;
```

<img width="1153" height="690" alt="image" src="https://github.com/user-attachments/assets/0d787862-1b16-4d55-8732-b1ae3b5c2bd3" />

---

## Which customer spent the most money?

```sql
SELECT 
customer_id,
SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 2;
```

<img width="1157" height="696" alt="image" src="https://github.com/user-attachments/assets/27538d8e-977e-44c1-8daf-d656e571d125" />

---
## Product Analysis Questions

## Which category has the highest number of orders?

```sql
 SELECT
 category,
 sum(transaction_id) as highest_order
 FROM retail_sales
 GROUP BY category
 ORDER BY highest_order
 DESC
 LIMIT 1;
```
<img width="1160" height="696" alt="image" src="https://github.com/user-attachments/assets/080df802-5763-4e52-a045-c2f4320f48db" />

---

## Which category sells the highest quantity?

```sql
 SELECT 
 category,
 sum(quantity) AS highest_quantity
 FROM retail_sales
 GROUP BY category 
 ORDER BY highest_quantity
 DESC
 LIMIT 1;
```
<img width="1162" height="672" alt="image" src="https://github.com/user-attachments/assets/f4cd6c62-7009-4c57-9c77-f20cda46cb94" />

---
## Time-Based EDA Questions

## Which month has the highest sales?

```sql
SELECT MONTH(sale_date) AS month,
Sum(total_sale) AS monthly_sales
FROM retail_sales
GROUP BY MONTH(sale_date)
ORDER BY monthly_sales DESC;
```
<img width="1171" height="662" alt="image" src="https://github.com/user-attachments/assets/8beb98cb-eba7-4378-b5c9-558f7ce6ce50" />

---

##  Which hour has the most transactions?

```sql
SELECT
HOUR(sale_time) AS hour,
Count(*) AS total_transactions
FROM retail_sales
GROUP BY HOUR(sale_time)
ORDER BY total_transactions DESC;
```
<img width="1152" height="706" alt="image" src="https://github.com/user-attachments/assets/5daff4f4-035c-497e-9200-237356a1e589" />

---

##  What are the daily sales trends?

```sql
SELECT sale_date,
Sum(total_sale) AS daily_sales
FROM retail_sales
GROUP BY sale_date
ORDER BY sale_date;
```
<img width="1166" height="695" alt="image" src="https://github.com/user-attachments/assets/d395a296-35f8-4dc2-8949-9794a124d018" />

---

##   Find customers who purchased from multiple categories 

```sql
SELECT
count(DISTINCT category) AS categories_purchase ,
customer_id
FROM retail_sales
GROUP BY customer_id
HAVING categories_purchase>1;
```
<img width="1148" height="698" alt="image" src="https://github.com/user-attachments/assets/fbe93a30-d470-4ddb-b973-4ef1560db9e8" />


---

##   Find low-performing categories 

```sql
SELECT category,
sum(total_sale) AS revenue
FROM retail_sales
GROUP BY category
ORDER BY revenue ASC;
```
<img width="1157" height="698" alt="image" src="https://github.com/user-attachments/assets/9ef7ac7b-3cd7-4c02-b518-06fc99e9c8c3" />

---

##  Find repeat customers

```sql
SELECT customer_id,
count(*) AS purchase_count
FROM retail_sales
GROUP BY customer_id
HAVING purchase_count > 1;
```
<img width="1167" height="701" alt="image" src="https://github.com/user-attachments/assets/9a3282bf-3118-4eb1-9783-fdebeb49e103" />

---
## Find duplicate transaction IDs

```sql
SELECT 
transaction_id,
count(*) AS duplicate_count
FROM retail_sales
GROUP BY transaction_id
HAVING count(*) > 1;
```
<img width="1142" height="700" alt="image" src="https://github.com/user-attachments/assets/6cd05cc9-ec0e-4c40-80b2-d513eda69a7b" />


---
## What is the total profit?

```sql
SELECT sum(total_sale - cogs) AS total_profit
FROM retail_sales;
```
<img width="1142" height="696" alt="image" src="https://github.com/user-attachments/assets/07cffebe-1929-4a0e-851e-cd6781d4d00f" />


---

## Find Peak Sales Date

```sql
SELECT sale_date,
sum(total_sale) AS total_sales
FROM retail_sales
GROUP BY sale_date
ORDER BY total_sales DESC
LIMIT 1; 
```
<img width="1152" height="697" alt="image" src="https://github.com/user-attachments/assets/71a4e6f0-af7e-45cc-835d-0212a8661d59" />


---

## Find Peak Sales Date

```sql
SELECT sale_date,
sum(total_sale) AS total_sales
FROM retail_sales
GROUP BY sale_date
ORDER BY total_sales DESC
LIMIT 1; 
```
<img width="1152" height="697" alt="image" src="https://github.com/user-attachments/assets/71a4e6f0-af7e-45cc-835d-0212a8661d59" />


---



# 📌 Key Insights

* Electronics and Clothing categories generated high revenue.
* Weekday sales were higher than weekend sales.
* Peak shopping hours were during morning and evening.
* Repeat customers contributed significantly to revenue.
* Female customers showed strong purchasing behavior in Beauty category.

---





---

## 📈 Monthly Revenue Analysis

<img width="1093" height="661" alt="image" src="https://github.com/user-attachments/assets/f533b0a1-d279-4508-8ad6-63689df41301" />


---






