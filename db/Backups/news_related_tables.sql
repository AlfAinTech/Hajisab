USE [dreambird_2]
GO
/****** Object:  Table [dbo].[AdminsettingsNewsFeed]    Script Date: 09/01/2016 13:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminsettingsNewsFeed](
	[is_horizontal] [bit] NOT NULL,
	[is_featured_news] [bit] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AdminsettingsNewsFeed] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 09/01/2016 13:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[news_title] [char](200) NULL,
	[news_description] [text] NULL,
	[from_date] [date] NULL,
	[to_date] [date] NULL,
	[is_latest_news] [bit] NULL,
	[is_feature_news] [bit] NULL,
	[created_date] [date] NULL,
	[is_main_news] [bit] NULL,
	[MediaItem_id] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsRelatedNews]    Script Date: 09/01/2016 13:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsRelatedNews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[news_id] [int] NOT NULL,
	[related_news_id] [int] NOT NULL,
 CONSTRAINT [PK_rel_news_related_news] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsDreamNews]    Script Date: 09/01/2016 13:41:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsDreamNews](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[news_id] [int] NOT NULL,
	[dream_id] [int] NOT NULL,
 CONSTRAINT [PK_rel_news_dreams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_News_MediaItems]    Script Date: 09/01/2016 13:41:58 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_MediaItems]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_Dreams]    Script Date: 09/01/2016 13:41:58 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_Dreams] FOREIGN KEY([dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_Dreams]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_News]    Script Date: 09/01/2016 13:41:58 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_News] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_News]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News]    Script Date: 09/01/2016 13:41:58 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News] FOREIGN KEY([related_news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News1]    Script Date: 09/01/2016 13:41:58 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News1] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News1]
GO
