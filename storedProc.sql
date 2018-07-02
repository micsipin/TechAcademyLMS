

--Number1
USE [db_TechAcademy_LMS]
GO
CREATE PROC [dbo].[spAnswerNumber1] (@branchName AS VARCHAR(50), @title AS VARCHAR(50))
AS BEGIN
	SELECT aa.numOfCopies, ab.branchName, ac.title
	FROM COPIES aa
	INNER JOIN BRANCH ab on aa.BranchID = ab.BranchID
	INNER JOIN BOOKS ac on aa.bookID = ac.bookID
	WHERE ab.branchName = 'Sharpstown' and ac.title = 'The Lost Tribe'
	
END



--NUMBER2
USE [db_TechAcademy_LMS]
GO
CREATE PROC [dbo].[spAnswerNumber2] (@title AS VARCHAR(50))
AS BEGIN	
	SELECT aa.bookID, aa.branchID, aa.numOfCopies, ab.title , ac.branchname
	FROM COPIES aa
	INNER JOIN BOOKS ab on ab.bookID = aa.bookID
	INNER JOIN BRANCH ac on ac.branchID = aa.branchID
	WHERE ab.title = 'The Lost Tribe'

END



--Number3
USE [db_TechAcademy_LMS]
GO
CREATE PROC [dbo].[spAnswerNumber3] (@branchName AS VARCHAR(50), @title AS VARCHAR(50))
AS BEGIN
	SELECT CONCAT(fName,+' '+ lName)AS NOLOANS 
	FROM MEMBERS 
	WHERE cardNum not in(SELECT cardNum from BOOKLOANS);

END



--NUMBER4
USE [db_TechAcademy_LMS]
GO
CREATE PROC [dbo].[spAnswerNumber4] (@dateDue AS DATE, @branchName AS VARCHAR(50))
AS BEGIN
	SELECT aa.dateDue, ab.title, ac.branchName, CONCAT(ad.fname,+' '+ad.lName) AS name, ad.mAddress
	FROM BOOKLOANS aa
	INNER JOIN BRANCH ac on ac.branchID = aa.branchID
	INNER JOIN MEMBERS ad on ad.cardNum = aa.cardNum
	INNER JOIN BOOKS ab on ab.bookID = aa.bookID
	WHERE convert(nvarchar(50), dateDue,126) BETWEEN '2018-06-12' and GETDATE() AND ac.branchName = 'Sharpstown'

END



--NUMBER5
USE [db_TechAcademy_LMS]
GO
CREATE PROC [dbo].[spAnswerNumber5] 
AS BEGIN
	SELECT BRANCH.branchName, COUNT(BOOKLOANS.bookID) AS TOTAL
	FROM (BOOKLOANS
	INNER JOIN BRANCH ON BOOKLOANS.branchID = BRANCH.branchID)
	GROUP BY branchName

END


--NUMBER6
USE [db_TechAcademy_LMS]
GO
CREATE PROC [dbo].[spAnswerNumber6] 
AS BEGIN
	SELECT CONCAT(fName,+' '+ lName) AS NAME, m.mAddress, COUNT(bl.CardNum) AS NumCheckedOut
	FROM MEMBERS AS m
	INNER JOIN BOOKLOANS AS bl
	ON m.cardNum = bl.cardNum
	GROUP BY m.fName,lName, m.mAddress
	HAVING COUNT(bl.cardNum) >= 5

END


--NUMBER7
USE [db_TechAcademy_LMS]
GO
CREATE PROC [dbo].[spAnswerNumber7] 
AS BEGIN
	SELECT aa.numOfCopies, ac.title,  ab.branchName, ad.authorName
	FROM COPIES aa
	INNER JOIN BRANCH ab on aa.BranchID = ab.BranchID
	INNER JOIN BOOKS ac on aa.bookID = ac.bookID
	INNER JOIN AUTHORS ad on ad.authorID = ac.bookID
	WHERE ad.authorName = 'King, Stephen' AND ab.branchName = 'Central'
END
