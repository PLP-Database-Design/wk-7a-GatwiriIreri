-- Question 1
SELECT 
    orderId,
    customerName,
    SUBSTRING_INDEX(SUBSTRING_INDEX(products, ',', numbers.n), ',', -1) AS product
FROM productDetail
CROSS JOIN (
    SELECT 1 AS n UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4
) numbers
WHERE numbers.n <= LENGTH(products) - LENGTH(REPLACE(products, ',', '')) + 1
ORDER BY orderId, product;


-- Question 2

-- Creating Orders Table
CREATE TABLE orders (
    orderId INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(100)
);

-- Populating orders table, which has distinct orderID and customerName
INSERT INTO orders (orderId, customerName)
SELECT DISTINCT orderId, customerName
FROM orderDetails;

-- Creating orderItems Table
CREATE TABLE orderItems (
    orderId INT AUTO_INCREMENT,
    product VARCHAR(100),
    quantity INT,
    PRIMARY KEY (orderId, product),
    FOREIGN KEY (orderId) REFERENCES orders(orderId)
);

-- populating orderItems table

INSERT INTO orderItems (orderId, product, quantity)
SELECT orderId, product, quantity
FROM orderDetails;




