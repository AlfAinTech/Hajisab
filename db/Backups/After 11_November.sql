EXEC sp_RENAME 'DreamLayouts.IsUserDefaultPage' , 'IsDefaultPage', 'COLUMN';
ALTER TABLE DreamLayouts
DROP COLUMN IsPublicDefaultPage
