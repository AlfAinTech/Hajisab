USE [DreamBird]
GO

/****** Object:  Table [dbo].[UserHintStatus]    Script Date: 1/31/2017 9:20:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserHintStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Page] [int] NOT NULL,
	[HintOption] [nvarchar](64) NOT NULL,
	[HintMarks] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[UserHintStatus]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO

ALTER TABLE [dbo].[UserHintStatus]  WITH CHECK ADD FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
GO


