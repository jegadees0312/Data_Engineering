1. Calculate the total amount spent by each customer.

SELECT c.Customer_ID,c.Customer_Name,
SUM(p.quantity * p.price) AS Total_amount_spent
FROM Customers c JOIN Products p 
ON c.ProductID = p.ProductID
GROUP BY c.CustomerID;
------------------------------------------------------------------------------------------------
 
2. Find customers who have spent more than $1,000 in total.

SELECT c.Customer_ID,c.Customer_Name,
SUM(p.quantity * p.price) AS Total_amount_spent
FROM Customers c JOIN Products p 
ON c.ProductID = p.ProductID
GROUP BY c.CustomerID HAVING SUM(p.quantity * p.price) > 1000
----------------------------------------------------------------------------------------------
 
3. Find Product Categories with More Than 5 Products

SELECT CategoryName,
COUNT(ProductID) AS Products
FROM Products
GROUP BY CategoryName
HAVING COUNT(ProductID) > 5
-----------------------------------------------------------------------------------------------

 4. Calculate the total number of products for each category and supplier combination.

SELECT CategoryID, SupplierID, 
COUNT(ProductID) AS TotalCount
FROM Products
GROUP BY CategoryID, SupplierID;
-----------------------------------------------------------------------------------------------

5. Summarize total sales by product and customer, and also provide an overall total.

SELECT c.CustomerID,p.ProductID,
SUM(p.price) AS TotalSales
FROM Customers c JOIN Products p
ON c.ProductID = p.ProductID GROUP BY 
GROUPING SETS ((c.CustomerID, c.ProductID),())
--------------------------------------------------------------------------------------------------
-- STORED PROCEDURES
1. Stored Procedure with INSERT Operation

CREATE PROCEDURE InsertProducts
    @product_id INT,
    @product_name VARCHAR(30),
    @price Decimal(10,2)
AS
BEGIN
    INSERT INTO Products(product_id,product_name,price)
    VALUES (@product_id, @product_name, @price)
END

EXEC InsertProducts @product_id=2 , @product_name='SmartPhone' ,@price=20000 ;
-----------------------------------------------------------------------------------------------------------------
2. Stored Procedure with UPDATE operation

CREATE PROCEDURE UpdateProducts
    @product_id INT,
    @product_name VARCHAR(20)
    @price DECIMAL(10,2)
AS
BEGIN
    UPDATE Products
    SET product_name =@product_name,
        price = @price
    WHERE product_id = @product_id
END

EXEC UpdateProducts @product_id=2 ,@product_name='Laptp',@price=10000;
-------------------------------------------------------------------------------------------------------------------
3.Stored Procedure with DELETE operation

CREATE PROCEDURE DeleteProduct
    @product_id INT
AS
BEGIN
    DELETE FROM  Products
    WHERE product_id = @product_id
END

EXEC Deleteproduct @product_id=1 ;
--------------------------------------------------------------------------------------------------------------------

1. Hands-on Exercise: Filtering Data using SQL Queries
Retrieve all products from the Products table that belong to the category 'Electronics' and have a price greater than 500.

SELECT productid,productname FROM products 
WHERE category = 'Electronics' AND price > 500
-----------------------------------------------------------------------------------------------------------------------------------------

2. Hands-on Exercise: Total Aggregations using SQL Queries
Calculate the total quantity of products sold from the Orders table.

SELECT SUM(quantity) AS Total_Quantity
FROM orders
-----------------------------------------------------------------------------------------------------------------------------------------

3. Hands-on Exercise: Group By Aggregations using SQL Queries
Calculate the total revenue generated for each product in the Orders table.

SELECT p.productname,Sum(o.quantity * o.totalamount) AS Total_Revenue
FROM products p JOIN orders o ON o.productid = p.productid
GROUP BY p.productname
--------------------------------------------------------------------------------------------------------------------------------------------

4. Hands-on Exercise: Order of Execution of SQL Queries
Write a query that uses WHERE, GROUP BY, HAVING, and ORDER BY clauses and explain the order of execution.

SELECT orderid, COUNT(*) AS Total_Count
FROM orders
WHERE orderdate >= '2024-01-01'
GROUP BY orderid
HAVING COUNT(*) > 0
ORDER BY Total_count DESC;
--------------------------------------------------------------------------------------------------------------------------------------------

5. Hands-on Exercise: Rules and Restrictions to Group and Filter Data in SQL Queries
Write a query that corrects a violation of using non-aggregated columns without grouping them.

SELECT SUM(totalamount) FROM orders

