USE RetailSalesAnalyticsDB;

DELIMITER $$

CREATE TRIGGER trg_PreventNegativeSales
BEFORE INSERT ON Sales
FOR EACH ROW
BEGIN
    IF NEW.Sales < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sales amount cannot be negative';
    END IF;
END$$

CREATE TRIGGER trg_PreventFutureOrderDate
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    IF NEW.Order_Date > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Order date cannot be in the future';
    END IF;
END$$

CREATE TRIGGER trg_PreventFutureShipDate
BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    IF NEW.Ship_Date < NEW.Order_Date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ship date cannot be earlier than order date';
    END IF;
END$$

DELIMITER ;