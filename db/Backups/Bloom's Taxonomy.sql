USE [DreamBird]
GO

/****** Object:  Table [dbo].[BloomsTaxonomy]    Script Date: 2/8/2017 11:13:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[BloomsTaxonomy](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TaxonomyName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


