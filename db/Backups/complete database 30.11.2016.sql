USE [master]
GO
/****** Object:  Database [DreamBird]    Script Date: 11/30/2016 12:05:00 PM ******/
CREATE DATABASE [DreamBird]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DreamBird', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DreamBird.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DreamBird_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DreamBird_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DreamBird] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DreamBird].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DreamBird] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DreamBird] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DreamBird] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DreamBird] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DreamBird] SET ARITHABORT OFF 
GO
ALTER DATABASE [DreamBird] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DreamBird] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DreamBird] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DreamBird] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DreamBird] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DreamBird] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DreamBird] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DreamBird] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DreamBird] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DreamBird] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DreamBird] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DreamBird] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DreamBird] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DreamBird] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DreamBird] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DreamBird] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DreamBird] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DreamBird] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DreamBird] SET  MULTI_USER 
GO
ALTER DATABASE [DreamBird] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DreamBird] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DreamBird] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DreamBird] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DreamBird] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DreamBird]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdminsettingsNewsFeed]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientLayout]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientPage]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ControlCategory]    Script Date: 11/30/2016 12:05:00 PM ******/
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
/****** Object:  Table [dbo].[Controls]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DreamEnrollment]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DreamLayouts]    Script Date: 11/30/2016 12:05:00 PM ******/
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
	[IsPublished] [bit] NOT NULL CONSTRAINT [DF_DreamLayouts_IsPublished]  DEFAULT ((1)),
	[IsUserDefaultPage] [bit] NULL CONSTRAINT [DF__DreamLayo__IsDef__403A8C7D]  DEFAULT ((0)),
	[IsPublicDefaultPage] [bit] NOT NULL CONSTRAINT [DF_DreamLayouts_IsPublicDefaultPage]  DEFAULT ((0)),
 CONSTRAINT [PK_DreamLayouts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DreamMessages]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DreamPageAuthorization]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dreams]    Script Date: 11/30/2016 12:05:00 PM ******/
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
	[IsFeatured] [bit] NOT NULL CONSTRAINT [DF_Dreams_IsFeatured]  DEFAULT ((0)),
	[IsDefault] [bit] NOT NULL CONSTRAINT [DF_Dreams_IsDefault]  DEFAULT ((0)),
	[IsPublished] [bit] NOT NULL CONSTRAINT [DF_Dreams_IsPublished]  DEFAULT ((0)),
	[LikeSeed] [int] NULL,
 CONSTRAINT [PK_Dreams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DreamTags]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DreamUserLikes]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DreamUserProfile]    Script Date: 11/30/2016 12:05:00 PM ******/
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
	[IsActivated] [bit] NOT NULL CONSTRAINT [DF__DreamUser__IsAct__2E1BDC42]  DEFAULT ((0)),
 CONSTRAINT [PK_DreamUserProfile] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DynamicLayouts]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InviteSharePage]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LayoutTextBank]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonMenu]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LessonMenuAvailability]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonProgressDashBoard]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonVideo]    Script Date: 11/30/2016 12:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonVideo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Layout_id] [int] NOT NULL,
	[BaseControlID] [nvarchar](50) NOT NULL,
	[MediaItem_id] [int] NULL,
 CONSTRAINT [PK_LessonVideo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MediaCategories]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MediaItems]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MediaTags]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Navigations]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewsDreamNews]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsRelatedNews]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TextBank]    Script Date: 11/30/2016 12:05:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextBank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[textdata] [nvarchar](max) NULL,
	[IsShared] [bit] NULL,
	[TextName] [nvarchar](max) NOT NULL CONSTRAINT [DF_TextBank_TextName]  DEFAULT (''),
 CONSTRAINT [PK_TextBank] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TextBankTag]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLessonProgress]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoTranscript]    Script Date: 11/30/2016 12:05:00 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'0176297C-F40E-459B-94C0-444A41E032FC', N'DreamUser')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'271D901E-1B8A-4ADE-92D3-1311C220B571', N'Admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'12c7f563-1599-410b-8114-f0543a68de42', N'271D901E-1B8A-4ADE-92D3-1311C220B571')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'29130344-3240-4a0d-8bd9-1936e031e12f', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'12c7f563-1599-410b-8114-f0543a68de42', NULL, 0, N'ALU+O0VP4qAgXxtMf/rKUcX/MCo9H+QssBE1pxZY+h5khM0ZdpiVRI32ucHVMOYwwQ==', N'28652e6a-9a09-41ec-8d45-b091998f397f', NULL, 0, 0, NULL, 0, 0, N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'29130344-3240-4a0d-8bd9-1936e031e12f', N'jahanzaib996@gmail.com', 0, N'AFN/aI2ZjGBvvU4LHTok1KQjX9fg22xFqgKM9cmQipRPUR2fAKlMd7IeSWgNXjUNKg==', N'4dd4ab72-5bdb-4472-9f53-c2a06c1b2646', NULL, 0, 0, NULL, 0, 0, N'jahanzaib')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', N'saba.akmal@kics.edu.pk', 0, N'ADHyFOJhcDjtK/DegH6Y67xkSfakShlIGqV+KYmTjqYJzkUnkz6jh7e7atuVJUh9og==', N'66fa7bc2-e589-4bcd-b8c9-aacf014b9e68', NULL, 0, 0, NULL, 0, 0, N'Qaswa')
