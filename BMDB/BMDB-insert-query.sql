-- BMDB date
-- instert Movie records

USE BMDB
GO

SELECT *
	FROM Movie;

INSERT INTO Movie (Title, Year, Rating, Director)
VALUES ('Step Brothers', 2008, 'R', 'Adam McKay'),
	   ('Elf', 2003, 'PG', 'Jon Favreau');

SELECT *
	FROM Actor;

INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
	VALUES ('Will', 'Ferrell', 'M', '1967-07-16'),
		   ('Zooey', 'Deschanel', 'F', '1980-01-17'),
		   ('Peter', 'Dinklage', 'M', '1969-06-11'),
		   ('John C.','Reilly','M','1965-05-24'),
		   ('Mary','Steenburgen','F','1953-02-08');

-- add credits
SELECT *
	FROM Actor;
SELECT *
	FROM Movie;

-- Elf (2):
-- Will Ferrell (1) - Buddy
-- Zooey Deschanel (2) - Jovie
-- Peter Dinklage (3) - Miles Finch
-- Marty Steenburgen (5) - Emily Hobbs

-- Step Brothers (1):
-- Will Ferrell (1) - Brennan Huff
-- John C. Reilly (4) - Dale Doback
-- Mary Steenburgen (5) - Nancy Huff

INSERT INTO Credit (MovieID, ActorID, Role)
VALUES
	(2, 1, 'Buddy'),
	(2, 2, 'Jovie'),
	(2, 3, 'Miles Finch'),
	(2, 5, 'Emily Hobbs'),
	(1, 1, 'Brennan Huff'),
	(1, 4, 'Dale Doback'),
	(1, 5, 'Nancy Huff');

-- show credits with movie, acter, and the role

Select Title, CONCAT(FirstName, ', ', LastName) AS Actor, Role
	FROM Credit C
	JOIN Movie M
	ON M.ID = C.MovieID
	JOIN Actor A
	ON A.ID = C.ActorID
	