SELECT orderid,SUM(totalamount) FROM orders GROUP BY orderid

-------------------------------------------------------------------------------------------------------------------------------------------
6. Hands-on Exercise: Filter Data based on Aggregated Results using Group By and Having
Retrieve all customers who have placed more than 5 orders using GROUP BY and HAVING clauses.

SELECT c.customerid,count(o.quantity) as Totalorders 
FROM customers c JOIN orders o 
ON c.customerid = o.orderid
GROUP BY c.customerid HAVING COUNT(quantity) > 0
----------------------------------------------------------------------------------------------------------------------------------------------

1. Basic Stored Procedure
Create a stored procedure named GetAllCustomers that retrieves all customer details from the Customers table.

CREATE PROCEDURE GetAllCustomers
AS
BEGIN
    SELECT * FROM Customers
END 

EXEC GetAllCustomers
--------------------------------------------------------------------------------------------------------------------------------------------

2. Stored Procedure with Input Parameter
Create a stored procedure named GetOrderDetailsByOrderID that accepts an OrderID as a parameter and retrieves the order details for that specific order.

CREATE PROCEDURE GetOrderDetailsByOrderID
    @orderid INT
AS
BEGIN
    SELECT * FROM Orders
    WHERE OrderID = @orderid
END

EXEC GetOrderDetailsByOrderID @orderid=2
-----------------------------------------------------------------------------------------------------------------------------------------------

3. Stored Procedure with Multiple Input Parameters
Create a stored procedure named GetProductsByCategoryAndPrice that accepts a product Category and a minimum Price as input parameters and retrieves all products that meet the criteria.

CREATE PROCEDURE GetProductsByCategoryAndPrice
      @category VARCHAR(50),
	  @minPrice DECIMAL(10,2)
AS
BEGIN
    SELECT * FROM Products
    WHERE Category = @category AND Price >= @minPrice
END 

EXEC GetProductsByCategoryAndPrice @category='electronics',@minprice=200
----------------------------------------------------------------------------------------------------------------------------------------------------
4. Stored Procedure with Insert Operation
Create a stored procedure named InsertNewProduct that accepts parameters for ProductName, Category, Price, and StockQuantity and inserts a new product into the Products table.


CREATE PROCEDURE InsertNewProduct
   @ProductName VARCHAR(50),
   @category VARCHAR(50),
   @Price DECIMAL(10,2),
   @StockQuantity INT
AS
BEGIN
    INSERT INTO Products (ProductName, Category, Price, StockQuantity)
    VALUES (@ProductName, @Category,@Price,@StockQuantity);
END

EXEC InsertNewProduct @ProductName='Tab',@category='electronics',@Price=20000,@StockQuantity=2
----------------------------------------------------------------------------------------------------------------------------------------------------
5. Stored Procedure with Update Operation
Create a stored procedure named UpdateCustomerEmail that accepts a CustomerID and a NewEmail parameter and updates the email address for the specified customer.

CREATE PROCEDURE UpdateCustomerEmail
  @CustomerID INT,
  @NewEmail VARCHAR(30)
AS
BEGIN
    UPDATE Customers
    SET Email = @NewEmail
    WHERE CustomerID = @CustomerID
END 

EXEC UpdateCustomerEmail @CustomerID=2,@NewEmail='fwtaf@gmail.com'
-----------------------------------------------------------------------------------------------------------------------------------------------
6. Stored Procedure with Delete Operation
Create a stored procedure named DeleteOrderByID that accepts an OrderID as a parameter and deletes the corresponding order from the Orders table.

CREATE PROCEDURE DeleteOrderByID
   @OrderID INT
AS
BEGIN
    DELETE FROM Orders
    WHERE OrderID = @OrderID;
END 

EXEC DeleteOrderByID @OrderID=6
------------------------------------------------------------------------------------------------------------------------------------------------

7. Stored Procedure with Output Parameter
Create a stored procedure named GetTotalProductsInCategory that accepts a Category parameter and returns the total number of products in that category using an output parameter.

CREATE PROCEDURE GetTotalProductsInCategory
	@Category VARCHAR(50),
	@TotalProducts INT OUTPUT
AS
BEGIN
    select @TotalProducts = count(*)
    from Products
    where Category = @Category
END

declare @Total INT
exec GetTotalProductsInCategory @Category='Electronics',@TotalProducts=@Total OUTPUT;
select @Total AS TotalProductsInCategory;
select * from Products;
------------------------------------------------------------------------------------------------------------------------------------------------
