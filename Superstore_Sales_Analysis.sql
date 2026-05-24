USE superstore;

-- SUPERSTORE RETAIL SALES ANALYSIS --

-- (QUERY 1) TOTAL REVENUE AND PROFIT BY REGION --
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Revenue,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Pct
FROM superstore.orders
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- (QUERY 2) TOP 10 PRODUCTS BY PROFIT MARGIN --
SELECT
    Product_Name,
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS Profit_Margin_Pct
FROM superstore.orders
GROUP BY Product_Name, Category
ORDER BY Profit_Margin_Pct DESC
LIMIT 10;

-- (QUERY 3) MONTH OVER MONTH SALES TREND --
SELECT
    YEAR(STR_TO_DATE(Order_Date, '%m/%d/%Y')) AS Year,
    MONTH(STR_TO_DATE(Order_Date, '%m/%d/%Y')) AS Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales,
    ROUND(SUM(Profit), 2) AS Monthly_Profit
FROM superstore.orders
GROUP BY YEAR(STR_TO_DATE(Order_Date, '%m/%d/%Y')), 
         MONTH(STR_TO_DATE(Order_Date, '%m/%d/%Y'))
ORDER BY Monthly_Sales DESC;

-- (QUERY 4) WHICH CATEGORY LOSES THE MOST MONEY --
SELECT
    Category,
    Sub_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore.orders
GROUP BY Category, Sub_Category
ORDER BY Total_Profit ASC;

-- (QUERY 5) CUSTOMER SEGMENT PERFORMANCE --
SELECT
    Segment,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Sales), 2) AS Avg_Order_Value
FROM superstore.orders
GROUP BY Segment
ORDER BY Total_Sales DESC;





