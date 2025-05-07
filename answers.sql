-- Question 1
-- Create a new table 
CREATE TABLE ProductDetail
(
    OrderID INT,
    CustomerName VARCHAR(100),
    Products VARCHAR(100)
    PRIMARY KEY (OrderID, Products)
);









-- Question 2

-- Create the Orders table
CREATE  TABLE Orders(
    OrderID INT, PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create the OrderDetails
CREATE TABLE OrderDetails(
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Insert data into OrderDetails table
INSERT INTO OrderDetails (OrderID, Product, Quantity)
VALUES 
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1);