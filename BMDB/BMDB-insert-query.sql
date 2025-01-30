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

-- Inserting Sonic Movies ( All 3 )
-- I might want to do my movie data base around video game movies. 
--Lean into how generally awful movie adaptations of video games are.

INSERT INTO Movie (Title, Year, Rating, Director)
VALUES
 ('Sonic the Hedgehog', 2020, 'PG', 'Jeff Fowler'),
 ('Sonic the Hedgehog 2', 2022, 'PG', 'Jeff Fowler'),
 ('Sonic the Hedgehog 3', 2024, 'PG', 'Jeff Fowler');

 -- Insert Actors
 /*
 Ben Schwartz - Sonic
 Jim Carrey - Ivo Robotnik, Gerald Robotnik 
 James Marsden
 Tika Sumpter
 Adam Pally
 Lee Majdoub
 Keanu Reeves - Shadow
 Colleen O'Shaughnessey - Tails
 Idris Elbs - Knuckles
*/

INSERT INTO Actor (FirstName, LastName, Gender, Birthdate)
	VALUES
 ('Ben', 'Schwartz', 'M', '1981-09-15'),
 ('Jim', 'Carrey', 'M', '1962-01-17'),
 ('James', 'Marsden', 'M', '1973-09-18'),
 ('Tika', 'Sumpter', 'F', '1980-06-20'),
 ('Adam', 'Pally', 'M', '1982-03-18'),
 ('Lee', 'Majdoub', 'M', '1982-05-31'),
 ('Keanu', 'Reeves', 'M', '1964-09-02'),
 ('Colleen', 'O\''Shaughnessey', 'F', '1971-09-15'),
 ('Idris', 'Elba', 'M', '1972-09-06')

SELECT Title, FirstName, Role
	FROM Movie M
	JOIN Credit C
	ON C.MovieID = M.ID
	JOIN Actor A
	ON C.ActorID = A.ID

UPDATE Actor
	SET LastName = 'O''Shaughnessey'
 WHERE Actor.ID = 13;

--Update Credit with Sonice (1,2,3) Actors
SELECT *
	FROM Actor;
SELECT *
	FROM Movie;
SELECT *
	FROM Credit;

INSERT INTO Credit (MovieID, ActorID, Role)
VALUES
--SONIC 1
 (3,6,'Sonic'),
 (3,7,'Ivo Robotnik'),
 (3,8,'Tom'),
 (3,9,'Maddie'),
 (3,10,'Wade'),
 (3,11,'Agent Stone'),
--SONIC 2 - Sonic1 Plus Tails and Knuckles
 (4,6,'Sonic'),
 (4,7,'Ivo Robotnik'),
 (4,8,'Tom'),
 (4,9,'Maddie'),
 (4,10,'Wade'),
 (4,11,'Agent Stone'),
 (4,13,'Tails'),
 (4,14,'Knuckles'),
--SONIC 3 - Sonic2 Plus Shadow
 (5,6,'Sonic'),
 (5,7,'Ivo Robotnik, Gerald Robotnik'),
 (5,8,'Tom'),
 (5,9,'Maddie'),
 (5,10,'Wade'),
 (5,11,'Agent Stone'),
 (5,13,'Tails'),
 (5,14,'Knuckles'),
 (5,12,'Shadow')


 




