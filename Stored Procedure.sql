/*Task 1: Create Stored Procedure*/

CREATE Database Members #Create Members database

CREATE Procedure GetAllMembers  #Create new stored procedure
AS
SELECT * TableMembers  #Select all members from table of members

CREATE Procedure [Members].[UpdateMember] #Modify Firstname
@Firstname varchar(50)  #Set Firstname to character with length of 50
AS
UPDATE TableMembers  
SET Firstname = @Firstname #Redeclare Firstname via user defined format
WHERE Firstname = 'Frank'









/*





