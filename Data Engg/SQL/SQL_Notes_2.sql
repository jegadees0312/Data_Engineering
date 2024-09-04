use demo

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, PhoneNumber) VALUES
(1, 'amit', 'sharma', 'amit.sharma@example.com', '9876543210'),
(2, 'pnya', 'mehta', 'priya.mehta@example.com', '8765432109'),
(3, 'rohit', 'kumar', 'rohit.kumar@example.com', '7654321098'),
(4, 'neha', 'verma', 'neha.verma@example.com', '6543210987'),
(5, 'siddharth', 'singh', 'siddharth.singh@example.com', '5432109876'),
(6, 'asha', 'rao', 'asha.rao@example.com', '4321098765');

SELECT * FROM customers
------------------------------------------------------------------------------------------------------------

-- MANIPULATING DATA

UPDATE Customers
 SET FirstName = RTRIM(LTRIM(LOWER(FirstName))),
     LastName = RTRIM(LTRIM(LOWER(LastName)))

-- pattern matching

SELECT * FROM customers
 WHERE firstname like '%a'

SELECT * FROM customers
 where phonenumber like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'

SELECT * FROM customers
WHERE LastName LIKE '_____'  -- IT WILL TAKE LAST NAME WITH 5 CHARACTERS


-- partioning data

SELECT CustomerID,OrderDate,TotalAmount
	SUM(TotalAmount) OVER (PARTITION BY CustomerID ORDER BY Orderdate ) AS RunningTotal
FROM Orders;


-- RANKING FUNCTION

SELECT CustomerID,OrderAmount,
	RANK() OVER (ORDER BY OrderAmount DESC)
FROM
	(SELECT CustomerID,SUM(OrderAmount) 
	FROM Orders
	GROUP BY CustomerId) 0
select * from orders
--------------------------------------------------------------------------------------

CREATE TABLE Employees (

    EmployeeID INT PRIMARY KEY IDENTITY(1,1),

    EmployeeName VARCHAR(100),

    ManagerID INT NULL

);


INSERT INTO Employees (EmployeeName, ManagerID)

VALUES 

('Amit Sharma', NULL),  -- Top manager

('Priya Mehta', 1),     -- Reports to Amit

('Rohit Kumar', 1),     -- Reports to Amit

('Neha Verma', 2),      -- Reports to Priya

('Siddharth Singh', 2), -- Reports to Priya

('Asha Rao', 3);        -- Reports to Rohit


INSERT INTO Employees (EmployeeName, ManagerID)

VALUES 

('Vikram Gupta', 4),  -- Reports to Neha

('Rajesh Patel', 5);  -- Reports to Siddharth

select * from employees
---------------------------------------------------------------------------------------------------------------------------

-- Recursion

WITH RecursiveEmployeeCTE AS(                      -- CTE -> Common Table Expression
	SELECT EmployeeID,ManagerID,EmployeeName
	FROM Employees
	WHERE ManagerId IS NULL
	UNION ALL
	SELECT e.EmployeeID,e.ManagerID,e.EmployeeName
	FROM Employees e
	INNER JOIN RecursiveEmployeeCTE r ON e.ManagerID = r.EmployeeID )
SELECT * FROM RecursiveEmployeeCTE


-----------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Sales (

    SaleID INT PRIMARY KEY,

    ProductID INT,

    Category VARCHAR(50),

    Amount DECIMAL(10, 2),

    SaleDate DATE

);
 
INSERT INTO Sales (SaleID, ProductID, Category, Amount, SaleDate) 

VALUES 

(1, 101, 'Electronics', 1500.00, '2024-01-15'),

(2, 102, 'Furniture', 800.00, '2024-01-16'),

(3, 103, 'Electronics', 2000.00, '2024-01-17'),

(4, 104, 'Electronics', 1200.00, '2024-02-01'),

(5, 105, 'Furniture', 900.00, '2024-02-03');

INSERT INTO SALES(SaleID, ProductID, Amount) VALUES(6,106,1000)

select * from sales
-------------------------------------------------------------------------------------------------------------------------------------

-- ROLLUP

SELECT Category,SUM(Amount) AS TotalSales
FROM Sales
GROUP BY ROLLUP(Category);

-------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2),
    OrderDate DATE
);
 
INSERT INTO Orders (OrderID, CustomerID, OrderAmount, OrderDate)
VALUES 
(1, 1, 500.00, '2024-01-15'),
(2, 2, 700.00, '2024-01-16'),
(3, 1, 300.00, '2024-01-17'),
(4, 3, 1200.00, '2024-02-01'),
(5, 2, 900.00, '2024-02-03');

SELECT * FROM ORDERS

-------------------------------------------------------------------------------------------------------------------------

-- CORELATED SUBQUERY

SELECT DISTINCT o1.CustomerId
FROM Orders o1
WHERE (
		SELECT COUNT(*)
		FROM Orders o2
		WHERE o2.CustomerId = o1.CustomerID ) > 1

------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ProductSales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Amount DECIMAL(10, 2),
    SaleDate DATE
);
 
INSERT INTO ProductSales (SaleID, ProductID, Amount, SaleDate)
VALUES 
(1, 101, 1500.00, '2024-01-15'),
(2, 102, 800.00, '2024-01-16'),
(3, 103, 2000.00, '2024-01-17'),
(4, 104, 1200.00, '2024-02-01'),
(5, 105, 900.00, '2024-02-03');

select * from productsales
------------------------------------------------------------------------------------------------------------------------------------------
-- VIEW

