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