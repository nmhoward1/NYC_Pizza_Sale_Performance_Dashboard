# Power BI DAX Measures for NYC Pizza Sales Dashboard

This file documents the DAX measures created for the dashboard KPIs and analysis.

### MAIN KPIS (Cards)

#### Total Orders
Total Orders = DISTINCTCOUNT(orders[order_id])
#### Total Pizzas Sold
Total Pizzas Sold = SUM(orders[quantity])
#### Average Order Value (AOV)
Average Order Value = DIVIDE([Total Revenue], [Total Orders], 0)

#### Average Pizzas per Order
Average Pizzas per Order = DIVIDE([Total Pizzas Sold], [Total Orders], 0)

----------------------------------------
### Trend Analysis

#### Orders by Month
Orders by Month = CALCULATE(
    [Total Orders],
    SUMMARIZE(orders, MONTH(orders[order_date]))
)

#### Revenue by Month
Revenue by Month = CALCULATE(
    [Total Revenue],
    SUMMARIZE(orders, MONTH(orders[order_date]))
)

#### MoM Revenue Growth %
MoM Revenue Growth % =
VAR CurrentMonth = [Total Revenue]
VAR PreviousMonth =
    CALCULATE([Total Revenue], DATEADD(orders[order_date], -1, MONTH))
RETURN
    DIVIDE(CurrentMonth - PreviousMonth, PreviousMonth, 0)

----------------------------------------

### Size Analysis

#### Revenue by Pizza Category
Revenue by Category = SUMX(
    VALUES(orders[pizza_category]),
    CALCULATE(SUM(orders[total_price]))
)

#### Revenue by Pizza Size
Revenue by Size = SUMX(
    VALUES(orders[pizza_size]),
    CALCULATE(SUM(orders[total_price]))
)

## Actual vs Target Analysis

#### Annual Orders Target
Annual Orders Target = 50000

#### Orders vs Target
Orders vs Target % =
DIVIDE([Total Orders], [Annual Orders Target], 0)