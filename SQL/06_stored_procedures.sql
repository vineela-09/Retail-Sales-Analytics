USE RetailSalesAnalyticsDB;

DELIMITER $$

CREATE PROCEDURE GetCustomerSales(IN p_CustomerID VARCHAR(20))
BEGIN
    SELECT
        c.Customer_ID,
        c.Customer_Name,
        ROUND(SUM(s.Sales),2) AS Total_Sales
    FROM Customers c
    JOIN Orders o
        ON c.Customer_ID = o.Customer_ID
    JOIN Sales s
        ON o.Order_ID = s.Order_ID
    WHERE c.Customer_ID = p_CustomerID
    GROUP BY
        c.Customer_ID,
        c.Customer_Name;
END$$

CREATE PROCEDURE GetProductSales(IN p_ProductID VARCHAR(20))
BEGIN
    SELECT
        p.Product_ID,
        p.Product_Name,
        ROUND(SUM(s.Sales),2) AS Revenue
    FROM Products p
    JOIN Sales s
        ON p.Product_ID = s.Product_ID
    WHERE p.Product_ID = p_ProductID
    GROUP BY
        p.Product_ID,
        p.Product_Name;
END$$

CREATE PROCEDURE GetSalesByCategory(IN p_Category VARCHAR(50))
BEGIN
    SELECT
        p.Category,
        ROUND(SUM(s.Sales),2) AS Revenue
    FROM Products p
    JOIN Sales s
        ON p.Product_ID = s.Product_ID
    WHERE p.Category = p_Category
    GROUP BY
        p.Category;
END$$

CREATE PROCEDURE GetSalesByRegion(IN p_Region VARCHAR(50))
BEGIN
    SELECT
        l.Region,
        ROUND(SUM(s.Sales),2) AS Revenue
    FROM Locations l
    JOIN Orders o
        ON l.Location_ID = o.Location_ID
    JOIN Sales s
        ON o.Order_ID = s.Order_ID
    WHERE l.Region = p_Region
    GROUP BY
        l.Region;
END$$

CREATE PROCEDURE GetTopCustomers(IN p_Limit INT)
BEGIN
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
        c.Customer_Name
    ORDER BY Total_Sales DESC
    LIMIT p_Limit;
END$$

CREATE PROCEDURE GetTopProducts(IN p_Limit INT)
BEGIN
    SELECT
        p.Product_ID,
        p.Product_Name,
        ROUND(SUM(s.Sales),2) AS Revenue
    FROM Products p
    JOIN Sales s
        ON p.Product_ID = s.Product_ID
    GROUP BY
        p.Product_ID,
        p.Product_Name
    ORDER BY Revenue DESC
    LIMIT p_Limit;
END$$

CREATE PROCEDURE GetSalesBetweenDates
(
    IN p_StartDate DATE,
    IN p_EndDate DATE
)
BEGIN
    SELECT
        o.Order_Date,
        ROUND(SUM(s.Sales),2) AS Revenue
    FROM Orders o
    JOIN Sales s
        ON o.Order_ID = s.Order_ID
    WHERE o.Order_Date BETWEEN p_StartDate AND p_EndDate
    GROUP BY
        o.Order_Date
    ORDER BY
        o.Order_Date;
END$$

CREATE PROCEDURE GetStateSales(IN p_State VARCHAR(100))
BEGIN
    SELECT
        l.State,
        ROUND(SUM(s.Sales),2) AS Revenue
    FROM Locations l
    JOIN Orders o
        ON l.Location_ID = o.Location_ID
    JOIN Sales s
        ON o.Order_ID = s.Order_ID
    WHERE l.State = p_State
    GROUP BY
        l.State;
END$$

DELIMITER ;