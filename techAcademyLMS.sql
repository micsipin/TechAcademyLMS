create DATABASE db_TechAcademy_LMS
USE db_TechAcademy_LMS


	--==MEMBERS-
	CREATE TABLE MEMBERS (
		cardNum INT PRIMARY KEY NOT NULL ,
		fName VARCHAR(50)  NOT NULL ,
		lName VARCHAR(50)  NOT NULL ,
		mAddress VARCHAR(75)  NOT NULL ,
		mPhone VARCHAR(50)  NOT NULL 
	);
	--==BRANCH-
	CREATE TABLE BRANCH (
		branchID INT PRIMARY KEY NOT NULL ,
		branchName VARCHAR(75)  NOT NULL ,
		branchAddress VARCHAR(75)  NOT NULL 
	);
	--==PUBLISHERS- 
	CREATE TABLE PUBLISHERS (
		publisherName VARCHAR(75) PRIMARY KEY NOT NULL ,
		publisherAddress VARCHAR(75)  NOT NULL ,
		publisherPhone VARCHAR(20)  NOT NULL 
	);
	--==AUTHORS-
	CREATE TABLE AUTHORS (
		authorID INT IDENTITY (1,1)  NOT NULL ,
		authorName VARCHAR(75) PRIMARY KEY NOT NULL 
	);
	--==BOOKS-
	CREATE TABLE BOOKS (
		bookID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		title VARCHAR(75)  NOT NULL ,
		publisherName VARCHAR(75) CONSTRAINT fk_book_publisherName FOREIGN KEY REFERENCES PUBLISHERS(publisherName) ON UPDATE CASCADE ON DELETE CASCADE,
		authorName VARCHAR(75) CONSTRAINT fk_book_authorName FOREIGN KEY REFERENCES AUTHORS(authorName) ON UPDATE CASCADE ON DELETE CASCADE
	);
	--==BOOKLOANS-
	CREATE TABLE BOOKLOANS (
		branchID INT  NOT NULL FOREIGN KEY REFERENCES BRANCH(branchID),
		bookID INT  NOT NULL FOREIGN KEY REFERENCES BOOKS(bookID),
		dateFrom date  NOT NULL ,
		dateDue date  NOT NULL ,
		cardNum INT  NOT NULL FOREIGN KEY REFERENCES MEMBERS(cardNum)
	);
	--==COPIES-
	CREATE TABLE COPIES (
		bookID INT NOT NULL CONSTRAINT fk_bookid_copies FOREIGN KEY REFERENCES BOOKS(bookID) ON UPDATE CASCADE ON DELETE CASCADE,
		branchID INT NOT NULL CONSTRAINT fk_branchid FOREIGN KEY REFERENCES BRANCH(branchID) ON UPDATE CASCADE ON DELETE CASCADE,
		numOfCopies VARCHAR(20)  NOT NULL 
	);
	

	--==POPULATE TABLES
	
	

	INSERT INTO AUTHORS 
		(authorName)
		VALUES
		('Blum, Richard'),
		('Butler, Tom'),
		('Rankins, Ray'),
		('Meyer, Eric A'),
		('Byars, Betsy Cromer'),
		('Taylor, Allen G.'),
		('Viescas, John L.'),
		('Forta, Ben'),
		('Dewson, Robin'),
		('Marriott, Edward'),
		('Cline, Ernest'),
		('King, Stephen'),
		('Child, Lee'),
		('Burgess, Anthony'),
		('Cervantes Saavedra, Miguel de'),
		('Handford, Martin'),
		('Thompson, Hunter S.')
	;	


			
	INSERT INTO PUBLISHERS
		(publisherName, publisherAddress, publisherPhone)
		VALUES
		('John Wiley & Sons', '1 Wiley Dr, Somerset, NJ 08873', '732-537-9410'),
		('SitePoint Pty Ltd', '48 Cambridge St,Collingwood VIC 3066', '465-435-4774'),
		('Sams', '9850 East 30th Street Indianapolis, IN 46229', '800-428-7267'),
		('O''Reilly', '1005 Gravenstein Hwy N, Sebastopol, CA 95472','707-827-7000'),
		('Henry Holt and Company, Inc', '175 Fifth Avenue, New York, NY 10010','646-307-5095'),
		('Addison-Wesley', '10 East 53rd Street, New York, NY 10022','617-848-7500'),
		('Springer Science+Business Media','233 Spring Street,New York, NY 10013-1578USA','212-460-1500'),
		('Crown','222 Rosewood Drive, Danvers, MA 01923','978-750-8400'),
		('Anchor Books','1745 Broadway, New York, NY 10019','212-940-7390'),
		('Penguin Books USA', '405 Murray Hill Pkwy, East Rutherford, NJ 07073','201-933-9292'),
		('Bantam Dell', '1745 Broadway, New York, NY 10019','212-782-9000'),
		('Norton','500 Fifth Avenue, New York City, New York','212-354-5500'),
		('Ecco','0 E. 53rd Street New York, NY 10022', '212-207-7000'),
		('Candlewick Press','99 Dover Street, Somerville, MA 02144', '617-661-0565'),
		('Vintage Books','1745 Broadway, New York, NY 10019','212-782-9000')
	;	



	INSERT INTO BOOKS
		(title, publisherName,authorName)
		VALUES
		('PHP,MYSQL & JAVASCRIPT ALLINONE','John Wiley & Sons','Blum, Richard'),
		('PHP&MYSQL:Novice to Ninja','SitePoint Pty Ltd','Butler, Tom'),
		('Microsoft SQL SERVER 2014','Sams','Rankins, Ray'),
		('Basic Visual Formatting in CSS','O''Reilly','Meyer, Eric A'),
		('Dog Diaries','Henry Holt and Company, Inc','Byars, Betsy Cromer'),
		('SQL for Dummies','John Wiley & Sons','Taylor, Allen G.'),
		('SQL Queries for Mere Mortals','Addison-Wesley','Viescas, John L.'),
		('Sams Teach Yourself Oracle PL/SQL in 10 Minutes','Sams','Forta, Ben'),
		('Beginning SQL Server 2012 for Developers','Springer Science+Business Media','Dewson, Robin'),
		('The Lost Tribe','Henry Holt and Company, Inc','Marriott, Edward'),
		('Ready Player One','Crown','Cline, Ernest'),
		('The Stand','Anchor Books','King, Stephen'),
		('IT','Penguin Books USA','King, Stephen'),
		('Nothing to Lose: A Jack Reacher Novel','Bantam Dell','Child, Lee'),
		('A Clockwork Orange','Norton','Burgess, Anthony'),
		('Don Quixote','Ecco','Cervantes Saavedra, Miguel de'),
		('Where''s Waldo?','Candlewick Press','Handford, Martin'),
		('Fear and Loathing in Las Vegas','Vintage Books','Thompson, Hunter S.'),
		('No Middle Name','Bantam Dell','Child, Lee'),
		('Night School','Bantam Dell','Child, Lee')
	;



	INSERT INTO BRANCH
		(branchID, branchName, branchAddress)
		VALUES
		(77036, 'Sharpstown', '7660 Clarewood Dr, Houston, TX 77036'),
		(98104, 'Central', '1000 4th Ave, Seattle, WA 98104'),
		(98050,'Renton Library', '100 Mill Ave S, Renton, WA 98057'),
		(98052, 'Microsoft Learning Center', 'Microsoft Building 92, 15010 NE 36th St, Redmond, WA 98052'),
		(98057, 'Tech Academy Library', '325 S 3rd St, Renton, WA 98057'),
		(98188, 'King County Library', '1386 Southcenter Mall, Tukwila, WA 98188')
	;



	INSERT INTO MEMBERS
		(cardNum,fName, lName, mAddress, mPhone)
		VALUES
		(005233810, 'Harry', 'Chin', '1748 SW 346th Pl Federal Way WA 98023', '253-716-6782'),
		(005232133, 'Alea', 'Amber Cox', '2408 W Olympic Ave Spokane WA 99205-5723', '206-335-8093'),
		(005232211, 'John', 'Summer', '104 167th St E Spanaway WA 98387-8227', '253-268-9354'),
		(005230921, 'John','Ng', '101 17th St Federal Way WA 98037', '253-268-9354'),
		(005232917, 'Jayne', 'Westman', '4005 141st St NW Gig Harbor, WA 98332', '360-422-8327'),
		(005238831, 'Mary Mi', 'Mae', '2121 6th Ave Apt N307 Seattle WA 98121-2812', '206-300-1439'),
		(005231938, 'Sommer', 'Park', '12134 71st Pl S Seattle WA 98178-3005', '206-399-1200'),
		(005230922, 'Shelly', ' Mena', '3116 164th St SW Apt 1604 Lynnwood WA 98087-3251', '206-951-9886'),
		(005234899, 'Harry H', ' Butts', '1818 44th Street Ct NW Gig Harbor WA 98335-1427', '360-204-9902'),
		(005230900, 'Eric', 'Ericson', '153 Florentia St Seattle WA 98109-1716', '206-784-0042')
	;
	
	
		
	INSERT INTO COPIES 
		(bookID, branchID, numOfCopies)
		VALUES
		(1,	98050,	'1 of 3'),
		(1,	98057,	'2 of 3'),
		(1,	98050,	'3 of 3'),
		(2,	98052,	'1 of 3'),
		(2,	98050,	'2 of 3'),
		(2,	77036,	'3 of 3'),
		(3,	98052,	'1 of 2'),
		(3,	98052,	'2 of 2'),
		(4,	98050,	'1 of 5'),
		(4,	98057,	'2 of 5'),
		(4,	77036,	'3 of 5'),
		(4,	77036,	'4 of 5'),
		(4,	98057,	'5 of 5'),
		(5,	98057,	'1 of 2'),
		(5,	98057,	'2 of 2'),
		(6,	98052,	'1 of 2'),
		(6,	98104,	'2 of 2'),
		(7,	98050,	'1 of 2'),
		(7,	98052,	'2 of 2'),
		(8,	98057,	'1 of 3'),
		(8,	77036,	'2 of 3'),
		(8,	98057,	'3 of 3'),
		(9,	77036,	'2 of 2'),
		(9,	98057,	'2 of 2'),
		(10,	77036,	'1 of 3'),
		(10,	98050,	'2 of 3'),
		(10,	98050,	'3 of 3'),
		(11,	98052,	'1 of 3'),
		(11,	98057,	'2 of 3'),
		(11,	98050,	'3 of 3'),
		(12,	98104,	'1 of 3'),
		(12,	98104,	'2 of 3'),
		(12,	98188,	'3 of 3'),
		(13,	98188,	'1 of 5'),
		(13,	98104,	'2 of 5'),
		(13,	77036,	'3 of 5'),
		(13,	77036,	'4 of 5'),
		(13,	98052,	'5 of 5'),
		(14,	98050,	'1 of 3'),
		(14,	98052,	'2 of 3'),
		(14,	98188,	'3 of 3'),
		(15,	98104,	'1 of 2'),
		(15,	98050,	'2 of 2'),
		(16,	98052,	'1 of 3'),
		(16,	98050,	'2 of 3'),
		(16,	98057,	'3 of 3'),
		(17,	98188,	'1 of 2'),
		(17,	98050,	'2 of 2'),
		(18,	77036,	'1 of 3'),
		(18,	98052,	'2 of 3'),
		(18,	98052,	'3 of 3'),
		(19,	98052,	'1 of 2'),
		(19,	98050,	'2 of 2'),
		(20,	98104,	'1 of 2'),
		(20,	98104,	'2 of 2')
	;


	
	
	INSERT INTO BOOKLOANS
		(branchID, bookID, dateFrom, dateDue, cardNum)
		VALUES
		(77036, 4, '2018-06-10', '2018-06-24', 5230900),
		(98057, 5, '2018-06-12', '2018-06-26', 5230921),
		(98052, 8, '2018-06-12', '2018-06-26', 5232211),
		(98052, 14, '2018-06-15', '2018-06-29', 5230922),
		(77036, 7, '2018-06-15', '2018-06-29', 5230922),
		(77036, 11, '2018-06-17', '2018-07-01', 5233810),
		(98052, 5, '2018-06-17', '2018-07-01', 5230900),
		(98050, 8, '2018-06-19', '2018-07-03', 5230921),
		(98057, 9, '2018-06-20', '2018-07-04', 5232211),
		(77036, 15, '2018-06-22', '2018-07-06', 5230900),
		(98057, 14, '2018-06-28', '2018-07-12', 5230922),
		(98057, 4, '2018-06-28', '2018-07-12', 5230922),
		(98104, 13, '2018-06-30', '2018-07-14', 5238831),
		(98050, 13, '2018-07-01', '2018-07-15', 5230900),
		(98052, 6, '2018-07-01', '2018-07-15', 5232211),
		(98057, 7, '2018-07-02', '2018-07-16', 5232211),
		(77036, 10, '2018-07-03', '2018-07-17', 5232211),
		(98050, 1, '2018-07-03', '2018-07-17', 5230900),
		(98052, 15, '2018-07-03', '2018-07-17', 5238831),
		(98052, 3, '2018-07-05', '2018-07-19', 5238831),
		(98057, 7, '2018-07-06', '2018-07-20', 5230922),
		(77036, 7, '2018-07-06', '2018-07-20', 5232211),
		(98050, 9, '2018-07-06', '2018-07-20', 5232211),
		(77036, 10, '2018-07-06', '2018-07-20', 5233810),
		(98104, 19, '2018-07-07', '2018-07-21', 5230922),
		(98052, 16, '2018-07-07', '2018-07-21', 5232211),
		(98104, 20, '2018-07-10', '2018-07-24', 5232917),
		(98050, 15, '2018-07-16', '2018-07-31', 5230922),
		(98050, 4, '2018-07-16', '2018-07-31', 5232211),
		(98104, 5, '2018-07-16', '2018-07-31', 5233810),
		(98050, 9, '2018-07-16', '2018-07-31', 5231938),
		(98052, 17, '2018-07-17', '2018-08-01', 5234899),
		(98188, 12, '2018-07-17', '2018-08-01', 5230921),
		(98057, 1, '2018-07-20', '2018-08-04', 5234899),
		(98050, 5, '2018-07-23', '2018-08-07', 5231938),
		(98050, 14, '2018-07-23', '2018-08-07', 5232917),
		(98052, 11, '2018-07-23', '2018-08-07', 5232917),
		(98057, 7, '2018-07-25', '2018-08-09', 5230921),
		(77036, 4, '2018-07-26', '2018-08-10', 5230921),
		(98188, 7, '2018-07-26', '2018-08-10', 5238831),
		(98050, 1, '2018-07-26', '2018-08-10', 5231938),
		(98188, 9, '2018-08-01', '2018-09-15', 5230921),
		(98188, 10, '2018-08-01', '2018-09-15', 5233810),
		(98050, 11, '2018-08-01', '2018-09-15', 5232211),
		(98188, 9, '2018-08-01', '2018-09-15', 5231938),
		(98188, 14, '2018-08-02', '2018-09-16', 5233810),
		(98052, 11, '2018-08-03', '2018-09-17', 5231938),
		(98057, 4, '2018-08-03', '2018-09-17', 5238831),
		(98050, 8, '2018-08-03', '2018-09-17', 5232917),
		(98050, 18, '2018-08-05', '2018-09-19', 5232917),
		(98057, 5, '2018-08-06', '2018-09-20', 5231938)
	;

	
		SELECT * FROM AUTHORS
	
		SELECT * FROM BOOKS
		
		SELECT * FROM BOOKLOANS
		
		SELECT * FROM COPIES
		
		SELECT * FROM BRANCH
		
		SELECT * FROM MEMBERS

		SELECT * FROM PUBLISHERS
