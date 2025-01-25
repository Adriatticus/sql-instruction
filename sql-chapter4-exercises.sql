--Chapter 4 Exercises -p. 132, 133
USE AP;

--Exercise 1
-- Write a SELECT statment that return all columns from:
--Vendors tables inner-joined with the invoices table
SELECT *
	FROM Invoices I
	JOIN Vendors V ON V.VendorID = I.VendorID 
	ORDER BY V.VendorID;
--Exercise 2
-- Write a SELECT statement that returns four columns:
-- 1) VendorName > From V table
-- 2) InvoiceNumber > From I table
-- 3) InvoiceDate > From I table
-- 4) Balance > InvoiceTotal - (PaymentTotal + CreditTotal)
SELECT *
	FROM Invoices;
SELECT *
	FROM Vendors;

SELECT VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
	FROM Invoices I
	JOIN Vendors V ON V.VendorID = I.VendorID
	WHERE InvoiceTotal - (PaymentTotal + CreditTotal) <> 0
	ORDER BY V.VendorName;
-- I feel like I'd want the Vendor ID displayed as well for easy reference in other tables when used as a foriegn key but I had difficulties doing both.
-- OK I figured it out by adding V.VendorID on the SELECT line

--Exercise 3
-- Write a SELECT statement that return three columns:
-- VendorName > V table
--DefaultAccountNo > V table
-- AccountDescription > GLAccounts (GLA) table
SELECT VendorName, DefaultAccountNo
	FROM Vendors;

SELECT VendorName, DefaultAccountNo, AccountDescription
	FROM GLAccounts GLA
	JOIN Vendors V ON V.DefaultAccountNo = GLA.AccountNo;
--Sniff out what they have in common

--Exercise 4 exercise 2 but with implicit syntax
--Generate the same result set described in ex. 2, but use:
--the implicit join syntax -p. 115
-- Write a SELECT statement that returns four columns:
-- 1) VendorName > From V table
-- 2) InvoiceNumber > From I table
-- 3) InvoiceDate > From I table
-- 4) Balance > InvoiceTotal - (PaymentTotal + CreditTotal)
SELECT *
	FROM Invoices;
SELECT *
	FROM Vendors;

SELECT VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
	FROM Invoices I, Vendors V
	WHERE V.VendorID = I.VendorID
	AND InvoiceTotal - (PaymentTotal + CreditTotal) <> 0
	ORDER BY V.VendorName;

-- Exercise 5
-- Write a SELECT statement that returns five columns fromt 3 tables:
-- All using the folling column aliases:
--1 Vendor VendorName column
--2 Date InvoiceDate column
--3 Number InvoiceNumber column
--4 # InvoiceSequence column
--5 LineItem INvoiceLineItemAmount column
--	Aliases V = Vendors table I = Invoices table LI = InvoiceLineItems table
--	ORDER BY Vendor, Date, Number, and #







	