SET IDENTITY_INSERT [dbo].[ClientPage] ON 

INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (1, 2, N'default', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=2&PID=3&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-4 sortable ui-sortable'' data-size=''col-md-4'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''padding-top:80;''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''col-md-4''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671fvd?DID=2&PID=3&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-4 sortable ui-sortable'' data-size=''col-md-4'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-4''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Content Summary''><a href=''http://localhost:64671desx?DID=2&PID=3&CID=BaseDreamControl3'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Content Summary</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (2, 1, N'Home', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=1&PID=1&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Search''><a href=''http://localhost:64671gf?DID=1&PID=1&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Search</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Dreamview''><a href=''http://localhost:64671gr?DID=1&PID=1&CID=BaseDreamControl3'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dreamview</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''footer''><a href=''http://localhost:64671fdc?DID=1&PID=1&CID=BaseDreamControl4'' target="_blank"><h4 style=''margin:0;''>footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (3, 2, N'userdefault', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=2&PID=4&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (6, 2, N'Home', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' id=''sortable-1'' style=''margin: 0px; display: block;'' data-size=''container''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' aria-hidden=''true'' style=''position:absolute; top:2px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' style=''position:absolute; top:10px; right:2px; opacity:0;'' data-toggle=''modal'' data-target=''#controlsList'' data-argument=''sortable-1''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' style=''position:absolute; top:15px; right:2px; opacity:0;'' data-toggle=''modal'' data-target=''#editCSS'' data-argument=''sortable-1''></span><input id=''hidden-sortable-1'' type=''hidden'' value=''''><input id=''hidden-class-sortable-1'' type=''hidden'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=2&PID=6&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' aria-hidden=''true'' style=''position:absolute; top:2px; right:2px; opacity:0;'' data-remove="http://localhost:64671/Comonent?DID=2&PID=6&CID=BaseDreamControl1"></span></div></div>')
SET IDENTITY_INSERT [dbo].[ClientPage] OFF
SET IDENTITY_INSERT [dbo].[ControlCategory] ON 

INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (1, N'Dreams', NULL)
SET IDENTITY_INSERT [dbo].[ControlCategory] OFF
SET IDENTITY_INSERT [dbo].[Controls] ON 

INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (1, 1, N'Top Menu Bar', 3, N'fdc', N'~/Components/TopNav/TopNavAnonymous.ascx', N'/Components/TextBank/SuperAdminTextBank.aspx', 0, N'/Comonent')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (2, 1, N'Lesson Menu', 3, N'fdc', N'~/Components/LessonMenu/LessonMenuManager.ascx', N'/Components/LessonMenu/LessonMenuAdminPage.aspx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (3, 1, N'Progress DashBoard', 3, N'hj', N'~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx', N'/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (4, 1, N'Multimedia Control', 3, N'hj', N'~/Components/LessonBank/Lesson/LessonMultiMedia.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (5, 1, N'quiz', 3, N'hj', N'~/Components/LessonBank/Lesson/LessonQuiz.ascx', N'xyz', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (6, 1, N'video Control', 3, N'hj', N'~/Components/LessonBank/Lesson/LessonVideo.ascx', N'/LessonVideoAdminPage.aspx', 1, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (17, 1, N'Dream Enrollment', 3, N'abc', N'~/Components/DreamEnrollment/DreamEnroll.ascx', N'fvd', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (18, 1, N'Custom Text Bank', 3, N'ab', N'~/Components/TextBank/TextBankView.ascx', N'/Components/TextBank/CustomAdminPage.aspx', 1, N'/Components/TextBank/DeleteCustomTextBank.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (19, 1, N'Shared TextBank', 3, N'ABC', N'~/Components/TextBank/TextBankView.ascx', N'/Components/TextBank/SharedTextBankPage.aspx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (20, 1, N'Dream Content Summary', 3, N'dc', N'~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx', N'desx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (21, 1, N'footer', 3, N'dsc', N'~/Components/Footer/FooterControl.ascx', N'fdc', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (22, 1, N'Navigation', 3, N'fvc', N'~/Components/NAV_General/NavigationView.ascx', N'/Components/NAV_General/NavigationAdminPage.aspx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (24, 1, N'useractivation', 3, N'fvc', N'~/Components/Account/UserActivation.ascx', N'abc', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (25, 1, N'Dream Profile', 3, N'fbv', N'~/Components/DreamProfile/DreamProfileView.ascx', N'dfsc', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (26, 1, N'share', 3, N'jhkh', N'~/Components/Account/InviteShare.ascx', N'~/Components/Account/InviteshareAdminpage.ascx', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (27, 1, N'Dreamview', 3, N'fdc', N'~/Components/Dreams/DreamView.ascx', N'gr', 0, NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (30, 1, N'Search', 3, N'fc', N'~/Components/Header/SearchWithHeader.ascx', N'gf', 0, NULL)
SET IDENTITY_INSERT [dbo].[Controls] OFF
SET IDENTITY_INSERT [dbo].[DreamLayouts] ON 

INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (1, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/Header/SearchWithHeader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/Dreams/DreamView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-4'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/Components/Footer/FooterControl.ascx''></uc2:basedreamcontrol></div>', 1, N'Home', NULL, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (3, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-4'' class="col-md-4" style="padding-top:80;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-4" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx''></uc2:basedreamcontrol></div>', 2, N'default', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (4, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 2, N'userdefault', NULL, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (5, NULL, 1, N'New', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (6, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div>', 2, N'Home', NULL, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[DreamLayouts] OFF
SET IDENTITY_INSERT [dbo].[DreamPageAuthorization] ON 

INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (1, 1, N'DreamUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (2, 1, N'Admin', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (3, 5, N'DreamUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (4, 5, N'Admin', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (5, 6, N'DreamUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (6, 6, N'Admin', 0)
SET IDENTITY_INSERT [dbo].[DreamPageAuthorization] OFF
SET IDENTITY_INSERT [dbo].[Dreams] ON 

INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed]) VALUES (1, N'Home', 1, N'', 0, 1, 1, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed]) VALUES (2, N'NTS', 2, N'National Testing Service – Pakistan (NTS) was established in July 2002 in response to an expressed need for a testing service in the National Education Policy (1998-2010) and the Information Technology (IT) Policy of Government of Pakistan (GoP).', 0, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[Dreams] OFF
SET IDENTITY_INSERT [dbo].[DreamTags] ON 

INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (1, 1, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (2, 2, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (3, 2, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (4, 1, 1)
SET IDENTITY_INSERT [dbo].[DreamTags] OFF
SET IDENTITY_INSERT [dbo].[DreamUserProfile] ON 

INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (1, N'29130344-3240-4a0d-8bd9-1936e031e12f', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[DreamUserProfile] OFF
SET IDENTITY_INSERT [dbo].[LayoutTextBank] ON 

INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (1, 3, 1, NULL, N'BaseDreamControl3                                 ', 0)
SET IDENTITY_INSERT [dbo].[LayoutTextBank] OFF
SET IDENTITY_INSERT [dbo].[MediaCategories] ON 

INSERT [dbo].[MediaCategories] ([id], [CategoryName]) VALUES (1, N'a')
SET IDENTITY_INSERT [dbo].[MediaCategories] OFF
SET IDENTITY_INSERT [dbo].[MediaItems] ON 

INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (1, N'gre.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-11-22 14:17:34.500' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (2, N'nts.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-11-22 14:21:27.547' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (3, N'asplogo-square.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-11-22 14:33:24.497' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (4, N'videoplayback.mp4', N'/Components/MediaBank/Content/Video', 1, N'video', CAST(N'2016-11-27 18:37:29.353' AS DateTime))
SET IDENTITY_INSERT [dbo].[MediaItems] OFF
SET IDENTITY_INSERT [dbo].[MediaTags] ON 

INSERT [dbo].[MediaTags] ([id], [MediaItem_id], [Tag_id]) VALUES (1, 1, 1)
INSERT [dbo].[MediaTags] ([id], [MediaItem_id], [Tag_id]) VALUES (2, 2, 1)
SET IDENTITY_INSERT [dbo].[MediaTags] OFF
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([id], [Name]) VALUES (1, N'tag1')
SET IDENTITY_INSERT [dbo].[Tags] OFF
SET IDENTITY_INSERT [dbo].[TextBank] ON 

INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (1, N'<img alt="" src="/Components/MediaBank/Content/Images/100x100/nts.png" style="width: 100px; height: 100px;" />', 0, N'image')
SET IDENTITY_INSERT [dbo].[TextBank] OFF
/****** Object:  Index [UQ__LessonMe__C99ED25133C560A9]    Script Date: 11/30/2016 12:05:00 PM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED25192BE3407]    Script Date: 11/30/2016 12:05:00 PM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED251943B9574]    Script Date: 11/30/2016 12:05:00 PM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED25196E0BBEE]    Script Date: 11/30/2016 12:05:00 PM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED251A5D866A9]    Script Date: 11/30/2016 12:05:00 PM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED251D222DC8E]    Script Date: 11/30/2016 12:05:00 PM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_IsContainer]  DEFAULT ((0)) FOR [IsContainer]
GO
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_DisplayName]  DEFAULT ('') FOR [DisplayName]
GO
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_menuType]  DEFAULT (N'multimedia') FOR [menuType]
GO
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_TimeLimit]  DEFAULT ((0)) FOR [TimeLimit]
GO
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableAvailability]  DEFAULT ((0)) FOR [EnableAvailability]
GO
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableDeadLine]  DEFAULT ((0)) FOR [EnableDeadLine]
GO
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableTimeLimit]  DEFAULT ((0)) FOR [EnableTimeLimit]
GO
ALTER TABLE [dbo].[LessonProgressDashBoard] ADD  CONSTRAINT [DF_LessonProgressDashBoard_ShowSiblingsProgress]  DEFAULT ((0)) FOR [ShowSiblingsProgress]
GO
ALTER TABLE [dbo].[UserLessonProgress] ADD  CONSTRAINT [DF_UserLessonProgress_progress]  DEFAULT ((0)) FOR [progress]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ClientPage]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([IconURL])
REFERENCES [dbo].[MediaItems] ([id])
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
ALTER TABLE [dbo].[DreamLayouts]  WITH CHECK ADD  CONSTRAINT [FK_DreamLayouts_Dreams] FOREIGN KEY([DreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamLayouts] CHECK CONSTRAINT [FK_DreamLayouts_Dreams]
GO
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile] FOREIGN KEY([SenderId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile]
GO
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile1] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile1]
GO
ALTER TABLE [dbo].[DreamPageAuthorization]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD  CONSTRAINT [FK_Dreams_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Dreams] CHECK CONSTRAINT [FK_Dreams_MediaItems]
GO
ALTER TABLE [dbo].[DreamTags]  WITH CHECK ADD  CONSTRAINT [FK_Tag] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamTags] CHECK CONSTRAINT [FK_Tag]
GO
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_AspNetUsers]
GO
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_Dreams] FOREIGN KEY([DreamId])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_Dreams]
GO
ALTER TABLE [dbo].[DreamUserProfile]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserProfile_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserProfile] CHECK CONSTRAINT [FK_DreamUserProfile_AspNetUsers]
GO
ALTER TABLE [dbo].[InviteSharePage]  WITH CHECK ADD  CONSTRAINT [FK_InviteSharePage_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InviteSharePage] CHECK CONSTRAINT [FK_InviteSharePage_DreamLayouts]
GO
ALTER TABLE [dbo].[LayoutTextBank]  WITH CHECK ADD  CONSTRAINT [FK_LayoutTextBank_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LayoutTextBank] CHECK CONSTRAINT [FK_LayoutTextBank_DreamLayouts]
GO
ALTER TABLE [dbo].[LessonMenu]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenu_LessonMenu] FOREIGN KEY([parentMenu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenu] CHECK CONSTRAINT [FK_LessonMenu_LessonMenu]
GO
ALTER TABLE [dbo].[LessonMenuAvailability]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenuAvailability_LessonMenu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenuAvailability] CHECK CONSTRAINT [FK_LessonMenuAvailability_LessonMenu]
GO
ALTER TABLE [dbo].[LessonProgressDashBoard]  WITH CHECK ADD  CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonProgressDashBoard] CHECK CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts]
GO
ALTER TABLE [dbo].[LessonVideo]  WITH CHECK ADD  CONSTRAINT [FK_LessonVideo_DreamLayouts1] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonVideo] CHECK CONSTRAINT [FK_LessonVideo_DreamLayouts1]
GO
ALTER TABLE [dbo].[LessonVideo]  WITH CHECK ADD  CONSTRAINT [FK_LessonVideo_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonVideo] CHECK CONSTRAINT [FK_LessonVideo_MediaItems]
GO
ALTER TABLE [dbo].[MediaItems]  WITH CHECK ADD  CONSTRAINT [FK_MediaItems_MediaCategories] FOREIGN KEY([MediaCategory_id])
REFERENCES [dbo].[MediaCategories] ([id])
GO
ALTER TABLE [dbo].[MediaItems] CHECK CONSTRAINT [FK_MediaItems_MediaCategories]
GO
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_MediaItems]
GO
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_Tags] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_Tags]
GO
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_DreamLayoutsnew] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_DreamLayoutsnew]
GO
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_MediaItems]
GO
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_MediaItems]
GO
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_Dreams] FOREIGN KEY([dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_Dreams]
GO
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_News] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_News]
GO
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News] FOREIGN KEY([related_news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News]
GO
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News1] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News1]
GO
ALTER TABLE [dbo].[TextBankTag]  WITH CHECK ADD  CONSTRAINT [FK_TextBankTag_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[TextBankTag] CHECK CONSTRAINT [FK_TextBankTag_Tags]
GO
ALTER TABLE [dbo].[TextBankTag]  WITH CHECK ADD  CONSTRAINT [FK_TextBankTag_TextBank] FOREIGN KEY([TextID])
REFERENCES [dbo].[TextBank] ([id])
GO
ALTER TABLE [dbo].[TextBankTag] CHECK CONSTRAINT [FK_TextBankTag_TextBank]
GO
ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_AspNetUsers] FOREIGN KEY([AspNetUser_id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_AspNetUsers]
GO
ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_LessonMenu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_LessonMenu]
GO
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'possible values are: video, audio, image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaItems', @level2type=N'COLUMN',@level2name=N'mediaType'
GO
USE [master]
GO
ALTER DATABASE [DreamBird] SET  READ_WRITE 
GO
