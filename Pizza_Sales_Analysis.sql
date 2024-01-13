--table name 'Pizza'
--MySQL
-----KPIs-------------
--  Total Revenue

         SELECT sum(total_price) as TOTAL_Revenue from pizza;                                    ---> 817860.049999993
     
--  Average Order Value**

         SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza;      ---> 38.307262295081635
 
--  Total Pizza sold**

           SELECT SUM(quantity) AS Total_pizza_sold FROM pizza              -----> 49574

--  Total no of order**

           SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza;       -----> 21350

--  Average Pizza per order**

         SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
         CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
         AS Avg_Pizzas_per_order
         FROM pizza                            
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Summary

SELECT COUNT (Order_id) AS Total_Orders, COUNT (DISTINCT pizza_name) AS Number_of_pizza_types, 
		SUM (Quantity) AS Total_Quantity_Sold, ROUND (SUM (Total_price),2) AS Total_revenue,ROUND (AVG (Total_price),2) AS Average_revenue
FROM pizza

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Orders by time of day
SELECT hour(order_time) AS Time_of_Day, COUNT(Order_id) AS Number_of_Orders, 
		SUM(Quantity) AS Number_of_Pizzas,ROUND(SUM(Total_price),2) AS Total_revenue
FROM pizza
GROUP BY hour(order_time)
ORDER BY hour(order_time) asc

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Orders by day of week

SELECT DAYNAME (order_date) AS Day_of_Week, COUNT(Order_id) AS Number_of_Orders,
		SUM (Quantity) AS Number_of_Pizzas, ROUND (SUM(Total_price),2) AS Total_revenue
FROM PIZZA
GROUP BY DAYNAME (order_date)
ORDER BY 2 DESC

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Orders per Pizza  

SELECT Pizza_name, COUNT(Order_id) AS Number_of_Orders,SUM(Quantity) AS Number_of_Pizzas,ROUND(SUM(Total_price),2) AS Total_revenue
FROM PIZZA
GROUP BY pizza_name
ORDER BY 2 DESC

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Orders by Month

SELECT MONTHNAME(order_date) AS Month, COUNT(Order_id) AS Number_of_Orders,
		SUM(Quantity) AS Number_of_Pizzas,ROUND (SUM(Total_price),2) AS Total_revenue
FROM pizza
GROUP BY monthname(order_date)
ORDER BY 2 DESC


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Order Contribution per Pizza size   

SELECT pizza_size, COUNT(Order_id) AS Number_of_Orders,SUM(Quantity) AS Number_of_Pizzas,
		ROUND (SUM(Total_price),2) AS Total_revenue
FROM pizza
GROUP BY pizza_size
ORDER BY 2 DESC

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Orders per Pizza category   

SELECT Pizza_category, COUNT (Order_id) AS Number_of_Orders,SUM (Quantity) AS Number_of_Pizzas,
		ROUND (SUM (Total_price),2) AS Total_revenue
FROM pizza
GROUP BY Pizza_category
ORDER BY 2 DESC
 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Revenue performance MOM

SELECT MONTHNAME(order_date) AS Month,ROUND(SUM(Total_price),2) AS Total_revenue
FROM pizza
GROUP BY MONTHNAME(MONTH, order_date)
ORDER BY 2 DESC

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Revenue Vs Orders MOM

SELECT MONTHNAME(MONTH, order_date) AS Month,COUNT(Order_id) AS Number_of_Orders,ROUND(SUM(Total_price),2) AS Total_revenue
FROM PIZZA
GROUP BY MONTHNAME(MONTH, order_date)

