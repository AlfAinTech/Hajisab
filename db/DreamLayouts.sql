/*
   Monday, March 27, 201710:27:49 AM
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
ALTER TABLE dbo.DreamLayouts
	DROP CONSTRAINT DF_DreamLayouts_IsPublished
GO
ALTER TABLE dbo.DreamLayouts
	DROP CONSTRAINT DF__DreamLayo__IsDef__403A8C7D
GO
ALTER TABLE dbo.DreamLayouts
	DROP CONSTRAINT DF_DreamLayouts_IsPublicDefaultPage
GO
CREATE TABLE dbo.Tmp_DreamLayouts
	(
	id int NOT NULL IDENTITY (1, 1),
	Layout nvarchar(MAX) NULL,
	DreamID int NULL,
	Page nvarchar(100) NULL,
	Description nvarchar(MAX) NULL,
	LayoutType nvarchar(50) NULL,
	IsPublished bit NOT NULL,
	IsUserDefaultPage bit NULL,
	IsPublicDefaultPage bit NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_DreamLayouts SET (LOCK_ESCALATION = TABLE)
GO
ALTER TABLE dbo.Tmp_DreamLayouts ADD CONSTRAINT
	DF_DreamLayouts_IsPublished DEFAULT ((1)) FOR IsPublished
GO
ALTER TABLE dbo.Tmp_DreamLayouts ADD CONSTRAINT
	DF__DreamLayo__IsDef__403A8C7D DEFAULT ((0)) FOR IsUserDefaultPage
GO
ALTER TABLE dbo.Tmp_DreamLayouts ADD CONSTRAINT
	DF_DreamLayouts_IsPublicDefaultPage DEFAULT ((0)) FOR IsPublicDefaultPage
GO
SET IDENTITY_INSERT dbo.Tmp_DreamLayouts ON
GO
IF EXISTS(SELECT * FROM dbo.DreamLayouts)
	 EXEC('INSERT INTO dbo.Tmp_DreamLayouts (id, Layout, DreamID, Page, Description, IsPublished, IsUserDefaultPage, IsPublicDefaultPage)
		SELECT id, Layout, DreamID, Page, Description, IsPublished, IsUserDefaultPage, IsPublicDefaultPage FROM dbo.DreamLayouts WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_DreamLayouts OFF
GO
ALTER TABLE dbo.UserResponse
	DROP CONSTRAINT FK__UserRespon__Page__46B27FE2
GO
ALTER TABLE dbo.UserQuizStatus
	DROP CONSTRAINT FK__UserQuizSt__Page__29E1370A
GO
ALTER TABLE dbo.UserHintStatus
	DROP CONSTRAINT FK__UserHintSt__Page__314D4EA8
GO
ALTER TABLE dbo.Navigations
	DROP CONSTRAINT FK_Navigations_DreamLayoutsnew
GO
ALTER TABLE dbo.LessonVideo
	DROP CONSTRAINT FK_LessonVideo_DreamLayouts1
GO
ALTER TABLE dbo.LessonQuestion
	DROP CONSTRAINT FK__LessonQue__Layou__4B7734FF
GO
ALTER TABLE dbo.LessonProgressDashBoard
	DROP CONSTRAINT FK_LessonProgressDashBoard_DreamLayouts
GO
ALTER TABLE dbo.LessonProgressControl
	DROP CONSTRAINT FK__LessonPro__Layou__5C6CB6D7
GO
ALTER TABLE dbo.LessonMultimedia
	DROP CONSTRAINT FK__LessonMul__Layou__4589517F
GO
ALTER TABLE dbo.LessonAssignments
	DROP CONSTRAINT FK__LessonAss__Layou__30C33EC3
GO
ALTER TABLE dbo.LayoutTextBank
	DROP CONSTRAINT FK_LayoutTextBank_DreamLayouts
GO
ALTER TABLE dbo.InviteSharePage
	DROP CONSTRAINT FK_InviteSharePage_DreamLayouts
GO
ALTER TABLE dbo.ChatAdmin
	DROP CONSTRAINT FK_ChatAdmin_DreamLayouts
GO
ALTER TABLE dbo.DreamPageControls
	DROP CONSTRAINT FK__DreamPage__Layou__54CB950F
GO
ALTER TABLE dbo.DreamPageAuthorization
	DROP CONSTRAINT FK__DreamPage__Dream__1CBC4616
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
	 ON DELETE  CASCADE 
	
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
BEGIN TRANSACTION
GO
ALTER TABLE dbo.DreamPageControls ADD CONSTRAINT
	FK__DreamPage__Layou__54CB950F FOREIGN KEY
	(
	Layout_ID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.DreamPageControls SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ChatAdmin ADD CONSTRAINT
	FK_ChatAdmin_DreamLayouts FOREIGN KEY
	(
	layoutID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ChatAdmin SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.InviteSharePage ADD CONSTRAINT
	FK_InviteSharePage_DreamLayouts FOREIGN KEY
	(
	LayoutID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.InviteSharePage SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LayoutTextBank ADD CONSTRAINT
	FK_LayoutTextBank_DreamLayouts FOREIGN KEY
	(
	LayoutID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.LayoutTextBank SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LessonAssignments ADD CONSTRAINT
	FK__LessonAss__Layou__30C33EC3 FOREIGN KEY
	(
	Layout_id
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.LessonAssignments SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LessonMultimedia ADD CONSTRAINT
	FK__LessonMul__Layou__4589517F FOREIGN KEY
	(
	Layout_id
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.LessonMultimedia SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LessonProgressControl ADD CONSTRAINT
	FK__LessonPro__Layou__5C6CB6D7 FOREIGN KEY
	(
	OriginalLayoutID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.LessonProgressControl SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LessonProgressDashBoard ADD CONSTRAINT
	FK_LessonProgressDashBoard_DreamLayouts FOREIGN KEY
	(
	LayoutID
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  CASCADE 
	
GO
ALTER TABLE dbo.LessonProgressDashBoard SET (LOCK_ESCALATION = TABLE)
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
BEGIN TRANSACTION
GO
ALTER TABLE dbo.UserHintStatus ADD CONSTRAINT
	FK__UserHintSt__Page__314D4EA8 FOREIGN KEY
	(
	Page
	) REFERENCES dbo.DreamLayouts
	(
	id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.UserHintStatus SET (LOCK_ESCALATION = TABLE)
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
