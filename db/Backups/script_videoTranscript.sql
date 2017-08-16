USE [DreamBird]
GO

/****** Object:  Table [dbo].[VideoTranscript]    Script Date: 8/30/2016 1:18:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[VideoTranscript](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MediaItem_id] [int] NULL,
	[TimeStamp] [decimal](18, 2) NULL,
	[Text] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO

