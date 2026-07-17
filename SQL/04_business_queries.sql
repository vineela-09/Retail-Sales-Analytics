USE RetailSalesAnalyticsDB;

-- 1. Total Sales Revenue

SELECT
ROUND(SUM(Sales),2) AS Total_Revenue
FROM Sales;

-- 2. Total Number of Orders

SELECT
COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Orders;

-- 3. Total Customers

SELECT
COUNT(*) AS Total_Customers
FROM Customers;

-- 4. Total Products

SELECT
COUNT(*) AS Total_Products
FROM Products;

-- 5. Top 10 Customers by Sales

SELECT
c.Customer_ID,
c.Customer_Name,
ROUND(SUM(s.Sales),2) AS Total_Sales
FROM Sales s
JOIN Orders o
ON s.Order_ID=o.Order_ID
JOIN Customers c
ON o.Customer_ID=c.Customer_ID
GROUP BY
c.Customer_ID,
c.Customer_Name
ORDER BY Total_Sales DESC
LIMIT 10;

-- 6. Top 10 Products by Revenue

SELECT
p.Product_Name,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Sales s
JOIN Products p
ON s.Product_ID=p.Product_ID
GROUP BY
p.Product_Name
ORDER BY Revenue DESC
LIMIT 10;

-- 7. Sales by Category

SELECT
p.Category,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Sales s
JOIN Products p
ON s.Product_ID=p.Product_ID
GROUP BY
p.Category
ORDER BY Revenue DESC;

-- 8. Sales by Sub Category

SELECT
p.Sub_Category,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Sales s
JOIN Products p
ON s.Product_ID=p.Product_ID
GROUP BY
p.Sub_Category
ORDER BY Revenue DESC;

-- 9. Sales by Region

SELECT
l.Region,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Sales s
JOIN Orders o
ON s.Order_ID=o.Order_ID
JOIN Locations l
ON o.Location_ID=l.Location_ID
GROUP BY
l.Region
ORDER BY Revenue DESC;

-- 10. Sales by State

SELECT
l.State,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Sales s
JOIN Orders o
ON s.Order_ID=o.Order_ID
JOIN Locations l
ON o.Location_ID=l.Location_ID
GROUP BY
l.State
ORDER BY Revenue DESC;