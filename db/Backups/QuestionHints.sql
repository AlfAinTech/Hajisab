USE [DreamBird]
GO

/****** Object:  Table [dbo].[QuestionHints]    Script Date: 2/2/2017 6:27:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[QuestionHints](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[HintText] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[QuestionHints]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO


