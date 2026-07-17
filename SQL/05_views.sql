USE RetailSalesAnalyticsDB;

CREATE VIEW vw_TotalSales AS
SELECT
SUM(Sales) AS Total_Revenue
FROM Sales;

CREATE VIEW vw_CustomerSales AS
SELECT
c.Customer_ID,
c.Customer_Name,
ROUND(SUM(s.Sales),2) AS Total_Sales
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
JOIN Sales s
ON o.Order_ID = s.Order_ID
GROUP BY
c.Customer_ID,
c.Customer_Name;

CREATE VIEW vw_ProductSales AS
SELECT
p.Product_ID,
p.Product_Name,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Products p
JOIN Sales s
ON p.Product_ID = s.Product_ID
GROUP BY
p.Product_ID,
p.Product_Name;

CREATE VIEW vw_CategorySales AS
SELECT
p.Category,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Products p
JOIN Sales s
ON p.Product_ID = s.Product_ID
GROUP BY
p.Category;

CREATE VIEW vw_SubCategorySales AS
SELECT
p.Sub_Category,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Products p
JOIN Sales s
ON p.Product_ID = s.Product_ID
GROUP BY
p.Sub_Category;

CREATE VIEW vw_RegionSales AS
SELECT
l.Region,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Locations l
JOIN Orders o
ON l.Location_ID = o.Location_ID
JOIN Sales s
ON o.Order_ID = s.Order_ID
GROUP BY
l.Region;

CREATE VIEW vw_StateSales AS
SELECT
l.State,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Locations l
JOIN Orders o
ON l.Location_ID = o.Location_ID
JOIN Sales s
ON o.Order_ID = s.Order_ID
GROUP BY
l.State;

CREATE VIEW vw_CitySales AS
SELECT
l.City,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Locations l
JOIN Orders o
ON l.Location_ID = o.Location_ID
JOIN Sales s
ON o.Order_ID = s.Order_ID
GROUP BY
l.City;

CREATE VIEW vw_OrderSummary AS
SELECT
o.Order_ID,
o.Order_Date,
c.Customer_Name,
l.City,
l.State,
ROUND(SUM(s.Sales),2) AS Order_Value
FROM Orders o
JOIN Customers c
ON o.Customer_ID = c.Customer_ID
JOIN Locations l
ON o.Location_ID = l.Location_ID
JOIN Sales s
ON o.Order_ID = s.Order_ID
GROUP BY
o.Order_ID,
o.Order_Date,
c.Customer_Name,
l.City,
l.State;

CREATE VIEW vw_TopProducts AS
SELECT
p.Product_Name,
ROUND(SUM(s.Sales),2) AS Revenue
FROM Products p
JOIN Sales s
ON p.Product_ID = s.Product_ID
GROUP BY
p.Product_Name
ORDER BY Revenue DESC;