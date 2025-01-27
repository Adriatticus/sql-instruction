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

--Exercise 4
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
-- Write a SELECT statement that returns five columns from 3 tables:
-- All using the folling column aliases:
--1 Vendor VendorName column
--2 Date InvoiceDate column
--3 Number InvoiceNumber column
--4 # InvoiceSequence column
--5 LineItem INvoiceLineItemAmount column
--	Aliases V = Vendors table I = Invoices table LI = InvoiceLineItems table
--	ORDER BY Vendor, Date, Number, and #
SELECT VendorName Vendor, InvoiceDate 'Date', InvoiceNumber Number, InvoiceSequence #, InvoiceLineItemAmount LineItem
	FROM Vendors V, Invoices I, InvoiceLineItems LI;

--Exercise 6
-- Write a SELECT statement that returns three columns:
--VendorID from Vendors V tabl
--VendorName from V table
--Name - A concatination of VendorContactFName and VendorContactLName, with a space in between
-- The result set should have one row for each vendor whose contact has the same first name as another vendor's contact
-- ORDER BY Name
-- Use a self-join
SELECT V1.VendorID, V1.VendorName, V1.VendorContactFName + ' ' + V1.VendorContactLName 'Name'
 FROM Vendors V1
 JOIN Vendors V2 ON V1.VendorContactFName = V2.VendorContactFName
 AND V1.VendorID <> V2.VendorID
ORDER BY V1.VendorContactFName + ' ' + V1.VendorContactLName;
-- Why does <> function that way and with both VendorID AND VendorContactLName AND VendorName

--Exercise 7
--Write a SELECT statement that returns two columns from the LGAccounts table:
--AccountNo and AccountDescription
--The result set should have one row for each account number that has never been used
--ORDER BY AccountNO
--use an outter join to the InvoiceLineItems table

SELECT GLA.AccountNo, GLA.AccountDescription
	FROM GLAccounts GLA LEFT JOIN InvoiceLineItems ILI
	ON GLA.AccountNo = ILI.AccountNo
	WHERE ILI.AccountNo IS NULL;

--Exercise 8

/*
 Use the UNION operator to generate a result set consisting of two columns from the Vendors table:
 VendorName and VendorState.
 If the vendor is in California, the VendorState value should be “CA”;
 otherwise, the VendorState value should be “Outside CA.” Sort the final result set by VendorName.
*/

SELECT VendorName, 'CA' AS VendorState
	FROM Vendors
	WHERE VendorState = 'CA'
UNION ALL
SELECT VendorName, 'Outside CA' AS VendorState
	FROM Vendors
	WHERE VendorState <> 'CA'
ORDER BY VendorName










	
