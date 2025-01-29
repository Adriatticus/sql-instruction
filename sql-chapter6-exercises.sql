--Chapter 6 Exercises

USE AP;

--Exercise 1

/*
1. Write a SELECT statement that returns the same result set as 
this SELECT statement. 
Substitute a subquery in a WHERE clause for the inner join. 
*/

SELECT DISTINCT VendorName
	FROM Vendors V
	JOIN Invoices I
	ON V.VendorID = I.VendorID
ORDER BY VendorName;

SELECT DISTINCT VendorName
	FROM Vendors V
	WHERE VendorID IN
	(SELECT VendorID
	FROM Invoices I)
ORDER BY VendorName;

/*
SELECT DISTINCT VendorName
	FROM Vendors V
	WHERE EXISTS
	(SELECT VendorID
	 FROM Invoices I
	 WHERE V.VendorID = I.VendorID)
	ORDER BY VendorName;
I like it
*/





--Exercise 2

/*
Write a SELECT statement that answers this question: 
Which invoices have a PaymentTotal that’s greater than 
the average PaymentTotal for all paid invoices? 
Return the InvoiceNumber and InvoiceTotal for each invoice.
*/

SELECT AVG(PaymentTotal) --1733.72
	 FROM Invoices
	 WHERE PaymentTotal <> 0;

SELECT InvoiceNumber, InvoiceTotal
	FROM Invoices
	WHERE PaymentTotal >
	(SELECT AVG(PaymentTotal) --1733.22
	 FROM Invoices
	 WHERE PaymentTotal <> 0);


/* I was wrong. I made more of a balance due type line first. The way the question is presented 
I think I would have understood "PaymentTotal for all invoices that have made a payment"
because in my mind "PaymentTotal for all paid invoices" reads as all invoices that are paid off -
And therefore would no longer have a balance either.
*/

SELECT InvoiceNumber, InvoiceDate, (InvoiceTotal - PaymentTotal - CreditTotal) AS BalanceDue, PaymentTotal
 FROM Invoices
 WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0;

 /*
 After looking at the above results I determined that all invoices that had a PaymentTotal <> 0
 were the only invoices that didn't have a balance due.
 This determines that there are no invoices that made a payment that didn't pay in full. So I don't even need to make 
 the code that could exclude that as well.
 I suppose that if this information was already available to those that requested the information you could
 use the correct answer above
*/

--Exercise 3?

/* Write a SELECT statement that answers this question:
Which invoices have a PaymentTotal that's greater than the median
PaymentTotal for all paid invoices?
(The median marks the midpoint in a set of values. In other words,
an equal number of values lie above and below the median value.)
Return the InvoiceNumber and InvoiceTotal for each invoice.
*/

SELECT InvoiceNumber, InvoiceTotal
	FROM Invoices
	WHERE PaymentTotal > ALL
	(SELECT TOP 50 PERCENT(PaymentTotal)
	FROM Invoices
	WHERE PaymentTotal <> 0);
	
	


--Exercise 4

--Write a SELECT statement that returns two columns from the GLAccounts table:
--AccountN. and AccountDescription
--The Result set should have one row for each account number
--That has never been used
--Use a correlated subquery introduced with the NOT EXISTS operator
--Sort the final result set by AccountNo.

SELECT AccountNo, AccountDescription
	FROM GLAccounts GLI
 WHERE NOT EXISTS
(SELECT *
	FROM InvoiceLineItems ILI
	WHERE ILI.AccountNo = GLI.AccountNo);

SELECT *
	FROM GLAccounts

--Exercise 5

/*
Write a SELECT statement that returns four columns:
VendorName, InvoiceID, InvoiceSequence, and InvoiceLineItemAmount
For each invoice that has more than one line item
in the InvoiceLineItems
*/

SELECT V.VendorName, I.InvoiceID, ILI.InvoiceSequence, ILI.InvoiceLineItemAmount
	FROM Vendors V
	JOIN Invoices I
	ON V.VendorID = I.VendorID
	JOIN InvoiceLineItems ILI
	ON I.InvoiceID = ILI.InvoiceID
	WHERE I.InvoiceID IN
	 (SELECT InvoiceID
	 FROM InvoiceLineItems
	 WHERE InvoiceSequence > 1)

