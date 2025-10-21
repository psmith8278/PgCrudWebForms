-- Customers CRUD

-- Insert Customer
CREATE OR REPLACE FUNCTION insert_customer(p_name VARCHAR, p_email VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Customers (Name, Email) VALUES (p_name, p_email);
END;
$$ LANGUAGE plpgsql;

-- Update Customer
CREATE OR REPLACE FUNCTION update_customer(p_id INT, p_name VARCHAR, p_email VARCHAR)
RETURNS VOID AS $$
BEGIN
    UPDATE Customers SET Name = p_name, Email = p_email WHERE CustomerId = p_id;
END;
$$ LANGUAGE plpgsql;

-- Delete Customer
CREATE OR REPLACE FUNCTION delete_customer(p_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Customers WHERE CustomerId = p_id;
END;
$$ LANGUAGE plpgsql;

-- Orders CRUD

-- Insert Order
CREATE OR REPLACE FUNCTION insert_order(p_customerid INT, p_orderdate DATE)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Orders (CustomerId, OrderDate) VALUES (p_customerid, p_orderdate);
END;
$$ LANGUAGE plpgsql;

-- Update Order
CREATE OR REPLACE FUNCTION update_order(p_id INT, p_customerid INT, p_orderdate DATE)
RETURNS VOID AS $$
BEGIN
    UPDATE Orders SET CustomerId = p_customerid, OrderDate = p_orderdate WHERE OrderId = p_id;
END;
$$ LANGUAGE plpgsql;

-- Delete Order
CREATE OR REPLACE FUNCTION delete_order(p_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Orders WHERE OrderId = p_id;
END;
$$ LANGUAGE plpgsql;

-- Products CRUD

-- Insert Product
CREATE OR REPLACE FUNCTION insert_product(p_name VARCHAR, p_price NUMERIC)
RETURNS VOID AS $$
BEGIN
    INSERT INTO Products (Name, Price) VALUES (p_name, p_price);
END;
$$ LANGUAGE plpgsql;

-- Update Product
CREATE OR REPLACE FUNCTION update_product(p_id INT, p_name VARCHAR, p_price NUMERIC)
RETURNS VOID AS $$
BEGIN
    UPDATE Products SET Name = p_name, Price = p_price WHERE ProductId = p_id;
END;
$$ LANGUAGE plpgsql;

-- Delete Product
CREATE OR REPLACE FUNCTION delete_product(p_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM Products WHERE ProductId = p_id;
END;
$$ LANGUAGE plpgsql;

-- OrderItems CRUD

-- Insert OrderItem
CREATE OR REPLACE FUNCTION insert_orderitem(p_orderid INT, p_productid INT, p_quantity INT, p_unitprice NUMERIC)
RETURNS VOID AS $$
BEGIN
    INSERT INTO OrderItems (OrderId, ProductId, Quantity, UnitPrice) VALUES (p_orderid, p_productid, p_quantity, p_unitprice);
END;
$$ LANGUAGE plpgsql;

-- Update OrderItem
CREATE OR REPLACE FUNCTION update_orderitem(p_id INT, p_orderid INT, p_productid INT, p_quantity INT, p_unitprice NUMERIC)
RETURNS VOID AS $$
BEGIN
    UPDATE OrderItems SET OrderId = p_orderid, ProductId = p_productid, Quantity = p_quantity, UnitPrice = p_unitprice WHERE OrderItemId = p_id;
END;
$$ LANGUAGE plpgsql;

-- Delete OrderItem
CREATE OR REPLACE FUNCTION delete_orderitem(p_id INT)
RETURNS VOID AS $$
BEGIN
    DELETE FROM OrderItems WHERE OrderItemId = p_id;
END;
$$ LANGUAGE plpgsql;
