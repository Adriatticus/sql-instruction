--Chapter 6 Exercises

USE AP;

--Exercise 1

/*
1. Write a SELECT statement that returns the same result set as this SELECT statement. 
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
	 FROM Invoices)
	ORDER BY VendorName;

--Exercise 2

/*
Write a SELECT statement that answers this question: Which invoices have a PaymentTotal that’s greater than the average PaymentTotal for all paid invoices? Return the InvoiceNumber and InvoiceTotal for each invoice.*/SELECT AVG(PaymentTotal) --1566.43	FROM InvoicesSELECT PaymentTotal, InvoiceNumber, InvoiceTotal	FROM Invoices	WHERE (InvoiceTotal - PaymentTotal -CreditTotal) <= 0	AND PaymentTotal >	 (SELECT AVG(PaymentTotal) --1566.43	 FROM Invoices)ORDER BY PaymentTotal;--Exercise 3?/* Write a SELECT statement that answers this question:Which invoices have a PaymentTotal that's greater than the medianPaymentTotal for all paid invoices?(The median marks the midpoint in a set of values. In other words,an equal number of values lie above and below the median value.)Return the InvoiceNumber and InvoiceTotal for each invoice.*/SELECT PaymentTotal, InvoiceNumber, InvoiceTotal	FROM Invoices	WHERE (InvoiceTotal - PaymentTotal -CreditTotal) <= 0	AND PaymentTotal > ALL	 (SELECT TOP 50 PERCENT AVG(PaymentTotal) --1566.43	 FROM Invoices)ORDER BY PaymentTotal;--Exercise 4--Write a SELECT statement that returns two columns from the GLAccounts table:--AccountN. and AccountDescription--The Result set should have one row for each account number--That has never been used--Use a correlated subquery introduced with the NOT EXISTS operator--Sort the final result set by AccountNo.SELECT AccountNo, AccountDescription	FROM GLAccounts GLI WHERE NOT EXISTS(SELECT *	FROM InvoiceLineItems ILI	WHERE ILI.AccountNo = GLI.AccountNo);SELECT *	FROM GLAccounts--Exercise 5/*Write a SELECT statement that returns four columns:VendorName, InvoiceID, InvoiceSequence, and InvoiceLineItemAmountFor each invoice that has more than one line itemin the InvoiceLineItems*/SELECT VendorName, I.InvoiceID, InvoiceSequence,InvoiceLineItemAmount	FROM InvoiceLineItems, Vendors, Invoices ISELECT *	FROM InvoiceLineItems	WHERE InvoiceSequence < 1	(SELECT COUNT/* Write a SELECT statementthat represents the sum of the largest unpaid invoices submitted by each vendor.Use a dervived table that returns MAX(InvoiceTotal)Grouped by VendorID, filtering for invoices with a balance*/