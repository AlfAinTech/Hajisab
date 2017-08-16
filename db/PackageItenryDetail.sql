USE [16_feb]
GO

/****** Object:  Table [dbo].[PackageItenryDetail]    Script Date: 4/2/2017 6:44:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PackageItenryDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cityName] [nvarchar](50) NOT NULL,
	[nights] [int] NOT NULL,
	[packageDetailID] [int] NOT NULL,
	[alharmainUserID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PackageItenryDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[PackageItenryDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageItenryDetail_PackageDetail] FOREIGN KEY([packageDetailID])
REFERENCES [dbo].[PackageDetail] ([id])
GO

ALTER TABLE [dbo].[PackageItenryDetail] CHECK CONSTRAINT [FK_PackageItenryDetail_PackageDetail]
GO


