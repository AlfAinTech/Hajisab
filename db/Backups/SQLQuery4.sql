USE [DreamBird]
GO

/****** Object:  Table [dbo].[ControlCategory]    Script Date: 10/24/2016 2:36:05 PM ******/
DROP TABLE [dbo].[ControlCategory]
GO

/****** Object:  Table [dbo].[ControlCategory]    Script Date: 10/24/2016 2:36:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ControlCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Cat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


