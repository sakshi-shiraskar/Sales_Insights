
--- Title :-        Pizza Sales Analysis
--- Created by :-   Sakshi Shiraskar
--- Tool used:-     MYSQL

/* 

       Description :-
•	This a Data Analysis Project using MySQL and PowerBI.
•	The dataset had over 48,000 rows.
•	I cleaned data in MS Excel, including tasks like eliminating extra spaces, substituting values, and eliminating empty rows. 
•	Then, transferred the cleaned dataset to MySQL workbench for further analysis. 
•	Finally, I wrote SQL queries to extract insights from the dataset.


     Approach :- 
• Understanding the datasets
• Cleaning the data
• Creating business questions
• Analysing through SQL queries

NOTE - In this file, we will analyze the business questions by leveraging SQL queries.

*/

-- Q.1 Total Revenue:
SELECT  SUM (total_price) AS Total_Revenue
FROM    pizza_sales;


-- Q.2 Average Order Value
SELECT  (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value 
FROM    pizza_sales;


-- Q.3) Total Pizzas Sold
SELECT   SUM(quantity) AS Total_pizza_sold
FROM     pizza_sales;


-- Q.4) Total Orders
SELECT   COUNT(DISTINCT order_id) AS Total_Orders 
FROM     pizza_sales;


-- Q.5) Average Pizzas Per Order
SELECT   SUM(quantity) / (COUNT(DISTINCT order_id) AS Avg_Pizzas_per_order
FROM     pizza_sales;


  -- Q.6) Percentage of sales by pizza category
SELECT    pizza_category, 
          ROUND (SUM(total_price),2) AS total_revenue, 
          ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price)
                                           FROM pizza_project.pizza_sales),2) AS percent_sales_by_category
FROM      pizza_project.pizza_sales
GROUP BY  pizza_category;


-- Q.7) Percentage of sales by pizza size
SELECT    pizza_size, 
          ROUND (SUM(total_price),2) AS total_revenue, 
          ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price)
                                           FROM pizza_project.pizza_sales),2) AS percent_sales_by_size
FROM      pizza_project.pizza_sales
GROUP BY  pizza_size;


-- Q.8) Total Pizzas Sold by Pizza Category
SELECT    pizza_category, 
          SUM(quantity) as Total_Quantity_Sold
FROM      pizza_sales
GROUP BY  pizza_category
ORDER BY  Total_Quantity_Sold DESC

  
-- Q.9) Top 5 Pizzas by Revenue
SELECT    pizza_name, 
          SUM(total_price) AS Total_Revenue
FROM      pizza_sales
GROUP BY  pizza_name
ORDER BY  Total_Revenue DESC
LIMIT     5;


-- Q.10)  Bottom 5 Pizzas by Revenue
SELECT    pizza_name, 
          SUM(total_price) AS Total_Revenue
FROM      pizza_sales
GROUP BY  pizza_name
ORDER BY  Total_Revenue ASC
LIMIT     5;


-- Q.11)   Top 5 Pizzas by Quantity Ordered
SELECT    pizza_name, 
          SUM(quantity) AS Total_Revenue
FROM      pizza_sales
GROUP BY  pizza_name
ORDER BY  Total_Revenue DESC
LIMIT     5;


-- Q.12)   Bottom 5 Pizzas by Quantity Ordered
SELECT    pizza_name, 
          SUM(quantity) AS Total_Revenue
FROM      pizza_sales
GROUP BY  pizza_name
ORDER BY  Total_Revenue ASC
LIMIT     5;

