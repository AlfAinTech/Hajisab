USE [DreamBird]
GO

/****** Object:  Table [dbo].[InviteSharePage]    Script Date: 10/13/2016 16:46:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InviteSharePage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LayoutID] [int] NOT NULL,
	[shareText] [nchar](100) NULL,
	[shareURL] [nchar](100) NULL,
 CONSTRAINT [PK_InviteSharePage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[InviteSharePage]  WITH CHECK ADD  CONSTRAINT [FK_InviteSharePage_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
GO

ALTER TABLE [dbo].[InviteSharePage] CHECK CONSTRAINT [FK_InviteSharePage_DreamLayouts]
GO


