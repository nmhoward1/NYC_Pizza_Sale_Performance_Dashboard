/* Average Order Value
Description: caculates the average price per order
*/

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;