--Chapter 6 Demos

USE AP;

--Subquery
	--In WHERE,
	--AVING,
	--FROM, 
	--SELECT -Column Specification (first three table specifications)

--p. 161 Subquery WHERE
-- Return all invoices whose total is > avg invoice total

SELECT *
	FROM Invoices;

SELECT AVG(InvoiceTotal)
	FROM Invoices;

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices
WHERE InvoiceTotal >
	(SELECT AVG(InvoiceTotal)
	FROM Invoices)
ORDER BY InvoiceTotal;

-- p. 163 A query that uses an inner join
-- Join Invoices and Vendors, show InvoiceNo, INvoiceDate, InvoiceTotal 
-- for invoice vendors from CA

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices I
	JOIN Vendors V
 ON I.VendorID = V.VendorID
 WHERE VendorState = 'CA'
 ORDER BY InvoiceDate;

-- same query as a subquery

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal
	FROM Invoices I
 WHERE VendorID IN
 (SELECT VendorID 
 FROM Vendors 
 WHERE VendorState = 'CA')
 ORDER BY InvoiceDate;

 -- p. 165
 -- Vendors without invoices
 -- Selecting columns to reveal the vendors from vendors who aren't also listed distinctly from the vendor ID in Invoices

SELECT VendorID, VendorName, VendorState
	FROM Vendors
 WHERE VendorID NOT IN 
  (SELECT DISTINCT VendorID FROM Invoices);

-- same without subquery

SELECT V.VendorID, VendorName, VendorState
	FROM Vendors V
	LEFT JOIN Invoices I
	ON V.VendorID = I.VendorID
	WHERE I.VendorID IS NULL;

--p. 167 Invoice payment details, see Balance due where BD is less than avg BD

SELECT InvoiceNumber, InvoiceDate, (InvoiceTotal - PaymentTotal - CreditTotal) AS BalanceDue
 FROM Invoices
 WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0
  AND (InvoiceTotal - PaymentTotal - CreditTotal) <
  (SELECT AVG(InvoiceTotal - PaymentTotal - CreditTotal)
	FROM Invoices
  WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0)
ORDER BY InvoiceTotal DESC;

--p. 169 ALL keyword - equal to coding series of conditions connected by AND operators

SELECT InvoiceTotal
	FROM Invoices
 WHERE VendorID = 34;
 --All invoices whose total are > vendor id 34's invoices

SELECT VendorName, InvoiceNumber, InvoiceTotal
	FROM Invoices I
	JOIN Vendors V
	ON V.VendorID = I.VendorID
 WHERE InvoiceTotal > ALL
 (SELECT InvoiceTotal
	FROM Invoices
 WHERE VendorID = 34)
 ORDER BY VendorName;

--p. 171 ANY and SOME keywords (Works with Or) - asking if ANY or SOME (synonyms) are true
-- Invoice Totals for vendorid 115

SELECT InvoiceTotal
	FROM Invoices
 WHERE VendorID =115;

-- invoices < any of vendor 115's

SELECT *
	FROM Vendors V
	JOIN Invoices I
	ON I.VendorID = V.VendorID
 WHERE InvoiceTotal < ANY
	(SELECT InvoiceTotal
	FROM Invoices
 WHERE VendorID =115);

--p. 172 First paragraph of book - How to code correlated sub queries - loopin shit or some shit
-- Show vendor invoices that are above their own average of invoices

SELECT VendorID, InvoiceNumber, InvoiceTotal
	FROM Invoices I1
 WHERE InvoiceTotal >
	(SELECT AVG(INvoiceTotal) FROM Invoices I2
	 WHERE I2.VendorID =I1.VendorID)
	ORDER BY VendorID, InvoiceTotal

--p. 175 WHERE EXISTS / NOT EXISTS
--Used most often in correlated sub queries
-- Vendors w/out invoices

SELECT VendorID, VendorName, VendorState
	FROM Vendors V
 WHERE NOT EXISTS
  (SELECT*
	FROM Invoices I
	WHERE I.VendorID = V.VendorID)