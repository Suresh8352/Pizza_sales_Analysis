**Pizza_sales_Analysis**
# Quries
**KPI's**
1. **Total Revenue**:
     SELECT sum(total_price) as TOTAL_Revenue from pizza;                                    ---> 817860.049999993
2. **Average Order Value**
     SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza;      ---> 38.307262295081635
3. **Total Pizza sold**
   SELECT SUM(quantity) AS Total_pizza_sold FROM pizza              -----> 49574
4. **Total no of order**
   SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza;       -----> 21350
5. **Average Pizza per order**
     SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
     CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
     AS Avg_Pizzas_per_order                                                   ---->2.32
     FROM pizza

7. 

