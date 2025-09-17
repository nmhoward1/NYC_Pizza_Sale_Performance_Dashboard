/*
Daily_Trend_Total_Orders
Caculates datetime trends for total orders
*/

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
