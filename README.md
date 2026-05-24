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
<img width="1142" height="702" alt="image" src="https://github.com/user-attachments/assets/cac22677-e6ec-4bb6-8c5d-9d7edc8cff9c" />


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
<img width="1143" height="702" alt="image" src="https://github.com/user-attachments/assets/52872e5e-83f2-4f2b-8568-16f5bb1964c0" />


---

## 2️⃣ What are the unique product categories?

```sql
 SELECT DISTINCT(category) from retail_sales;
```

<img width="1168" height="707" alt="image" src="https://github.com/user-attachments/assets/a3bc35c0-c9c9-4bb6-9654-8ef9c08981f2" />


---

## 3️⃣ How many unique customers are there?

```sql
 SELECT
 DISTINCT(customer_id) as unique_customer
 FROM retail_sales;
```
<img width="1161" height="695" alt="image" src="https://github.com/user-attachments/assets/b493d526-ecde-4386-bda4-70c4d12907c8" />

---

## Customer Based Analysis

---

## 4️⃣ what is the average age of the customers?

```sql
SELECT avg(age) as Avg_age
 FROM retail_sales;
```
<img width="1143" height="697" alt="image" src="https://github.com/user-attachments/assets/84b52a34-b9c5-4ba6-ada2-6636d4118280" />



---

## 5️⃣ calulate the total sales of each category?

```sql
 SELECT 
 category,
 sum(total_sale) AS net_sales
FROM retail_sales
 GROUP BY 1;
```
<img width="1142" height="695" alt="image" src="https://github.com/user-attachments/assets/6405ae7b-fc79-49c3-b22a-1fc324ecda9c" />


---


## which gender spend more money?

```sql
SELECT 
gender,
SUM(total_sale) AS total_spending
FROM retail_sales
GROUP BY gender;
```

<img width="1156" height="692" alt="image" src="https://github.com/user-attachments/assets/340aed03-d8e0-4a14-ab0b-7597c1d1a5ef" />

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
<img width="1161" height="697" alt="image" src="https://github.com/user-attachments/assets/e0e7f275-d6ba-46ad-9410-d3082a58e21b" />


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
<img width="1132" height="686" alt="image" src="https://github.com/user-attachments/assets/30b401b5-aeba-4975-97df-4f9b5efabde4" />

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
<img width="1132" height="686" alt="image" src="https://github.com/user-attachments/assets/83104d93-bcff-4c95-a842-92254610cc85" />

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
<img width="1151" height="692" alt="image" src="https://github.com/user-attachments/assets/beedad83-dc28-4942-83e8-d800aaa332c1" />


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
<img width="1152" height="703" alt="image" src="https://github.com/user-attachments/assets/0477434a-154c-4be7-9179-a8b071df7cfb" />

---

##  What are the daily sales trends?

```sql
SELECT sale_date,
Sum(total_sale) AS daily_sales
FROM retail_sales
GROUP BY sale_date
ORDER BY sale_date;
```
<img width="1153" height="707" alt="image" src="https://github.com/user-attachments/assets/55f5eeb8-f233-42f5-be8f-24c726066167" />

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
<img width="1158" height="705" alt="image" src="https://github.com/user-attachments/assets/515fce8d-dcc5-4d14-a765-b7ecab8af71d" />


---

##   Find low-performing categories 

```sql
SELECT category,
sum(total_sale) AS revenue
FROM retail_sales
GROUP BY category
ORDER BY revenue ASC;
```
<img width="1155" height="697" alt="image" src="https://github.com/user-attachments/assets/16d25933-e152-49a0-9dbc-5b341fa0c3af" />

---

##  Find repeat customers

```sql
SELECT customer_id,
count(*) AS purchase_count
FROM retail_sales
GROUP BY customer_id
HAVING purchase_count > 1;
```
<img width="1150" height="698" alt="image" src="https://github.com/user-attachments/assets/cf264abb-d7d4-411e-8060-c3c85210d3e0" />

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
<img width="1155" height="710" alt="image" src="https://github.com/user-attachments/assets/824a0273-fdca-414c-8eff-e0b5b67be24b" />


---
## What is the total profit?

```sql
SELECT sum(total_sale - cogs) AS total_profit
FROM retail_sales;
```
<img width="1160" height="706" alt="image" src="https://github.com/user-attachments/assets/26cf82f8-2ff9-436f-8100-bc5b632aa344" />

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
<img width="1152" height="698" alt="image" src="https://github.com/user-attachments/assets/0dc40fa9-6e72-4c9b-9c45-34a98844d8bc" />


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

<img width="1142" height="695" alt="image" src="https://github.com/user-attachments/assets/803ce7c6-3860-4cdb-b2b3-cba3c6f09a0a" />

---






