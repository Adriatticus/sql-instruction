--Chapter 3 exercise 1
SELECT VendorContactLName, VendorContactFName, VendorName
	FROM Vendors;

--Chapter 3 exercise 2
SELECT 
InvoiceNumber AS Number,
InvoiceTotal AS Total,
PaymentTotal + CreditTotal AS Credits,
InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
	FROM Invoices;

--Chapter 3 exercise 3
SELECT VendorContactLName + ', ' + VendorContactFName AS 'Full Name'
	FROM Vendors;

--Chapter 3 exercise 4
SELECT InvoiceTotal,
InvoiceTotal * .1 AS "10%",
InvoiceTotal * .1 + InvoiceTotal AS "Plus 10%"
	FROM Invoices
WHERE InvoiceTotal * .1 + InvoiceTotal > 1000
ORDER BY InvoiceTotal DESC;

--Chapter 3 exercise 5
SELECT 
InvoiceNumber AS Number,
InvoiceTotal AS Total,
PaymentTotal + CreditTotal AS Credits,
InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
	FROM Invoices
Where InvoiceTotal - (PaymentTotal + CreditTotal) BETWEEN 500 AND 10000;

--Chapter 3 excercise 6
SELECT 
VendorContactLName + ', ' + VendorContactFName AS 'Full Name'
	FROM Vendors
WHERE 
VendorContactLName LIKE 'A%' 
OR VendorContactLName LIKE 'B%' 
OR VendorContactLName LIKE 'C%' 
OR VendorContactLName LIKE 'E%'
--NOT D
;

--Chapter 3 exercise 7
SELECT PaymentDate, InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
	FROM Invoices
WHERE (PaymentDate IS NOT NULL AND InvoiceTotal - (PaymentTotal + CreditTotal) > 0) or (PaymentDate IS NULL AND InvoiceTotal - (PaymentTotal + CreditTotal) <= 0);







