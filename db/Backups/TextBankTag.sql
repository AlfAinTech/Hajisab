/*
   Friday, October 28, 201611:00:01 AM
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
CREATE TABLE dbo.TextBankTag
	(
	id int NOT NULL IDENTITY (1, 1),
	TextID int NOT NULL,
	TagID int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.TextBankTag ADD CONSTRAINT
	PK_TextBankTag PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.TextBankTag SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.TextBankTag', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.TextBankTag', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.TextBankTag', 'Object', 'CONTROL') as Contr_Per 