USE [DreamBird]
GO

/****** Object:  Table [dbo].[Files]    Script Date: 12/5/2016 9:42:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Files](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[path] [nvarchar](50) NOT NULL,
	[FileCategory_ID] [int] NULL,
	[FileType] [nvarchar](50) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([FileCategory_ID])
REFERENCES [dbo].[FileCategories] ([id])
GO


