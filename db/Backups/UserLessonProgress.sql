USE [DreamBird]
GO

/****** Object:  Table [dbo].[UserLessonProgress]    Script Date: 10/28/2016 08:42:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserLessonProgress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [int] NOT NULL,
	[AspNetUser_id] [nvarchar](128) NOT NULL,
	[progress] [int] NOT NULL,
 CONSTRAINT [PK_UserLessonProgress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_AspNetUsers] FOREIGN KEY([AspNetUser_id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_AspNetUsers]
GO

ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_LessonMenu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO

ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_LessonMenu]
GO

ALTER TABLE [dbo].[UserLessonProgress] ADD  CONSTRAINT [DF_UserLessonProgress_progress]  DEFAULT ((0)) FOR [progress]
GO


