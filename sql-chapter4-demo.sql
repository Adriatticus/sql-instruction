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