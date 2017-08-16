USE [26oct_DreamBird]
GO

/****** Object:  Table [dbo].[LessonMenuAvailability]    Script Date: 11/02/2016 08:38:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LessonMenuAvailability](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NOT NULL,
	[AvailableFrom] [datetime] NULL,
	[DeadLine] [datetime] NULL,
	[TimeLimit] [int] NOT NULL,
	[EnableAvailability] [bit] NOT NULL,
	[EnableDeadLine] [bit] NOT NULL,
	[EnableTimeLimit] [bit] NOT NULL,
 CONSTRAINT [PK_LessonMenuAvailability] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[LessonMenuAvailability]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenuAvailability_LessonMenu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[LessonMenu] ([id])
GO

ALTER TABLE [dbo].[LessonMenuAvailability] CHECK CONSTRAINT [FK_LessonMenuAvailability_LessonMenu]
GO

ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_TimeLimit]  DEFAULT ((0)) FOR [TimeLimit]
GO

ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableAvailability]  DEFAULT ((0)) FOR [EnableAvailability]
GO

ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableDeadLine]  DEFAULT ((0)) FOR [EnableDeadLine]
GO

ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableTimeLimit]  DEFAULT ((0)) FOR [EnableTimeLimit]
GO


