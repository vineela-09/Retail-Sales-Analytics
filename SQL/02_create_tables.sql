USE RetailSalesAnalyticsDB;

CREATE TABLE Customers (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Segment VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    Product_ID VARCHAR(20) PRIMARY KEY,
    Product_Name VARCHAR(255) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Sub_Category VARCHAR(50) NOT NULL
);

CREATE TABLE Locations (
    Location_ID INT AUTO_INCREMENT PRIMARY KEY,
    Country VARCHAR(50) NOT NULL,
    Region VARCHAR(50) NOT NULL,
    State VARCHAR(100) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Postal_Code VARCHAR(20),
    UNIQUE (Country, Region, State, City, Postal_Code)
);

CREATE TABLE Orders (
    Order_ID VARCHAR(20) PRIMARY KEY,
    Order_Date DATE NOT NULL,
    Ship_Date DATE NOT NULL,
    Ship_Mode VARCHAR(50) NOT NULL,
    Customer_ID VARCHAR(20) NOT NULL,
    Location_ID INT NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Location_ID) REFERENCES Locations(Location_ID)
);

CREATE TABLE Sales (
    Sale_ID INT AUTO_INCREMENT PRIMARY KEY,
    Row_ID INT NOT NULL UNIQUE,
    Order_ID VARCHAR(20) NOT NULL,
    Product_ID VARCHAR(20) NOT NULL,
    Sales DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);