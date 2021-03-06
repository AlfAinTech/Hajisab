/*
   Friday, November 11, 201612:03:58 PM
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
	IsPublicDefaultPage bit NULL
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
SET IDENTITY_INSERT dbo.Tmp_DreamLayouts ON
GO
IF EXISTS(SELECT * FROM dbo.DreamLayouts)
	 EXEC('INSERT INTO dbo.Tmp_DreamLayouts (id, Layout, DreamID, Page, Description, NavEnable, IsPublished, IsUserDefaultPage)
		SELECT id, Layout, DreamID, Page, Description, NavEnable, IsPublished, IsDefaultPage FROM dbo.DreamLayouts WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_DreamLayouts OFF
GO
ALTER TABLE dbo.LessonProgressDashBoard
	DROP CONSTRAINT FK_LessonProgressDashBoard_DreamLayouts
GO
ALTER TABLE dbo.LessonVideo
	DROP CONSTRAINT FK_LessonVideo_DreamLayouts1
GO
ALTER TABLE dbo.LessonMenu
	DROP CONSTRAINT FK_LessonMenu_DreamLayouts
GO
ALTER TABLE dbo.LessonMenu
	DROP CONSTRAINT FK_LessonMenu_DreamLayouts1
GO
ALTER TABLE dbo.InviteSharePage
	DROP CONSTRAINT FK_InviteSharePage_DreamLayouts
GO
ALTER TABLE dbo.LayoutTextBank
	DROP CONSTRAINT FK_LayoutTextBank_DreamLayouts
GO
DROP TABLE dbo.DreamLayouts
GO
EXECUTE sp_rename N'dbo.Tmp_DreamLayouts', N'DreamLayouts', 'OBJECT' 
GO
ALTER TABLE dbo.DreamLayouts ADD CONSTRAINT
	PK_DreamLayouts PRIMARY KEY CLUSTERED 
	(
	id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.DreamLayouts ADD CONSTRAINT
	FK_DreamLayouts_Dreams FOREIGN KEY
	(
	DreamID
	) REFERENCES dbo.Dreams
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.DreamLayouts', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.DreamLayouts', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.DreamLayouts', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.LayoutTextBank ADD CONSTRAINT
	FK_LayoutTextBank_DreamLayouts FOREIGN KEY
	(
	LayoutID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.LayoutTextBank SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.LayoutTextBank', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.LayoutTextBank', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.LayoutTextBank', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.InviteSharePage ADD CONSTRAINT
	FK_InviteSharePage_DreamLayouts FOREIGN KEY
	(
	LayoutID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.InviteSharePage SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.InviteSharePage', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.InviteSharePage', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.InviteSharePage', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.LessonMenu ADD CONSTRAINT
	FK_LessonMenu_DreamLayouts FOREIGN KEY
	(
	DreamLayoutID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.LessonMenu ADD CONSTRAINT
	FK_LessonMenu_DreamLayouts1 FOREIGN KEY
	(
	ParentLayoutID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.LessonMenu SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.LessonMenu', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.LessonMenu', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.LessonMenu', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.LessonVideo ADD CONSTRAINT
	FK_LessonVideo_DreamLayouts1 FOREIGN KEY
	(
	Layout_id
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.LessonVideo SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.LessonVideo', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.LessonVideo', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.LessonVideo', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
ALTER TABLE dbo.LessonProgressDashBoard ADD CONSTRAINT
	FK_LessonProgressDashBoard_DreamLayouts FOREIGN KEY
	(
	LayoutID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.LessonProgressDashBoard SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.LessonProgressDashBoard', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.LessonProgressDashBoard', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.LessonProgressDashBoard', 'Object', 'CONTROL') as Contr_Per 