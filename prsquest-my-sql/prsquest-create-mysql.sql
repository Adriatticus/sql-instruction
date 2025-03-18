-- create and select the database
DROP DATABASE IF EXISTS prsquest;
CREATE DATABASE prsquest;
USE prsquest;

-- create User table
-- DROP TABLE IF EXISTS User;
Create table User (
ID				INT				primary key auto_increment,
Username		VARCHAR(20)		NOT NULL,
Password		VARCHAR(10)		NOT NULL,
FirstName		VARCHAR(20)		NOT NULL,
LastName		VARCHAR(20)		NOT NULL,
PhoneNumber		VARCHAR(12)		NOT NULL,
Email			VARCHAR(75)		NOT NULL,
CharacterName	VARCHAR(20)		NOT NULL,
Job				VARCHAR(25)		NOT NULL,
Title			VARCHAR(50)		NULL,
Reviewer		BIT				NOT NULL,
Admin			BIT				NOT NULL,
CONSTRAINT uname UNIQUE (Username),
CONSTRAINT charname UNIQUE (CharacterName)
);

-- create Vendor table
-- DROP TABLE IF EXISTS Vendor;
Create table Vendor(
ID				INT					primary key auto_increment,
Code			VARCHAR(10)			NOT NULL,
Name			VARCHAR(255)		NOT NULL,
Address			VARCHAR(255)		NOT NULL,
City			VARCHAR(255)		NOT NULL,
State			VARCHAR(2)			NOT NULL,
Zip				VARCHAR(5)			NOT NULL,
PhoneNumber		VARCHAR(12)			NOT NULL,
Email			VARCHAR(100)		NOT NULL,
CONSTRAINT vcode UNIQUE (Code)
);

-- create Product table
-- DROP TABLE IF EXISTS Product;
Create table Product(
ID				INT				primary key auto_increment,
VendorID		INT				NOT NULL,
PartNumber		VARCHAR(50)		NOT NULL,
Name			VARCHAR(150)	NOT NULL,
Price			DECIMAL(10,2)	NOT NULL,
Unit			VARCHAR(255)	NULL,
PhotoPath		VARCHAR(255)	NULL,
CONSTRAINT vendorpart UNIQUE (VendorID, PartNumber),
CONSTRAINT FK_ProductVendor FOREIGN KEY (VendorID) REFERENCES Vendor(ID)
);

-- create Vendor table
-- DROP TABLE IF EXISTS Vendor;
Create table Request(
ID					INT				primary key auto_increment,
UserID				INT				NOT NULL,
RequestNumber		VARCHAR(20)		NOT NULL,
Description			VARCHAR(100)	NOT NULL,
Justification		VARCHAR(255)	NOT NULL,
DateNeeded			DATE			NOT NULL,			
DeliveryMode		VARCHAR(25)		NOT NULL,
Status				VARCHAR(20)		DEFAULT 'NEW',	
Total				DECIMAL(10,2)	DEFAULT 0.0,
SubmittedDate		DATETIME		NOT NULL,
ReasonForRejection	VARCHAR(100)	NULL,
CONSTRAINT FK_RequestUser FOREIGN KEY (UserID) REFERENCES User(ID)
);

-- create Vendor table
-- DROP TABLE IF EXISTS Vendor;
Create table LineItem(
ID				INT		primary key auto_increment,	
RequestID		INT		NOT NULL,
ProductID		INT		NOT NULL,
Quantity		INT		NOT NULL,
CONSTRAINT reqpdt UNIQUE (RequestID, ProductID),
CONSTRAINT FK_LineReq FOREIGN KEY (RequestID) REFERENCES Request(ID),
CONSTRAINT FK_LinePro FOREIGN KEY (ProductID) REFERENCES Product(ID)
);

-- create a user and grant privileges to that user
DROP USER IF EXISTS prsquest_user@localhost;
CREATE USER prsquest_user@localhost IDENTIFIED BY 'sesame';
GRANT SELECT, INSERT, DELETE, UPDATE ON prsquest.* TO prsquest_user@localhost;