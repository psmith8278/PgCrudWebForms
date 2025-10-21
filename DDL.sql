-- Customers table
CREATE TABLE Customers (
    CustomerId SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- Products table
CREATE TABLE Products (
    ProductId SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price NUMERIC(10,2) NOT NULL
);

-- Orders table
CREATE TABLE Orders (
    OrderId SERIAL PRIMARY KEY,
    CustomerId INTEGER NOT NULL REFERENCES Customers(CustomerId) ON DELETE CASCADE,
    OrderDate DATE NOT NULL
);

-- OrderItems table
CREATE TABLE OrderItems (
    OrderItemId SERIAL PRIMARY KEY,
    OrderId INTEGER NOT NULL REFERENCES Orders(OrderId) ON DELETE CASCADE,
    ProductId INTEGER NOT NULL REFERENCES Products(ProductId),
    Quantity INTEGER NOT NULL,
    UnitPrice NUMERIC(10,2) NOT NULL
);
