/*
   Monday, November 21, 201611:25:21 AM
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
EXECUTE sp_rename N'dbo.Navigations.Dream_id', N'Tmp_Layout_id_4', 'COLUMN' 
GO
EXECUTE sp_rename N'dbo.Navigations.Tmp_Layout_id_4', N'Layout_id', 'COLUMN' 
GO
ALTER TABLE dbo.Navigations SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.Navigations', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.Navigations', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.Navigations', 'Object', 'CONTROL') as Contr_Per 