CREATE VIEW TotalSalesByProduct
WITH SCHEMABINDING AS
SELECT ProductID, SUM(Amount) AS TotalSales
FROM dbo.ProductSales
GROUP BY ProductID;

SELECT * FROM TotalSalesByProduct


-----------------------------------------------------------------------------------------------------------------------------------------------------------

-- EXAMPLES 

1. Filter and Aggregate on Join Results using SQL**
- Task: Join the `Orders` and `Customers` tables to find the total order amount per customer and filter out customers who have spent less than $1,000.

SELECT c.CustomerID,c.firstName,
SUM(o.OrderAmount) AS TotalSpent
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID,c.firstName
HAVING SUM(o.OrderAmount) >= 1000;

-------------------------------------------------------------------------------------------------------------------------------------------------


2. Cumulative Aggregations and Ranking in SQL Queries**
- Task: Create a cumulative sum of the `OrderAmount` for each customer to track the running total of how much each customer has spent.

SELECT c.CustomerID, c.FirstName, c.LastName, o.OrderAmount,SUM(o.OrderAmount) 
OVER (PARTITION BY c.CustomerID ORDER BY o.OrderDate) AS RunningTotal
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderDate;

-------------------------------------------------------------------------------------------------------------------------------------------------

3. OVER and PARTITION BY Clause in SQL Queries**
- Task: Rank the customers based on the total amount they have spent, partitioned by city.

WITH CustomerRank AS (
    SELECT c.CustomerID,c.FirstName,c.City,
    SUM(o.OrderAmount) AS TotalSpent
    FROM Orders o JOIN Customers c 
	ON o.CustomerID = c.CustomerID
    GROUP BY c.CustomerID, c.FirstName, c.City)
SELECT CustomerID,FirstName,City,TotalSpent,
    RANK() OVER (PARTITION BY City ORDER BY TotalSpent DESC) AS CityRank
FROM CustomerRank;


-------------------------------------------------------------------------------------------------------------------------------------------------


4. Total Aggregation using OVER and PARTITION BY in SQL Queries**
- Task: Calculate the total amount of all orders (overall total) and the percentage each customers total spending contributes to the overall total.

WITH CustomerTotals AS (
    SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.OrderAmount) AS TotalSpent
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.FirstName, c.LastName)
SELECT CustomerID, FirstName, LastName, TotalSpent,
       SUM(TotalSpent) OVER () AS Overall_Total,
       ROUND((TotalSpent / SUM(TotalSpent) OVER ()) * 100, 2) AS Percentage_Of_Total
FROM CustomerTotals;

-------------------------------------------------------------------------------------------------------------------------------------------------

5. Ranking in SQL**
- Task: Rank all customers based on the total amount they have spent, without partitioning.

SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.OrderAmount) AS TotalSpent,
       RANK() OVER (ORDER BY SUM(o.OrderAmount) DESC) AS OverallRank
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-------------------------------------------------------------------------------------------------------------------------------------------------


Here are additional tasks that build on the concepts of filtering, aggregating, ranking, and window functions in SQL:

*6. Task: Calculate the Average Order Amount per City**
- Task: Write a query that joins the `Orders` and `Customers` tables, calculates the average order amount for each city, and orders the results by the average amount in descending order.

SELECT c.City, AVG(o.OrderAmount) AS AverageOrderAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.City
ORDER BY AverageOrderAmount DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------

7. Task: Find Top N Customers by Total Spending**
- Task: Write a query to find the top 3 customers who have spent the most, using `ORDER BY` and `LIMIT`.

SELECT TOP 3 c.CustomerID, c.FirstName, c.LastName, SUM(o.OrderAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------


8. Task: Calculate Yearly Order Totals**
- Task: Write a query that groups orders by year (using `OrderDate`), calculates the total amount of orders for each year, and orders the results by year.

SELECT YEAR(o.OrderDate) AS OrderYear, SUM(o.OrderAmount) AS YearlyTotal
FROM Orders o
GROUP BY YEAR(o.OrderDate)
ORDER BY OrderYear;

-------------------------------------------------------------------------------------------------------------------------------------------------

9. Task: Calculate the Rank of Customers by Total Order Amount**
- Task: Write a query that ranks customers by their total spending, but only for customers located in "Mumbai". The rank should reset for each customer in "Mumbai".

SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.OrderAmount) AS TotalSpent, RANK() OVER (PARTITION BY c.City ORDER BY SUM(o.OrderAmount) DESC) AS RankInMumbai
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.City = 'Mumbai'
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.City;

-------------------------------------------------------------------------------------------------------------------------------------------------

10. Task: Compare Each Customer's Total Order to the Average Order Amount**
- Task: Write a query that calculates each customer's total order amount and compares it to the average order amount for all customers.

WITH CustomerTotals AS (
    SELECT c.CustomerID, c.FirstName, c.LastName, SUM(o.OrderAmount) AS TotalSpent
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.FirstName, c.LastName
),
AverageTotal AS (
    SELECT AVG(TotalSpent) AS AverageOrderAmount
    FROM CustomerTotals
)

SELECT ct.CustomerID, ct.FirstName, ct.LastName, ct.TotalSpent, at.AverageOrderAmount,
       CASE
           WHEN ct.TotalSpent > at.AverageOrderAmount THEN 'Above Average'
           WHEN ct.TotalSpent < at.AverageOrderAmount THEN 'Below Average'
           ELSE 'Average'
       END AS Comparison
FROM CustomerTotals ct, AverageTotal at;

-------------------------------------------------------------------------------------------------------------------------------------------------
