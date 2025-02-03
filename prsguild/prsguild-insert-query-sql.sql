--prsguild insert query

USE prsguild;

--insert 2 users

INSERT INTO [User] (Username, Password, FirstName, LastName, PhoneNumber, Email, CharacterName, Class, Title, Reviewer, Admin)
VALUES
	('Adrian', 'password', 'Adrian', 'Johnson', '318-900-1988', 'Adriatticus@prsguild.com', 'Adriatticus', 'Paladin', 'Guild Master', 0, 1),
	('Travis', 'changeme', 'Travis', 'Boettjer', '909-900-1988', 'Travatticus@prsguild.com', 'Travatticus', 'Mageblade', 'The Patient', 1, 0);

INSERT INTO [User] (Username, Password, FirstName, LastName, PhoneNumber, Email, CharacterName, Class, Title, Reviewer, Admin)
VALUES
	('Matt', 'password', 'Matt', 'Houp', '311-900-1988', 'Matatticus@prsguild.com', 'Matatticus', 'Death Knight', 'Blade of Ruin', 1, 0);

SELECT *
	FROM [User];
SELECT *
	FROM Vendor;

-- insert 3 vendors

INSERT INTO Vendor (UserID, ShopCode, Profession, Zone, Town)
VALUES
	(1, '7ALGM', 'Cooking', 'Plains of Eternal Light', 'Clifftop Retreat'),
	(2, '7ALAL', 'Alchemy', 'Sunken Hollow', 'Mage Tower'),
	(3, '7ALBS', 'Black Smithing', 'Scoured Barrens', 'Festering Undertow');

--I need 10 products -- Mild Spices, Flint and Tinder, Simple Wood, Raw Spotted Snapper, Cheerbloom, Empty Vial, Kingsleaf, Herbalist's Pouch, Copper Ore, Smith's Hammer, Flux, Four Leather Belt

SELECT *
	FROM [Product];

INSERT INTO [Product] (VendorID, Partnumber, Name, Price, Stack, PhotoPath),
VALUES
	()



