/*Create A User Defined Format*/

-- SQL User Defined Functions - Scalar Functions example
/*Task: Use Student records to
  1. Concatonate a Full Name
  2. Calculate Final Grade using the following weights:
	 Given Midterm = 40%  
           Homework = 10%
           Final = 50%
  3. Calculate Class Rank for each Class Year*/

USE [SQL School]

GO
SELECT [SudentID]
      ,[FirstName]
      ,[LastName]
      ,[ClassYear]
      ,[MidtermExam]
      ,[Homework]
      ,[FinalExam]
  FROM [Students Table]

#Create FullName
GO
CREATE FUNCTION fullName (@FirstName VARCHAR(50), @LastName VARCHAR(50))
  RETURNS VARCHAR(200)
  AS
    BEGIN 
       RETURN (SELECT  @FirstName + SPACE(2) + @LastName)
    END


GO
SELECT [SudentID]
      ,[FirstName]
      ,[LastName]
      ,School.fullName() AS [FullName]
      ,[ClassYear]
      ,[MidtermExam]
      ,[Homework]
      ,[FinalExam]
  FROM [Students Table]



#Create Calculate Final Grade 
GO  
CREATE FUNCTION CalculateFinalGrade ()
  RETURNS INT
  AS
    BEGIN 
       RETURN (SELECT (0.4*([MidtermExam])+0.1*([Homework])+0.5*([FinalExam])) FROM [Students Table])
    END

#Implement Final Grade Calculation
GO
SELECT [SudentID]
      ,[FirstName]
      ,[LastName]
      ,[ClassYear]
      ,[MidtermExam]
      ,[Homework]
      ,[FinalExam]
      ,School.CalculateFinalGrade() AS [FinalGrade]
  FROM [MyEmployees Table]


#Calculate Class Rank
GO
CREATE FUNCTION CalculateClassRank ()
  RETURNS INT
  AS
    BEGIN
      RETURN (SELECT DESC([Final Grade]) 
              FROM [Students Table]
			  GROUP BY [ClassYear])
	END

#Implement Class Rank Calculation
GO
SELECT [SudentID]
      ,[FirstName]
      ,[LastName]
      ,[ClassYear]
      ,[MidtermExam]
      ,[Homework]
      ,[FinalExam]
      ,[FinalGrade]
      ,School.CalculateClassRank () AS [ClassRank]
  FROM [MyEmployees Table]

      
    