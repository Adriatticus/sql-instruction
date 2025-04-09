drop table if exists user;

Create table User (
ID 					integer 			primary key auto_increment,
UserName			varchar(20) 		not null unique,
Password 			varchar(10) 	not null,
FirstName 			varchar(20) 	not null,
LastName 			varchar(20) 	not null,
PhoneNumber 		varchar(12) 	not null,
IsAdmin 			tinyint 		default 1 not null
);

insert into user (ID, UserName, Password, FirstName, LastName, PhoneNumber, IsAdmin) VALUES
	(1, 'hgilmore', 'hockey', 'Happy', 'Gilmore', '513-555-4020', 1),
	(2, 'dgrohl', 'rocknroll', 'Dave', 'Grohl', '111-222-3333', 0);
   