USE [26oct_DreamBird]
GO

/****** Object:  Table [dbo].[DreamEnrollment]    Script Date: 11/04/2016 09:31:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DreamEnrollment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dreamID] [int] NOT NULL,
	[AspNetUserID] [nvarchar](128) NOT NULL,
	[enroll_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_DreamEnrollment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[DreamEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_DreamEnrollment_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO

ALTER TABLE [dbo].[DreamEnrollment] CHECK CONSTRAINT [FK_DreamEnrollment_AspNetUsers]
GO

ALTER TABLE [dbo].[DreamEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_DreamEnrollment_Dreams] FOREIGN KEY([dreamID])
REFERENCES [dbo].[Dreams] ([id])
GO

ALTER TABLE [dbo].[DreamEnrollment] CHECK CONSTRAINT [FK_DreamEnrollment_Dreams]
GO


