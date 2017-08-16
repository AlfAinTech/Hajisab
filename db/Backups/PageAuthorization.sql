USE [DreamBirdNew]
GO

/****** Object:  Table [dbo].[DreamPageAuthorization]    Script Date: 11/28/2016 12:04:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DreamPageAuthorization](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DreamLayout_id] [int] NULL,
	[PageRole] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[DreamPageAuthorization]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
GO


