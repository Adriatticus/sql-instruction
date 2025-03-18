-- prsquest insert query

USE prsquest;
SELECT *
	FROM REQUEST
    WHERE STATUS = 'REVIEW' AND USERID != 1;
-- insert 2 users

SELECT *
	FROM User;

INSERT INTO User (Username, Password, FirstName, LastName, PhoneNumber, Email, CharacterName, Job, Title, Reviewer, Admin)
VALUES
	('Adrian', 'password', 'Adrian', 'Johnson', '318-900-1988', 'Adriatticus@prsguild.com', 'Adriatticus', 'Paladin', 'Guild Master', 0, 1),
	('Travis', 'changeme', 'Travis', 'Boettjer', '909-900-1988', 'Travatticus@prsguild.com', 'Travatticus', 'Mageblade', 'The Patient', 1, 0);

-- Unused User

-- INSERT INTO User (Username, Password, FirstName, LastName, PhoneNumber, Email, CharacterName, Job, Title, Reviewer, Admin)
-- VALUES
-- 	('Matt', 'password', 'Matt', 'Houp', '311-900-1988', 'Matatticus@prsguild.com', 'Matatticus', 'Death Knight', 'Blade of Ruin', 1, 0);

SELECT *
	FROM User;
SELECT *
	FROM Vendor;

-- insert 3 vendors BlackSmith, Mystic, Outfitter

INSERT INTO Vendor (Code, Name, Address, City, State, Zip, PhoneNumber, Email)
VALUES 
	('BS', 'Argoth, the Blacksmith', '6000 Bright Forge Passage', 'The Cauldron', 'DS',/*Dragon Maw Summit*/'47851', '918-107-8891', 'Argoth@BSGuild.com'),
	('MY', 'Malavander, the Mystic', '1 Mage Tower Square', 'Scholars Apptitude', 'SC',/*Shimmering Coast*/'14714', '414-404-1404', 'Malavander@MYGuild.com'),
	('OF', 'Simon the Outfitter', '12 Wildlife Corridor', 'Hunters Haven', 'KW',/*Kingswood*/'51141','415-585-5114','Simon@OFGuild.com');


-- I need 10 products -- Game Jerky, Flint and Tinder, Leather Flask, Health Potion, Enchanted Gnarled Staff, Scroll of Water Breathing, Bronze Sword, Hero's Shield, Adventurer's Breastplate, Four Leather Belt

SELECT *
	FROM Product
 ORDER BY Price;

INSERT INTO Product (VendorID, Partnumber, Name, Price, Unit)
VALUES
	(3, '1', 'Game Jerky', 0.55, '1'),
	(3, '2', 'Leather Flask', 2.50, '1'),
	(3, '3', 'Flint and Tinder', 0.15, '1'),
	(3, '4', 'Four Leather Belt', 4.00, '1'),
	(2, '5', 'Health Potion',0.80 ,'1'),
	(2, '6', 'Enchanted Gnarled Staff', 8.00, '1'),
	(2, '7', 'Scroll of Water Breathing', 15.00, '1'),
	(1, '8', 'Adventurer''s Breastplate', 12.00, '1'),
	(1, '9', 'Bronze Short Sword', 7.00, '1'),
	(1, '10', 'Banded Buckler', 5.00,'1');

SELECT *
	FROM Request;
SELECT *
	FROM LineItem;

INSERT INTO Request (UserID, RequestNumber, Description, Justification, DateNeeded, DeliveryMode, Total, SubmittedDate, ReasonForRejection)
VALUES
	(1, '1', 'A chance to increse the guild warchest!', 'I recived a tip that a looter toosed a handsome bounty into a deep underwater cavern just before being caught by his pursuers. I believe the cost of a Scroll of Water Breathing would be greatly offset by the retrieval of said bounty!', '2025-02-05', 'PickUp', 15.00, '2025-02-05', 'You''re just too green right now. You likely don''t have enough stamina for the swim,');

INSERT INTO LineItem (RequestID, ProductID, Quantity)
VALUES
	(3, 7, 1);

-- Adriatticus Wants to buy a Scroll of Water Breathing for 15g

SELECT CharacterName, P.Name, R.Total
	FROM Request R
	JOIN LineItem LI ON R.ID = LI.RequestID
	JOIN Product P ON P.ID = LI.ProductID
	JOIN User U ON U.ID = R.UserID;