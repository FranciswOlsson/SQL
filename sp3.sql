--More Stored Procedures

CREATE PROCEDURE spFilmList
AS
BEGIN
  SELECT
     FilmName
	 ,FilmReleaseDate
	 ,FilmRunTimeMinutes
  FROM
    tblFilm
  ORDER BY
    FilmName ASC
END
EXECUTE spFilmList

--Modify stored procedure
ALTER PROCEDURE spFilmList
AS
BEGIN
  SELECT
     FilmName
	 ,FilmReleaseDate
	 ,FilmRunTimeMinutes
	 ,FilmOscarNominations
  FROM
    tblFilm
  ORDER BY
    FilmName DESC
END
EXECUTE spFilmList

--Remove stored procedure
DROP PROCEDURE spFilmList

--With Parameters
CREATE PROC spFilmCriteria(@MinLength AS INT)
AS
BEGIN
  SELECT
    FilmName
	,FilmRunTimeMinutes
  FROM
    tblFilm
  WHERE
    FilmRunTimeMinutes > @MinLength
  ORDER BY
    FilmRunTimeMinutes ASC
END
EXECUTE spFilmCriteria 150

--Alter Stored Procedure with Parameters
ALTER PROC spFilmCriteria
  (
    @MinLength AS INT
	,@MaxLength AS INT
  )

AS
BEGIN
  SELECT
    FilmName
	,FilmRunTimeMinutes
  FROM
    tblFilm
  WHERE
    FilmRunTimeMinutes >= @MinLength AND
	FilmRunTimeMinutes <= @MaxLength 
  ORDER BY
    FilmRunTimeMinutes ASC
END
EXECUTE spFilmCriteria @MinLength=150,@MaxLength=180

--Stored Procedures with Text Parameters
ALTER PROC spFilmCriteria
  (
    @MinLength AS INT
	,@MaxLength AS INT
	,@Title AS VARCHAR(MAX)
  )
AS
BEGIN
  SELECT
    FilmName
	,FilmRunTimeMinutes
	,Title
  FROM
    tblFilm
  WHERE
    FilmRunTimeMinutes >= @MinLength AND
	FilmRunTimeMinutes <= @MaxLength AND
	FilmName LIKE CONCAT('%',  @Title, '%')
  ORDER BY
    FilmRunTimeMinutes ASC
END
EXECUTE spFilmCriteria @MinLength=150,@MaxLength=180,@Title='star'

--With Null values
ALTER PROC spFilmCriteria
  (
    @MinLength AS INT = NULL
	,@MaxLength AS INT = NULL
	,@Title AS VARCHAR(MAX)
  )
AS
BEGIN
  SELECT
    FilmName
	,FilmRunTimeMinutes
	,Title
  FROM
    tblFilm
  WHERE
    (@MinLength IS NULL OR FilmRunTimeMinutes >= @MinLength) AND
	(@MaxLength IS NULL OR FilmRunTimeMinutes <= @MaxLength) AND
	FilmName LIKE CONCAT('%',  @Title, '%')
  ORDER BY
    FilmRunTimeMinutes ASC
END
EXECUTE spFilmCriteria @MinLength=150,@MaxLength=180,@Title='star'