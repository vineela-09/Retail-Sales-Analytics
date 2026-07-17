USE RetailSalesAnalyticsDB;

CREATE TABLE Superstore_Staging (
    Row_ID INT,
    Order_ID VARCHAR(20),
    Order_Date VARCHAR(20),
    Ship_Date VARCHAR(20),
    Ship_Mode VARCHAR(50),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(100),
    State VARCHAR(100),
    Postal_Code VARCHAR(20),
    Region VARCHAR(50),
    Product_ID VARCHAR(20),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Product_Name VARCHAR(255),
    Sales DECIMAL(10,2)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/superstore_final_dataset.csv'
INTO TABLE Superstore_Staging
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
Row_ID,
Order_ID,
Order_Date,
Ship_Date,
Ship_Mode,
Customer_ID,
Customer_Name,
Segment,
Country,
City,
State,
Postal_Code,
Region,
Product_ID,
Category,
Sub_Category,
Product_Name,
Sales
);

INSERT INTO Customers (Customer_ID, Customer_Name, Segment)
SELECT DISTINCT
Customer_ID,
Customer_Name,
Segment
FROM Superstore_Staging;

INSERT INTO Products (Product_ID, Product_Name, Category, Sub_Category)
SELECT DISTINCT
Product_ID,
Product_Name,
Category,
Sub_Category
FROM Superstore_Staging;

INSERT INTO Locations (Country, Region, State, City, Postal_Code)
SELECT DISTINCT
Country,
Region,
State,
City,
Postal_Code
FROM Superstore_Staging;

INSERT INTO Orders
(
Order_ID,
Order_Date,
Ship_Date,
Ship_Mode,
Customer_ID,
Location_ID
)
SELECT DISTINCT
s.Order_ID,
STR_TO_DATE(s.Order_Date,'%d-%m-%Y'),
STR_TO_DATE(s.Ship_Date,'%d-%m-%Y'),
s.Ship_Mode,
s.Customer_ID,
l.Location_ID
FROM Superstore_Staging s
JOIN Locations l
ON s.Country=l.Country
AND s.Region=l.Region
AND s.State=l.State
AND s.City=l.City
AND s.Postal_Code=l.Postal_Code;

INSERT INTO Sales
(
Row_ID,
Order_ID,
Product_ID,
Sales
)
SELECT
Row_ID,
Order_ID,
Product_ID,
Sales
FROM Superstore_Staging;