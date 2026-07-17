USE RetailSalesAnalyticsDB;

CREATE INDEX idx_customer_name
ON Customers(Customer_Name);

CREATE INDEX idx_customer_segment
ON Customers(Segment);

CREATE INDEX idx_product_name
ON Products(Product_Name);

CREATE INDEX idx_category
ON Products(Category);

CREATE INDEX idx_sub_category
ON Products(Sub_Category);

CREATE INDEX idx_region
ON Locations(Region);

CREATE INDEX idx_state
ON Locations(State);

CREATE INDEX idx_city
ON Locations(City);

CREATE INDEX idx_order_date
ON Orders(Order_Date);

CREATE INDEX idx_ship_date
ON Orders(Ship_Date);

CREATE INDEX idx_ship_mode
ON Orders(Ship_Mode);

CREATE INDEX idx_customer_order
ON Orders(Customer_ID);

CREATE INDEX idx_location_order
ON Orders(Location_ID);

CREATE INDEX idx_product_sales
ON Sales(Product_ID);

CREATE INDEX idx_order_sales
ON Sales(Order_ID);

CREATE INDEX idx_sales_amount
ON Sales(Sales);

CREATE INDEX idx_row_id
ON Sales(Row_ID);