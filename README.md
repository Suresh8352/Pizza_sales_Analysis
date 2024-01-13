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

**E. Percentage of sale in each Size of pizza**


        SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
        CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza) AS DECIMAL(10,2)) AS PCT
        FROM pizza
        GROUP BY pizza_size
        ORDER BY pizza_size
**F. Total Pizzas Sold by Pizza Category**

                SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
                FROM pizza
                GROUP BY pizza_category
                ORDER BY Total_Quantity_Sold DESC
**G. TOP FIVE(5) PIZZA by Revenue**
    
                    SELECT  pizza_name, SUM(total_price) AS Total_Revenue
                    FROM pizza
                    GROUP BY pizza_name
                    ORDER BY Total_Revenue DESC
                    LIMIT 5;
**H. Bottom five pizzas by revenue**

                SELECT  pizza_name, SUM(total_price) AS Total_Revenue
                FROM pizza
                GROUP BY pizza_name
                ORDER BY Total_Revenue ASC 
                LIMIT 5

**I. Bottom five pizzas by order**
    
                SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
                FROM pizza
                GROUP BY pizza_name
                ORDER BY Total_Orders DESC
                limit 5;
