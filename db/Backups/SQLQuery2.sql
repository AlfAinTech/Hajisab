/*
   Monday, November 14, 20169:16:10 AM
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
ALTER TABLE dbo.DreamLayouts
	DROP CONSTRAINT FK_DreamLayouts_Dreams
GO
ALTER TABLE dbo.Dreams SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Dreams', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Dreams', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Dreams', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.DreamLayouts
	DROP CONSTRAINT DF_DreamLayouts_NavEnable
GO
ALTER TABLE dbo.DreamLayouts
	DROP CONSTRAINT DF_DreamLayouts_IsPublished
GO
ALTER TABLE dbo.DreamLayouts
	DROP CONSTRAINT DF__DreamLayo__IsDef__403A8C7D
GO
CREATE TABLE dbo.Tmp_DreamLayouts
	(
	id int NOT NULL IDENTITY (1, 1),
	Layout nvarchar(MAX) NULL,
	DreamID int NULL,
	Page nvarchar(100) NULL,
	Description nvarchar(MAX) NULL,
	NavEnable bit NOT NULL,
	IsPublished bit NOT NULL,
	IsUserDefaultPage bit NULL,
	IsPublicDefaultPage bit NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_DreamLayouts SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_DreamLayouts ADD CONSTRAINT
	DF_DreamLayouts_NavEnable DEFAULT ((0)) FOR NavEnable
GO
ALTER TABLE dbo.Tmp_DreamLayouts ADD CONSTRAINT
	DF_DreamLayouts_IsPublished DEFAULT ((1)) FOR IsPublished
GO
ALTER TABLE dbo.Tmp_DreamLayouts ADD CONSTRAINT
	DF__DreamLayo__IsDef__403A8C7D DEFAULT ((0)) FOR IsUserDefaultPage
GO
ALTER TABLE dbo.Tmp_DreamLayouts ADD CONSTRAINT
	DF_DreamLayouts_IsPublicDefaultPage DEFAULT 0 FOR IsPublicDefaultPage
GO
SET IDENTITY_INSERT dbo.Tmp_DreamLayouts ON
GO
IF EXISTS(SELECT * FROM dbo.DreamLayouts)
	 EXEC('INSERT INTO dbo.Tmp_DreamLayouts (id, Layout, DreamID, Page, Description, NavEnable, IsPublished, IsUserDefaultPage, IsPublicDefaultPage)
		SELECT id, Layout, DreamID, Page, Description, NavEnable, IsPublished, IsUserDefaultPage, IsPublicDefaultPage FROM dbo.DreamLayouts WITH (HOLDLOCK TABLOCKX)')
GO
COMMIT
