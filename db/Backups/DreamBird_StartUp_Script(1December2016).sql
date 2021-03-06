USE [master]
GO
/****** Object:  Database [DreamBird_StartUp]    Script Date: 12/01/2016 14:25:15 ******/
CREATE DATABASE [DreamBird_StartUp] ON  PRIMARY 
( NAME = N'DreamBird_StartUp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\DreamBird_StartUp.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DreamBird_StartUp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\DreamBird_StartUp_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DreamBird_StartUp] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DreamBird_StartUp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DreamBird_StartUp] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET ARITHABORT OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DreamBird_StartUp] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DreamBird_StartUp] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DreamBird_StartUp] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET  DISABLE_BROKER
GO
ALTER DATABASE [DreamBird_StartUp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DreamBird_StartUp] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DreamBird_StartUp] SET  READ_WRITE
GO
ALTER DATABASE [DreamBird_StartUp] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DreamBird_StartUp] SET  MULTI_USER
GO
ALTER DATABASE [DreamBird_StartUp] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DreamBird_StartUp] SET DB_CHAINING OFF
GO
USE [DreamBird_StartUp]
GO
/****** Object:  Table [dbo].[TextBank]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextBank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[textdata] [nvarchar](max) NULL,
	[IsShared] [bit] NULL,
	[TextName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TextBank] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_DreamTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaCategories]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ImageCategories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonMenu]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LessonMenu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menuName] [nvarchar](50) NOT NULL,
	[IsContainer] [bit] NOT NULL,
	[parentMenu_id] [int] NULL,
	[ParentLayoutID] [int] NULL,
	[DreamLayoutID] [int] NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[menuRight] [varchar](50) NULL,
	[menuType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LessonMenu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LessonMenu] ON
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (1, N'parent', 0, NULL, NULL, NULL, N'parent', NULL, N'none')
SET IDENTITY_INSERT [dbo].[LessonMenu] OFF
/****** Object:  Table [dbo].[ControlCategory]    Script Date: 12/01/2016 14:25:16 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ControlCategory] ON
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (1, N'Dreams', NULL)
SET IDENTITY_INSERT [dbo].[ControlCategory] OFF
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'0176297C-F40E-459B-94C0-444A41E032FC', N'DreamUser')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'271D901E-1B8A-4ADE-92D3-1311C220B571', N'Admin')
/****** Object:  Table [dbo].[AdminsettingsNewsFeed]    Script Date: 12/01/2016 14:25:16 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DynamicLayouts]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DynamicLayouts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Header] [bit] NOT NULL,
	[Footer] [bit] NOT NULL,
	[ContentRatio] [nvarchar](255) NULL,
 CONSTRAINT [PK_DynamicLayouts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientLayout]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientLayout](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[layoutName] [nvarchar](25) NOT NULL,
	[layoutContent] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'dreambirdapp@gmail.com', 0, N'APLml/0DpDKa18KEGZMcZDW3Sa2YnboMgIe9Z/mIrk36MLaanGAAT0GPRAra0w67ow==', N'598b8590-d1e8-4a9a-ac71-a03a7416278c', NULL, 0, 0, NULL, 0, 0, N'admin')
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'271D901E-1B8A-4ADE-92D3-1311C220B571')
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DreamUserProfile]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamUserProfile](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AspNetUserId] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Education] [nvarchar](128) NULL,
	[DateOfBirth] [datetime] NULL,
	[ProfilePicture] [nvarchar](max) NULL,
	[IsActivated] [bit] NOT NULL,
 CONSTRAINT [PK_DreamUserProfile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DreamUserProfile] ON
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'admin', NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[DreamUserProfile] OFF
/****** Object:  Table [dbo].[DreamTags]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Dream_id] [int] NULL,
	[Tag_id] [int] NULL,
 CONSTRAINT [PK_DreamTag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaItems]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[path] [nvarchar](50) NOT NULL,
	[MediaCategory_id] [int] NULL,
	[mediaType] [nvarchar](50) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_Icons] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'possible values are: video, audio, image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaItems', @level2type=N'COLUMN',@level2name=N'mediaType'
GO
SET IDENTITY_INSERT [dbo].[MediaItems] ON
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (3, N'asplogo-square.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6C600EFE385 AS DateTime))
SET IDENTITY_INSERT [dbo].[MediaItems] OFF
/****** Object:  Table [dbo].[UserLessonProgress]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLessonProgress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [int] NOT NULL,
	[AspNetUser_id] [nvarchar](128) NOT NULL,
	[progress] [int] NOT NULL,
 CONSTRAINT [PK_UserLessonProgress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextBankTag]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextBankTag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TextID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TextBankTag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonMenuAvailability]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonMenuAvailability](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NOT NULL,
	[AvailableFrom] [datetime] NULL,
	[DeadLine] [datetime] NULL,
	[TimeLimit] [int] NOT NULL,
	[EnableAvailability] [bit] NOT NULL,
	[EnableDeadLine] [bit] NOT NULL,
	[EnableTimeLimit] [bit] NOT NULL,
 CONSTRAINT [PK_LessonMenuAvailability] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoTranscript]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoTranscript](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MediaItem_id] [int] NULL,
	[TimeStamp] [decimal](18, 2) NULL,
	[Text] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaTags]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MediaTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MediaItem_id] [int] NULL,
	[Tag_id] [int] NULL,
 CONSTRAINT [PK_ImageTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[news_title] [char](50) NULL,
	[news_description] [text] NULL,
	[from_date] [date] NULL,
	[to_date] [date] NULL,
	[is_latest_news] [bit] NULL,
	[is_feature_news] [bit] NULL,
	[created_date] [date] NULL,
	[is_main_news] [bit] NULL,
	[MediaItem_id] [int] NULL,
	[Category] [char](15) NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hotelName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[rating] [int] NOT NULL,
	[distance] [float] NOT NULL,
	[mediaID] [int] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Controls]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Controls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ControlCategory_id] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IconURL] [int] NULL,
	[NormalMarkup] [nvarchar](max) NULL,
	[DefautControlName] [nvarchar](max) NULL,
	[AdminControlPath] [nvarchar](max) NULL,
	[isSeperateWindow] [bit] NULL,
	[DeleteControlPath] [nvarchar](250) NULL,
 CONSTRAINT [PK_Controls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Controls] ON
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (1, 1, N'Top Menu Bar', 3, N'xyz', N'~/Components/TopNav/TopNavAnonymous.ascx', N'/Components/TextBank/SuperAdminTextBank.aspx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (2, 1, N'Lesson Menu', 3, N'xyz', N'~/Components/LessonMenu/LessonMenuManager.ascx', N'/Components/LessonMenu/LessonMenuAdminPage.aspx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (3, 1, N'Progress DashBoard', 3, N'xyz', N'~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx', N'/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (4, 1, N'Multimedia Control', 3, N'xyz', N'~/Components/LessonBank/Lesson/LessonMultiMedia.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (5, 1, N'quiz', 3, N'xyz', N'~/Components/LessonBank/Lesson/LessonQuiz.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (6, 1, N'video Control', 3, N'xyz', N'~/Components/LessonBank/Lesson/LessonVideo.ascx', N'/LessonVideoAdminPage.aspx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (17, 1, N'Dream Enrollment', 3, N'xyz', N'~/Components/DreamEnrollment/DreamEnroll.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (18, 1, N'Custom Text Bank', 3, N'xyz', N'~/Components/TextBank/TextBankView.ascx', N'/Components/TextBank/CustomAdminPage.aspx', 0, N'/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (19, 1, N'Shared TextBank', 3, N'xyz', N'~/Components/TextBank/TextBankView.ascx', N'/Components/TextBank/SharedTextBankPage.aspx', 0, N'/Components/TextBank/SharedTextBank/DeleteSharedTextBank.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (20, 1, N'Dream Content Summary', 3, N'xyz', N'~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (21, 1, N'footer', 3, N'xyz', N'~/Components/Footer/FooterControl.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (22, 1, N'Navigation', 3, N'xyz', N'~/Components/NAV_General/NavigationView.ascx', N'/Components/NAV_General/NavigationAdminPage.aspx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (24, 1, N'useractivation', 3, N'xyz', N'~/Components/Account/UserActivation.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (25, 1, N'Dream Profile', 3, N'xyz', N'~/Components/DreamProfile/DreamProfileView.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (26, 1, N'share', 3, N'xyz', N'~/Components/Account/InviteShare.ascx', N'~/Components/Account/InviteshareAdminpage.ascx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (27, 1, N'Dreamview', 3, N'xyz', N'~/Components/Dreams/DreamView.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (30, 1, N'Search', 3, N'xyz', N'~/Components/Header/SearchWithHeader.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (31, 1, N'Related Dreams', 3, N'xyz', N'~/Components/Dreams/RelatedDreams.ascx', N'xyz', 0, NULL)
SET IDENTITY_INSERT [dbo].[Controls] OFF
/****** Object:  Table [dbo].[Dreams]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dreams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DreamName] [varchar](500) NULL,
	[MediaItem_id] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[IsFeatured] [bit] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[LikeSeed] [int] NULL,
 CONSTRAINT [PK_Dreams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DreamMessages]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamMessages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiverId] [int] NOT NULL,
	[Message] [nvarchar](max) NULL,
 CONSTRAINT [PK_DreamMessages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DreamLayouts]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamLayouts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Layout] [nvarchar](max) NULL,
	[DreamID] [int] NULL,
	[Page] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[IsPublished] [bit] NOT NULL,
	[IsUserDefaultPage] [bit] NULL,
	[IsPublicDefaultPage] [bit] NOT NULL,
 CONSTRAINT [PK_DreamLayouts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DreamEnrollment]    Script Date: 12/01/2016 14:25:16 ******/
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
/****** Object:  Table [dbo].[DreamUserLikes]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamUserLikes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DreamId] [int] NOT NULL,
	[AspNetUserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_DreamUserLikes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientPage]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientPage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DreamLayout_id] [int] NULL,
	[Page] [nvarchar](25) NULL,
	[pageContent] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsRelatedNews]    Script Date: 12/01/2016 14:25:16 ******/
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
/****** Object:  Table [dbo].[NewsDreamNews]    Script Date: 12/01/2016 14:25:16 ******/
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
/****** Object:  Table [dbo].[Navigations]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Navigations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MediaItem_id] [int] NULL,
	[Layout_id] [int] NULL,
	[Caption] [nvarchar](50) NULL,
	[Link] [nvarchar](50) NULL,
	[IsPublished] [bit] NULL,
	[LinkType] [int] NULL,
 CONSTRAINT [PK_Navigations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonVideo]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonVideo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Layout_id] [int] NOT NULL,
	[BaseControlID] [nvarchar](50) NOT NULL,
	[MediaItem_id] [int] NULL,
	[showTranscript] [bit] NOT NULL,
 CONSTRAINT [PK_LessonVideo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonProgressDashBoard]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonProgressDashBoard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BaseControlID] [nvarchar](max) NULL,
	[ShowSiblingsProgress] [bit] NOT NULL,
	[LayoutID] [int] NOT NULL,
 CONSTRAINT [PK_LessonProgressDashBoard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LayoutTextBank]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LayoutTextBank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[LayoutID] [int] NOT NULL,
	[TextID] [int] NOT NULL,
	[SharedTextID] [int] NULL,
	[ControlName] [nchar](50) NOT NULL,
	[IsShared] [bit] NULL,
 CONSTRAINT [PK_LayoutTextBank] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InviteSharePage]    Script Date: 12/01/2016 14:25:16 ******/
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
/****** Object:  Table [dbo].[DreamPageAuthorization]    Script Date: 12/01/2016 14:25:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamPageAuthorization](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DreamLayout_id] [int] NULL,
	[PageRole] [nvarchar](25) NULL,
	[isAllowed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_TextBank_TextName]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[TextBank] ADD  CONSTRAINT [DF_TextBank_TextName]  DEFAULT ('') FOR [TextName]
GO
/****** Object:  Default [DF_LessonMenu_IsContainer]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_IsContainer]  DEFAULT ((0)) FOR [IsContainer]
GO
/****** Object:  Default [DF_LessonMenu_DisplayName]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_DisplayName]  DEFAULT ('') FOR [DisplayName]
GO
/****** Object:  Default [DF_LessonMenu_menuType]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_menuType]  DEFAULT (N'multimedia') FOR [menuType]
GO
/****** Object:  Default [DF__DreamUser__IsAct__2E1BDC42]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamUserProfile] ADD  CONSTRAINT [DF__DreamUser__IsAct__2E1BDC42]  DEFAULT ((0)) FOR [IsActivated]
GO
/****** Object:  Default [DF_UserLessonProgress_progress]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[UserLessonProgress] ADD  CONSTRAINT [DF_UserLessonProgress_progress]  DEFAULT ((0)) FOR [progress]
GO
/****** Object:  Default [DF_LessonMenuAvailability_TimeLimit]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_TimeLimit]  DEFAULT ((0)) FOR [TimeLimit]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableAvailability]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableAvailability]  DEFAULT ((0)) FOR [EnableAvailability]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableDeadLine]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableDeadLine]  DEFAULT ((0)) FOR [EnableDeadLine]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableTimeLimit]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableTimeLimit]  DEFAULT ((0)) FOR [EnableTimeLimit]
GO
/****** Object:  Default [DF_Hotel_rating]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_rating]  DEFAULT ((0)) FOR [rating]
GO
/****** Object:  Default [DF_Hotel_distance]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_distance]  DEFAULT ((0)) FOR [distance]
GO
/****** Object:  Default [DF_Dreams_IsFeatured]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsFeatured]  DEFAULT ((0)) FOR [IsFeatured]
GO
/****** Object:  Default [DF_Dreams_IsDefault]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
/****** Object:  Default [DF_Dreams_IsPublished]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsPublished]  DEFAULT ((0)) FOR [IsPublished]
GO
/****** Object:  Default [DF_DreamLayouts_IsPublished]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_IsPublished]  DEFAULT ((1)) FOR [IsPublished]
GO
/****** Object:  Default [DF__DreamLayo__IsDef__403A8C7D]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF__DreamLayo__IsDef__403A8C7D]  DEFAULT ((0)) FOR [IsUserDefaultPage]
GO
/****** Object:  Default [DF_DreamLayouts_IsPublicDefaultPage]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_IsPublicDefaultPage]  DEFAULT ((0)) FOR [IsPublicDefaultPage]
GO
/****** Object:  Default [DF_LessonVideo_showTranscript]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonVideo] ADD  CONSTRAINT [DF_LessonVideo_showTranscript]  DEFAULT ((0)) FOR [showTranscript]
GO
/****** Object:  Default [DF_LessonProgressDashBoard_ShowSiblingsProgress]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonProgressDashBoard] ADD  CONSTRAINT [DF_LessonProgressDashBoard_ShowSiblingsProgress]  DEFAULT ((0)) FOR [ShowSiblingsProgress]
GO
/****** Object:  ForeignKey [FK_LessonMenu_LessonMenu]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonMenu]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenu_LessonMenu] FOREIGN KEY([parentMenu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenu] CHECK CONSTRAINT [FK_LessonMenu_LessonMenu]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_DreamUserProfile_AspNetUsers]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamUserProfile]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserProfile_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserProfile] CHECK CONSTRAINT [FK_DreamUserProfile_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_Tag]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamTags]  WITH CHECK ADD  CONSTRAINT [FK_Tag] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamTags] CHECK CONSTRAINT [FK_Tag]
GO
/****** Object:  ForeignKey [FK_MediaItems_MediaCategories]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[MediaItems]  WITH CHECK ADD  CONSTRAINT [FK_MediaItems_MediaCategories] FOREIGN KEY([MediaCategory_id])
REFERENCES [dbo].[MediaCategories] ([id])
GO
ALTER TABLE [dbo].[MediaItems] CHECK CONSTRAINT [FK_MediaItems_MediaCategories]
GO
/****** Object:  ForeignKey [FK_UserLessonProgress_AspNetUsers]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_AspNetUsers] FOREIGN KEY([AspNetUser_id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_UserLessonProgress_LessonMenu]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_LessonMenu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_LessonMenu]
GO
/****** Object:  ForeignKey [FK_TextBankTag_Tags]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[TextBankTag]  WITH CHECK ADD  CONSTRAINT [FK_TextBankTag_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[TextBankTag] CHECK CONSTRAINT [FK_TextBankTag_Tags]
GO
/****** Object:  ForeignKey [FK_TextBankTag_TextBank]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[TextBankTag]  WITH CHECK ADD  CONSTRAINT [FK_TextBankTag_TextBank] FOREIGN KEY([TextID])
REFERENCES [dbo].[TextBank] ([id])
GO
ALTER TABLE [dbo].[TextBankTag] CHECK CONSTRAINT [FK_TextBankTag_TextBank]
GO
/****** Object:  ForeignKey [FK_LessonMenuAvailability_LessonMenu]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonMenuAvailability]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenuAvailability_LessonMenu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenuAvailability] CHECK CONSTRAINT [FK_LessonMenuAvailability_LessonMenu]
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__00200768]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK_MediaTags_MediaItems]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_MediaItems]
GO
/****** Object:  ForeignKey [FK_MediaTags_Tags]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_Tags] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_Tags]
GO
/****** Object:  ForeignKey [FK_News_MediaItems]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_MediaItems]
GO
/****** Object:  ForeignKey [FK_Hotel_MediaItems]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_MediaItems]
GO
/****** Object:  ForeignKey [FK__Controls__Contro__04E4BC85]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
/****** Object:  ForeignKey [FK__Controls__IconUR__05D8E0BE]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([IconURL])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK_Dreams_MediaItems]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD  CONSTRAINT [FK_Dreams_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Dreams] CHECK CONSTRAINT [FK_Dreams_MediaItems]
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile] FOREIGN KEY([SenderId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile]
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile1]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile1] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile1]
GO
/****** Object:  ForeignKey [FK_DreamLayouts_Dreams]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamLayouts]  WITH CHECK ADD  CONSTRAINT [FK_DreamLayouts_Dreams] FOREIGN KEY([DreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamLayouts] CHECK CONSTRAINT [FK_DreamLayouts_Dreams]
GO
/****** Object:  ForeignKey [FK_DreamEnrollment_AspNetUsers]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_DreamEnrollment_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamEnrollment] CHECK CONSTRAINT [FK_DreamEnrollment_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_DreamEnrollment_Dreams]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_DreamEnrollment_Dreams] FOREIGN KEY([dreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamEnrollment] CHECK CONSTRAINT [FK_DreamEnrollment_Dreams]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_AspNetUsers]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_Dreams]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_Dreams] FOREIGN KEY([DreamId])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_Dreams]
GO
/****** Object:  ForeignKey [FK__ClientPag__Dream__0E6E26BF]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[ClientPage]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[Dreams] ([id])
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News] FOREIGN KEY([related_news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News1]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News1] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News1]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_Dreams]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_Dreams] FOREIGN KEY([dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_Dreams]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_News]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_News] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_News]
GO
/****** Object:  ForeignKey [FK_Navigations_DreamLayoutsnew]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_DreamLayoutsnew] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_DreamLayoutsnew]
GO
/****** Object:  ForeignKey [FK_Navigations_MediaItems]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_MediaItems]
GO
/****** Object:  ForeignKey [FK_LessonVideo_DreamLayouts1]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonVideo]  WITH CHECK ADD  CONSTRAINT [FK_LessonVideo_DreamLayouts1] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonVideo] CHECK CONSTRAINT [FK_LessonVideo_DreamLayouts1]
GO
/****** Object:  ForeignKey [FK_LessonVideo_MediaItems]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonVideo]  WITH CHECK ADD  CONSTRAINT [FK_LessonVideo_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonVideo] CHECK CONSTRAINT [FK_LessonVideo_MediaItems]
GO
/****** Object:  ForeignKey [FK_LessonProgressDashBoard_DreamLayouts]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LessonProgressDashBoard]  WITH CHECK ADD  CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonProgressDashBoard] CHECK CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_LayoutTextBank_DreamLayouts]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[LayoutTextBank]  WITH CHECK ADD  CONSTRAINT [FK_LayoutTextBank_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LayoutTextBank] CHECK CONSTRAINT [FK_LayoutTextBank_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_InviteSharePage_DreamLayouts]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[InviteSharePage]  WITH CHECK ADD  CONSTRAINT [FK_InviteSharePage_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InviteSharePage] CHECK CONSTRAINT [FK_InviteSharePage_DreamLayouts]
GO
/****** Object:  ForeignKey [FK__DreamPage__Dream__19DFD96B]    Script Date: 12/01/2016 14:25:16 ******/
ALTER TABLE [dbo].[DreamPageAuthorization]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
