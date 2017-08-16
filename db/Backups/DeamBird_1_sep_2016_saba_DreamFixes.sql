ALTER TABLE DreamUserProfile
ALTER COLUMN DateOfBirth datetime
GO
ALTER TABLE DreamLayouts
ADD IsDefaultPage Bit NOT NULL DEFAULT(0)
GO