-- Create a normalized ProductDetail table (1NF)
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert rows with atomic values (Kenyan names & clothing items)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'Brian Otieno', 'T-shirt'),
(101, 'Brian Otieno', 'Cap'),
(102, 'Aisha Njeri', 'Dress'),
(102, 'Aisha Njeri', 'Scarf'),
(102, 'Aisha Njeri', 'Hat'),
(103, 'Kevin Kiptoo', 'Jeans');
...............................................................................................................................................

2NF
-- Orders table to remove partial dependency
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert customer info (Kenyan names)
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'Brian Otieno'),
(102, 'Aisha Njeri'),
(103, 'Kevin Kiptoo');

-- OrderItems table for order-product relationship
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert clothing products and their quantities
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'T-shirt', 2),
(101, 'Cap', 1),
(102, 'Dress', 3),
(102, 'Scarf', 1),
(102, 'Hat', 2),
(103, 'Jeans', 1);
