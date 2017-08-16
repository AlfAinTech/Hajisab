USE [DreamBird]
GO

/****** Object:  Table [dbo].[QuestionExplanation]    Script Date: 3/15/2017 5:23:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[QuestionExplanation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[ExplanationText] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[QuestionExplanation]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO


