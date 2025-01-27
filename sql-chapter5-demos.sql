SQL-Chapter5-Demo

USE AP;

-- p.137 114 rows in Invoices table.
-- # of invoices, sum total due where totalk due > 0

SELECT *
	FROM Invoices;

SELECT InvoiceNumber,
(InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
	FROM Invoices
	WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0

-- how many invoices have a balance due? Total Due?

SELECT COUNT(*) As NumberOfInvoices, SUM(InvoiceTotal - PaymentTotal - CreditTotal) AS TotalDue
	FROM Invoices
WHERE InvoiceTotal - PaymentTotal -CreditTotal > 0

-- how many total invoices, avg inv total, total inv amount?
-- for invoices after 7/1/22

SELECT 'After 7/1/2022' AS SelectionDate,
	COUNT(*) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AvgInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount
	FROM Invoices
	WHERE InvoiceDate > '2022-07-01';

-- p. 139 MIN and MAX

SELECT 'After 7/1/2022' AS SelectionDate,
	COUNT(*) AS NumberOfInvoices,
	MAX(InvoiceTotal) AS HighestInvoiceAmount,
	MIN(InvoiceTotal) AS LowestInvoiceAmount
	FROM Invoices
	WHERE InvoiceDate > '2022-07-01';

-- p139 (NON numeric) First or Last vendor, alphabetically?

SELECT MIN(VendorName) AS FirstVendor,
	MAX(VendorName) AS LastVendor,
	COUNT(VendorName) AS NumberOFVendors
	FROM Vendors;

-- p139 DISTINCT keyword used in summary queries
-- distinct # of vendors

SELECT COUNT(DISTINCT VendorID) AS NumerOFVendors,
	COUNT(*) AS NumberOfInvoices,
	AVG(InvoiceTotal) AS AvgInvoiceAmount,
	SUM(InvoiceTotal) AS TotalInvoiceAmount
	FROM Invoices;

-- p140, 141 Group and summarize date GROUP BY and HAVING
-- get average inv amount by vendor
-- Avg over $2000

SELECT VendorID, AVG(InvoiceTotal) AS AvgInvAmt
	FROM Invoices
	GROUP BY VendorID
	HAVING AVG(InvoiceTotal) > 2000
ORDER BY AvgInvAmt;

-- p. 143 # of invoices by vendor

SELECT VendorID, COUNT(*) AS InvoiceQty
	FROM Invoices
	GROUP BY VendorID;

-- p. vendors by state and city
-- with inv qty and inv avg

SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQtyInvoiceTotal, AVG(InvoiceTotal) AS INvoiceAvg
	FROM Invoices I
	JOIN Vendors V
	ON I.VendorID = V.VendorID
	GROUP BY VendorState, VendorCity
	ORDER BY VendorState, VendorCity;

-- limit the results using HAVING clause

SELECT VendorState, VendorCity, COUNT(*) AS InvoiceQtyInvoiceTotal, AVG(InvoiceTotal) AS INvoiceAvg
	FROM Invoices I
	JOIN Vendors V
	ON I.VendorID = V.VendorID
	GROUP BY VendorState, VendorCity
	HAVING COUNT(*) >=2
	ORDER BY VendorState, VendorCity;

-- p. 145 search condidtion in the HAVING clause

SELECT VendorName, COUNT(*) AS InvoiceQty,
	AVG(InvoiceTotal) AS InvoiceAvg
	FROM Vendors V
	JOIN Invoices I
	ON V.VendorID = I.VendorID
GROUP BY VendorName
HAVING AVG(InvoiceTotal) > 500
ORDER BY InvoiceQty DESC;

-- p. 145 seach condition in the WHERE clause

SELECT VendorName, COUNT(*) AS InvoiceQty,
	AVG(InvoiceTotal) AS InvoiceAvg
	FROM Vendors V
	JOIN Invoices I
	ON V.VendorID = I.VendorID
WHERE InvoiceTotal > 500
GROUP BY VendorName
ORDER BY InvoiceQty DESC;

-- p. 149 Invoices by Vendor, grouped, to get invoice count and invoice total w/ summary row

SELECT VendorID, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
	FROM Invoices
GROUP BY ROLLUP(VendorID);

-- ROLLUP multiple columns:
--vendors for IA and NJ
--ROLLUP by vendor state and vendor city

SELECT VendorState, VendorCity, COUNT(*) AS QtyVendors
	FROM Vendors
WHERE VendorState IN ('IA' , 'NJ')
GROUP BY ROLLUP (VendorState, VendorCity)
ORDER BY VendorState DESC, VendorCity DESC;

-- p. 151 CUBE - similar to roll up but adds summary rows for something?

/* SELECT VendorID, COUNT(*) as InvoiceCount,
	SUM(InvoiceTotal) AS InvoiceSum
	FROM Invoices
	GROUP BY CUBE(VendorID) */

SELECT VendorState, VendorCity, COUNT(*) AS QtyVendors
	FROM Vendors
WHERE VendorState IN ('IA' , 'NJ')
GROUP BY CUBE (VendorState, VendorCity)
ORDER BY VendorState DESC, VendorCity DESC;

-- p. 153 grouping sets

SELECT VendorState, VendorCity, COUNT(*) AS QtyVendors
	FROM Vendors
WHERE VendorState IN ('IA' , 'NJ')
GROUP BY GROUPING SETS (VendorState, VendorCity)
ORDER BY VendorState DESC, VendorCity DESC;

-- COMPOSITE GROUPING

SELECT VendorState, VendorCity, VendorZipCode, COUNT(*) AS QtyVendors
	FROM Vendors
WHERE VendorState IN ('IA' , 'NJ')
GROUP BY GROUPING SETS ((VendorState, VendorCity), VendorZipCode, ())
ORDER BY VendorState DESC, VendorCity DESC;

-- p. 155 

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal,
	SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateTotal,
	SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateCount,
	SUM(InvoiceTotal) OVER (PARTITION BY InvoiceDate) AS DateAvg
	FROM Invoices
