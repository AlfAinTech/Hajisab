/*
   Thursday, October 20, 20168:24:58 AM
   User: 
   Server: (local)
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
ALTER TABLE dbo.LessonMenu ADD
	menuType nvarchar(50) NOT NULL CONSTRAINT DF_LessonMenu_menuType DEFAULT N'multimedia'
GO
ALTER TABLE dbo.LessonMenu SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.LessonMenu', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.LessonMenu', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.LessonMenu', 'Object', 'CONTROL') as Contr_Per 