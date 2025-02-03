-- Chapter 7

USE BMDB;

-- update and delete

SELECT *
	FROM Movie;

-- Insert a test/dummy record

INSERT INTO Movie (Title, Year, Rating, Director)
 VALUES ('Test', 2025, 'R', 'Test Director');

-- get a record by ID (primary key)

SELECT *
	FROM Movie
 WHERE ID = 3;

-- update Test Movie to Test Movie 2, year 2026

UPDATE Movie
	SET Title = 'Test 2',
	Year = 2026
 WHERE ID = 3;

-- delete

DELETE Movie
	WHERE ID = 3;

SELECT *
	FROM Movie

-- copy the movie table into MovieCopy

SELECT *
	INTO MovieCopy
	FROM Movie;

SELECT *
	FROM MovieCopy;

ALTER TABLE MovieCopy
ALTER COLUMN Rating VARCHAR(5) NULL;

INSERT
	INTO MovieCopy (Title, Year, Director)
	VALUES ('EZClapper$', 2026, 'Adrian, Travis')
	
