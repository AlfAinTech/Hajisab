/*
   Wednesday, December 21, 201612:11:21 PM
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
ALTER TABLE dbo.DreamLayouts
	DROP CONSTRAINT FK_DreamLayouts_Dreams
GO
ALTER TABLE dbo.Dreams SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Navigations
	DROP CONSTRAINT FK_Navigations_DreamLayoutsnew
GO
ALTER TABLE dbo.UserQuizStatus
	DROP CONSTRAINT FK__UserQuizSt__Page__29E1370A
GO
ALTER TABLE dbo.UserResponse
	DROP CONSTRAINT FK__UserRespon__Page__46B27FE2
GO
ALTER TABLE dbo.LessonQuestion
	DROP CONSTRAINT FK__LessonQue__Layou__4B7734FF
GO
ALTER TABLE dbo.DreamLayouts ADD CONSTRAINT
	FK_DreamLayouts_Dreams FOREIGN KEY
	(
	DreamID
	) REFERENCES dbo.Dreams
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.DreamLayouts SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LessonQuestion ADD CONSTRAINT
	FK__LessonQue__Layou__4B7734FF FOREIGN KEY
	(
	Layout_id
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.LessonQuestion SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.UserResponse ADD CONSTRAINT
	FK__UserRespon__Page__46B27FE2 FOREIGN KEY
	(
	Page
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.UserResponse SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.UserQuizStatus ADD CONSTRAINT
	FK__UserQuizSt__Page__29E1370A FOREIGN KEY
	(
	Page
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.UserQuizStatus SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Navigations ADD CONSTRAINT
	FK_Navigations_DreamLayoutsnew FOREIGN KEY
	(
	Layout_id
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.Navigations SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
