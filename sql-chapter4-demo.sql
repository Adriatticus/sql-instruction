-- Chapter 4 Demos

-- Vendors and Invoices tables

SELECT *
	FROM Vendors;

SELECT *
	FROM Invoices
ORDER BY VendorID;

-- which vendors have we invoiced? (done business with us)
-- which vendors have we not done business with?
-- which vendors have spent the most money with us?

-- p. 103 join Vendors and Invoices
SELECT *
	FROM Invoices
	JOIN Vendors on Vendors.VendorID = Invoices.VendorID;
-- All vendors who have been invoiced

SELECT InvoiceNumber, VendorName
	FROM Invoices
	JOIN Vendors on Vendors.VendorID = Invoices.VendorID;
-- Easier to read than above (added specified SELECT)

--p. 105 - aliases in joins w/ AS keyword
SELECT InvoiceNumber, VendorName
	FROM Invoices AS Inv
	JOIN Vendors AS Ven on Ven.VendorID = Inv.VendorID;

SELECT InvoiceNumber, VendorName
	FROM Invoices AS I
	JOIN Vendors AS V on V.VendorID = I.VendorID;

--simplest form
SELECT InvoiceNumber, VendorName
	FROM Invoices I
	JOIN Vendors V on V.VendorID = I.VendorID;

-- add in a calculated column, where, order by
SELECT InvoiceNumber, VendorName, InvoiceDueDate, (InvoiceTotal - PaymentTotal - CreditTotal) AS BalanceDue
	FROM Invoices I
	JOIN Vendors V on V.VendorID = I.VendorID
	WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0
ORDER BY InvoiceDueDate DESC;

--p. 107 fully qualified object names
SELECT *
	FROM AP.dbo.Vendors;

--p. 109 joining on multiple things
-- join Invoices to InvoiceLineItems AND InvoiceTotal to InvoiceLineItemAmount
SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, InvoiceLineItemAmount
	FROM Invoices I
	JOIN InvoiceLineItems LI ON I.InvoiceID = LI.InvoiceID
	AND I.InvoiceTotal > LI.InvoiceLineItemAmount
ORDER BY InvoiceNumber;



