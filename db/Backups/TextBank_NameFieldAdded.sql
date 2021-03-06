/*
   Friday, October 28, 201610:58:48 AM
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
ALTER TABLE dbo.TextBank ADD
	TextName nvarchar(MAX) NOT NULL CONSTRAINT DF_TextBank_TextName DEFAULT ''
GO
ALTER TABLE dbo.TextBank SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.TextBank', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.TextBank', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.TextBank', 'Object', 'CONTROL') as Contr_Per 