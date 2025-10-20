-- PgCrudWebForms Database Schema

CREATE TABLE Products (
    ProductId SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Customers (
    CustomerId SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Orders (
    OrderId SERIAL PRIMARY KEY,
    CustomerId INT REFERENCES Customers(CustomerId),
    OrderDate DATE
);

CREATE TABLE OrderItems (
    OrderItemId SERIAL PRIMARY KEY,
    OrderId INT REFERENCES Orders(OrderId),
    ProductId INT REFERENCES Products(ProductId),
    Quantity INT,
    UnitPrice DECIMAL(10,2)
);
