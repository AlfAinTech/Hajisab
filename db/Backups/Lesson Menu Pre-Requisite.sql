USE [DreamBird]
GO

/****** Object:  Table [dbo].[LessonMenuPreRequisite]    Script Date: 1/3/2017 10:33:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LessonMenuPreRequisite](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [int] NOT NULL,
	[pre_req_menu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[LessonMenuPreRequisite]  WITH CHECK ADD  CONSTRAINT [FK__LessonMen__menu___2704CA5F] FOREIGN KEY([menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO

ALTER TABLE [dbo].[LessonMenuPreRequisite] CHECK CONSTRAINT [FK__LessonMen__menu___2704CA5F]
GO

ALTER TABLE [dbo].[LessonMenuPreRequisite]  WITH CHECK ADD  CONSTRAINT [FK__LessonMen__pre_r__2610A626] FOREIGN KEY([pre_req_menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO

ALTER TABLE [dbo].[LessonMenuPreRequisite] CHECK CONSTRAINT [FK__LessonMen__pre_r__2610A626]
GO


