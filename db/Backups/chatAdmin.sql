USE [16_feb]
GO
/****** Object:  Table [dbo].[ChatAdmin]    Script Date: 02/16/2017 15:18:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChatAdmin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tokenID] [varchar](50) NOT NULL,
	[serverID] [varchar](50) NOT NULL,
	[layoutID] [int] NOT NULL,
 CONSTRAINT [PK_ChatAdmin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_ChatAdmin_DreamLayouts]    Script Date: 02/16/2017 15:18:07 ******/
ALTER TABLE [dbo].[ChatAdmin]  WITH CHECK ADD  CONSTRAINT [FK_ChatAdmin_DreamLayouts] FOREIGN KEY([layoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[ChatAdmin] CHECK CONSTRAINT [FK_ChatAdmin_DreamLayouts]
GO
