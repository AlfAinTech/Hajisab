use DreamBird

go

ALTER TABLE [dbo].[MediaTags] DROP CONSTRAINT [FK_MediaTags_Tags];

ALTER TABLE [dbo].[MediaTags] DROP CONSTRAINT [FK_MediaTags_MediaItems];

ALTER TABLE [dbo].[MediaTags] WITH NOCHECK
    ADD CONSTRAINT [FK_MediaTags_Tags] FOREIGN KEY ([Tag_id]) REFERENCES [dbo].[Tags] ([id]) on delete set null;

ALTER TABLE [dbo].[MediaTags] WITH NOCHECK
    ADD CONSTRAINT [FK_MediaTags_MediaItems] FOREIGN KEY ([MediaItem_id]) REFERENCES [dbo].[MediaItems] ([id]) on delete set null;

	ALTER TABLE [dbo].[MediaItems] DROP CONSTRAINT [FK_MediaItems_MediaCategories];
	ALTER TABLE [dbo].[MediaItems] WITH NOCHECK
    ADD CONSTRAINT [FK_MediaItems_MediaCategories] FOREIGN KEY ([MediaCategory_id]) REFERENCES [dbo].[MediaCategories] ([id]) on delete set null;
