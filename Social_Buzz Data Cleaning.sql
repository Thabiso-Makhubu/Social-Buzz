--Data Cleaning using the Content Table

----View table
select * from content

----Delete Columns in the table
ALTER TABLE Content
DROP COLUMN URL

ALTER TABLE Content
DROP COLUMN column1, User_ID

Update Content
SET Category = REPLACE(Category,'"', '')

--Data Cleaning using the Reactions

----View table
select * from Reactions

----Delete Columns in the table
ALTER TABLE Reactions
DROP COLUMN Column1, User_ID

DELETE FROM Reactions where Type IS NULL

----View and change Data Types
select COLUMN_NAME, Data_type 
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'Reactions'

ALTER TABLE Reactions
ALTER COLUMN Datetime Datetime

--Data Cleaning using the Reaction_Types

----View table
select * from Reaction_Types

----Delete Columns in the table
ALTER TABLE Reaction_Types
DROP COLUMN Column1