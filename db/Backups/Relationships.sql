/*
   Friday, October 28, 201611:01:12 AM
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
ALTER TABLE dbo.TextBank SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.TextBank', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.TextBank', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.TextBank', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.Tags SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Tags', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Tags', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Tags', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.TextBankTag ADD CONSTRAINT
	FK_TextBankTag_Tags FOREIGN KEY
	(
	TagID
	) REFERENCES dbo.Tags
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TextBankTag ADD CONSTRAINT
	FK_TextBankTag_TextBank FOREIGN KEY
	(
	TextID
	) REFERENCES dbo.TextBank
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.TextBankTag SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.TextBankTag', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.TextBankTag', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.TextBankTag', 'Object', 'CONTROL') as Contr_Per 