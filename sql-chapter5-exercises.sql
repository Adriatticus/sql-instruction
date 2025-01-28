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
Write a SELECT statement that returns three columns:
VendorName, InvoiceCount, and InvoiceSum.
InvoiceCount is the count of the number of invoices,
and InvoiceSum is the sum of the InvoiceTotal column.
Group the result set by vendor.
Sort the result set
so the vendor with the highest number of invoices appears first.
*/

SELECT VendorName, COUNT(InvoiceID) AS InvoiceCount,SUM(InvoiceTotal) AS InvoiceSum
	FROM Invoices I
	JOIN Vendors V
	ON V.VendorID = I.VendorID
	GROUP BY VendorName
	ORDER BY InvoiceCount DESC;

SELECT *
	FROM Invoices

-- Exercise 4

/*
Write a SELECT statement that returns three columns:
AccountDescription, LineItemCount, and LineItemSum.
LineItemCount is the number of entries in 
	the InvoiceLineItemstable that have that AccountNo.
LineItemSum is the sum of the InvoiceLineItemAmount
	column for that AccountNo.*/
	
SELECT AccountDescription, 
	COUNT(InvoiceID) AS LineItemCount,
	SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM GLAccounts GLA
	JOIN InvoiceLineItems ILI
	ON GLA.AccountNo = ILI.AccountNo
	GROUP BY AccountDescription
	HAVING COUNT(InvoiceID) > 1
	ORDER BY LineItemCount DESC;

/*Filter the result set to include only those rows with LineItemCount greater than 1. 
Group the result set by account description, and sort it by descending LineItemCount.
Hint: Join the GLAccounts table to the InvoiceLineItems table
*/

--Exercise 5

/*
Modify the solution to exercise 4 to filter for invoices
dated from October 1, 2022 to December 31, 2022.
Hint: Join the Invoices table so you can code 
a search condition based on InvoiceDate.
*/

SELECT AccountDescription,
	COUNT(ILI.InvoiceID) AS LineItemCount,
	SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM GLAccounts GLA
	JOIN InvoiceLineItems ILI
	ON GLA.AccountNo = ILI.AccountNo
	JOIN Invoices I
	ON I.InvoiceID = ILI.InvoiceID
	WHERE InvoiceDate BETWEEN '2022-10-1' AND '2022-12-31'
	GROUP BY AccountDescription
	HAVING COUNT(ILI.InvoiceID) > 1 
	ORDER BY LineItemCount DESC;

-- Exercise 6

/*
Write a SELECT statement that answers the following question: 
What is the total amount invoiced for each AccountNo? 
Use the ROLLUP operator to include a row that gives the grand total.
Hint: Use the InvoiceLineItemAmount column of the InvoiceLineItems table.
*/

SELECT AccountNo, 
	COUNT(*) AS InvoiceCount, 
	SUM(InvoiceLineItemAmount) AS InvoicesSum
	FROM InvoiceLineItems
	GROUP BY ROLLUP (AccountNO)
	--ORDER BY InvoicesSum

-- Exercise 7

/*
Write a SELECT statement that returns four columns: 
VendorName, Account-Description, LineItemCount, and LineItemSum.
LineItemCount is the row count, 
and LineItemSum is the sum of the InvoiceLineItemAmount column. 
For each vendor and account, 
return the number and sum of line items, 
sorted first by vendor, then by account description.
Hint: Use a four-table join
*/

SELECT GLA.AccountDescription,
 V.VendorName,
 COUNT('ROWS') AS LineItemCount, 
 SUM(InvoiceLineItemAmount) AS LineItemSum
	FROM GLAccounts GLA
	JOIN InvoiceLineItems ILI
	ON GLA.AccountNo = ILI.AccountNo
	JOIN Invoices I
	ON  I.InvoiceID = ILI.InvoiceID
	JOIN Vendors V
	ON V.VendorID = I.VendorID
	GROUP BY GROUPING SETS (V.VendorName, GLA.AccountDescription)
	ORDER By V.VendorName, GLA.AccountDescription

-- Exercise 8

/*
Write a SELECT statement that answers this question:
Which vendors are being paid from more than one account?
Return two columns: the vendor name and the total number of accounts that apply to that vendor’s invoices.
Hint: Use the DISTINCT keyword to count InvoiceLineItems.AccountNo.
*/

SELECT COUNT(DISTINCT ILI.AccountNo) TotalAccounts,
	V.VendorName
	FROM Invoices I
	JOIN InvoiceLineItems ILI
	ON I.InvoiceID = ILI.InvoiceID
	JOIN GLAccounts GLA
	ON GLA.AccountNo = ILI.AccountNo
	JOIN Vendors V
	ON V.VendorID = I.VendorID
	WHERE CreditTotal > 0
	GROUP BY V.VendorName
	HAVING COUNT(DISTINCT ILI.AccountNo) > 1
	ORDER BY VendorName
	
--Exercise 9

/*
Write a SELECT statement that returns six columns:VendorID From the Invoices table From the Invoices table From the Invoices tableInvoiceDate ^InvoiceTotal ^VendorTotal The sum of the invoice totals for each vendorVendorCount The count of invoices for each vendorVendorAvg The average of the invoice totals for each vendorThe result set should include the individual invoices for each vendor.
*/

SELECT I.VendorID, I.InvoiceDate, I.InvoiceTotal,
 SUM(I.InvoiceTotal) OVER (PARTITION BY I.InvoiceDate) AS VendorTotal, 
 COUNT(I.InvoiceID) OVER (PARTITION BY I.InvoiceDate) AS VendorCount, 
 AVG(I.InvoiceTotal) OVER (PARTITION BY I.InvoiceDate) AS VendorAvg
	FROM Invoices I
	--JOIN Vendors V
	--ON I.VendorID = V.VendorID
	ORDER BY I.VendorID;

SELECT VendorID, InvoiceDate, InvoiceTotal,
    SUM(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorTotal,
    COUNT(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorCount,
    AVG(InvoiceTotal) OVER (PARTITION BY VendorID) AS VendorAvg
FROM Invoices;


