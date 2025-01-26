USE MyGuitarShop;

--Tables review
SELECT *
	FROM Addresses;

SELECT *
	FROM Administrators;

SELECT *
	FROM Categories;

SELECT *
	FROM Customers;

SELECT *
	FROM OrderItems;

SELECT *
	FROM Orders;

SELECT *
	FROM Products;

-- Chapter 4

-- Exercise 1

/* 1. Write a SELECT statement that joins the Categories table to the Products table and
returns these columns: CategoryName, ProductName, ListPrice.
Sort the result set by CategoryName and then by ProductName in ascending order. */

SELECT CategoryName, ProductName, ListPrice
	FROM Categories C
	JOIN Products P
	ON C.CategoryID = P.CategoryID;

Select c.CategoryName, p.ProductName, p.ListPrice 
	FROM Categories c, Products p
	WHERE C.CategoryID = P.CategoryID;

SELECT * 
	FROM Products; 

-- Exercise 2

/*Write a SELECT statement that joins the Customers table to the Addresses table and
returns these columns: FirstName, LastName, Line1, City, State, ZipCode.
Return one row for each address for the customer with an email address of
allan.sherwood@yahoo.com.*/

SELECT FirstName, LastName, Line1, City, A.State, ZipCode
	FROM Customers C
	JOIN Addresses A
	ON C.CustomerID = A.CustomerID
	WHERE C.EmailAddress = 'allan.sherwood@yahoo.com';

-- Exercise 3

/* 
Write a SELECT statement that joins the Customers table to the Addresses table and
returns these columns: FirstName, LastName, Line1, City, State, ZipCode.
Code the join so only addresses that are the shipping address for a customer are
returned.
*/

SELECT FirstName, LastName, Line1, City, A.State, ZipCode
	FROM Customers C
	JOIN Addresses A
	ON C.CustomerID = A.CustomerID
	WHERE C.ShippingAddressID = A.AddressID;

SELECT *
	FROM Addresses;

SELECT *
	FROM Customers
	WHERE ShippingAddressID = 5;

-- Exercise 4

/*Write a SELECT statement that joins the Customers, Orders, OrderItems, and
Products tables. This statement should return these columns: LastName, FirstName,
OrderDate, ProductName, ItemPrice, DiscountAmount, and Quantity.
Use aliases for the tables.
Sort the final result set by LastName, OrderDate, and ProductName.*/

SELECT C.LastName, C.FirstName, O.OrderDate, P.ProductName, OI.ItemPrice, OI.DiscountAmount, OI.Quantity
	FROM Customers C
	JOIN Orders O
	ON C.CustomerID = O.CustomerID
	JOIN OrderItems OI
	ON O.OrderID = OI.OrderID 
	JOIN Products P
	ON P.ProductID = OI.ProductID
ORDER BY LastName, OrderDate, ProductName;

SELECT C.LastName, C.FirstName, O.OrderDate, P.ProductName, OI.ItemPrice, OI.DiscountAmount, OI.Quantity
	FROM Customers C, Orders O, OrderItems OI, Products P
	WHERE C.CustomerID = O.CustomerID
	AND O.OrderID = OI.OrderID
	AND P.ProductID = OI.ProductID
	ORDER BY LastName, OrderDate, ProductName;
--T

-- Exercise 5

/*
Write a SELECT statement that returns the ProductName and ListPrice columns from
the Products table.
Return one row for each product that has the same list price as another product.
(Hint: Use a self-join to check that the ProductID columns aren’t equal but the
ListPrice column is equal.)
Sort the result set by ProductName.
*/

SELECT P1.ProductName, P1.ListPrice, P1.ProductID
	FROM Products P1
	JOIN Products P2
	ON P1.ListPrice = P2.ListPrice
	AND P1.ProductID <> P2.ProductID
ORDER BY P1.ProductName;