USE [DreamBird]
GO
/****** Object:  Table [dbo].[AssignmentBank]    Script Date: 12/26/2016 10:53:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentBank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[FileStorageDirectory] [nvarchar](512) NOT NULL,
	[CategoryID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignmentCategories]    Script Date: 12/26/2016 10:53:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AssignmentResponse]    Script Date: 12/26/2016 10:53:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignmentResponse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Page] [int] NOT NULL,
	[isSubmitted] [bit] NOT NULL,
	[UploadedFilePath] [nvarchar](255) NULL,
	[UploadedFileType] [nvarchar](10) NULL,
	[AssignmentResult] [decimal](15, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonAssignments]    Script Date: 12/26/2016 10:53:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonAssignments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Layout_id] [int] NOT NULL,
	[BaseControlID] [nvarchar](50) NOT NULL,
	[Assignment_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AssignmentBank] ON 

INSERT [dbo].[AssignmentBank] ([id], [Name], [Description], [FileStorageDirectory], [CategoryID]) VALUES (1, N'Momentum', N'Write the definition of Momentum', N'~/Components/Assignments/Content/Files/Momentum/', 1)
SET IDENTITY_INSERT [dbo].[AssignmentBank] OFF
SET IDENTITY_INSERT [dbo].[AssignmentCategories] ON 

INSERT [dbo].[AssignmentCategories] ([id], [CategoryName]) VALUES (1, N'Physics')
INSERT [dbo].[AssignmentCategories] ([id], [CategoryName]) VALUES (2, N'Chemistry')
INSERT [dbo].[AssignmentCategories] ([id], [CategoryName]) VALUES (3, N'Mathematics')
SET IDENTITY_INSERT [dbo].[AssignmentCategories] OFF
SET IDENTITY_INSERT [dbo].[AssignmentResponse] ON 

INSERT [dbo].[AssignmentResponse] ([id], [AssignmentID], [UserID], [Page], [isSubmitted], [UploadedFilePath], [UploadedFileType], [AssignmentResult]) VALUES (1, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54, 1, N'D:\DreamBird\DreamBird\Components\Assignments\Content\Files\Momentum\3ad5b021-ffea-486d-8640-9de2f6e161ca_Momentum.pdf', N'.pdf', CAST(0.000 AS Decimal(15, 3)))
INSERT [dbo].[AssignmentResponse] ([id], [AssignmentID], [UserID], [Page], [isSubmitted], [UploadedFilePath], [UploadedFileType], [AssignmentResult]) VALUES (2, 1, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', 54, 1, N'D:\DreamBird\DreamBird\Components\Assignments\Content\Files\Momentum\1ee8e6c2-1582-48e2-9900-1a6e095bc3ab_Momentum.docx', N'.docx', CAST(9.000 AS Decimal(15, 3)))
SET IDENTITY_INSERT [dbo].[AssignmentResponse] OFF
SET IDENTITY_INSERT [dbo].[LessonAssignments] ON 

INSERT [dbo].[LessonAssignments] ([id], [Layout_id], [BaseControlID], [Assignment_id]) VALUES (1, 54, N'BaseDreamControl1', 1)
SET IDENTITY_INSERT [dbo].[LessonAssignments] OFF
ALTER TABLE [dbo].[AssignmentBank]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[AssignmentCategories] ([id])
GO
ALTER TABLE [dbo].[AssignmentResponse]  WITH CHECK ADD FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
ALTER TABLE [dbo].[AssignmentResponse]  WITH CHECK ADD FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD FOREIGN KEY([Assignment_id])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
