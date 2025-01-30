--prsguild create

USE master
GO

DROP DATABASE IF EXISTS prsguild

CREATE DATABASE prsguild
GO

USE prsguild

-- User Table

CREATE TABLE User
UserID			INT				IDENTITY(1,1) 
Username		VARCHAR(20)		NOT NULL
[Password]		VARCHAR(10)		NOT NULL
FirstName		VARCHAR(20)		NOT NULL
LastName		VARCHAR(20)		NOT NULL
PhoneNumber		VARCHAR(12)		NOT NULL
Email			VARCHAR(75)		NOT NULL
Reviewer		BIT				NOT NULL
[Admin]			BIT				NOT NULL