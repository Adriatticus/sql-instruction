--Chapter 5 Exercises

USE AP;

--Exercise 1

/*
Write a SELECT statement that returns two columns from the Invoices table:
VendorID and PaymentSum,
where PaymentSum is the sum of the PaymentTotal column.
Group the result set by VendorID.
*/

SELECT VendorID, SUM(PaymentTotal) AS PaymentSum
	FROM Invoices
	GROUP BY VendorID;

--Exercise 2

/*
Write a SELECT statement that returns two columns:
VendorName and PaymentSum,
where PaymentSum is the sum of the PaymentTotal column.
Group the result set by VendorName. 
Return only 10 rows,
corresponding to the 10 vendors who’ve been paid the most. 
*/

SELECT TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSum
	FROM Invoices I
	JOIN Vendors V
	ON V.VendorID = I.VendorID
	GROUP BY VendorName;

-- Exercise 3

/*
Write a SELECT statement that returns three columns:VendorName, InvoiceCount, and InvoiceSum.InvoiceCount is the count of the number of invoices,and InvoiceSum is the sum of the InvoiceTotal column.Group the result set by vendor.Sort the result setso the vendor with the highest number of invoices appears first.*/SELECT VendorName, COUNT(InvoiceID) AS InvoiceCount,SUM(InvoiceTotal) AS InvoiceSum
	FROM Invoices I
	JOIN Vendors V
	ON V.VendorID = I.VendorID
	GROUP BY VendorName	ORDER BY InvoiceCount DESC;SELECT *	FROM Invoices-- Exercise 4/*Write a SELECT statement that returns three columns:AccountDescription, LineItemCount, and LineItemSum.LineItemCount is the number of entries in 	the InvoiceLineItemstable that have that AccountNo.LineItemSum is the sum of the InvoiceLineItemAmount	column for that AccountNo.*/	SELECT AccountDescription, 	COUNT(InvoiceID) AS LineItemCount,	SUM(InvoiceLineItemAmount) AS LineItemSum	FROM GLAccounts GLA	JOIN InvoiceLineItems ILI	ON GLA.AccountNo = ILI.AccountNo	GROUP BY AccountDescription	HAVING COUNT(InvoiceID) > 1	ORDER BY LineItemCount DESC;/*Filter the result set to include only those rows with LineItemCount greater than 1. Group the result set by account description, and sort it by descending LineItemCount.Hint: Join the GLAccounts table to the InvoiceLineItems table*/--Exercise 5