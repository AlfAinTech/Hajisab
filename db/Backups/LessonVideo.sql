/*
   Thursday, November 17, 20161:06:06 PM
   User: 
   Server: JAHANZAIB-PC\SQLEXPRESS
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
ALTER TABLE dbo.LessonVideo
	DROP CONSTRAINT FK_LessonVideo_DreamLayouts1
GO
ALTER TABLE dbo.DreamLayouts SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LessonVideo
	DROP CONSTRAINT FK_LessonVideo_MediaItems
GO
ALTER TABLE dbo.MediaItems SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LessonVideo ADD CONSTRAINT
	FK_LessonVideo_MediaItems FOREIGN KEY
	(
	MediaItem_id
	) REFERENCES dbo.MediaItems
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.LessonVideo ADD CONSTRAINT
	FK_LessonVideo_DreamLayouts1 FOREIGN KEY
	(
	Layout_id
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.LessonVideo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