--Exercise 6

/* 
Write a SELECT statement
that represents the sum of the largest unpaid invoices submitted by 
each vendor.
Use a dervived table that returns MAX(InvoiceTotal)
Grouped by VendorID, filtering for invoices with a balance
*/

/* SELECT MAX(InvoiceTotal)
	FROM Invoices
	JOIN
	 (SELECT */
	 
SELECT VendorName, SUM(I.InvoiceTotal) AS UnpaidSum, I.VendorID
	FROM Vendors V
	JOIN
	(SELECT MAX(InvoiceTotal) AS MAXInvoiceTotal, VendorID
		FROM Invoices
		WHERE InvoiceTotal > (PaymentTotal + CreditTotal)
		GROUP BY VendorID) AS MAXInvoices
	ON V.VendorID = MAXInvoices.VendorID
	JOIN Invoices I
	ON I.VendorID = V.VendorID
	AND I.InvoiceTotal = MAXInvoices.MAXInvoiceTotal
	WHERE (InvoiceTotal > PaymentTotal + CreditTotal)
	GROUP BY V.VendorName, I.VendorID

SELECT VendorID, MAX(InvoiceTotal) as BD
	FROM Invoices
	WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0
	GROUP BY VendorID

SELECT SUM(InvoiceMax) MAXAMAXIMUS
FROM (SELECT VendorID, MAX(InvoiceTotal) AS InvoiceMax
      FROM Invoices
      WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
      GROUP BY VendorID) AS MaxInvoice;

--Exercise 7

/*
Write a SELECT statement that returns the 
name, city, and state 
of each vendor that’s located in a unique city and state.
In other words, don’t include vendors that have a city and state
in common with another vendor.
*/

SELECT VendorID, VendorName, VendorState, VendorCity
	FROM Vendors
 ORDER BY VendorState, VendorCity;

 SELECT V1.VendorName, V1.VendorState, V1.VendorCity, V1.VendorID
	FROM Vendors V1
	WHERE V1.VendorID NOT IN
	(SELECT DISTINCT V2.VendorID
	FROM Vendors V2
	JOIN Vendors V3
	ON V3.VendorState = V2.VendorState
	AND V3.VendorCity = V2.VendorCity
	AND V3.VendorID <> V2.VEndorID)
	ORDER BY VendorID

--subquery - returning vendor ids for vendors who have same city/state combos
-- Included: 68, 93, 96, 51, 52, 18
-- Excluded: 20, 29, 64, 37

SELECT DISTINCT V2.VendorID
	FROM Vendors V2
	JOIN Vendors V3
	ON V3.VendorState = V2.VendorState
	AND V3.VendorCity = V2.VendorCity
	AND V3.VendorID <> V2.VEndorID
 ORDER BY V2.VendorID;

 ORDER BY VendorState, VendorCity

 --My Guitar Shop Exercise

USE MyGuitarShop;

--Exercise 1

 SELECT DISTINCT CategoryName
	FROM Products P
	JOIN Categories C
	ON C.CategoryID = P.CategoryID;

SELECT DISTINCT (CategoryName)
	FROM Categories
	WHERE CategoryID IN
	(SELECT DISTINCT CategoryID
	FROM Products);

SELECT DISTINCT CategoryID
	FROM Products;

--Exercise 4
/*
A) Write a SELECT statement that returns three columns: EmailAddress, OrderID, and 
the order total for each order. To do this, you can group the result set by the 
EmailAddress and OrderID columns. Then, you can calculate the order total from the 
columns in the OrderItems table.
B) Write a second SELECT statement that uses the first SELECT statement in its FROM 
clause. The main query should return two columns: the customer’s email address and 
the largest order for that customer. To do this, you can group the result set by the 
EmailAddress column
*/

SELECT *
	FROM Orders O
	JOIN Customers C
	ON C.CustomerID = O.CustomerID
	JOIN OrderItems OI
	ON OI.OrderID = O.OrderID
	





