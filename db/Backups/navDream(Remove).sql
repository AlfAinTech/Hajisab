/*
   Monday, November 21, 201611:26:01 AM
   User: 
   Server: (local)
   Database: 26oct_DreamBird
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
ALTER TABLE dbo.Navigations
	DROP CONSTRAINT FK_Navigations_Dreams
GO
ALTER TABLE dbo.Dreams SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Dreams', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Dreams', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Dreams', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Navigations SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Navigations', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Navigations', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Navigations', 'Object', 'CONTROL') as Contr_Per 