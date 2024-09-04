 
 use product_value
 
 CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    order_date DATE)
    
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price int)

INSERT INTO Orders (order_id, product_id, quantity, order_date) VALUES
(1, 1, 2, '2024-08-01'),
(2, 2, 1, '2024-08-02'),
(3, 3, 3, '2024-08-03'),
(4, 1, 1, '2014-03-04'),
(5, 4, 4, '2024-08-05'),
(6, 5, 2, '2014-03-06');

INSERT INTO Products (product_id, product_name, price) VALUES
(1, 'Laptop', 88.00),
(2, 'Smartphone', 500.00),
(3, 'Tablet', 300.00),
(4, 'Headphones', 50.00),
(5, 'Monitor', 150.00);

Select product_name,price,quantity,order_date 
From Products Inner Join Orders
On Products.product_id=Orders.product_id

Select product_name,price,quantity,order_date 
From Products Left Join Orders
On Products.product_id=Orders.product_id

Select product_name,price,quantity,order_date 
From Products Right Join Orders
On Products.product_id=Orders.product_id

Select p.product_name,p.price,o.quantity,o.order_date 
From Products p Inner Join Orders o
On p.product_id=o.product_id

Select product_name,price,quantity,order_date 
From Products Left Join Orders
On Products.product_id=Orders.product_id

Select product_name,price,quantity,order_date 
From Products Right Join Orders
On Products.product_id=Orders.product_id

Select product_name,price,quantity,order_date 
From Products full outer Join Orders
On Products.product_id=Orders.product_id

-- Grouping for multiple columns 
select p.product_name,o.order_date,sum(o.quantity) as Total_quantity from orders o join products p on o.product_id=p.product_id
group by grouping SETS(o.product_name),(o.order_date));

-- Subquery
select o.order_id,o.product_id ,(select p.product_name from products p where p.product_id=o.product_id) as Product_name from orders o

-- Exits
select u.user_id,u.user_name from users where Exists (select 1 from orders o where o.user_id = u.user_id);

-- Any
select p.product_name,p.price from products p where p.price > any (select price from products where product_name like 'smart%')

-- All
select p.product_name,p.price from products p where p.price > All (select price from products where product_name like 'smartphone%')

-- Nested subquery
select user_id,user_name from users 
where user_id in (select user_id from orders where product_id in 
(select product_id from products where price > 1000))

-- Union
select 'price of product diff' as type,product_name  from products where price >500
union
select 'value'as typ ,product_name from products where product_name like 'smart%'

-- Intersect
select product_name  from products where price >500
Intersect
select product_name from products where product_name like 'lap%'

-- Except
select product_name  from products where price >500
Except
select product_name from products where product_name like 'smart%'

-- Case
select product_id,product_name,
Case
when price >300 Then 'Price is high'
when price <=300 Then 'price is low'
End as 'Price Range'
From products

-- IFNULL
select name,IFNULL(departmentid,0) departID from tblemployee
select name,IFNULL(departmentid,'NO Value') departID from tblemployee
select name,COALESCE(departmentid,0) departID from tblemployee  -- it will select the first not null value

-- Current user
select current_user

-- If
select product_name ,if(price>300,'high','low') from products

-- Functions
select product_name ,Upper(product_name) As uppercase_of_productname from products 
select product_name ,lower(product_name) As lowercase_of_productname from products
select product_name ,Substring(product_name,1,3) As trimmed_from_1to3 from products
select product_name,charindex('a',product_name) as First_occurance_of_letter from products
select product_name ,LEN(product_name) As length_of_productname from products
select product_name ,Ltrim(product_name) As remove_left_space from products
select product_name ,Rtrim(product_name) As remove_right_space from products
select product_name ,Ltrim(Rtrim(product_name)) As remove_left_space_and_right_space from products
select product_name ,Replace(product_name,'phone','device') As replaced_value from products
select product_name ,Concat(product_name,'-',price) As concated_value from products
select product_name ,Left(product_name,3) As first_three_characters from products
select product_name ,Right(product_name,3) As last_three_characters from products
select product_name ,Reverse(product_name) As reversed_value from products
select product_name ,Format(product_name,'N2') As formated_value from products
select product_name ,REPLICATE(product_name,3) As repeatedName from products


-- Dates
select GETDATE() As Currentdate,
DATEADD(Day,10,GETDATE()) AS Future_Date

select DATEADD(year,-1,GETDATE()) AS Date_minus_oneyear

Select DATEDIFF(day,2024-01-12,CURRENTDATE()) as daysdifference

select Format('2024-01-12','MMMM-dd-yyyy') as formateddate

Select DATEDIFF(month,'2024-12-03','2024-08-20') as monthdifference

desc orders

-- Math Functions
select product_name, Round(price,2) from products

select product_name, Ceiling(price) from products

select product_name, Floor(price) from products

select product_name, price, price % 5 as Modulo_price from products

select product_name, SQRT(price) from products

select product_name, Power(price,3) from products

select ABS(MAX(price)-MIN(price)) as Pricediffference from products

select product_name, price,ROUND(RAND() * 100,2) as RandomValues from products

select product_name, price,LOG(price) as logvalues from products


-- STORED PROCEDURES
CREATE PROCEDURE DEMO
AS
BEGIN
    SELECT * FROM products
END 
EXEC demo

CREATE PROCEDURE GetProductById
 @ProductID INT
AS
BEGIN
    SELECT * FROM products
    WHERE Product_id = @ProductID
END ;
EXEC GetProductById @ProductID=1;

CREATE PROCEDURE GetProductByCategoryandPrice
 @product_name VARCHAR(20),
 @price DECIMAL(10,2)
AS
BEGIN
    SELECT * FROM products
    WHERE product_name = @category AND Price > @price
END ;
EXEC GetProductByCategoryandPrice @product_name = 'smartphone', @price='100' ;
--------------------------------------------------------------------------------------------------

CREATE PROCEDURE ProcessOrder
    @ProductID INT,
    @Quantity INT,
    @OrderDate DATE
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Insert the order
        INSERT INTO Orders (ProductID, Quantity, OrderDate)
        VALUES (@ProductID, @Quantity, @OrderDate);

        -- Update the product stock
        UPDATE Products
        SET StockQuantity = StockQuantity - @Quantity
        WHERE ProductID = @ProductID;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        
        -- Handle errors, such as logging or rethrowing
        -- Example of rethrowing the error
        THROW;
    END CATCH;
END;
 ----------------------------------------------------------------------------------------------------
CREATE PROCEDURE AdjustStock
    @orderID INT,
    @Adjustment INT
AS
BEGIN
    IF @Adjustment > 0
    BEGIN
        -- Add to stock
        UPDATE orders
        SET Quantity = Quantity + @Adjustment
        WHERE order_ID = @orderID;
    END
    ELSE IF @Adjustment < 0
    BEGIN
        -- Subtract from stock
        UPDATE orders
        SET Quantity = Quantity + @Adjustment
        WHERE order_ID = @orderID;
    END
END;

EXEC AdjustStock @orderID = 1, @Adjustment = 2;  -- Increase stock by 2
EXEC AdjustStock @orderID = 1, @Adjustment = -1;  -- Decrease stock by 1
----------------------------------------------------------------------------------------------------------------------
use company
create procedure a
as 
begin
select * from customers
select * from orders
select * from products
end

exec a
 


