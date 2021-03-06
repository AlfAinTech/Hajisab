/*
   Wednesday, December 21, 201612:09:35 PM
   User: 
   Server: DESKTOP-LO2ST7Q\SQLEXPRESS
   Database: DreamBird
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DreamPageAuthorization
	DROP CONSTRAINT FK__DreamPage__Dream__1CBC4616
GO
ALTER TABLE dbo.DreamLayouts SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DreamPageAuthorization ADD CONSTRAINT
	FK__DreamPage__Dream__1CBC4616 FOREIGN KEY
	(
	DreamLayout_id
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.DreamPageAuthorization SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
