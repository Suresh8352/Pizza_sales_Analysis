**Pizza_sales_Analysis**
# Quries
**A. KPI's**

     **Total Revenue**
   
             SELECT sum(total_price) as TOTAL_Revenue from pizza;                                    ---> 817860.049999993
         
      **Average Order Value**
  
             SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza;      ---> 38.307262295081635
     
      **Total Pizza sold**
  
               SELECT SUM(quantity) AS Total_pizza_sold FROM pizza              -----> 49574
   
      **Total no of order**
  
               SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza;       -----> 21350
   
      **Average Pizza per order**
  
             SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
             CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
             AS Avg_Pizzas_per_order
             FROM pizza                                                               ----->    2.32


**B.Daily Trend for Total Orders**

     SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
     FROM pizza
     GROUP BY DAYNAME(order_date);
     -->Gives the day wise total order
**C.Monthly Trends**

     select MonthNAME(order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
     from pizza
     GROUP BY monthNAME(order_date);
     --> Gives the montly total orders
**D.Percentage of sale in each category of pizza**

        SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
        CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza) AS DECIMAL(10,2)) AS PCT
        FROM pizza
        GROUP BY pizza_category



