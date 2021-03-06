USE [master]
GO
/****** Object:  Database [DreamBird]    Script Date: 2/21/2017 9:44:05 AM ******/
CREATE DATABASE [DreamBird]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DreamBird', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DreamBird.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[Accommodation]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accommodation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[availability] [bit] NOT NULL CONSTRAINT [DF_Accommodation_availability]  DEFAULT ((0)),
	[hotelID] [int] NOT NULL,
 CONSTRAINT [PK_Accommodation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AdminsettingsNewsFeed]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[AirLine]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirLine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AspNetUserID] [nvarchar](128) NOT NULL DEFAULT ('3ad5b021-ffea-486d-8640-9de2f6e161ca'),
 CONSTRAINT [PK_AirLine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AlharmainUser]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlharmainUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[mobileNo] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[contect] [nvarchar](max) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[province] [nvarchar](50) NOT NULL,
	[adults] [int] NOT NULL,
	[children] [int] NOT NULL,
	[infants] [int] NOT NULL,
 CONSTRAINT [PK_AlharmainUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AlharmainUserPackage]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlharmainUserPackage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[packageDetailID] [int] NOT NULL,
	[isCustomPackage] [bit] NOT NULL,
	[discountID] [int] NULL,
	[AccomMakkahID] [int] NOT NULL,
	[AccomMadinaID] [int] NOT NULL,
 CONSTRAINT [PK_AlharmainUserPackage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[AssignmentBank]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[AssignmentCategories]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[AssignmentResponse]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[BloomsTaxonomy]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[ChatAdmin]    Script Date: 2/21/2017 9:44:05 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientLayout]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[ClientPage]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[ControlCategory]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[Controls]    Script Date: 2/21/2017 9:44:05 AM ******/
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
	[isProgress] [bit] NULL,
 CONSTRAINT [PK_Controls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomPackage]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomPackage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[month] [int] NOT NULL,
	[hotelMakkahID] [int] NOT NULL,
	[nightsMakkah] [int] NOT NULL,
	[hotelMadinaID] [int] NOT NULL,
	[nightsMadina] [int] NOT NULL,
	[isRoundTrip] [bit] NOT NULL,
	[returnAirLineID] [int] NOT NULL,
	[departureAirLineID] [int] NOT NULL,
	[roomMakkahID] [int] NOT NULL,
	[roomMadinaID] [int] NOT NULL,
	[depFlightID] [int] NOT NULL,
	[retFlightID] [int] NOT NULL,
 CONSTRAINT [PK_CustomPackage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiscountPackage]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountPackage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[availableFrom] [date] NOT NULL,
	[availableTill] [date] NOT NULL,
	[packageDetailID] [int] NOT NULL,
	[discountPercent] [float] NOT NULL,
 CONSTRAINT [PK_DiscountPackage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DreamEnrollment]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[DreamLayouts]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[DreamMessages]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[DreamPageAuthorization]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[DreamPageControls]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamPageControls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Layout_ID] [int] NOT NULL,
	[Component_ID] [int] NOT NULL,
	[BaseDreamServer_ID] [nvarchar](25) NOT NULL,
	[TotalProgress] [decimal](15, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dreams]    Script Date: 2/21/2017 9:44:05 AM ******/
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
	[dreamTypeID] [int] NULL CONSTRAINT [DF_Dreams_dreamTypeID]  DEFAULT ((1)),
	[AspNetUserID] [nvarchar](128) NOT NULL DEFAULT ('3ad5b021-ffea-486d-8640-9de2f6e161ca'),
 CONSTRAINT [PK_Dreams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DreamTags]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[DreamType]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DreamType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DetailPath] [nvarchar](max) NULL,
 CONSTRAINT [PK_DreamType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DreamUserLikes]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[DreamUserProfile]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[DynamicLayouts]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[FIBOptions]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FIBOptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[OptionText] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FileCategories]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Files]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[path] [nvarchar](50) NOT NULL,
	[FileCategory_ID] [int] NULL,
	[FileType] [nvarchar](50) NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Flight]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[departureDate] [date] NOT NULL,
	[returnDate] [date] NOT NULL,
	[fromCity] [nvarchar](50) NOT NULL,
	[destinationCity] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[flightType] [int] NOT NULL,
	[airLineID] [int] NOT NULL,
 CONSTRAINT [PK_Flights] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hotelName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[rating] [int] NOT NULL CONSTRAINT [DF_Hotel_rating]  DEFAULT ((0)),
	[distance] [float] NOT NULL CONSTRAINT [DF_Hotel_distance]  DEFAULT ((0)),
	[mediaID] [int] NOT NULL,
	[AspNetUserID] [nvarchar](128) NOT NULL DEFAULT ('3ad5b021-ffea-486d-8640-9de2f6e161ca'),
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelFacility]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelFacility](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[availability] [bit] NOT NULL,
	[mediaID] [int] NOT NULL,
	[hotelID] [int] NOT NULL,
 CONSTRAINT [PK_Facility] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mediaID] [int] NOT NULL,
	[hotelID] [int] NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InviteSharePage]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[LayoutTextBank]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[LessonAssignments]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[LessonMenu]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LessonMenu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menuName] [nvarchar](50) NOT NULL,
	[IsContainer] [bit] NOT NULL CONSTRAINT [DF_LessonMenu_IsContainer]  DEFAULT ((0)),
	[parentMenu_id] [int] NULL,
	[ParentLayoutID] [int] NULL,
	[DreamLayoutID] [int] NULL,
	[previous_LayoutID] [int] NULL,
	[next_LayoutID] [int] NULL,
	[DisplayName] [nvarchar](50) NOT NULL CONSTRAINT [DF_LessonMenu_DisplayName]  DEFAULT (''),
	[menuRight] [varchar](50) NULL,
	[menuType] [nvarchar](50) NOT NULL CONSTRAINT [DF_LessonMenu_menuType]  DEFAULT (N'multimedia'),
	[isActive] [bit] NULL,
	[isDefault] [bit] NULL,
	[AppOrder] [int] NULL,
	[isShowNP] [bit] NULL,
 CONSTRAINT [PK_LessonMenu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LessonMenuAvailability]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonMenuAvailability](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NOT NULL,
	[AvailableFrom] [datetime] NULL,
	[DeadLine] [datetime] NULL,
	[TimeLimit] [int] NOT NULL CONSTRAINT [DF_LessonMenuAvailability_TimeLimit]  DEFAULT ((0)),
	[EnableAvailability] [bit] NOT NULL CONSTRAINT [DF_LessonMenuAvailability_EnableAvailability]  DEFAULT ((0)),
	[EnableDeadLine] [bit] NOT NULL CONSTRAINT [DF_LessonMenuAvailability_EnableDeadLine]  DEFAULT ((0)),
	[EnableTimeLimit] [bit] NOT NULL CONSTRAINT [DF_LessonMenuAvailability_EnableTimeLimit]  DEFAULT ((0)),
 CONSTRAINT [PK_LessonMenuAvailability] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonMenuPreRequisite]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonMenuPreRequisite](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [int] NOT NULL,
	[pre_req_menu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonMultimedia]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonMultimedia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Layout_id] [int] NOT NULL,
	[BaseControlID] [nvarchar](50) NOT NULL,
	[MultimediaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonProgressControl]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonProgressControl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BaseControlID] [nvarchar](max) NULL,
	[ResidingLayoutID] [int] NULL,
	[OriginalLayoutID] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
	[ProgressType] [nvarchar](16) NULL,
 CONSTRAINT [PK__LessonPr__3213E83FCB683907] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonProgressDashBoard]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonProgressDashBoard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BaseControlID] [nvarchar](max) NULL,
	[ShowSiblingsProgress] [bit] NOT NULL CONSTRAINT [DF_LessonProgressDashBoard_ShowSiblingsProgress]  DEFAULT ((0)),
	[LayoutID] [int] NOT NULL,
 CONSTRAINT [PK_LessonProgressDashBoard] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonQuestion]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonQuestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Layout_id] [int] NOT NULL,
	[BaseControlID] [nvarchar](50) NOT NULL,
	[Question_id] [int] NULL,
	[HintOption] [nvarchar](64) NULL,
	[HintMarks] [decimal](18, 2) NULL,
	[ShowAnswer] [bit] NULL,
 CONSTRAINT [PK_LessonQuestion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonQuiz]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonQuiz](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Layout_id] [int] NOT NULL,
	[BaseControlID] [nvarchar](50) NOT NULL,
	[QuizID] [int] NULL,
	[Graded] [bit] NOT NULL,
	[Marks] [decimal](15, 3) NULL,
	[TimeBased] [bit] NOT NULL,
	[TotalTime] [int] NULL,
	[visibleQuestions] [int] NOT NULL,
	[QuestionsPerPage] [int] NOT NULL,
	[HintOption] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LessonVideo]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonVideo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Layout_id] [int] NOT NULL,
	[BaseControlID] [nvarchar](50) NOT NULL,
	[MediaItem_id] [int] NULL,
	[showTranscript] [bit] NOT NULL CONSTRAINT [DF_LessonVideo_showTranscript]  DEFAULT ((0)),
 CONSTRAINT [PK_LessonVideo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MCQOptions]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MCQOptions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[OptionText] [nvarchar](255) NOT NULL,
	[isCorrect] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MediaCategories]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[MediaItems]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[MediaTags]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[MultiFIBComponents]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultiFIBComponents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[TextType] [nvarchar](50) NOT NULL,
	[TextContent] [nvarchar](255) NOT NULL,
	[Weightage] [decimal](15, 2) NULL,
	[Sequence] [int] NULL,
 CONSTRAINT [PK__MultiFIB__3213E83F02D3EA00] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MultiFIBMarkup]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MultiFIBMarkup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[QuestionMarkup] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Multimediabank]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Multimediabank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[DirectoryPath] [nvarchar](256) NULL,
	[IndexFilePath] [nvarchar](256) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Navigations]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[NewsDreamNews]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[NewsRelatedNews]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[Package]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[startDate] [date] NOT NULL,
	[duration] [int] NOT NULL,
	[mediaID] [int] NOT NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PackageDetail]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dreamID] [int] NOT NULL,
	[hotelIDMakkah] [int] NOT NULL,
	[nightsInMakkah] [int] NOT NULL CONSTRAINT [DF_PackageDetail_nightsInMakkah]  DEFAULT ((0)),
	[hotelIDMadina] [int] NOT NULL,
	[nightsInMadina] [int] NOT NULL CONSTRAINT [DF_PackageDetail_nightsInMadina]  DEFAULT ((0)),
	[returnFlight] [bit] NOT NULL,
	[departureFlightID] [int] NULL,
	[returnFlightID] [int] NULL,
	[isTransportAvailable] [bit] NOT NULL CONSTRAINT [DF_Table_1_isTransport]  DEFAULT ((0)),
	[transportID] [int] NULL,
	[isZiaratAvailable] [bit] NOT NULL,
	[ziaratID] [int] NULL,
	[isVisaAvailable] [bit] NOT NULL,
	[visaID] [int] NULL,
	[additionalExpense] [int] NOT NULL CONSTRAINT [DF_PackageDetail_additionalExpense]  DEFAULT ((0)),
	[additionalDetail] [nvarchar](max) NULL,
	[isAirLineAvailable] [bit] NOT NULL CONSTRAINT [DF_PackageDetail_isAirLineAvailable]  DEFAULT ((0)),
	[packageType] [nvarchar](50) NOT NULL DEFAULT ((1)),
	[startDate] [date] NOT NULL DEFAULT (getdate()),
	[minRange] [float] NOT NULL DEFAULT ((0)),
	[maxRange] [float] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_PackageDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionBank]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionBank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NULL,
	[Level] [int] NULL,
	[CategoryID] [int] NULL,
	[SubCategoryID] [int] NULL,
 CONSTRAINT [PK__Question__3213E83F74AA5B81] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionCategories]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionHints]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionHints](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[HintText] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionSubCategories]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionSubCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[SubCategoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_QuestionSubCategories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QTypeName] [nvarchar](128) NULL,
	[EditTypeControl] [nvarchar](512) NULL,
	[ViewTypeControl] [nvarchar](512) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizBank]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizBank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](512) NOT NULL,
	[Categoryid] [int] NOT NULL,
	[MediaItemID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizBankQuestions]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizBankQuestions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuizID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizCategories]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizCategories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[TextBank]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[TextBankTag]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[TransPort]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransPort](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TransPort] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserHintStatus]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserHintStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Page] [int] NOT NULL,
	[UserID] [nvarchar](100) NULL,
	[HintOption] [nvarchar](64) NOT NULL,
	[HintMarks] [decimal](18, 2) NULL,
 CONSTRAINT [PK__UserHint__3213E83F90B8A285] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLessonProgress]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLessonProgress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [int] NOT NULL,
	[AspNetUser_id] [nvarchar](128) NOT NULL,
	[progress] [decimal](18, 3) NOT NULL CONSTRAINT [DF_UserLessonProgress_progress]  DEFAULT ((0)),
 CONSTRAINT [PK_UserLessonProgress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserQuizStatus]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserQuizStatus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuizID] [int] NOT NULL,
	[QuestionID] [int] NOT NULL,
	[QuestionStatus] [bit] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Page] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserResponse]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserResponse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[Page] [int] NOT NULL,
	[UserPerformance] [bit] NOT NULL,
	[UserReply] [nvarchar](255) NULL,
	[quizID] [int] NULL,
	[AwardedMarks] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VideoTranscript]    Script Date: 2/21/2017 9:44:05 AM ******/
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
/****** Object:  Table [dbo].[VisaPackages]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisaPackages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[visaTitle] [nvarchar](50) NOT NULL,
	[amount] [float] NOT NULL,
	[issueDate] [date] NOT NULL,
	[expireDate] [date] NOT NULL,
	[AspNetUserID] [nvarchar](128) NOT NULL DEFAULT ('3ad5b021-ffea-486d-8640-9de2f6e161ca'),
 CONSTRAINT [PK_VisaPackages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ziarat]    Script Date: 2/21/2017 9:44:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ziarat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[text] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ziarat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accommodation] ON 

INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (3, N'room 1', 12000, 1, 2)
SET IDENTITY_INSERT [dbo].[Accommodation] OFF
SET IDENTITY_INSERT [dbo].[AirLine] ON 

INSERT [dbo].[AirLine] ([id], [Name], [AspNetUserID]) VALUES (1, N'Pakistan International Airline', N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
SET IDENTITY_INSERT [dbo].[AirLine] OFF
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'271D901E-1B8A-4ADE-92D3-1311C220B571', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C', N'RegisteredUser')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'B0067FFA-6714-4454-B3BA-920AA78F655C', N'AnonymousUser')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'C3A2048D-D8F2-4951-A4AC-7CC556BC9EAD', N'EnrolledUser')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Facebook', N'1279151828792833', N'6a6328ff-530b-40e3-9635-6f040941aa02')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Facebook', N'1772561323009364', N'c3b70fc3-2c17-487f-b023-503f5c0232c5')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'106503808014110465900', N'8ede996c-fa92-4655-8b91-282af6d3cd49')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'115983989610436776729', N'9ec276e3-6ca1-486f-ab56-362b09217745')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00e15ddc-48b6-400e-9d5a-7dc89cb0cbcd', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'271D901E-1B8A-4ADE-92D3-1311C220B571')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6a6328ff-530b-40e3-9635-6f040941aa02', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8ede996c-fa92-4655-8b91-282af6d3cd49', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'985d0276-bba6-4d8a-8b02-b8440f3a176e', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9ec276e3-6ca1-486f-ab56-362b09217745', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a0e8a11e-0a02-4361-bbc6-cfa8ae2f41ce', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b12ebd32-72e6-4d7d-a544-e1caa179db0a', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b3afc247-bd2f-4be2-ab35-6d6a71e17816', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c3b70fc3-2c17-487f-b023-503f5c0232c5', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cde4eb97-41d7-4936-84e2-e915ed50e8f0', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e40b58ec-a049-423a-bdb3-ce988352056c', N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00e15ddc-48b6-400e-9d5a-7dc89cb0cbcd', N'16_febapp@gmail.com', 0, N'AATGX+lfjpsaVLnXP0qyHT0Mha7lqn9iafL3BFkMLKg9/ABQvb52l2mysKEjn0278Q==', N'c6488e26-b8e9-43dc-9024-cb5103fa88c2', NULL, 0, 0, NULL, 0, 0, N'haris')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', N'jahanzaib@uet.edu.pk', 0, N'AJ40ttPY3TVaa9x2eNxehQn04TAZU0mmvPusHUiAH0DjDU2qf+1PvMFZElhKQ6GXaw==', N'e07829c2-821f-480b-bfeb-8b08876b7017', NULL, 0, 0, NULL, 0, 0, N'jahanzaibbabar')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'16_febapp@gmail.com', 0, N'APUlWFqACsVGWmPdPaszKzyXLt6W5w0dlNzr9K68RWh2ZifsNMeNVfUligGx3Bo9ZQ==', N'0d67e239-ce93-4b8c-9c7f-07b6501d4af4', NULL, 0, 0, NULL, 0, 0, N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3c41f5f6-5e0e-488a-b740-cf6732213f49', N'16_febapp@gmail.com', 0, NULL, N'4ccc8deb-0ce0-4e1e-8c0b-00e359e8ba1d', NULL, 0, 0, NULL, 0, 0, N'16_febapp')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'447b2ff1-48a0-4094-ad9f-1a2e8be568ce', N'16_febapp@gmail.com', 0, NULL, N'ab6d6468-2fb7-4d68-8846-f84f79560666', NULL, 0, 0, NULL, 0, 0, N'16_febapps')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'48ff644d-46ef-4412-913e-46994fe283b0', N'saba.akmal@kics.edu.pk', 0, NULL, N'515dded7-7086-4df6-92ee-06db254f3a20', NULL, 0, 0, NULL, 0, 0, N'SabaAkmal')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6a6328ff-530b-40e3-9635-6f040941aa02', N'jahanzaib996@gmail.com', 0, NULL, N'f7c2e612-6cd3-4841-a1fc-357cc40cdd7e', NULL, 0, 0, NULL, 0, 0, N'jzeebe')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8ede996c-fa92-4655-8b91-282af6d3cd49', N'resonotech@gmail.com', 0, NULL, N'76d80ac5-2633-4209-9dae-812e12547b73', NULL, 0, 0, NULL, 0, 0, N'resonotech')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'985d0276-bba6-4d8a-8b02-b8440f3a176e', N'16_febapp@gmail.com', 0, N'AMkcl8XqJLmFMTg6DKzlK0OejsOlYM8Iod19y1mKYU6BMk4fYFkhE1DbmhSVnJ5DRA==', N'f212c614-494a-4cf2-b049-afd18d417e83', NULL, 0, 0, NULL, 0, 0, N'amin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9ec276e3-6ca1-486f-ab56-362b09217745', N'awais.hassan@kics.edu.pk', 0, NULL, N'22d42093-6316-40c0-ba06-c8cf4ec6cdaa', NULL, 0, 0, NULL, 0, 0, N'M.AwaisHassan')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a0e8a11e-0a02-4361-bbc6-cfa8ae2f41ce', N'16_febapp@gmail.com', 0, N'AHJXkje22mOlaB9eXNwRvBSkCGKMW2WjP1QXRLkHQeP7XyKfAiDZwYHOU9qSvazOWg==', N'53c5364d-bdbe-4366-83f2-e2d9bf577339', NULL, 0, 0, NULL, 0, 0, N'asif')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b12ebd32-72e6-4d7d-a544-e1caa179db0a', N'saba.akmal@kics.edu.pk', 0, N'AEJ6Pf9VRet2xNaZCybpNlsV5cpezEjOgLW7Yst3EheqA1QF8kMIt/l2JFfmxuNzpw==', N'f18342a3-c2e6-49ed-a6be-b93dfed0b782', NULL, 0, 0, NULL, 0, 0, N'sabaakmal23')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b3afc247-bd2f-4be2-ab35-6d6a71e17816', N'jahanzaib996@gmail.com', 0, N'AKH4S9FEcExUM6PDNxs0XFSBy34L7SQbnCoFJMVyaUh8qUiWJxMKIjYl6990wUfQ4w==', N'9a78b00f-1f5c-45a8-a4f9-9dbfa84d9841', NULL, 0, 0, NULL, 0, 0, N'jzeebee')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c3b70fc3-2c17-487f-b023-503f5c0232c5', N'october.pink.10@gmail.com', 0, NULL, N'2f31711d-2263-4cfe-82e2-f6e5cb29e92c', NULL, 0, 0, NULL, 0, 0, N'FaizaJahanzaib')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cde4eb97-41d7-4936-84e2-e915ed50e8f0', N'16_febapp@gmail.com', 0, N'AE/Gw7J9eIzUx5I+U0M3aJVFlL9uzUC945VqluOA0+N2J+GOBUVMYYNn2fB/xj7Lhg==', N'c2eef060-807a-4cab-9a8f-bd04aa49adbe', NULL, 0, 0, NULL, 0, 0, N'ali')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e40b58ec-a049-423a-bdb3-ce988352056c', N'saba.akmal@kics.edu.pk', 0, N'AHj9k2dWiNi6pDagyI5V4kN1CJev8oAORsPoAf2jKqSOwcmHZPG0s/Ayb18Zyajzkg==', N'1faed6b0-1812-466f-b37c-d19d25148512', NULL, 0, 0, NULL, 0, 0, N'saba')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'edba741d-aac8-4959-a79c-e18f24f86c87', N'jahanzaib996@gmail.com', 0, NULL, N'55984a33-16d9-44cf-ab9f-c5aa9036ba01', NULL, 0, 0, NULL, 0, 0, N'MuhammadJahanzaib')
SET IDENTITY_INSERT [dbo].[AssignmentBank] ON 

INSERT [dbo].[AssignmentBank] ([id], [Name], [Description], [FileStorageDirectory], [CategoryID]) VALUES (1, N'Momentum', N'Write the definition of Momentum', N'~/Components/Assignments/Content/Files/Momentum/', 1)
SET IDENTITY_INSERT [dbo].[AssignmentBank] OFF
SET IDENTITY_INSERT [dbo].[AssignmentCategories] ON 

INSERT [dbo].[AssignmentCategories] ([id], [CategoryName]) VALUES (1, N'Physics')
INSERT [dbo].[AssignmentCategories] ([id], [CategoryName]) VALUES (2, N'Chemistry')
INSERT [dbo].[AssignmentCategories] ([id], [CategoryName]) VALUES (3, N'Mathematics')
SET IDENTITY_INSERT [dbo].[AssignmentCategories] OFF
SET IDENTITY_INSERT [dbo].[AssignmentResponse] ON 

INSERT [dbo].[AssignmentResponse] ([id], [AssignmentID], [UserID], [Page], [isSubmitted], [UploadedFilePath], [UploadedFileType], [AssignmentResult]) VALUES (1, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54, 1, N'D:\16_feb\16_feb\Components\Assignments\Content\Files\Momentum\3ad5b021-ffea-486d-8640-9de2f6e161ca_Momentum.pdf', N'.pdf', CAST(0.000 AS Decimal(15, 3)))
INSERT [dbo].[AssignmentResponse] ([id], [AssignmentID], [UserID], [Page], [isSubmitted], [UploadedFilePath], [UploadedFileType], [AssignmentResult]) VALUES (2, 1, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', 54, 1, N'D:\16_feb\16_feb\Components\Assignments\Content\Files\Momentum\1ee8e6c2-1582-48e2-9900-1a6e095bc3ab_Momentum.docx', N'.docx', CAST(9.000 AS Decimal(15, 3)))
SET IDENTITY_INSERT [dbo].[AssignmentResponse] OFF
SET IDENTITY_INSERT [dbo].[BloomsTaxonomy] ON 

INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (1, N'Knowledge')
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (2, N'Comprehension')
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (3, N'Application')
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (4, N'Analysis')
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (5, N'Synthesis')
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (6, N'Evaluation')
SET IDENTITY_INSERT [dbo].[BloomsTaxonomy] OFF
SET IDENTITY_INSERT [dbo].[ChatAdmin] ON 

INSERT [dbo].[ChatAdmin] ([id], [tokenID], [serverID], [layoutID]) VALUES (1, N'5ASDQ24UUMBGQF34G6LQCMDKVOHDK7KB', N'http://localhost:8002/server/', 93)
SET IDENTITY_INSERT [dbo].[ChatAdmin] OFF
SET IDENTITY_INSERT [dbo].[ClientLayout] ON 

INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (1, N'Layout1', N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    <h4 style=''margin: 0;''>1</h4>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''></div><div class=''btn btn-success col-md-6 sortable ui-sortable'' data-size=''col-md-6'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-6''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-6 sortable ui-sortable'' data-size=''col-md-6'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    <h4 style=''margin: 0;''>6/12</h4>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''col-md-6''></div><div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    <h4 style=''margin: 0;''>3/12</h4>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-3''></div><div class=''btn btn-success col-md-9 sortable ui-sortable'' data-size=''col-md-9'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    <h4 style=''margin: 0;''>9/12</h4>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''col-md-9''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-7''>
    <h4 style=''margin: 0;''>1</h4>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-7'' value=''''><input type=''hidden'' id=''hidden-class-sortable-7'' value=''col-md-12''></div>')
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (2, N'Layout2', N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <div class=''btn btn-success col-md-1 sortable ui-sortable'' data-size=''col-md-1'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    <h4 style=''margin: 0;''>1/12</h4>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input id=''hidden-sortable-2'' value='''' style='''' type=''hidden''><input id=''hidden-class-sortable-2'' value=''col-md-1'' style='''' type=''hidden''></div>
    <div class=''btn btn-success col-md-11 sortable ui-sortable'' data-size=''col-md-11'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    <h4 style=''margin: 0;''>11/12</h4>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input id=''hidden-sortable-3'' value='''' style='''' type=''hidden''><input id=''hidden-class-sortable-3'' value=''col-md-11'' style='''' type=''hidden''></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input id=''hidden-sortable-1'' value='''' style='''' type=''hidden''><input id=''hidden-class-sortable-1'' value=''container'' style='''' type=''hidden''></div>')
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (3, N'Video', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''video Control''><div class=''col-md-6'' style=''padding:0;''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>video Control</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''video Control'' type=''checkbox''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''video Control'' style=''color:black;'' placeholder=''Weightage'' disabled=''disabled''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''>')
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (4, N'Quiz', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Quiz''><div class=''col-md-6'' style=''padding:0;''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Quiz</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Quiz'' type=''checkbox''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Quiz'' style=''color:black;'' placeholder=''Weightage'' disabled=''disabled''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><input type=''hidden'' id=''counter_current'' value=''2''>')
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (5, N'Reading', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''Custom Text Bank''><div class=''col-md-6'' style=''padding:0;''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Custom Text Bank</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Custom Text Bank'' type=''checkbox''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Custom Text Bank'' style=''color:black;'' placeholder=''Weightage'' disabled=''disabled''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''>')
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (6, N'Multimedia', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Lesson Multimedia''><div class=''col-md-6'' style=''padding:0;''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Lesson Multimedia</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Lesson Multimedia'' type=''checkbox''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Lesson Multimedia'' style=''color:black;'' placeholder=''Weightage'' disabled=''disabled''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><input type=''hidden'' id=''counter_current'' value=''2''>')
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (7, N'UmrahDetail', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''PackageHeader''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><input type=''hidden'' id=''counter_current'' value=''5''><div class=''btn btn-success col-md-9 sortable ui-sortable'' data-size=''col-md-9'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-9''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''umrah detail''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>umrah detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-3''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''2'' data-name=''Accommodation Makkah''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Accommodation Makkah</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''3'' data-name=''Accommodation Madina''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Accommodation Madina</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''4'' data-name=''discount detail''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>discount detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (8, N'BookingForm', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''PackageHeader''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform'' data-basedreamserverid=''1''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer'' data-basedreamserverid=''2''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''><input type=''hidden'' id=''counter_current''>')
SET IDENTITY_INSERT [dbo].[ClientLayout] OFF
SET IDENTITY_INSERT [dbo].[ClientPage] ON 

INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (1, 1, N'Default', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar'' data-basedreamserverid=''1''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=1&PID=1&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=1&PID=1&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Search'' data-basedreamserverid=''2''><a href=''http://localhost:64671null?DID=1&PID=1&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Search</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl2'' data-remove="http://localhost:64671null?DID=1&PID=1&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Featured Dreams'' data-basedreamserverid=''3''><a href=''http://localhost:64671~/Components/Dreams/FeatureDreams.ascx?DID=1&PID=1&CID=BaseDreamControl3'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Featured Dreams</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237.?DID=1&amp;PID=1&amp;CID=BaseDreamControl3'' data-remove="http://localhost:64671.?DID=1&PID=1&CID=BaseDreamControl3"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12 featured_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Dream View New'' data-basedreamserverid=''4''><a href=''http://localhost:64671.?DID=1&PID=1&CID=BaseDreamControl4'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream View New</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671.?DID=1&amp;PID=1&amp;CID=BaseDreamControl4'' data-remove="http://localhost:64671.?DID=1&PID=1&CID=BaseDreamControl4"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12 content_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-7''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-8''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-8'' value=''''><input type=''hidden'' id=''hidden-class-sortable-8'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''General News '' data-basedreamserverid=''5''><a href=''http://localhost:64671~/Components/News/NewControls/GeneralNewsView.ascx?DID=1&PID=1&CID=BaseDreamControl5'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>General News </h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237..?DID=1&amp;PID=1&amp;CID=BaseDreamControl5'' data-remove="http://localhost:64671null?DID=1&PID=1&CID=BaseDreamControl5"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-7'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-7'' value=''col-md-12 news_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-11''>
    
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-12''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-12'' value=''''><input type=''hidden'' id=''hidden-class-sortable-12'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''footer'' data-basedreamserverid=''6''><a href=''http://localhost:64671null?DID=1&PID=1&CID=BaseDreamControl6'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=1&amp;PID=1&amp;CID=BaseDreamControl6'' data-remove="http://localhost:64671null?DID=1&PID=1&CID=BaseDreamControl6"></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-11'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-11'' value=''col-md-12 footer_wrapper''></div><input type=''hidden'' id=''counter_current'' value=''7''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (2, 2, N'Default', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar'' data-basedreamserverid=''1''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=2&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=2&PID=2&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding:0; background-position: center top 0px;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12 main_image_gre''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank'' data-basedreamserverid=''2''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl2'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl2'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank'' data-basedreamserverid=''3''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl3'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl3'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl3"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding:0; padding-top:30px; padding-bottom:30px;''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12 featured_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    <div class=''btn btn-success col-md-8 sortable ui-sortable'' data-size=''col-md-8'' style=''display: block; margin: 0px;'' id=''sortable-8''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-8'' value=''''><input type=''hidden'' id=''hidden-class-sortable-8'' value=''col-md-8''><div class=''col-md-12 btn btn-warning'' data-name=''video Control'' data-basedreamserverid=''4''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl4'' target=''_blank'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=2&amp;CID=BaseDreamControl4'' data-remove="http://localhost:64671null?DID=2&PID=2&CID=BaseDreamControl4"></span></div></div><div class=''btn btn-success col-md-4 sortable ui-sortable'' data-size=''col-md-4'' style=''display: block; margin: 0px;'' id=''sortable-7''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-7'' value=''margin-top:35px;''><input type=''hidden'' id=''hidden-class-sortable-7'' value=''col-md-4''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Content Summary'' data-basedreamserverid=''5''><a href=''http://localhost:64671null?DID=2&PID=2&CID=BaseDreamControl5'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Content Summary</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=2&amp;CID=BaseDreamControl5'' data-remove="http://localhost:64671null?DID=2&PID=2&CID=BaseDreamControl5"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''container''></div>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-9''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-10''>
    
    <div class=''btn btn-success col-md-8 sortable ui-sortable'' data-size=''col-md-8'' style=''display: block; margin: 0px;'' id=''sortable-12''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-12'' value=''''><input type=''hidden'' id=''hidden-class-sortable-12'' value=''col-md-8''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank'' data-basedreamserverid=''6''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl6'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl6'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl6"></span></div></div><div class=''btn btn-success col-md-4 sortable ui-sortable'' data-size=''col-md-4'' style=''display: block; margin: 0px;'' id=''sortable-11''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-11'' value=''''><input type=''hidden'' id=''hidden-class-sortable-11'' value=''col-md-4''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment'' data-basedreamserverid=''7''><a href=''http://localhost:64671null?DID=2&PID=2&CID=BaseDreamControl7'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=2&amp;CID=BaseDreamControl7'' data-remove="http://localhost:64671null?DID=2&PID=2&CID=BaseDreamControl7"></span></div><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank'' data-basedreamserverid=''8''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl8'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl8'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl8"></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-10'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-10'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-10'' value=''''><input type=''hidden'' id=''hidden-class-sortable-10'' value=''container''></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-9'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-9'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-9'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-9'' value=''col-md-12''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-13''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-14''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-14'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-14'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-14'' value=''''><input type=''hidden'' id=''hidden-class-sortable-14'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank'' data-basedreamserverid=''9''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl9'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl9'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl9"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-13'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-13'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-13'' value=''''><input type=''hidden'' id=''hidden-class-sortable-13'' value=''col-md-12''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-15''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-16''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-16'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-16'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-16'' value=''padding:15px;''><input type=''hidden'' id=''hidden-class-sortable-16'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank'' data-basedreamserverid=''10''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl10'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl10'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl10"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-15'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-15'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-15'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-15'' value=''col-md-12 news_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-17''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-18''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-18'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-18'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-18'' value=''''><input type=''hidden'' id=''hidden-class-sortable-18'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Footer'' data-basedreamserverid=''11''><a href=''http://localhost:64671null?DID=2&PID=2&CID=BaseDreamControl11'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=2&amp;CID=BaseDreamControl11'' data-remove="http://localhost:64671null?DID=2&PID=2&CID=BaseDreamControl11"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-17'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-17'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-17'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-17'' value=''col-md-12 footer_wrapper''></div><input type=''hidden'' id=''counter_current'' value=''12''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (3, 2, N'Home', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://74.208.125.237/Components/TextBank/SuperAdminTextBank.aspx?DID=2&PID=3&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=3&amp;CID=BaseDreamControl1'' data-remove="http://74.208.125.237null?DID=2&PID=3&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://74.208.125.237/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=3&CID=BaseDreamControl2'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=3&amp;CID=BaseDreamControl2'' data-remove="http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=3&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12 content_wrapper''><div class=''col-md-12 btn btn-warning'' data-name=''Lesson Menu''><a href=''http://74.208.125.237/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=2&PID=3&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>Lesson Menu</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://74.208.125.237null?DID=2&PID=3&CID=BaseDreamControl3"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (4, 2, N'Progress', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Progress DashBoard''><a href=''http://74.208.125.237/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx?DID=2&PID=4&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Progress DashBoard</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://74.208.125.237null?DID=2&PID=4&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (5, 2, N'Video01', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://74.208.125.237/LessonVideoAdminPage.aspx?DID=2&PID=6&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://74.208.125.237null?DID=2&PID=6&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (6, 2, N'Quiz01', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Quiz''><a href=''http://74.208.125.237null?DID=2&PID=7&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Quiz</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://74.208.125.237null?DID=2&PID=7&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (7, 2, N'Reading01', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://74.208.125.237null?DID=2&PID=8&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=8&amp;CID=BaseDreamControl1'' data-remove="http://74.208.125.237null?DID=2&PID=8&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''background-color:#b1b1b1;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://74.208.125.237/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=8&CID=BaseDreamControl2'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=8&amp;CID=BaseDreamControl2'' data-remove="http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=8&CID=BaseDreamControl2"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (8, 2, N'Activity01', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://74.208.125.237/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=10&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=10&amp;CID=BaseDreamControl1'' data-remove="http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=10&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (9, 2, N'Activity02', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://74.208.125.237/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=11&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''="" return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=11&amp;CID=BaseDreamControl1'' data-remove="http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=11&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (10, 2, N'Acitivity03', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://74.208.125.237/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=12&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=12&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (11, 3, N'Default', N' <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar'' data-basedreamserverid=''1''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=3&PID=13&CID=BaseDreamControl1'' attrto=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=3&amp;PID=13&amp;CID=BaseDreamControl1'' http://localhost:64671/components/textbank/superadmintextbank.aspx?did="3&amp;PID=13&amp;CID=BaseDreamControl1'');''" attrto="http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=3&PID=13&CID=BaseDreamControl1" target="page_frame" onclick="SetIFrame(''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=3&PID=13&CID=BaseDreamControl1'');"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=3&amp;PID=13&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=3&PID=13&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank'' data-basedreamserverid=''2''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=13&CID=BaseDreamControl2'' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''="" return='''' false;''='''' attrto=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=3&amp;PID=13&amp;CID=BaseDreamControl2'' http://localhost:64671/components/textbank/customadminpage.aspx?did="3&amp;PID=13&amp;CID=BaseDreamControl2'');''" attrto="http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=13&CID=BaseDreamControl2" target="page_frame" onclick="SetIFrame(''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=13&CID=BaseDreamControl2'');"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=13&amp;CID=BaseDreamControl2'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=13&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Lesson Menu'' data-basedreamserverid=''3''><a href=''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=3&PID=13&CID=BaseDreamControl3'' attrto=''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=3&amp;PID=13&amp;CID=BaseDreamControl3'' http://localhost:64671/components/lessonmenu/lessonmenuadminpage.aspx?did="3&amp;PID=13&amp;CID=BaseDreamControl3'');''" attrto="http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=3&PID=13&CID=BaseDreamControl3" target="page_frame" onclick="SetIFrame(''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=3&PID=13&CID=BaseDreamControl3'');"><h4 style=''margin:0;''>Lesson Menu</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=3&amp;PID=13&amp;CID=BaseDreamControl3'' data-remove="http://localhost:64671null?DID=3&PID=13&CID=BaseDreamControl3"></span></div></div><input type=''hidden'' id=''counter_current'' value=''4''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (12, 3, N'Lesson1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=14&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=14&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=14&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671null?DID=3&PID=14&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=3&amp;PID=14&amp;CID=BaseDreamControl2'' data-remove="http://localhost:64671null?DID=3&PID=14&CID=BaseDreamControl2"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (13, 3, N'MediaBank', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=15&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=15&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=15&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671null?DID=3&PID=15&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=3&amp;PID=15&amp;CID=BaseDreamControl2'' data-remove="http://localhost:64671null?DID=3&PID=15&CID=BaseDreamControl2"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (14, 3, N'MediaSelection', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=16&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=16&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=16&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671null?DID=3&PID=16&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=3&PID=16&CID=BaseDreamControl2"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (15, 3, N'Templates', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=17&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=17&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=17&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (16, 3, N'LayoutCreation', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=18&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=18&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=18&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (17, 3, N'AddComponents', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=19&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=19&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=19&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (18, 3, N'Components', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=20&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=20&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=20&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (19, 3, N'AddNewComponent', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=21&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=21&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=21&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (20, 3, N'ComponentList', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=22&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=22&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=22&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (21, 3, N'FileBank', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Lesson Multimedia''><a href=''http://localhost:64671/Components/MultimediaBank/MultimediaSelection.aspx?DID=3&PID=23&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Lesson Multimedia</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671.?DID=3&amp;PID=23&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671.?DID=3&PID=23&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (22, 3, N'DreamAdminPanel', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=24&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=24&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (23, 3, N'DreamPages', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=25&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=25&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (24, 3, N'PageBuilder', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=26&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=26&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (25, 3, N'CreationDefaultDream', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Lesson Multimedia''><a href=''http://localhost:64671/Components/MultimediaBank/MultimediaSelection.aspx?DID=3&PID=27&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Lesson Multimedia</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671.?DID=3&amp;PID=27&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671.?DID=3&PID=27&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (26, 3, N'DefaultPage', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=29&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=29&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (27, 3, N'DreamMenu', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=30&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=30&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (28, 3, N'NewsAdminPanel', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=31&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=31&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (29, 3, N'AddNews', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=32&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=32&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (30, 3, N'EditNews', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=33&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=33&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (31, 2, N'Week03', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=35&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''="" return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=35&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=35&CID=BaseDreamControl1"></span></div></div>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://s19390994.onlinehome-server.comnull?DID=2&PID=35&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=2&amp;PID=35&amp;CID=BaseDreamControl2'' data-remove="http://s19390994.onlinehome-server.comnull?DID=2&PID=35&CID=BaseDreamControl2"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (32, 2, N'First', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=37&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=37&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=37&CID=BaseDreamControl1"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://s19390994.onlinehome-server.comnull?DID=2&PID=37&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.comnull?DID=2&PID=37&CID=BaseDreamControl2"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (33, 2, N'Second', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=38&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=38&CID=BaseDreamControl1"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://s19390994.onlinehome-server.comnull?DID=2&PID=38&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.comnull?DID=2&PID=38&CID=BaseDreamControl2"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (34, 2, N'Third', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=39&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=39&CID=BaseDreamControl1"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://s19390994.onlinehome-server.comnull?DID=2&PID=39&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.comnull?DID=2&PID=39&CID=BaseDreamControl2"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (35, 5, N'satphys', N' ')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (36, 10, N'Sample', N' <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar'' data-basedreamserverid=''1''><a page_frame'');='''' iframe.src=''this.href;'' ''='''' alert(''hi'');''='''' return;''='''' attrto=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=10&amp;PID=42&amp;CID=BaseDreamControl1'' http:='''' localhost:64671='''' components='''' textbank='''' superadmintextbank.aspx?did=''10&amp;PID=42&amp;CID=BaseDreamControl1'' );''''='''' http://localhost:64671/components/textbank/superadmintextbank.aspx?did="10&amp;PID=42&amp;CID=BaseDreamControl1'');''" attrto="http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=10&PID=42&CID=BaseDreamControl1" target="page_frame" onclick="SetIFrame(''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=10&PID=42&CID=BaseDreamControl1'');"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=10&amp;PID=42&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=10&PID=42&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding:0; background-position: center top 0px;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12 main_image_gre''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    <div class=''btn btn-success col-md-8 sortable ui-sortable'' data-size=''col-md-8'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-8''><div class=''col-md-12 btn btn-warning'' data-name=''video Control'' data-basedreamserverid=''3''><a page_frame'');='''' iframe.src=''this.href;'' ''='''' alert(''hi'');''='''' return;''='''' attrto=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=10&amp;PID=42&amp;CID=BaseDreamControl3'' http:='''' localhost:64671='''' lessonvideoadminpage.aspx?did=''10&amp;PID=42&amp;CID=BaseDreamControl3'' );''''='''' http://localhost:64671/lessonvideoadminpage.aspx?did="10&amp;PID=42&amp;CID=BaseDreamControl3'');''" attrto="http://localhost:64671/LessonVideoAdminPage.aspx?DID=10&PID=42&CID=BaseDreamControl3" target="page_frame" onclick="SetIFrame(''http://localhost:64671/LessonVideoAdminPage.aspx?DID=10&PID=42&CID=BaseDreamControl3'');"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=10&amp;PID=42&amp;CID=BaseDreamControl3'' data-remove="http://localhost:64671null?DID=10&PID=42&CID=BaseDreamControl3"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><div class=''btn btn-success col-md-4 sortable ui-sortable'' data-size=''col-md-4'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''col-md-4''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank'' data-basedreamserverid=''4''><a mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' page_frame'');='''' iframe.src=''this.href;'' ''='''' alert(''hi'');''='''' return;''='''' attrto=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=10&amp;PID=42&amp;CID=BaseDreamControl4'' http:='''' localhost:64671='''' components='''' textbank='''' customadminpage.aspx?did=''10&amp;PID=42&amp;CID=BaseDreamControl4'' );''''='''' http://localhost:64671/components/textbank/customadminpage.aspx?did="10&amp;PID=42&amp;CID=BaseDreamControl4'');''" attrto="http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=10&PID=42&CID=BaseDreamControl4" target="page_frame" onclick="SetIFrame(''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=10&PID=42&CID=BaseDreamControl4'');"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&amp;PID=42&amp;CID=BaseDreamControl4'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&PID=42&CID=BaseDreamControl4"></span></div></div><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''container''></div>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12 content_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-7''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-8''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-8'' value=''''><input type=''hidden'' id=''hidden-class-sortable-8'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank'' data-basedreamserverid=''5''><a mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' page_frame'');='''' iframe.src=''this.href;'' ''='''' alert(''hi'');''='''' return;''='''' attrto=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=10&amp;PID=42&amp;CID=BaseDreamControl5'' http:='''' localhost:64671='''' components='''' textbank='''' customadminpage.aspx?did=''10&amp;PID=42&amp;CID=BaseDreamControl5'' );''''='''' http://localhost:64671/components/textbank/customadminpage.aspx?did="10&amp;PID=42&amp;CID=BaseDreamControl5'');''" attrto="http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=10&PID=42&CID=BaseDreamControl5" target="page_frame" onclick="SetIFrame(''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=10&PID=42&CID=BaseDreamControl5'');"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&amp;PID=42&amp;CID=BaseDreamControl5'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&PID=42&CID=BaseDreamControl5"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-7'' value=''''><input type=''hidden'' id=''hidden-class-sortable-7'' value=''col-md-12''></div><input type=''hidden'' id=''counter_current'' value=''6''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (37, 10, N'Default', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Quiz''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=10&PID=43&CID=BaseDreamControl1'' attrto="http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=10&PID=43&CID=BaseDreamControl1" target="page_frame" onclick="SetIFrame(''http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=10&PID=43&CID=BaseDreamControl1'');"><h4 style=''margin:0;''>Quiz</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Quiz'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Quiz'' style=''color:black;'' placeholder=''Weightage'' value=''50''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=10&amp;PID=43&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=10&PID=43&CID=BaseDreamControl1"></span></div></div><input type=''hidden'' id=''counter_current'' value=''2''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (38, 10, N'SubMenu1', N' <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://s19390994.onlinehome-server.com/LessonVideoAdminPage.aspx?DID=10&PID=45&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.comnull?DID=10&PID=45&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (39, 10, N'Menu2', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=10&PID=46&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&amp;PID=46&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&PID=46&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (41, 8, N'Test page', N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <div class=''btn btn-success col-md-1 sortable ui-sortable'' data-size=''col-md-1'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    <h4 style=''margin: 0;''>1/12</h4>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input id=''hidden-sortable-2'' value='''' style='''' type=''hidden''><input id=''hidden-class-sortable-2'' value=''col-md-1'' style='''' type=''hidden''></div>
    <div class=''btn btn-success col-md-11 sortable ui-sortable'' data-size=''col-md-11'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input id=''hidden-sortable-3'' value='''' style='''' type=''hidden''><input id=''hidden-class-sortable-3'' value=''col-md-11'' style='''' type=''hidden''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/SuperAdminTextBank.aspx?DID=8&PID=51&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.comnull?DID=8&PID=51&CID=BaseDreamControl1"></span></div></div><span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input id=''hidden-sortable-1'' value='''' style='''' type=''hidden''><input id=''hidden-class-sortable-1'' value=''container'' style='''' type=''hidden''><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position:absolute; top:2px; left:4px;''></span><input id=''hidden-sortable-1'' value='''' style='''' type=''hidden''><input id=''hidden-class-sortable-1'' value=''col-md-12 btn btn-success container sortable ui-sortable'' style='''' type=''hidden''></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (42, 11, N'Home', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/SuperAdminTextBank.aspx?DID=11&PID=48&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.comnull?DID=11&PID=48&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Search''><a href=''http://s19390994.onlinehome-server.comnull?DID=11&PID=48&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Search</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl2'' data-remove="http://s19390994.onlinehome-server.comnull?DID=11&PID=48&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Featured Dreams''><a href=''http://s19390994.onlinehome-server.com~/Components/Dreams/FeatureDreams.ascx?DID=11&PID=48&CID=BaseDreamControl3'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Featured Dreams</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237.?DID=1&amp;PID=1&amp;CID=BaseDreamControl3'' data-remove="http://s19390994.onlinehome-server.com.?DID=11&PID=48&CID=BaseDreamControl3"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12 featured_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Dreamview''><a href=''http://s19390994.onlinehome-server.comnull?DID=11&PID=48&CID=BaseDreamControl4'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dreamview</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl4'' data-remove="http://s19390994.onlinehome-server.comnull?DID=11&PID=48&CID=BaseDreamControl4"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12 content_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-7''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-8''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-8'' value=''''><input type=''hidden'' id=''hidden-class-sortable-8'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''General News ''><a href=''http://s19390994.onlinehome-server.com~/Components/News/NewControls/GeneralNewsView.ascx?DID=11&PID=48&CID=BaseDreamControl5'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>General News </h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237..?DID=1&amp;PID=1&amp;CID=BaseDreamControl5'' data-remove="http://s19390994.onlinehome-server.comnull?DID=11&PID=48&CID=BaseDreamControl5"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-7'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-7'' value=''col-md-12 news_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-11''>
    
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-12''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-12'' value=''''><input type=''hidden'' id=''hidden-class-sortable-12'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''footer''><a href=''http://s19390994.onlinehome-server.comnull?DID=11&PID=48&CID=BaseDreamControl6'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=1&amp;PID=1&amp;CID=BaseDreamControl6'' data-remove="http://s19390994.onlinehome-server.comnull?DID=11&PID=48&CID=BaseDreamControl6"></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-11'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-11'' value=''col-md-12 footer_wrapper''></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (43, 11, N'Home1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-11''>
    
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-12''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-12'' value=''''><input type=''hidden'' id=''hidden-class-sortable-12'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''footer'' data-basedreamserverid=''6''><a href=''http://localhost:64671null?DID=11&PID=53&CID=BaseDreamControl6'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=1&amp;PID=1&amp;CID=BaseDreamControl6'' data-remove="http://localhost:64671null?DID=11&PID=53&CID=BaseDreamControl6"></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-11'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-11'' value=''col-md-12 footer_wrapper''></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar'' data-basedreamserverid=''1''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=11&PID=53&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=11&PID=53&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Search'' data-basedreamserverid=''2''><a href=''http://localhost:64671null?DID=11&PID=53&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Search</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl2'' data-remove="http://localhost:64671null?DID=11&PID=53&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Featured Dreams'' data-basedreamserverid=''3''><a href=''http://localhost:64671~/Components/Dreams/FeatureDreams.ascx?DID=11&PID=53&CID=BaseDreamControl3'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Featured Dreams</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237.?DID=1&amp;PID=1&amp;CID=BaseDreamControl3'' data-remove="http://localhost:64671.?DID=11&PID=53&CID=BaseDreamControl3"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12 featured_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Dreamview'' data-basedreamserverid=''4''><a href=''http://localhost:64671null?DID=11&PID=53&CID=BaseDreamControl4'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dreamview</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl4'' data-remove="http://localhost:64671null?DID=11&PID=53&CID=BaseDreamControl4"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12 content_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-7''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-8''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-8'' value=''''><input type=''hidden'' id=''hidden-class-sortable-8'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''General News '' data-basedreamserverid=''5''><a href=''http://localhost:64671~/Components/News/NewControls/GeneralNewsView.ascx?DID=11&PID=53&CID=BaseDreamControl5'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>General News </h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237..?DID=1&amp;PID=1&amp;CID=BaseDreamControl5'' data-remove="http://localhost:64671null?DID=11&PID=53&CID=BaseDreamControl5"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-7'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-7'' value=''col-md-12 news_wrapper''></div><input type=''hidden'' id=''counter_current'' value=''7''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (44, 1, N'QuizTest', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Quiz'' data-basedreamserverid=''1''><a href=''http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=1&PID=54&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Quiz</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=1&amp;PID=54&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=1&PID=54&CID=BaseDreamControl1"></span></div></div><input type=''hidden'' id=''counter_current'' value=''2''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (45, 1, N'QuestionTest', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Top Menu Bar''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=1&PID=55&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=1&amp;PID=55&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=1&PID=55&CID=BaseDreamControl1"></span></div></div><input type=''hidden'' id=''counter_current'' value=''9''><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''8'' data-name=''Custom Text Bank''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=1&PID=55&CID=BaseDreamControl8'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Custom Text Bank'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Custom Text Bank'' style=''color:black;'' placeholder=''Weightage'' value=''70''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=1&amp;PID=55&amp;CID=BaseDreamControl8'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=1&PID=55&CID=BaseDreamControl8"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (46, 12, N'Default', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar'' data-basedreamserverid=''1''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=12&PID=56&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=12&amp;PID=56&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=12&PID=56&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Lesson Menu'' data-basedreamserverid=''2''><a href=''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=12&PID=56&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Lesson Menu</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=12&amp;PID=56&amp;CID=BaseDreamControl2'' data-remove="http://localhost:64671null?DID=12&PID=56&CID=BaseDreamControl2"></span></div></div><input type=''hidden'' id=''counter_current'' value=''5''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (47, 12, N'Progress', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Progress DashBoard''><a href=''http://localhost:64671/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx?DID=12&PID=57&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Progress DashBoard</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=57&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (48, 12, N'Chapter1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''2'' data-name=''Custom Text Bank''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=12&PID=58&CID=BaseDreamControl2'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Custom Text Bank'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Custom Text Bank'' style=''color:black;'' placeholder=''Weightage'' value=''90''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&PID=58&CID=BaseDreamControl2"></span></div></div><input type=''hidden'' id=''counter_current'' value=''3''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (49, 12, N'Ch1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=12&PID=60&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&amp;PID=60&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&PID=60&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671null?DID=12&PID=60&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=60&CID=BaseDreamControl2"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (50, 12, N'Ch2', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=12&PID=61&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&amp;PID=61&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&PID=61&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671null?DID=12&PID=61&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=61&CID=BaseDreamControl2"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (51, 12, N'Quiz1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Quiz''><a href=''http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=12&PID=62&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Quiz</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=12&amp;PID=62&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=12&PID=62&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (52, 12, N'Quiz2', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Quiz''><a href=''http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=12&PID=63&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Quiz</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=63&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (53, 10, N'tedst', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''3'' data-name=''Question''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/QuestionBank/Admin/QuestionAdmin.aspx?DID=10&PID=47&CID=BaseDreamControl3'' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' attrto="http://localhost:64671/Components/QuestionBank/Admin/QuestionAdmin.aspx?DID=10&PID=47&CID=BaseDreamControl3" target="page_frame" onclick="SetIFrame(''http://localhost:64671/Components/QuestionBank/Admin/QuestionAdmin.aspx?DID=10&PID=47&CID=BaseDreamControl3'');"><h4 style=''margin:0;''>Question</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Question'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Question'' style=''color:black;'' placeholder=''Weightage'' value=''60''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671.?DID=10&amp;PID=47&amp;CID=BaseDreamControl3'' data-remove="http://localhost:64671.?DID=10&PID=47&CID=BaseDreamControl3"></span></div></div><input type=''hidden'' id=''counter_current'' value=''4''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (54, 12, N'NewSubMenu', N'<input type=''hidden'' id=''counter_current'' value=''8''><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''5'' data-name=''Custom Text Bank''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=12&PID=65&CID=BaseDreamControl5'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Custom Text Bank'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Custom Text Bank'' style=''color:black;'' placeholder=''Weightage'' value=''50''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&amp;PID=65&amp;CID=BaseDreamControl5'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&PID=65&CID=BaseDreamControl5"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''6'' data-name=''Custom Text Bank''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=12&PID=65&CID=BaseDreamControl6'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''="" return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Custom Text Bank'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Custom Text Bank'' style=''color:black;'' placeholder=''Weightage'' value=''30''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&amp;PID=65&amp;CID=BaseDreamControl6'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&PID=65&CID=BaseDreamControl6"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''7'' data-name=''video Control''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=12&PID=65&CID=BaseDreamControl7'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>video Control</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''video Control'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''video Control'' style=''color:black;'' placeholder=''Weightage'' value=''90''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=65&CID=BaseDreamControl7"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (55, 12, N'NewMenu', N'<input type=''hidden'' id=''counter_current'' value=''8''><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''6'' data-name=''Lesson Menu Progress''><a href=''http://localhost:64671/Components/LessonMenu/LessonMenuProgressAdmin.aspx?DID=12&PID=64&CID=BaseDreamControl6'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Lesson Menu Progress</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671.?DID=12&amp;PID=64&amp;CID=BaseDreamControl6'' data-remove="http://localhost:64671.?DID=12&PID=64&CID=BaseDreamControl6"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''7'' data-name=''Custom Text Bank''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=12&PID=64&CID=BaseDreamControl7'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Custom Text Bank'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Custom Text Bank'' style=''color:black;'' placeholder=''Weightage'' value=''100''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&PID=64&CID=BaseDreamControl7"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (56, 12, N'AnotherNewMenu', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''Custom Text Bank''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=12&PID=66&CID=BaseDreamControl'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Custom Text Bank'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Custom Text Bank'' style=''color:black;'' placeholder=''Weightage'' value=''50''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&PID=66&CID=BaseDreamControl"></span></div></div><input type=''hidden'' id=''counter_current'' value=''2''><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Custom Text Bank''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=12&PID=66&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Custom Text Bank'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Custom Text Bank'' style=''color:black;'' placeholder=''Weightage'' value=''50''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=12&PID=66&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (57, 12, N'Video1', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''video Control''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=12&PID=59&CID=BaseDreamControl'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>video Control</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''video Control'' type=''checkbox''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''video Control'' style=''color:black;'' placeholder=''Weightage'' disabled=''disabled''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=59&CID=BaseDreamControl"></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (58, 12, N'YetAnotherNewMenu', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''video Control''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=12&PID=67&CID=BaseDreamControl'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>video Control</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''video Control'' type=''checkbox''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''video Control'' style=''color:black;'' placeholder=''Weightage'' disabled=''disabled''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=67&CID=BaseDreamControl"></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (59, 12, N'New1', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Quiz''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=12&PID=68&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Quiz</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Quiz'' type=''checkbox''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Quiz'' style=''color:black;'' placeholder=''Weightage'' disabled=''disabled''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=68&CID=BaseDreamControl1"></span></div></div><input type=''hidden'' id=''counter_current'' value=''2''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (60, 10, N'test', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Lesson Menu''><a href=''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=10&PID=71&CID=BaseDreamControl1'' attrto="http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=10&PID=71&CID=BaseDreamControl1" target="page_frame" onclick="SetIFrame(''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=10&PID=71&CID=BaseDreamControl1'');"><h4 style=''margin:0;''>Lesson Menu</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=10&amp;PID=71&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=10&PID=71&CID=BaseDreamControl1"></span></div></div><input type=''hidden'' id=''counter_current'' value=''2''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (61, 12, N'New', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Lesson Menu''><a href=''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=12&PID=72&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Lesson Menu</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=72&CID=BaseDreamControl1"></span></div></div><input type=''hidden'' id=''counter_current'' value=''2''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (62, 12, N'Weak', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Lesson Menu''><a href=''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=12&PID=74&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Lesson Menu</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=74&CID=BaseDreamControl1"></span></div></div><input type=''hidden'' id=''counter_current'' value=''2''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (63, 12, N'AnotherNew', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''video Control''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=12&PID=77&CID=BaseDreamControl'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>video Control</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''video Control'' type=''checkbox''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''video Control'' style=''color:black;'' placeholder=''Weightage'' disabled=''disabled''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=12&PID=77&CID=BaseDreamControl"></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (64, 10, N'Lesson1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''Lesson Menu Progress''><a href=''http://localhost:64671/Components/LessonMenu/LessonMenuProgressAdmin.aspx?DID=10&PID=78&CID=BaseDreamControl'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Lesson Menu Progress</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671.?DID=10&PID=78&CID=BaseDreamControl"></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (65, 10, N'Lesson01', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''Question''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/QuestionBank/Admin/QuestionAdmin.aspx?DID=10&PID=79&CID=BaseDreamControl'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Question</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Question'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Question'' style=''color:black;'' placeholder=''Weightage'' value=''100''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671.?DID=10&PID=79&CID=BaseDreamControl"></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (66, 10, N'Lesson02', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''Quiz''><div class=''col-md-6'' style=''padding:0;''><a href=''http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=10&PID=80&CID=BaseDreamControl'' target="_blank"><h4 style=''margin:0;''>Quiz</h4></a></div><div class=''col-md-3'' style=''padding:0;''><h5 style=''margin:0;''><input class=''myCheck'' data-name=''Quiz'' type=''checkbox'' checked=''checked''>Use Progress</h5></div><div class=''col-md-3'' style=''padding:0;''><input type=''number'' class=''myText'' data-name=''Quiz'' style=''color:black;'' placeholder=''Weightage'' value=''100''></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671null?DID=10&PID=80&CID=BaseDreamControl"></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (67, 14, N'umrahDetail', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=14&PID=91&CID=BaseDreamControl'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vvv?DID=14&PID=91&CID=BaseDreamControl"></span></div></div><input type=''hidden'' id=''counter_current'' value=''5''><div class=''btn btn-success col-md-9 sortable ui-sortable'' data-size=''col-md-9'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-9''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''umrah detail''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackagePageDetail.ascx?DID=14&PID=91&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>umrah detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671cc?DID=14&PID=91&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-3''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''2'' data-name=''Accommodation Makkah''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/AccommodationsMakkah.ascx?DID=14&PID=91&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Accommodation Makkah</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671abc?DID=14&PID=91&CID=BaseDreamControl2"></span></div><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''3'' data-name=''Accommodation Madina''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/AccommodationsMadina.ascx?DID=14&PID=91&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>Accommodation Madina</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671123?DID=14&PID=91&CID=BaseDreamControl3"></span></div><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''4'' data-name=''discount detail''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx?DID=14&PID=91&CID=BaseDreamControl4'' target="_blank"><h4 style=''margin:0;''>discount detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=14&PID=91&CID=BaseDreamControl4"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (68, 14, N'bookingForm', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=14&PID=92&CID=BaseDreamControl'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vvv?DID=14&PID=92&CID=BaseDreamControl"></span></div></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform'' data-basedreamserverid=''1''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/BookingForm.ascx?DID=14&PID=92&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671abc?DID=14&PID=92&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer'' data-basedreamserverid=''2''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/PackageFooter.ascx?DID=14&PID=92&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=14&PID=92&CID=BaseDreamControl2"></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''><input type=''hidden'' id=''counter_current''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (69, 14, N'botPage', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''ChatBot''><a href=''http://localhost:64671/chat/Connect.aspx?DID=14&PID=93&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>ChatBot</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671cyrr?DID=14&amp;PID=93&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671cyrr?DID=14&PID=93&CID=BaseDreamControl1"></span></div></div><input type=''hidden'' id=''counter_current'' value=''2''>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (70, 13, N'umrahDetail', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=13&PID=94&CID=BaseDreamControl'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vvv?DID=13&PID=94&CID=BaseDreamControl"></span></div></div><input type=''hidden'' id=''counter_current'' value=''5''><div class=''btn btn-success col-md-9 sortable ui-sortable'' data-size=''col-md-9'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-9''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''umrah detail''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackagePageDetail.ascx?DID=13&PID=94&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>umrah detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671cc?DID=13&PID=94&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-3''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''2'' data-name=''Accommodation Makkah''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/AccommodationsMakkah.ascx?DID=13&PID=94&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Accommodation Makkah</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671abc?DID=13&PID=94&CID=BaseDreamControl2"></span></div><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''3'' data-name=''Accommodation Madina''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/AccommodationsMadina.ascx?DID=13&PID=94&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>Accommodation Madina</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671123?DID=13&PID=94&CID=BaseDreamControl3"></span></div><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''4'' data-name=''discount detail''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx?DID=13&PID=94&CID=BaseDreamControl4'' target="_blank"><h4 style=''margin:0;''>discount detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=13&PID=94&CID=BaseDreamControl4"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (71, 13, N'bookingForm', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=13&PID=95&CID=BaseDreamControl'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vvv?DID=13&PID=95&CID=BaseDreamControl"></span></div></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform'' data-basedreamserverid=''1''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/BookingForm.ascx?DID=13&PID=95&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671abc?DID=13&PID=95&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer'' data-basedreamserverid=''2''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/PackageFooter.ascx?DID=13&PID=95&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=13&PID=95&CID=BaseDreamControl2"></span></div></div><input type=''hidden'' id=''counter_current'' value=''1''><input type=''hidden'' id=''counter_current''>')
SET IDENTITY_INSERT [dbo].[ClientPage] OFF
SET IDENTITY_INSERT [dbo].[ControlCategory] ON 

INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (1, N'Dreams', NULL)
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (2, N'test', NULL)
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (3, N'test 2', NULL)
SET IDENTITY_INSERT [dbo].[ControlCategory] OFF
SET IDENTITY_INSERT [dbo].[Controls] ON 

INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (1, 1, N'Top Menu Bar', 4, N'xyz', N'~/Components/TopNav/TopNavAnonymous.ascx', N'/Components/TextBank/SuperAdminTextBank.aspx', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (2, 1, N'Lesson Menu', 22, N'xyz', N'~/Components/LessonMenu/LessonMenuManager.ascx', N'/Components/LessonMenu/LessonMenuAdminPage.aspx', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (3, 1, N'Progress DashBoard', 5, N'xyz', N'~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx', N'/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (4, 1, N'Multimedia Control', 10, N'xyz', N'~/Components/LessonBank/Lesson/LessonMultiMedia.ascx', N'null', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (5, 1, N'Quiz', 7, N'xyz', N'~/Components/QuizBank/User/QuizView.ascx', N'/Components/QuizBank/QuizBankAdmin.aspx', 0, N'null', 1)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (6, 1, N'video Control', 9, N'xyz', N'~/Components/LessonBank/Lesson/LessonVideo.ascx', N'/LessonVideoAdminPage.aspx', 1, N'null', 1)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (17, 1, N'Dream Enrollment', 14, N'xyz', N'~/Components/DreamEnrollment/DreamEnroll.ascx', N'null', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (18, 1, N'Custom Text Bank', 31, N'xyz', N'~/Components/TextBank/TextBankView.ascx', N'/Components/TextBank/CustomAdminPage.aspx', 1, N'/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx', 1)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (19, 1, N'Shared TextBank', 32, N'xyz', N'~/Components/TextBank/TextBankView.ascx', N'/Components/TextBank/SharedTextBankPage.aspx', 0, N'/Components/TextBank/SharedTextBank/DeleteSharedTextBank.aspx', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (20, 1, N'Dream Content Summary', 35, N'xyz', N'~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx', N'null', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (21, 1, N'Footer', 3, N'xyz', N'~/Components/Footer/FooterControl.ascx', N'null', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (22, 1, N'Navigation', 15, N'xyz', N'~/Components/NAV_General/NavigationView.ascx', N'/Components/NAV_General/NavigationAdminPage.aspx', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (24, 1, N'useractivation', 13, N'xyz', N'~/Components/Account/UserActivation.ascx', N'null', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (25, 1, N'Dream Profile', 16, N'xyz', N'~/Components/DreamProfile/DreamProfileView.ascx', N'null', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (26, 1, N'Share', 11, N'xyz', N'~/Components/Account/InviteShare.ascx', N'~/Components/Account/InviteshareAdminpage.ascx', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (27, 1, N'Dreamview', 17, N'xyz', N'~/Components/Dreams/DreamView.ascx', N'null', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (30, 1, N'Search', 12, N'xyz', N'~/Components/Header/SearchWithHeader.ascx', N'null', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (31, 1, N'Related Dreams', 25, N'xyz', N'~/Components/Dreams/RelatedDreams.ascx', N'null', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (32, 1, N'Featured Dreams', 10, N'Featured Dreams', N'~/Components/Dreams/FeatureDreams.ascx', N'~/Components/Dreams/FeatureDreams.ascx', 0, N'.', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (33, 1, N'General News ', 19, N'General News', N'~/Components/News/NewControls/GeneralNewsView.ascx', N'~/Components/News/NewControls/GeneralNewsView.ascx', 0, N'null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (34, 1, N'Register Email', 39, N'Register Email', N'~/Components/Account/RegisterEmail.ascx', N'~/Components/Account/RegisterEmail.ascx', 0, N'.null', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (35, 1, N'Assignment', 32, N'Assignment', N'~/Components/Assignments/AssignmentUserView.ascx', N'/Components/Assignments/AssignmentAdmin.aspx', 1, N'.', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (36, 1, N'Dream View New', 17, N'Dream View New', N'~/Components/Dreams/DreamView_New.ascx', N'.', 0, N'.', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (37, 1, N'Lesson Multimedia', 25, N'Multimedia', N'~/Components/MultimediaBank/MultimediaBankView.ascx', N'/Components/MultimediaBank/MultimediaSelection.aspx', 1, N'.', 1)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (38, 1, N'Question', 12, N'Question', N'~/Components/QuestionBank/User/QuestionView.ascx', N'/Components/QuestionBank/Admin/QuestionAdmin.aspx', 1, N'.', 1)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (39, 1, N'Lesson Menu Progress', 48, N'Lesson Menu Progress', N'~/Components/LessonMenu/LessonMenuProgress.ascx', N'/Components/LessonMenu/LessonMenuProgressAdmin.aspx', 1, N'.', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (40, 2, N'UmrahList', 32, N'abc', N'~/UmrahComponents/PackageComponent/PackageListView.ascx', N'~/UmrahComponents/PackageComponent/PackageListView.ascx', 1, N'.', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (41, 2, N'Bookinform', 47, N'hbkj', N'~/UmrahComponents/PackageComponent/BookingForm.ascx', N'~/UmrahComponents/PackageComponent/BookingForm.ascx', 0, N'abc', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (42, 2, N'PackageHeader', 15, N'vvv', N'~/UmrahComponents/headerFooter/Packageheader.ascx', N'~/UmrahComponents/headerFooter/Packageheader.ascx', 0, N'vvv', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (43, 2, N'pkg footer', 22, N'vv', N'~/UmrahComponents/headerFooter/PackageFooter.ascx', N'~/UmrahComponents/headerFooter/PackageFooter.ascx', 0, N'vv', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (44, 2, N'umrah detail', 25, N'vv', N'~/UmrahComponents/PackageComponent/PackagePageDetail.ascx', N'~/UmrahComponents/PackageComponent/PackagePageDetail.ascx', 0, N'cc', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (45, 2, N'discount detail', 5, N'vv', N'~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx', N'~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx', 0, N'vv', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (46, 2, N'searchUmrahComponent', 4, N'abc', N'~/UmrahComponents/PackageComponent/DetailSearch.ascx', N'~/UmrahComponents/PackageComponent/DetailSearch.ascx', 0, N'123', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (47, 1, N'recentDreams', 4, N'abc', N'~/Components/Dreams/RecentDreams.ascx', N'~/Components/Dreams/RecentDreams.ascx', 0, N'123', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (48, 2, N'Accommodation Makkah', 50, N'abc', N'~/UmrahComponents/PackageComponent/AccommodationsMakkah.ascx', N'~/UmrahComponents/PackageComponent/AccommodationsMakkah.ascx', 0, N'abc', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (50, 1, N'ChatBot', 5, N'xyz', N'~/chat/ChatControl.ascx', N'/chat/Connect.aspx', 0, N'cyrr', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (59, 2, N'Accommodation Madina', 50, N'abc', N'~/UmrahComponents/PackageComponent/AccommodationsMadina.ascx', N'~/UmrahComponents/PackageComponent/AccommodationsMadina.ascx', 0, N'123', 0)
SET IDENTITY_INSERT [dbo].[Controls] OFF
SET IDENTITY_INSERT [dbo].[DreamEnrollment] ON 

INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (1, 2, N'b3afc247-bd2f-4be2-ab35-6d6a71e17816', CAST(N'2016-12-06 23:52:02.210' AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (2, 2, N'c3b70fc3-2c17-487f-b023-503f5c0232c5', CAST(N'2016-12-07 03:49:32.300' AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (3, 2, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', CAST(N'2016-12-07 03:54:15.423' AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (4, 2, N'6a6328ff-530b-40e3-9635-6f040941aa02', CAST(N'2016-12-07 04:12:37.297' AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (5, 2, N'8ede996c-fa92-4655-8b91-282af6d3cd49', CAST(N'2016-12-08 06:05:38.130' AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (6, 2, N'9ec276e3-6ca1-486f-ab56-362b09217745', CAST(N'2016-12-08 07:06:45.340' AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (7, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', CAST(N'2017-01-19 10:42:01.077' AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (8, 10, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', CAST(N'2017-01-19 10:48:42.157' AS DateTime))
SET IDENTITY_INSERT [dbo].[DreamEnrollment] OFF
SET IDENTITY_INSERT [dbo].[DreamLayouts] ON 

INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (1, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="padding:0;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/Header/SearchWithHeader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12 featured_wrapper" style="padding:0;">
    <div id=''sortable-4'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/Dreams/FeatureDreams.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-5'' class="col-md-12 content_wrapper" style="padding:0;">
    <div id=''sortable-6'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/Components/Dreams/DreamView_New.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-7'' class="col-md-12 news_wrapper" style="padding:0;">
    <div id=''sortable-8'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl5'' runat=''server'' defaultcontrol=''~/Components/News/NewControls/GeneralNewsView.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-11'' class="col-md-12 footer_wrapper" style="padding:0;">
    
    <div id=''sortable-12'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl6'' runat=''server'' defaultcontrol=''~/Components/Footer/FooterControl.ascx''></uc2:basedreamcontrol></div>
</div><input type=''hidden'' id=''counter_current'' value=''7''>', 1, N'Default', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (2, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12 main_image_gre" style="padding:0; background-position: center top 0px;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12 featured_wrapper" style="padding:0; padding-top:30px; padding-bottom:30px;">
    <div id=''sortable-4'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-5'' class="col-md-12" style="padding:0;">
    
    <div id=''sortable-6'' class="container" style="">
    <div id=''sortable-8'' class="col-md-8" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div><div id=''sortable-7'' class="col-md-4" style="margin-top:35px;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl5'' runat=''server'' defaultcontrol=''~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx''></uc2:basedreamcontrol></div>
    
</div>
</div><div id=''sortable-9'' class="col-md-12" style="padding:0;">
    <div id=''sortable-10'' class="container" style="">
    
    <div id=''sortable-12'' class="col-md-8" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl6'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-11'' class="col-md-4" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl7'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl8'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>
</div>
    
</div><div id=''sortable-13'' class="col-md-12" style="">
    <div id=''sortable-14'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl9'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-15'' class="col-md-12 news_wrapper" style="padding:0;">
    <div id=''sortable-16'' class="container" style="padding:15px;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl10'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-17'' class="col-md-12 footer_wrapper" style="padding:0;">
    <div id=''sortable-18'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl11'' runat=''server'' defaultcontrol=''~/Components/Footer/FooterControl.ascx''></uc2:basedreamcontrol></div>
    
</div><input type=''hidden'' id=''counter_current'' value=''12''>', 2, N'Default', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (3, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12 content_wrapper" style="padding:0;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol></div>', 2, N'Home', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (4, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx''></uc2:basedreamcontrol></div>', 2, N'Progress', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (5, N'Hello World', 2, N'Week01', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (6, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 2, N'Video01', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (7, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonQuiz.ascx''></uc2:basedreamcontrol></div>', 2, N'Quiz01', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (8, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="background-color:#b1b1b1;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 2, N'Reading01', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (9, N'Hello World', 2, N'Week02', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (10, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 2, N'Activity01', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (11, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 2, N'Activity02', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (12, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 2, N'Acitivity03', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (13, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12" style="padding:0;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''4''>', 3, N'Default', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (14, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 3, N'Lesson1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (15, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 3, N'MediaBank', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (16, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 3, N'MediaSelection', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (17, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'Templates', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (18, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'LayoutCreation', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (19, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'AddComponents', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (20, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'Components', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (21, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'AddNewComponent', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (22, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'ComponentList', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (23, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''.''></uc2:basedreamcontrol></div>', 3, N'FileBank', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (24, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'DreamAdminPanel', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (25, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'DreamPages', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (26, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'PageBuilder', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (27, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/MultimediaBank/MultimediaBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'CreationDefaultDream', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (28, N'Hello World', 3, N'CreationSampleDream', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (29, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'DefaultPage', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (30, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'DreamMenu', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (31, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'NewsAdminPanel', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (32, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'AddNews', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (33, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'EditNews', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (34, N'Hello World', 2, N'Week0', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (35, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    <div id=''sortable-2'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>
</div><div id=''sortable-3'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 2, N'Week03', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (36, N'Hello World', 2, N'Week04', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (37, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    <div id=''sortable-2'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-3'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 2, N'First', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (38, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    <div id=''sortable-2'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-3'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 2, N'Second', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (39, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-2'' class="col-md-12" style="">
    <div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-3'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 2, N'Third', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (40, NULL, 5, N'testpage', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (41, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> ', 5, N'satphys', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (42, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12 main_image_gre" style="padding:0; background-position: center top 0px;">
    
    
</div><div id=''sortable-3'' class="col-md-12 content_wrapper" style="">
    <div id=''sortable-4'' class="container" style="">
    <div id=''sortable-5'' class="col-md-8" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>
    
<div id=''sortable-6'' class="col-md-4" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div></div>
    
</div><div id=''sortable-7'' class="col-md-12" style="">
    <div id=''sortable-8'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl5'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>
    
</div><input type=''hidden'' id=''counter_current'' value=''6''>', 10, N'Sample', NULL, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (43, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/QuizBank/User/QuizView.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''2''>', 10, N'Default', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (44, N'Hello World', 10, N'Menu1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (45, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 10, N'SubMenu1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (46, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 10, N'Menu2', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (47, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/QuestionBank/User/QuestionView.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''4''>', 10, N'tedst', NULL, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (48, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="padding:0;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/Header/SearchWithHeader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12 featured_wrapper" style="padding:0;">
    <div id=''sortable-4'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/Dreams/FeatureDreams.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-5'' class="col-md-12 content_wrapper" style="padding:0;">
    <div id=''sortable-6'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/Components/Dreams/DreamView.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-7'' class="col-md-12 news_wrapper" style="padding:0;">
    <div id=''sortable-8'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl5'' runat=''server'' defaultcontrol=''~/Components/News/NewControls/GeneralNewsView.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-11'' class="col-md-12 footer_wrapper" style="padding:0;">
    
    <div id=''sortable-12'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl6'' runat=''server'' defaultcontrol=''~/Components/Footer/FooterControl.ascx''></uc2:basedreamcontrol></div>
</div>', 11, N'Home', NULL, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (49, N'Add Content here', 11, N'Default', NULL, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (51, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-1'' class="container" style="">
    <div id=''sortable-2'' class="col-md-1" style="">
    <h4 style=''margin: 0;''>1/12</h4>
    
</div>
    <div id=''sortable-3'' class="col-md-11" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div>
</div>', 8, N'Test page', NULL, 1, 1, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (53, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-11'' class="col-md-12 footer_wrapper" style="padding:0;">
    
    <div id=''sortable-12'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl6'' runat=''server'' defaultcontrol=''~/Components/Footer/FooterControl.ascx''></uc2:basedreamcontrol></div>
</div><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="padding:0;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/Header/SearchWithHeader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12 featured_wrapper" style="padding:0;">
    <div id=''sortable-4'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/Dreams/FeatureDreams.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-5'' class="col-md-12 content_wrapper" style="padding:0;">
    <div id=''sortable-6'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/Components/Dreams/DreamView.ascx''></uc2:basedreamcontrol></div>
    
</div><div id=''sortable-7'' class="col-md-12 news_wrapper" style="padding:0;">
    <div id=''sortable-8'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl5'' runat=''server'' defaultcontrol=''~/Components/News/NewControls/GeneralNewsView.ascx''></uc2:basedreamcontrol></div>
    
</div><input type=''hidden'' id=''counter_current'' value=''7''>', 11, N'Home1', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (54, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/QuizBank/User/QuizView.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''2''>', 1, N'QuizTest', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (55, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''9''><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl8'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 1, N'QuestionTest', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (56, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''5''>', 12, N'Default', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (57, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx''></uc2:basedreamcontrol></div>', 12, N'Progress', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (58, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''3''>', 12, N'Chapter1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (59, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''1''>', 12, N'Video1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (60, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 12, N'Ch1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (61, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 12, N'Ch2', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (62, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/QuizBank/User/QuizView.ascx''></uc2:basedreamcontrol></div>', 12, N'Quiz1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (64, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><input type=''hidden'' id=''counter_current'' value=''8''><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl6'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuProgress.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl7'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 12, N'NewMenu', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (65, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><input type=''hidden'' id=''counter_current'' value=''8''><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl5'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl6'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl7'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 12, N'NewSubMenu', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (66, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''2''><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 12, N'AnotherNewMenu', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (67, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''1''>', 12, N'YetAnotherNewMenu', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (68, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/QuizBank/User/QuizView.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''2''>', 12, N'New1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (69, N'Hello World', 12, N'New2', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (70, N'Hello World', 12, N'New3', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (71, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''2''>', 10, N'test', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (72, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''2''>', 12, N'New', NULL, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (73, N'Hello World', 12, N'Progress', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (74, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''2''>', 12, N'Weak', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (75, N'Hello World', 12, N'Progress', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (76, N'Hello World', 12, N'Progress', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (77, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''1''>', 12, N'AnotherNew', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (78, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuProgress.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''1''>', 10, N'Lesson1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (79, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/Components/QuestionBank/User/QuestionView.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''1''>', 10, N'Lesson01', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (80, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/Components/QuizBank/User/QuizView.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''1''>', 10, N'Lesson02', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (81, N'Hello World', 10, N'Lesson2', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (82, N'Hello World', 10, N'SubMenu1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (91, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''5''><div id=''sortable-2'' class="col-md-9" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackagePageDetail.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-3" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/AccommodationsMakkah.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/AccommodationsMadina.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx''></uc2:basedreamcontrol></div>', 14, N'umrahDetail', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (92, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/BookingForm.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/PackageFooter.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''1''><input type=''hidden'' id=''counter_current''>', 14, N'bookingForm', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (93, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/chat/ChatControl.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''2''>', 14, N'botPage', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (94, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''5''><div id=''sortable-2'' class="col-md-9" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackagePageDetail.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-3" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/AccommodationsMakkah.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/AccommodationsMadina.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx''></uc2:basedreamcontrol></div>', 13, N'umrahDetail', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (95, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/BookingForm.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/PackageFooter.ascx''></uc2:basedreamcontrol></div><input type=''hidden'' id=''counter_current'' value=''1''><input type=''hidden'' id=''counter_current''>', 13, N'bookingForm', NULL, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[DreamLayouts] OFF
SET IDENTITY_INSERT [dbo].[DreamPageAuthorization] ON 

INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (1, 1, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (2, 1, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (3, 1, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (4, 2, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (5, 2, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (6, 2, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (7, 3, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (8, 3, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (9, 3, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (13, 4, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (14, 4, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (15, 4, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (16, 5, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (17, 5, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (18, 5, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (19, 6, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (20, 6, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (21, 6, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (22, 7, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (23, 7, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (24, 7, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (25, 8, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (26, 8, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (27, 8, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (28, 9, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (29, 9, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (30, 9, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (31, 10, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (32, 10, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (33, 10, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (34, 11, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (35, 11, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (36, 11, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (37, 12, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (38, 12, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (39, 12, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (40, 13, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (41, 13, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (42, 13, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (43, 14, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (44, 14, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (45, 14, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (46, 15, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (47, 15, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (48, 15, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (49, 16, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (50, 16, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (51, 16, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (52, 17, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (53, 17, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (54, 17, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (55, 18, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (56, 18, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (57, 18, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (58, 19, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (59, 19, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (60, 19, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (61, 20, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (62, 20, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (63, 20, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (64, 21, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (65, 21, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (66, 21, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (67, 22, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (68, 22, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (69, 22, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (70, 23, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (71, 23, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (72, 23, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (73, 24, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (74, 24, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (75, 24, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (76, 25, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (77, 25, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (78, 25, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (79, 26, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (80, 26, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (81, 26, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (82, 27, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (83, 27, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (84, 27, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (85, 28, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (86, 28, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (87, 28, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (88, 29, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (89, 29, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (90, 29, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (91, 30, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (92, 30, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (93, 30, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (94, 31, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (95, 31, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (96, 31, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (97, 32, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (98, 32, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (99, 32, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (100, 33, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (101, 33, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (102, 33, N'EnrolledUser', 1)
GO
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (103, 34, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (104, 34, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (105, 34, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (106, 35, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (107, 35, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (108, 35, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (109, 36, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (110, 36, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (111, 36, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (112, 37, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (113, 37, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (114, 37, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (115, 38, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (116, 38, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (117, 38, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (118, 39, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (119, 39, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (120, 39, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (121, 40, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (122, 40, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (123, 40, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (124, 41, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (125, 41, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (126, 41, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (127, 42, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (128, 42, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (129, 42, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (130, 43, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (131, 43, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (132, 43, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (133, 44, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (134, 44, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (135, 44, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (136, 45, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (137, 45, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (138, 45, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (139, 46, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (140, 46, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (141, 46, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (142, 47, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (143, 47, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (144, 47, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (148, 51, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (149, 51, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (150, 51, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (154, 53, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (155, 53, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (156, 53, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (157, 54, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (158, 54, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (159, 54, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (160, 55, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (161, 55, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (162, 55, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (163, 56, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (164, 56, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (165, 56, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (166, 57, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (167, 57, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (168, 57, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (169, 58, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (170, 58, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (171, 58, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (172, 59, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (173, 59, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (174, 59, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (175, 60, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (176, 60, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (177, 60, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (178, 61, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (179, 61, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (180, 61, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (181, 62, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (182, 62, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (183, 62, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (187, 64, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (188, 64, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (189, 64, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (190, 65, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (191, 65, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (192, 65, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (193, 66, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (194, 66, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (195, 66, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (196, 67, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (197, 67, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (198, 67, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (199, 68, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (200, 68, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (201, 68, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (202, 69, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (203, 69, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (204, 69, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (205, 70, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (206, 70, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (207, 70, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (208, 71, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (209, 71, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (210, 71, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (211, 72, N'RegisteredUser', 1)
GO
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (212, 72, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (213, 72, N'EnrolledUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (214, 73, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (215, 73, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (216, 73, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (217, 74, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (218, 74, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (219, 74, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (220, 75, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (221, 75, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (222, 75, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (223, 76, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (224, 76, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (225, 76, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (226, 77, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (227, 77, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (228, 77, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (229, 78, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (230, 78, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (231, 78, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (232, 79, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (233, 79, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (234, 79, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (235, 80, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (236, 80, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (237, 80, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (238, 81, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (239, 81, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (240, 81, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (241, 82, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (242, 82, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (243, 82, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (244, 93, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (245, 93, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (246, 93, N'EnrolledUser', 1)
SET IDENTITY_INSERT [dbo].[DreamPageAuthorization] OFF
SET IDENTITY_INSERT [dbo].[DreamPageControls] ON 

INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (8, 65, 18, N'BaseDreamControl5', CAST(50.000 AS Decimal(15, 3)))
INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (10, 65, 18, N'BaseDreamControl6', CAST(30.000 AS Decimal(15, 3)))
INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (11, 65, 6, N'BaseDreamControl7', CAST(90.000 AS Decimal(15, 3)))
INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (12, 66, 18, N'BaseDreamControl', CAST(50.000 AS Decimal(15, 3)))
INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (13, 66, 18, N'BaseDreamControl1', CAST(50.000 AS Decimal(15, 3)))
INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (14, 64, 18, N'BaseDreamControl7', CAST(100.000 AS Decimal(15, 3)))
INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (15, 58, 18, N'BaseDreamControl2', CAST(90.000 AS Decimal(15, 3)))
INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (17, 47, 38, N'BaseDreamControl3', CAST(60.000 AS Decimal(15, 3)))
INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (18, 43, 5, N'BaseDreamControl1', CAST(50.000 AS Decimal(15, 3)))
INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (19, 79, 38, N'BaseDreamControl', CAST(100.000 AS Decimal(15, 3)))
INSERT [dbo].[DreamPageControls] ([id], [Layout_ID], [Component_ID], [BaseDreamServer_ID], [TotalProgress]) VALUES (20, 80, 5, N'BaseDreamControl', CAST(100.000 AS Decimal(15, 3)))
SET IDENTITY_INSERT [dbo].[DreamPageControls] OFF
SET IDENTITY_INSERT [dbo].[Dreams] ON 

INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (1, N'Test dream', 10, N'This is a dream.', 1, 1, 1, 10, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (2, N'TOEFL', 54, N'TOEFL', 1, 0, 1, 40, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (3, N'AdminTutorial', 47, N'یہ ٹیوٹوریل ایک کورس منظم کرنے کے لئے تمام ضروری اقدامات ایڈمنسٹریٹرکو سکھانے گا', 0, 0, 1, 0, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (4, N'IELTS', 55, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, 1, 100, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (5, N'SAT', 56, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, 1, 60, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (6, N'NCEES', 53, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, 1, 190, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (7, N'GRE', 30, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, 1, 230, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (8, N'Islam', 52, N'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ .إِنَّكَ حَمِيدٌ مَجِيدٌ اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ، ...', 0, 0, 1, 218, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (9, N'GMAT', 36, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, 1, 45, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (10, N'Test', 25, N'', 0, 0, 1, 10, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (11, N'Home', 13, N'', 0, 0, 1, 0, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (12, N'Physics', 50, N'Physics', 1, 0, 1, 0, NULL, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (13, N'Pacckage1', 25, N'package 1 for umrah', 0, 0, 1, 0, 2, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID], [AspNetUserID]) VALUES (14, N'package2', 51, N'', 0, 0, 1, 0, 2, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
SET IDENTITY_INSERT [dbo].[Dreams] OFF
SET IDENTITY_INSERT [dbo].[DreamTags] ON 

INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (1, 2, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (2, 2, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (3, 2, 3)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (4, 4, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (5, 4, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (6, 4, 3)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (7, 6, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (8, 6, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (9, 6, 3)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (10, 2, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (11, 2, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (12, 2, 3)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (13, 4, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (14, 4, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (15, 4, 3)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (16, 6, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (17, 6, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (18, 6, 3)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (19, 2, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (20, 2, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (21, 2, 3)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (22, 2, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (23, 2, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (24, 2, 3)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (25, 2, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (26, 2, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (27, 2, 3)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (28, 4, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (29, 4, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (30, 4, 3)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (31, 6, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (32, 6, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (33, 6, 3)
SET IDENTITY_INSERT [dbo].[DreamTags] OFF
SET IDENTITY_INSERT [dbo].[DreamType] ON 

INSERT [dbo].[DreamType] ([id], [Name], [DetailPath]) VALUES (1, N'BasicDream', NULL)
INSERT [dbo].[DreamType] ([id], [Name], [DetailPath]) VALUES (2, N'UmrahDetail', N'~/UmrahComponents/AdminControls/Packages/PackageDetail.ascx')
SET IDENTITY_INSERT [dbo].[DreamType] OFF
SET IDENTITY_INSERT [dbo].[DreamUserLikes] ON 

INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (29, 9, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (47, 4, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (48, 8, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (60, 7, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab')
SET IDENTITY_INSERT [dbo].[DreamUserLikes] OFF
SET IDENTITY_INSERT [dbo].[DreamUserProfile] ON 

INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'admin', NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (2, N'b3afc247-bd2f-4be2-ab35-6d6a71e17816', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (3, N'cde4eb97-41d7-4936-84e2-e915ed50e8f0', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (4, N'985d0276-bba6-4d8a-8b02-b8440f3a176e', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (5, N'a0e8a11e-0a02-4361-bbc6-cfa8ae2f41ce', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (6, N'e40b58ec-a049-423a-bdb3-ce988352056c', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (7, N'b12ebd32-72e6-4d7d-a544-e1caa179db0a', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (8, N'6a6328ff-530b-40e3-9635-6f040941aa02', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (9, N'c3b70fc3-2c17-487f-b023-503f5c0232c5', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (10, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', N'Test', N'BBCS', CAST(N'1980-01-08 00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (11, N'8ede996c-fa92-4655-8b91-282af6d3cd49', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (12, N'9ec276e3-6ca1-486f-ab56-362b09217745', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (13, N'00e15ddc-48b6-400e-9d5a-7dc89cb0cbcd', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[DreamUserProfile] OFF
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (1, N'jquery.vticker.min.js', N'/Components/FileBank/Content/.js', NULL, N'.js', CAST(N'2016-12-06 22:25:44.040' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (2, N'jquery.carouFredSel-6.0.4-packed.js', N'/Components/FileBank/Content/.js', NULL, N'.js', CAST(N'2016-12-06 23:05:46.327' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (3, N'ragdoll_rumble.swf', N'/Components/FileBank/Content/.swf', NULL, N'.swf', CAST(N'2016-12-07 01:30:43.067' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (4, N'sdf.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 05:07:19.927' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (5, N'Login.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 11:52:21.717' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (6, N'MediaBank.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 11:57:04.463' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (7, N'MediaSelection.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 11:59:59.557' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (8, N'Templates.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:02:03.683' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (9, N'LayoutCreation.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:04:56.620' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (10, N'AddingComponents.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:07:23.217' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (11, N'Components.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:09:34.130' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (12, N'AddNewComponent.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:13:34.950' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (13, N'ComponentList.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:15:12.197' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (14, N'FileBank.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:17:28.847' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (15, N'IntroAdminPanel.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:20:39.563' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (16, N'DreamPages.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:23:24.427' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (17, N'PageBuilder.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:25:15.423' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (18, N'CreationDefaultDream.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:27:36.423' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (19, N'CreationSampleDream.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:30:46.750' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (20, N'CreationLessonMenu.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:32:38.207' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (21, N'NewsControlPanel.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:34:41.300' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (22, N'AddNews.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:36:53.093' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (23, N'EditNews.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-07 12:38:34.990' AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (24, N'thai.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(N'2016-12-19 16:08:16.003' AS DateTime))
SET IDENTITY_INSERT [dbo].[Files] OFF
SET IDENTITY_INSERT [dbo].[Flight] ON 

INSERT [dbo].[Flight] ([id], [Name], [departureDate], [returnDate], [fromCity], [destinationCity], [price], [flightType], [airLineID]) VALUES (1, N'PIA-123', CAST(N'2017-01-13' AS Date), CAST(N'2017-02-15' AS Date), N'Lahore', N'Jaddah', 120000, 2, 1)
SET IDENTITY_INSERT [dbo].[Flight] OFF
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([id], [hotelName], [description], [rating], [distance], [mediaID], [AspNetUserID]) VALUES (2, N'hotel1', N'    		xyz', 1, 4, 23, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
SET IDENTITY_INSERT [dbo].[HotelFacility] ON 

INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (1, N'facility 1', 1, 25, 2)
SET IDENTITY_INSERT [dbo].[HotelFacility] OFF
SET IDENTITY_INSERT [dbo].[HotelImage] ON 

INSERT [dbo].[HotelImage] ([id], [mediaID], [hotelID]) VALUES (1, 43, 2)
SET IDENTITY_INSERT [dbo].[HotelImage] OFF
SET IDENTITY_INSERT [dbo].[LayoutTextBank] ON 

INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (1, 2, 1, NULL, N'BaseDreamControl2                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (2, 2, 2, NULL, N'BaseDreamControl3                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (3, 2, 3, NULL, N'BaseDreamControl6                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (4, 2, 4, NULL, N'BaseDreamControl8                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (5, 2, 5, NULL, N'BaseDreamControl9                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (6, 2, 6, NULL, N'BaseDreamControl10                                ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (7, 3, 7, NULL, N'BaseDreamControl2                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (8, 8, 8, NULL, N'BaseDreamControl2                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (9, 10, 9, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (10, 11, 10, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (11, 12, 11, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (12, 13, 12, NULL, N'BaseDreamControl2                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (13, 14, 13, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (14, 15, 14, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (15, 16, 15, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (16, 17, 16, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (17, 18, 17, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (18, 19, 18, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (19, 20, 19, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (20, 21, 20, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (21, 22, 21, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (22, 23, 22, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (23, 24, 23, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (24, 25, 24, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (25, 26, 25, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (26, 27, 26, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (27, 29, 27, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (28, 30, 28, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (29, 31, 29, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (30, 32, 30, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (31, 33, 31, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (32, 35, 32, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (33, 37, 33, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (34, 38, 34, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (35, 39, 35, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (36, 42, 36, NULL, N'BaseDreamControl2                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (37, 42, 37, NULL, N'BaseDreamControl4                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (38, 42, 38, NULL, N'BaseDreamControl5                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (39, 46, 39, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (42, 60, 42, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (43, 61, 43, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (46, 58, 46, NULL, N'BaseDreamControl2                                 ', 0)
SET IDENTITY_INSERT [dbo].[LayoutTextBank] OFF
SET IDENTITY_INSERT [dbo].[LessonAssignments] ON 

INSERT [dbo].[LessonAssignments] ([id], [Layout_id], [BaseControlID], [Assignment_id]) VALUES (1, 54, N'BaseDreamControl1', 1)
SET IDENTITY_INSERT [dbo].[LessonAssignments] OFF
SET IDENTITY_INSERT [dbo].[LessonMenu] ON 

INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (1, N'parent', 0, NULL, NULL, NULL, NULL, NULL, N'parent', NULL, N'none', NULL, NULL, 0, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (2, N'Progress', 0, 1, 3, 4, NULL, NULL, N'Progress', N'user', N'none', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (3, N'Week01', 1, 1, 3, 5, NULL, NULL, N'Week 01', N'user', N'none', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (4, N'Video01', 0, 3, 3, 6, NULL, NULL, N'Video 01', N'user', N'video', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (5, N'Quiz01', 0, 3, 3, 7, NULL, NULL, N'Quiz 01', N'user', N'quiz', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (6, N'Reading01', 0, 3, 3, 8, NULL, NULL, N'Reading', N'user', N'multimedia', NULL, NULL, 3, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (7, N'Week02', 1, 1, 3, 9, NULL, NULL, N'Week 02', N'user', N'none', NULL, NULL, 3, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (8, N'Activity01', 0, 7, 3, 10, NULL, NULL, N'Activity 01', N'user', N'none', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (9, N'Activity02', 0, 7, 3, 11, NULL, NULL, N'Activity 02', N'user', N'none', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (10, N'Acitivity03', 0, 7, 3, 12, NULL, NULL, N'Activity 03', N'user', N'none', NULL, NULL, 3, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (11, N'Lesson1', 0, 1, 13, 14, NULL, NULL, N'Login', N'public', N'none', NULL, 0, 7, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (12, N'MediaBank', 1, 1, 13, 15, NULL, NULL, N'Media Bank', N'public', N'multimedia', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (13, N'MediaSelection', 0, 12, 13, 16, NULL, NULL, N'Media Selection', N'public', N'multimedia', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (14, N'Templates', 1, 1, 13, 17, NULL, NULL, N'Templates', N'public', N'none', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (15, N'LayoutCreation', 0, 14, 13, 18, NULL, NULL, N'Layout Creation', N'public', N'none', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (16, N'AddComponents', 0, 14, 13, 19, NULL, NULL, N'Adding Components', N'public', N'none', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (17, N'Components', 1, 1, 13, 20, NULL, NULL, N'Components', N'public', N'none', NULL, NULL, 4, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (18, N'AddNewComponent', 0, 17, 13, 21, NULL, NULL, N'Add New Component', N'public', N'none', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (19, N'ComponentList', 0, 17, 13, 22, NULL, NULL, N'Component List', N'public', N'none', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (20, N'FileBank', 0, 1, 13, 23, 11, 24, N'File Bank', N'public', N'none', NULL, NULL, 5, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (21, N'DreamAdminPanel', 1, 1, 13, 24, NULL, NULL, N'Dream Admin Panel', N'public', N'none', NULL, NULL, 6, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (22, N'DreamPages', 0, 21, 13, 25, NULL, NULL, N'Dream Pages', N'public', N'none', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (23, N'PageBuilder', 0, 21, 13, 26, NULL, NULL, N'Page Design Builder', N'public', N'none', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (24, N'CreationDefaultDream', 0, 1, 13, 27, NULL, NULL, N'Creation of Default Dream', N'public', N'multimedia_site', NULL, NULL, 8, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (25, N'CreationSampleDream', 1, 1, 13, 28, NULL, NULL, N'Creation of Sample Dream', N'public', N'none', NULL, NULL, 9, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (26, N'DefaultPage', 0, 25, 13, 29, NULL, NULL, N'Default Page', N'user', N'none', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (27, N'DreamMenu', 0, 25, 13, 30, NULL, NULL, N'Dream Menu', N'user', N'none', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (28, N'NewsAdminPanel', 1, 1, 13, 31, NULL, NULL, N'News Admin Panel', N'public', N'none', NULL, NULL, 3, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (29, N'AddNews', 0, 28, 13, 32, NULL, NULL, N'Add News', N'user', N'none', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (30, N'EditNews', 0, 28, 13, 33, NULL, NULL, N'Edit News', N'public', N'none', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (31, N'Week0', 1, 1, 3, 34, NULL, NULL, N'Week 0', N'user', N'none', NULL, NULL, 4, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (32, N'Week03', 0, 1, 3, 35, NULL, NULL, N'Week 03', N'user', N'multimedia', NULL, NULL, 5, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (33, N'Week04', 0, 1, 3, 36, NULL, NULL, N'Week 04', N'user', N'multimedia', NULL, NULL, 6, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (34, N'First', 0, 31, 3, 37, NULL, NULL, N'First', N'user', N'multimedia', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (35, N'Second', 0, 31, 3, 38, NULL, NULL, N'Second', N'user', N'multimedia', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (36, N'Third', 0, 31, 3, 39, NULL, NULL, N'Third', N'user', N'multimedia', NULL, NULL, 3, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (37, N'Menu1', 1, 1, 43, 44, NULL, NULL, N'Menu 1', N'user', N'none', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (38, N'SubMenu1', 0, 37, 43, 45, NULL, NULL, N'Sub Menu 1', N'user', N'none', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (39, N'Menu2', 0, 1, 43, 46, NULL, NULL, N'Menu 2', N'user', N'none', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (40, N'Progress', 0, 1, 56, 57, NULL, NULL, N'Progress', N'user', N'none', NULL, 0, 4, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (41, N'Chapter1', 1, 1, 56, 58, NULL, NULL, N'Chapter 1', N'user', N'none', NULL, 0, 3, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (42, N'Video1', 0, 1, 56, 59, 43, NULL, N'Video 1', N'user', N'video', NULL, 0, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (43, N'Ch1', 0, 41, 56, 60, NULL, NULL, N'Chapter 01', N'user', N'reading', NULL, NULL, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (44, N'Ch2', 0, 41, 56, 61, 45, 43, N'Chapter 02', N'user', N'reading', NULL, NULL, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (45, N'Quiz1', 0, 41, 56, 62, NULL, NULL, N'Quiz 01', N'user', N'quiz', NULL, NULL, 3, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (47, N'NewMenu', 1, 1, 56, 64, NULL, NULL, N'New Menu', N'user', N'reading', NULL, 0, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (48, N'NewSubMenu', 0, 47, 56, 65, NULL, NULL, N'New Sub Menu', N'user', N'reading', NULL, 0, 2, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (49, N'AnotherNewMenu', 0, 47, 56, 66, NULL, NULL, N'Another New Menu', N'user', N'none', NULL, 0, 5, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (50, N'YetAnotherNewMenu', 0, 47, 56, 67, NULL, NULL, N'Yet Another New Menu', N'user', N'video', NULL, 0, 3, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (51, N'New1', 0, 47, 56, 68, NULL, NULL, N'New1', N'user', N'quiz', NULL, 0, 4, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (52, N'New2', 0, 47, 56, 69, NULL, NULL, N'New2', N'user', N'none', NULL, 0, 6, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (53, N'New3', 0, 47, 56, 70, NULL, NULL, N'New 3', N'user', N'none', NULL, 0, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (56, N'Progress', 0, 1, 72, 75, NULL, NULL, N'Progress', N'user', N'none', NULL, 0, 1, NULL)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (57, N'Progress', 0, 1, 74, 76, NULL, NULL, N'PROGRESS', N'user', N'none', NULL, 0, 1, NULL)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (58, N'AnotherNew', 0, 1, 74, 77, NULL, NULL, N'AnotherNew', N'user', N'video', NULL, 0, 2, 0)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (59, N'Lesson1', 1, 1, 71, 78, NULL, NULL, N'Lesson 1', N'user', N'none', NULL, 1, 1, 0)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (60, N'Lesson01', 0, 59, 71, 79, NULL, NULL, N'Lesson 1.1', N'user', N'none', NULL, 0, 1, 1)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (61, N'Lesson02', 1, 59, 71, 80, NULL, NULL, N'Lesson 1.2', N'user', N'none', NULL, 0, 2, 0)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (62, N'Lesson2', 0, 1, 71, 81, NULL, NULL, N'Lesson 2', N'user', N'none', NULL, 0, 2, 0)
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [previous_LayoutID], [next_LayoutID], [DisplayName], [menuRight], [menuType], [isActive], [isDefault], [AppOrder], [isShowNP]) VALUES (63, N'SubMenu1', 0, 61, 71, 82, NULL, NULL, N'Sub Menu 1', N'user', N'none', NULL, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[LessonMenu] OFF
SET IDENTITY_INSERT [dbo].[LessonMenuAvailability] ON 

INSERT [dbo].[LessonMenuAvailability] ([id], [MenuID], [AvailableFrom], [DeadLine], [TimeLimit], [EnableAvailability], [EnableDeadLine], [EnableTimeLimit]) VALUES (1, 31, CAST(N'2016-09-14 00:00:00.000' AS DateTime), CAST(N'2016-12-04 00:00:00.000' AS DateTime), 0, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[LessonMenuAvailability] OFF
SET IDENTITY_INSERT [dbo].[LessonMenuPreRequisite] ON 

INSERT [dbo].[LessonMenuPreRequisite] ([id], [menu_id], [pre_req_menu_id]) VALUES (27, 20, 11)
INSERT [dbo].[LessonMenuPreRequisite] ([id], [menu_id], [pre_req_menu_id]) VALUES (28, 20, 13)
INSERT [dbo].[LessonMenuPreRequisite] ([id], [menu_id], [pre_req_menu_id]) VALUES (29, 41, 48)
SET IDENTITY_INSERT [dbo].[LessonMenuPreRequisite] OFF
SET IDENTITY_INSERT [dbo].[LessonMultimedia] ON 

INSERT [dbo].[LessonMultimedia] ([id], [Layout_id], [BaseControlID], [MultimediaID]) VALUES (3, 27, N'BaseDreamControl1', 7)
SET IDENTITY_INSERT [dbo].[LessonMultimedia] OFF
SET IDENTITY_INSERT [dbo].[LessonProgressControl] ON 

INSERT [dbo].[LessonProgressControl] ([id], [BaseControlID], [ResidingLayoutID], [OriginalLayoutID], [MenuID], [ProgressType]) VALUES (4, N'BaseDreamControl3', 64, 66, 49, N'ChildOnly')
INSERT [dbo].[LessonProgressControl] ([id], [BaseControlID], [ResidingLayoutID], [OriginalLayoutID], [MenuID], [ProgressType]) VALUES (6, N'BaseDreamControl6', 64, 64, 47, N'ChildOnly')
INSERT [dbo].[LessonProgressControl] ([id], [BaseControlID], [ResidingLayoutID], [OriginalLayoutID], [MenuID], [ProgressType]) VALUES (7, N'BaseDreamControl', 78, 78, 59, N'ParentOnly')
SET IDENTITY_INSERT [dbo].[LessonProgressControl] OFF
SET IDENTITY_INSERT [dbo].[LessonProgressDashBoard] ON 

INSERT [dbo].[LessonProgressDashBoard] ([id], [BaseControlID], [ShowSiblingsProgress], [LayoutID]) VALUES (1, N'BaseDreamControl1', 1, 4)
INSERT [dbo].[LessonProgressDashBoard] ([id], [BaseControlID], [ShowSiblingsProgress], [LayoutID]) VALUES (2, N'BaseDreamControl1', 1, 57)
SET IDENTITY_INSERT [dbo].[LessonProgressDashBoard] OFF
SET IDENTITY_INSERT [dbo].[LessonQuestion] ON 

INSERT [dbo].[LessonQuestion] ([id], [Layout_id], [BaseControlID], [Question_id], [HintOption], [HintMarks], [ShowAnswer]) VALUES (1, 55, N'BaseDreamControl1', 4, NULL, NULL, NULL)
INSERT [dbo].[LessonQuestion] ([id], [Layout_id], [BaseControlID], [Question_id], [HintOption], [HintMarks], [ShowAnswer]) VALUES (2, 47, N'BaseDreamControl3', 18, N'Normal', CAST(60.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[LessonQuestion] ([id], [Layout_id], [BaseControlID], [Question_id], [HintOption], [HintMarks], [ShowAnswer]) VALUES (3, 79, N'BaseDreamControl', 4, N'Zero', CAST(0.00 AS Decimal(18, 2)), NULL)
SET IDENTITY_INSERT [dbo].[LessonQuestion] OFF
SET IDENTITY_INSERT [dbo].[LessonQuiz] ON 

INSERT [dbo].[LessonQuiz] ([id], [Layout_id], [BaseControlID], [QuizID], [Graded], [Marks], [TimeBased], [TotalTime], [visibleQuestions], [QuestionsPerPage], [HintOption]) VALUES (6, 80, N'BaseDreamControl', 1, 1, CAST(100.000 AS Decimal(15, 3)), 0, 200, 2, 2, N'Normal')
SET IDENTITY_INSERT [dbo].[LessonQuiz] OFF
SET IDENTITY_INSERT [dbo].[LessonVideo] ON 

INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id], [showTranscript]) VALUES (1, 2, N'BaseDreamControl4', 40, 1)
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id], [showTranscript]) VALUES (2, 6, N'BaseDreamControl1', 40, 1)
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id], [showTranscript]) VALUES (3, 42, N'BaseDreamControl3', 40, 1)
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id], [showTranscript]) VALUES (4, 45, N'BaseDreamControl1', 40, 0)
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id], [showTranscript]) VALUES (5, 65, N'BaseDreamControl7', 40, 0)
SET IDENTITY_INSERT [dbo].[LessonVideo] OFF
SET IDENTITY_INSERT [dbo].[MCQOptions] ON 

INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (1, 4, N'125', 1)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (2, 4, N'120', 1)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (3, 4, N'127', 1)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (4, 4, N'130', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (5, 5, N'6 : 7 : 8', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (6, 5, N'2 : 3 : 4', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (7, 5, N'6 : 8 : 9', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (8, 5, N'None of these', 1)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (9, 6, N'3.9030', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (10, 6, N'1.6020', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (11, 6, N'1.9030', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (12, 6, N'None of these', 1)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (13, 7, N'2', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (14, 7, N'4', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (15, 7, N'7', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (16, 7, N'8', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (17, 7, N'11', 1)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (18, 8, N'10', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (19, 8, N'12', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (20, 8, N'13', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (21, 8, N'14', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (22, 8, N'15', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (23, 9, N'Shows that an influx of manpower from Europe was not critical for the survival of the Crusader states', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (24, 9, N'Shows that Muslims vastly outnumbered Europeans in the Crusader states', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (25, 9, N'minimizes the importance of Hospitallers and Teutonic Knights in the administration of the Crusader states', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (26, 9, N'presents an incident in which a military order supported a Muslim traveler', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (27, 4, N'135', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (28, 10, N'pH<sub>2</sub>&nbsp;&gt; pSO<sub>2</sub>&nbsp;&gt; pCH<sub>4</sub>', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (29, 10, N'pH<sub>2&nbsp;</sub>&gt; pCH<sub>4&nbsp;</sub>&gt; pSO2', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (30, 10, N'pSO<sub>2</sub>&nbsp;&gt; pH<sub>2</sub>&nbsp;&gt; pCH<sub>4</sub>', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (31, 11, N'Tim needs extra practice reading and writing problematic letters and words at home at least 30 minutes per day.', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (32, 10, N'pSO<sub>2</sub>&nbsp;&gt; pCH<sub>4</sub>, &gt; pH<sub>2</sub>', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (33, 12, N'<img alt="1" height="146" src="http://www.questionpapers.net.in/chemistry/wp-content/uploads/2016/12/1.jpg" width="187" />', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (34, 13, N'asdfghjkl', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (35, 13, N'lkjhgfdsa', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (36, 9, N'Demo Option added through inline options. ', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (37, 9, N'Demo Option to show abdullah', 0)
SET IDENTITY_INSERT [dbo].[MCQOptions] OFF
SET IDENTITY_INSERT [dbo].[MediaCategories] ON 

INSERT [dbo].[MediaCategories] ([id], [CategoryName]) VALUES (1, N'Dream Images')
SET IDENTITY_INSERT [dbo].[MediaCategories] OFF
SET IDENTITY_INSERT [dbo].[MediaItems] ON 

INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (3, N'asplogo-square.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-11-22 14:33:24.497' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (4, N'imgres.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 12:22:31.767' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (5, N'images.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 12:26:13.577' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (6, N'image.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 12:30:22.197' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (7, N'im.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 12:32:34.887' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (8, N'video.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-06 14:11:57.657' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (9, N'videosone.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 14:13:02.907' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (10, N'check-tick-icon-25.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 14:13:56.970' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (11, N'sharing-music-on-music-paradise.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 14:14:13.407' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (12, N'search-text-512.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 14:14:43.527' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (13, N'activation.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 14:16:06.307' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (14, N'enrollment.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 14:16:58.807' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (15, N'direction.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 14:19:03.203' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (16, N'profile-icon-28.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 14:20:05.460' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (17, N'activity_grid1600.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 14:23:39.543' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (18, N'16_feb-logo.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 04:38:56.437' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (19, N'News Icon.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 05:07:48.817' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (20, N'uet.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 05:19:44.813' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (21, N'COL9-6.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 05:23:42.587' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (22, N'content-tree-94741.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 05:28:21.900' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (23, N'GRE.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 05:32:42.740' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (24, N'GRE.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-06 05:32:54.687' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (25, N'CRE-icon-square_0.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 05:33:50.750' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (26, N'GRE.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-06 05:34:28.400' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (27, N'Picture1.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-06 05:34:42.380' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (28, N'uet.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-06 05:37:06.873' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (29, N'lums.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 05:39:41.073' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (30, N'Picture1.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 05:40:00.843' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (31, N'text_document_complete-512.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 05:50:40.187' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (32, N'file-share-_-_-512.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 05:54:15.150' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (33, N'uet.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-06 05:57:12.843' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (34, N'uet.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-06 05:58:27.520' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (35, N'SummaryIcon.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 06:11:30.157' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (36, N'UET.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 06:15:30.720' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (37, N'uet.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-06 06:16:25.287' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (38, N'34 - Query Parameters Solution.mp4', N'/Components/MediaBank/Content/Video', 1, N'video', CAST(N'2016-12-06 22:10:48.663' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (39, N'icon-ecommunications.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-06 22:15:57.267' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (40, N'video1.mp4', N'/Components/MediaBank/Content/Video', 1, N'video', CAST(N'2016-12-06 22:16:20.080' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (41, N'uet.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-06 22:17:25.993' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (42, N'UET Lahore.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-08 02:35:02.807' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (43, N'uet_et.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-08 05:35:44.163' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (44, N'success_sum.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-08 05:38:12.087' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (45, N'success_abd.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-08 05:42:05.973' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (46, N'grebooks.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-08 05:59:30.487' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (47, N'cnAsVm.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-08 06:09:21.297' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (48, N'success.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-08 06:14:33.037' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (49, N'nust-university-islamabad.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-08 07:13:42.700' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (50, N'campus1.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-08 07:18:50.897' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (51, N'PU-Fee-Structure-2016.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-08 07:21:00.430' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (52, N'understandislam.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-08 07:31:37.547' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (53, N'ncees.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-09 04:03:01.833' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (54, N'ETS_TOEFL_iBT_310.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-09 04:04:00.077' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (55, N'ielts.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-09 04:04:24.027' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (56, N'WPoeWnSt.jpeg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-09 04:04:53.263' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (57, N'content.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-19 15:20:58.627' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (58, N'content.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-19 15:21:37.190' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (59, N'Untitled-3.gif', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-19 15:44:19.957' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (60, N'3.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(N'2016-12-23 23:55:27.020' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (61, N'chem.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-23 23:55:55.833' AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (62, N'physics.gif', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(N'2016-12-24 00:03:35.537' AS DateTime))
SET IDENTITY_INSERT [dbo].[MediaItems] OFF
SET IDENTITY_INSERT [dbo].[MultiFIBComponents] ON 

INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (38, 18, N'Text', N'text area', CAST(0.00 AS Decimal(15, 2)), 1)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (39, 18, N'Blank', N'Jahanzaib', CAST(80.00 AS Decimal(15, 2)), 2)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (40, 18, N'Text', N'text area', CAST(0.00 AS Decimal(15, 2)), 3)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (41, 18, N'Blank', N'Muhammad ', CAST(80.00 AS Decimal(15, 2)), 4)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (42, 18, N'Text', N'text area', CAST(0.00 AS Decimal(15, 2)), 5)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (43, 18, N'Blank', N'Faiza', CAST(80.00 AS Decimal(15, 2)), 6)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (44, 18, N'Blank', N'Haider', CAST(100.00 AS Decimal(15, 2)), 7)
SET IDENTITY_INSERT [dbo].[MultiFIBComponents] OFF
SET IDENTITY_INSERT [dbo].[MultiFIBMarkup] ON 

INSERT [dbo].[MultiFIBMarkup] ([id], [QuestionID], [QuestionMarkup]) VALUES (1, 18, N'

        <div class="col-md-3" data-type="Text" data-component="1"><div class="col-md-10"><span class="mfib" id="span_1">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="1" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="2"><div class="col-md-8"><span class="mfib" id="blank_2">Jahanzaib</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_2">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="2" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="3"><div class="col-md-10"><span class="mfib" id="span_3">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="3" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="4"><div class="col-md-8"><span class="mfib" id="blank_4">Muhammad</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_4">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="4" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="5"><div class="col-md-10"><span class="mfib" id="span_5">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="5" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="6"><div class="col-md-8"><span class="mfib" id="blank_6">Faiza</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_6">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="6" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="7"><div class="col-md-8"><span class="mfib" id="blank_7">Haider</span></div><div class="col-md-2"><span data-weightage="100" id="weightage_7">100</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="7" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div>')
INSERT [dbo].[MultiFIBMarkup] ([id], [QuestionID], [QuestionMarkup]) VALUES (2, 19, N'

        <div class="col-md-3" data-type="Text" data-component="1"><div class="col-md-10"><span class="mfib" id="span_1">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="1" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="2"><div class="col-md-8"><span class="mfib" id="blank_2">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_2">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="2" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="3"><div class="col-md-10"><span class="mfib" id="span_3">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="3" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="4"><div class="col-md-8"><span class="mfib" id="blank_4">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_4">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="4" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="5"><div class="col-md-10"><span class="mfib" id="span_5">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="5" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="6"><div class="col-md-8"><span class="mfib" id="blank_6">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_6">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="6" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="7"><div class="col-md-8"><span class="mfib" id="blank_7">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_7">90</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="7" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div>')
INSERT [dbo].[MultiFIBMarkup] ([id], [QuestionID], [QuestionMarkup]) VALUES (3, 20, N'

        <div class="col-md-3" data-type="Text" data-component="1"><div class="col-md-10"><span class="mfib" id="span_1">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="1" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="2"><div class="col-md-8"><span class="mfib" id="blank_2">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_2">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="2" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="3"><div class="col-md-10"><span class="mfib" id="span_3">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="3" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="4"><div class="col-md-8"><span class="mfib" id="blank_4">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_4">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="4" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="5"><div class="col-md-10"><span class="mfib" id="span_5">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="5" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="6"><div class="col-md-8"><span class="mfib" id="blank_6">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_6">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="6" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="7"><div class="col-md-8"><span class="mfib" id="blank_7">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_7">90</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="7" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div>')
SET IDENTITY_INSERT [dbo].[MultiFIBMarkup] OFF
SET IDENTITY_INSERT [dbo].[Multimediabank] ON 

INSERT [dbo].[Multimediabank] ([id], [Name], [Description], [DirectoryPath], [IndexFilePath]) VALUES (7, N'Bank1', N'nss', N'~/Components/MultimediaBank/Items/AlharmainHome', N'../../Components/MultimediaBank/Items/AlharmainHome/index.html')
SET IDENTITY_INSERT [dbo].[Multimediabank] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (1, N'Start your GRE Preparation                        ', N'The Graduate Record Examination (GRE) is a standardized test that is an admissions requirement for most Graduate Schools in the United States.[7] Created and administered by the Educational Testing Service (ETS) in 1949,[8] the exam aims to measure verbal reasoning, quantitative reasoning, analytical writing, and critical thinking skills that have been acquired over a long period of learning and that are not entirely based on any specific field of study outside of the GRE itself. The GRE General Test is offered as a computer-based exam administered at Prometric testing centers.', CAST(N'2016-12-07' AS Date), CAST(N'2016-12-16' AS Date), 1, 1, CAST(N'2016-12-08' AS Date), 0, 46, N'national       ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (2, N'Start GMAT Preparation Now!                       ', N'The Graduate Management Admission Test (GMAT (/''d?i?mæt/ (jee-mat))) is a computer adaptive test (CAT) intended to assess certain analytical, writing, quantitative, verbal, and reading skills in written English for use in admission to a graduate management program, such as an MBA. It requires knowledge of certain grammar and knowledge of certain algebra, geometry, and arithmetic. The GMAT does not measure business knowledge or skill, nor does it measure intelligence. According to the test owning company, the Graduate Management Admission Council (GMAC), the GMAT assesses analytical writing and problem-solving abilities, while also addressing data sufficiency, logic, and critical reasoning skills that it believes to be vital to real-world business and management success. It can be taken up to five times a year. Each attempt must be at least 16 days apart', CAST(N'2016-12-08' AS Date), CAST(N'2016-12-30' AS Date), 0, 1, CAST(N'2016-12-08' AS Date), 0, 44, N'national       ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (3, N'IELTS                                             ', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', CAST(N'2016-12-07' AS Date), CAST(N'2016-12-30' AS Date), 0, 1, CAST(N'2016-12-09' AS Date), 0, 55, N'national       ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (4, N'Success Story                                     ', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

', CAST(N'2016-12-07' AS Date), CAST(N'2016-12-29' AS Date), 1, 1, CAST(N'2016-12-08' AS Date), 0, 45, N'international  ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (5, N'Dream Big                                         ', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', CAST(N'2016-12-06' AS Date), CAST(N'2016-12-31' AS Date), 1, 1, CAST(N'2016-12-08' AS Date), 0, 47, N'national       ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (6, N'How to be Successful?                             ', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

', CAST(N'2016-12-07' AS Date), CAST(N'2016-12-31' AS Date), 1, 1, CAST(N'2016-12-08' AS Date), 0, 48, N'international  ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (7, N'Preparing for NCEES?                              ', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', CAST(N'2016-12-08' AS Date), CAST(N'2016-12-30' AS Date), 1, 1, CAST(N'2016-12-09' AS Date), 0, 53, N'national       ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (8, N'Appear in GRE                                     ', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', CAST(N'2016-12-08' AS Date), CAST(N'2016-12-31' AS Date), 0, 1, CAST(N'2016-12-09' AS Date), 0, 30, N'national       ')
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[NewsDreamNews] ON 

INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (1, 1, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (2, 1, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (3, 2, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (4, 2, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (5, 3, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (6, 3, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (7, 1, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (8, 1, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (9, 2, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (10, 2, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (11, 3, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (12, 3, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (13, 4, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (14, 4, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (15, 1, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (16, 1, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (17, 3, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (18, 3, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (19, 5, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (20, 5, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (21, 6, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (22, 6, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (23, 7, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (24, 7, 4)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (25, 7, 5)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (26, 7, 6)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (27, 7, 7)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (28, 1, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (29, 1, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (30, 1, 4)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (31, 1, 6)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (32, 1, 9)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (33, 2, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (34, 2, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (35, 2, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (36, 2, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (37, 2, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (38, 2, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (39, 5, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (40, 5, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (41, 8, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (42, 8, 4)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (43, 8, 5)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (44, 8, 6)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (45, 3, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (46, 3, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (47, 3, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (48, 3, 3)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (49, 7, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (50, 7, 4)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (51, 7, 5)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (52, 7, 6)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (53, 7, 7)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (54, 8, 2)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (55, 8, 4)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (56, 8, 5)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (57, 8, 6)
SET IDENTITY_INSERT [dbo].[NewsDreamNews] OFF
SET IDENTITY_INSERT [dbo].[NewsRelatedNews] ON 

INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (1, 2, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (2, 3, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (3, 3, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (4, 1, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (5, 1, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (6, 1, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (7, 2, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (8, 2, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (9, 2, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (10, 3, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (11, 3, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (12, 3, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (13, 4, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (14, 4, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (15, 4, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (16, 1, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (17, 1, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (18, 1, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (19, 3, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (20, 3, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (21, 3, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (22, 5, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (23, 5, 4)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (24, 6, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (25, 6, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (26, 6, 4)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (27, 6, 5)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (28, 7, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (29, 7, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (30, 7, 6)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (31, 1, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (32, 1, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (33, 1, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (34, 1, 5)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (35, 2, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (36, 2, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (37, 2, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (38, 2, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (39, 2, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (40, 2, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (41, 2, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (42, 2, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (43, 2, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (44, 5, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (45, 5, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (46, 5, 4)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (47, 8, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (48, 8, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (49, 8, 6)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (50, 8, 7)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (51, 3, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (52, 3, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (53, 3, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (54, 3, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (55, 3, 2)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (56, 3, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (57, 7, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (58, 7, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (59, 7, 6)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (60, 8, 1)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (61, 8, 3)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (62, 8, 6)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (63, 8, 7)
SET IDENTITY_INSERT [dbo].[NewsRelatedNews] OFF
SET IDENTITY_INSERT [dbo].[PackageDetail] ON 

INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [additionalExpense], [additionalDetail], [isAirLineAvailable], [packageType], [startDate], [minRange], [maxRange]) VALUES (5, 14, 2, 1, 2, 2, 1, 1, 1, 0, NULL, 0, NULL, 1, 1, 0, N'', 0, N'1', CAST(N'2017-02-21' AS Date), 0, 0)
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [additionalExpense], [additionalDetail], [isAirLineAvailable], [packageType], [startDate], [minRange], [maxRange]) VALUES (6, 13, 2, 1, 2, 1, 1, 1, 1, 0, NULL, 1, 1, 1, 1, 1200, N'', 0, N'1', CAST(N'2017-02-21' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[PackageDetail] OFF
SET IDENTITY_INSERT [dbo].[QuestionBank] ON 

INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (4, 1, N'Find the greatest number which on dividing 1657 and 2037 leaves remainders 6 and 5 respectively.', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (5, 1, N'Seats for Mathematics, Physics and Biology in a school are in the ratio 5 : 7 : 8. There is a proposal to increase these seats by 40%, 50% and 75% respectively. What will be the ratio of increased seats?', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (6, 1, N'If log10 2 = 0.3010, the value of log10 80 is:', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (7, 1, N'When iron pyrite (FeS2) is heated in air, the process known as &quot;roasting&quot; forms sulfur dioxide and iron(III) oxide. When the equation for this process is completed and balanced, using the smallest whole number coefficients, what is the coefficient for &quot;O2&quot;?&nbsp;<br />
&nbsp; &nbsp; FeS2 + &nbsp;O2 --&gt; &nbsp; SO2 + &nbsp;Fe2O3', 1, 1, 2)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (8, 1, N'Balance the following equation with the smallest whole number coefficients. Choose the answer that is the sum of the coefficients in the balanced equation. Do not forget coefficients of &quot;one.&quot;&nbsp;<br />
&nbsp; &nbsp;Cr2(SO4)3 + RbOH --&gt; &nbsp;Cr(OH)3 + Rb2SO4', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (9, 1, N'<p>Passage 1</p>

<p>&nbsp; &nbsp;Whenever I visited Jerusalem, I always entered the al-Aqsa Mosque, beside which stood a small mosque which the Franks had converted into a church.... [T]he Templars, ... who were my friends, would evacuate the little adjoining mosque so that I could pray in it.</p>

<p>&nbsp; &nbsp;Usamah ibn Munqidh, Muslim historian, Jerusalem, circa 1138</p>

<p>&nbsp; &nbsp;Passage 2</p>

<p>&nbsp; &nbsp;The Crusader states were able to cling to survival only through frequent delivery of supplies and manpower from Europe.</p>

<p>&nbsp; &nbsp;[They] were defended primarily by three semi-monastic military orders: the Templars, the Hospitallers, and the Teutonic Knights. Combining monasticism and militarism, these orders served to protect pilgrims and to wage perpetual war against the Muslims.</p>

<p>&nbsp; &nbsp;Palmira Brummett, world historian, 2007</p>

<p><br />
&nbsp; &nbsp;The second passage does not support the first passage because the second passage</p>
', 1, 2, 4)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (10, 1, N'0.5 mole of each of H<sub>2</sub>, SO<sub>2</sub>&nbsp;and CH<sub>4</sub>&nbsp;are kept in a container. A hole was made in the container. After 3 hours, the order of partial pressures in the container will be', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (11, 1, N'The teacher has arranged a meeting with Tim&rsquo;s mother to discuss these concerns. Which of the following statements is best for the teacher to say to Tim&rsquo;s mother?', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (12, 1, N'Which of the following biphenyls is optically active<strong>?</strong>', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (13, 1, N'A car has a linear velocity v on a circular track of radius r. If its speed is increasing at a rate of a m/s2, then its resultant acceleration will be good', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (14, 2, N'Wao, its a Fill In Blanks Questioner', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (15, 2, N'jkklhjkljklhjklhjhkl', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (16, 1, N'New Qeustion', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (17, 4, N'Multiple Fill In Blanks Question', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (18, 4, N'Multiple Fill In Blanks Question', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (19, 4, N'Multiple Fill In Blanks Question', 1, 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (20, 4, N'Multiple Fill In Blanks Question', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[QuestionBank] OFF
SET IDENTITY_INSERT [dbo].[QuestionCategories] ON 

INSERT [dbo].[QuestionCategories] ([id], [CategoryName]) VALUES (1, N'Math')
INSERT [dbo].[QuestionCategories] ([id], [CategoryName]) VALUES (2, N'SocialStudies')
INSERT [dbo].[QuestionCategories] ([id], [CategoryName]) VALUES (3, N'Physics')
SET IDENTITY_INSERT [dbo].[QuestionCategories] OFF
SET IDENTITY_INSERT [dbo].[QuestionHints] ON 

INSERT [dbo].[QuestionHints] ([id], [QuestionID], [HintText]) VALUES (1, 12, N'You can feel it.&nbsp;')
INSERT [dbo].[QuestionHints] ([id], [QuestionID], [HintText]) VALUES (2, 15, N'This is my hint')
INSERT [dbo].[QuestionHints] ([id], [QuestionID], [HintText]) VALUES (3, 14, N'This is my hints')
INSERT [dbo].[QuestionHints] ([id], [QuestionID], [HintText]) VALUES (4, 4, N'This is Abdullah&#39;s hint.&nbsp;')
SET IDENTITY_INSERT [dbo].[QuestionHints] OFF
SET IDENTITY_INSERT [dbo].[QuestionSubCategories] ON 

INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (1, 1, N'Al-Jebra')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (2, 1, N'Trigonometery')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (3, 1, N'Unit Conversion')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (4, 2, N'National')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (5, 2, N'International')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (6, 3, N'Momentum')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (7, 3, N'Velocity')
SET IDENTITY_INSERT [dbo].[QuestionSubCategories] OFF
SET IDENTITY_INSERT [dbo].[QuestionType] ON 

INSERT [dbo].[QuestionType] ([id], [QTypeName], [EditTypeControl], [ViewTypeControl]) VALUES (1, N'MCQ''s', N'Components/QuestionBank/MCQHandler.aspx', N'~/Components/QuestionBank/User/MCQUserView.ascx')
INSERT [dbo].[QuestionType] ([id], [QTypeName], [EditTypeControl], [ViewTypeControl]) VALUES (2, N'FillInBlanks', N'Components/QuestionBank/FillInBlanksHandler.aspx', N'~/Components/QuestionBank/User/FillInBlanksUserView.ascx')
INSERT [dbo].[QuestionType] ([id], [QTypeName], [EditTypeControl], [ViewTypeControl]) VALUES (3, N'ShortQuestions', N'Default', NULL)
INSERT [dbo].[QuestionType] ([id], [QTypeName], [EditTypeControl], [ViewTypeControl]) VALUES (4, N'MultipleFIB', N'Components/QuestionBank/MultipleFIBHandler.aspx', N'~/Components/QuestionBank/User/MultiFIBUserView.ascx')
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
SET IDENTITY_INSERT [dbo].[QuizBank] ON 

INSERT [dbo].[QuizBank] ([id], [Name], [Description], [Categoryid], [MediaItemID]) VALUES (1, N'New Quiz for ECAT', N'New Quiz', 1, 14)
SET IDENTITY_INSERT [dbo].[QuizBank] OFF
SET IDENTITY_INSERT [dbo].[QuizBankQuestions] ON 

INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (1, 1, 4, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (2, 1, 5, 1)
SET IDENTITY_INSERT [dbo].[QuizBankQuestions] OFF
SET IDENTITY_INSERT [dbo].[QuizCategories] ON 

INSERT [dbo].[QuizCategories] ([id], [CategoryName]) VALUES (1, N'ECAT')
INSERT [dbo].[QuizCategories] ([id], [CategoryName]) VALUES (2, N'MCAT')
SET IDENTITY_INSERT [dbo].[QuizCategories] OFF
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([id], [Name]) VALUES (1, N'GRE')
INSERT [dbo].[Tags] ([id], [Name]) VALUES (2, N'IELTS')
INSERT [dbo].[Tags] ([id], [Name]) VALUES (3, N'NCEES')
INSERT [dbo].[Tags] ([id], [Name]) VALUES (4, N'music')
SET IDENTITY_INSERT [dbo].[Tags] OFF
SET IDENTITY_INSERT [dbo].[TextBank] ON 

INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (1, N'<div class="col-md-12 heading_image" style="position:absolute; left:100px; bottom:10px;">
<h1><a href="DreamView.html" style="color:white;">GRE</a></h1>

<h3 style="color: #eb8c2e; margin-top: 15px;">The Smartest Way to Graduate and Business School</h3>
</div>
', 0, N'heading_GRE')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (2, N'<div class="col-md-4" style="padding-left:30px; padding-right:30px;"><button class="btn btn-default">Similar Courses</button></div>

<div class="col-md-4" style="padding-left:30px; padding-right:30px;"><button class="btn btn-default">View Detail</button></div>

<div class="col-md-4" style="padding-left:30px; padding-right:30px;"><button class="btn btn-default">Meet the Authors</button></div>
', 0, N'featured_navigation_ecat')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (3, N'<script type="text/javascript" src="../../Components/FileBank/Content/.js/jquery.vticker.min.js"></script><script type="text/javascript">
		jQuery(document).ready(function($){
			$(''#dream_news'').vTicker(''init'', 
			{
				height: 56,
					showItems: 2,
					padding:4});
			$(window).scroll(function(){
				$(''.hideme'').each(function(){
					var bottom = $(this).offset().top + $(this).outerHeight();
					var WindowBottom = $(window).scrollTop() + $(window).height();
					if(WindowBottom > bottom)
					{
						$(this).animate({''opacity'':''1''}, 500);
					}
				});
			});
		});
	</script>
<h3>What You&#39;ll learn in this course</h3>

<ul style="font-size:16px; display: block; list-style: none;">
	<li class="hideme" style="border: 10px solid #e6e6e6; padding:20px; width: 50%; margin:15px 0 15px 0;">Introduction to GRE and History</li>
	<li class="hideme" style="border: 10px solid rgb(242, 255, 210);padding: 20px;width: 50%;margin: 15px 0px 15px 30%;">Total Recall of all the Courses</li>
	<li class="hideme" style="border: 10px solid rgb(127, 173, 162);padding: 20px;width: 50%;margin: 15px 0px 15px 10%;">Exam Pattern</li>
	<li class="hideme" style="border: 10px solid rgb(255, 202, 219);padding: 20px;width: 50%;margin: 15px 0px 15px 25%;">Marking Criteria</li>
	<li class="hideme" style="border: 10px solid rgb(207, 253, 255);padding: 20px;width: 50%;margin: 15px 0px 15px 5%;">Tips on how to be successful in GRE</li>
	<li class="hideme" style="border: 10px solid #e6e6e6; padding:20px; width: 50%; margin:15px 0 15px 0; margin-left: 25%;">Reference from Past Papers</li>
	<li class="hideme" style="border: 10px solid rgb(225, 226, 147);padding: 20px;width: 50%;margin: 15px 0px;">Sample Papers</li>
</ul>
', 0, N'dream_detail_gre')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (4, N'<div class="panel panel-default hideme" style="font-size:16px;"><!-- Default panel contents -->
<div class="panel-heading">Related News</div>
<!-- List group -->

<div class="panel-body">
<div id="dream_news" style="min-height: 56px;">
<ul>
	<li>
	<div class="col-md-12" style="padding:0; background-color: #e6e6e6; margin-top: 5px; margin-bottom: 5px;">
	<div class="col-md-2" style="padding: 0"><img src="/Components/MediaBank/Content/Images/100x100/Picture1.jpg" style="width: 100%;" /></div>

	<div class="col-md-10" style=" height: 53px;"><a href="#" target="_blank">GRE to be held on 28-September, 2016</a></div>
	</div>
	</li>
</ul>
</div>
</div>

<div class="panel-footer"><button class="btn btn-warning">View More</button></div>
</div>
<script src="../../Components/FileBank/Content/.js/jquery.carouFredSel-6.0.4-packed.js" type="text/javascript"></script><script type="text/javascript">
		$(function() {
			$(''#carousel'').carouFredSel({
				items: 1,
				scroll: {
					duration: 2500,
					timeoutDuration: 1500,
					easing: ''elastic''
				}
			});
		});
	</script>

<div class="panel panel-default hideme" style="font-size:16px;"><!-- Default panel contents -->
<div class="panel-heading">Meet The Authors</div>
<!-- List group -->

<div class="panel-body">
<div id="wrapper">
<div id="carousel">
<div id="blue"><img alt="blue_muffin" src="/Components/MediaBank/Content/Images/Original/16_feb-logo.png" style="border-radius: 50px; width: 100px;" />
<h3>Imran</h3>

<p>Assistant Professor</p>
</div>

<div id="pink"><img alt="light_pink_muffin" src="/Components/MediaBank/Content/Images/Original/16_feb-logo.png" style="width: 100px;" />
<h3>Jahanzaib</h3>

<p>Professor</p>
</div>

<div id="white"><img alt="white_muffin" src="/Components/MediaBank/Content/Images/100x100/16_feb-logo.png" style="width: 100px;" />
<h3>Ali</h3>

<p>Director</p>
</div>
</div>
</div>
</div>
</div>
', 0, N'news_ticker_gre')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (5, N'<h3 style="color: #eb8c2e;">Frequently Asked Questions</h3>

<h4>Who Can Take This Course?</h4>

<p>Students who are planning Graduate&nbsp;Studies.</p>
', 0, N'faq_ecat')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (6, N'<h2>Success Stories</h2>

<div class="col-md-12" id="featured_news">
<div class="col-md-3">
<div class="featured_news thumb"><a href="#"><img src="/Components/MediaBank/Content/Images/Original/profile-icon-28.png" /> </a></div>

<div class="news_detail">
<p><a href="#">Success Story: See how Sumaira Shaheen achieved her dreams</a></p>
</div>
</div>

<div class="col-md-3">
<div class="featured_news thumb"><a href="#"><img src="/Components/MediaBank/Content/Images/Original/profile-icon-28.png" /> </a></div>

<div class="news_detail">
<p><a href="#">Success Story: See how Ali&nbsp;achieved his&nbsp;dreams</a></p>
</div>
</div>

<div class="col-md-3">
<div class="featured_news thumb"><a href="#"><img src="/Components/MediaBank/Content/Images/Original/profile-icon-28.png" /> </a></div>

<div class="news_detail">
<p><a href="#">Success Story: See how Asad&nbsp;achieved his dreams</a></p>
</div>
</div>

<div class="col-md-3">
<div class="featured_news thumb"><a href="#"><img src="/Components/MediaBank/Content/Images/Original/profile-icon-28.png" /> </a></div>

<div class="news_detail">
<p><a href="#">Success Story: See how Asim&nbsp;achieved his dreams</a></p>
</div>
</div>
</div>
', 0, N'success_stories_gre')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (7, N'<a href="~/DreamHome.aspx/ECAT/Default" runat="server"><h1>ECAT</h1></a>
<h3>University of Engineering & Technology, Lahore</h3>
', 0, N'ecat_heading')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (8, N'<h1>Today''s Reading</h1>
<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis lorem commodo neque accumsan lacinia eget lacinia felis. Donec dignissim risus ut mi molestie, nec sagittis ipsum ornare. Nam posuere felis at ante interdum, id sagittis velit commodo. Duis ornare, orci eget tristique molestie, ipsum lectus vehicula augue, eu tincidunt mauris orci in urna. Curabitur accumsan vel augue in ullamcorper. Pellentesque in ultricies turpis, quis vehicula diam. Aenean dictum neque quis mollis mollis. Donec nec commodo ante. In hac habitasse platea dictumst.</p>', 0, N'reading_01_ecat')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (9, N'<div class="col-md-3">
<div class="col-md-12" style="background-color: #e6e6e6; padding-bottom: 15px; padding-top: 15px;"><img src="/Components/MediaBank/Content/Images/Original/16_feb-logo.png" style="width:100%; padding:5px;" /></div>
<br />
<a class="btn btn-primary" href="../Components/NAV_General/www.yahoo.com" id="" style="width: 100%;" target="_blank">nav1</a></div>

<div class="col-md-3">
<div class="col-md-12" style="background-color: #e6e6e6; padding-bottom: 15px; padding-top: 15px;"><img src="/Components/MediaBank/Content/Images/Original/lums.png" style="width:100%; padding:5px;" /></div>
<br />
<a class="btn btn-primary" href="../Components/NAV_General/www.yahoo.com" id="" style="width: 100%;" target="_blank">nav1</a></div>

<div class="col-md-3">
<div class="col-md-12" style="background-color: #e6e6e6; padding-bottom: 15px; padding-top: 15px;"><img src="/Components/MediaBank/Content/Images/Original/profile-icon-28.png" style="width:100%; padding:5px;" /></div>
<br />
<a class="btn btn-primary" href="../Components/NAV_General/www.yahoo.com" id="" style="width: 100%;" target="_blank">nav1</a></div>
', 0, N'activity01_ecat')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (10, N'<object height="500" width="500"><param name="movie" value="../../Components/FileBank/Content/.swf/ragdoll_rumble.swf" /><embed height="500" src="../../Components/FileBank/Content/.swf/ragdoll_rumble.swf" width="500"></embed></object>', 0, N'game_ecat')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (11, N'<div class="col-md-3">
<div class="col-md-12" style="background-color: #e6e6e6; padding-bottom: 15px; padding-top: 15px; border-radius: 50%;"><img src="/Components/MediaBank/Content/Images/Original/profile-icon-28.png" style="width:100%; padding:5px;" /></div>
<br />
<a class="btn btn-primary" href="../Components/NAV_General/www.yahoo.com" id="" style="width: 100%;" target="_blank">nav1</a></div>

<div class="col-md-3">
<div class="col-md-12" style="background-color: #e6e6e6; padding-bottom: 15px; padding-top: 15px; border-radius: 50%;"><img src="/Components/MediaBank/Content/Images/Original/profile-icon-28.png" style="width:100%; padding:5px;" /></div>
<br />
<a class="btn btn-primary" href="../Components/NAV_General/www.yahoo.com" id="" style="width: 100%;" target="_blank">nav1</a></div>

<div class="col-md-3">
<div class="col-md-12" style="background-color: #e6e6e6; padding-bottom: 15px; padding-top: 15px; border-radius: 50%;"><img src="/Components/MediaBank/Content/Images/Original/profile-icon-28.png" style="width:100%; padding:5px;" /></div>
<br />
<a class="btn btn-primary" href="../Components/NAV_General/www.yahoo.com" id="" style="width: 100%;" target="_blank">nav1</a></div>
', 0, N'activity03_ecat')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (12, N'<h2>Admin Tutorial for Creating Deams</h2>

<h3 style="text-align:center">Pay attention to the details</h3>
', 0, N'title_admntutorial')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (13, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/Login.pdf" style="width:100%; height:650px;"></iframe>', 0, N'pdf_adminTutorial')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (14, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/MediaBank.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_mediaBank')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (15, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/MediaSelection.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_mediaSelection')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (16, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/Templates.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorials_templates')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (17, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/LayoutCreation.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_layoutcreation')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (18, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/AddingComponents.pdf" style="width:100%; height:650px;"></iframe>', 0, N'adminTutorial_addComponents')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (19, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/Components.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_components')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (20, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/AddNewComponent.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_addNewComponent')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (21, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/ComponentList.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_componentList')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (22, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/FileBank.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_fileBank')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (23, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/IntroAdminPanel.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admin_tutorial_dreamAdminPanel')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (24, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/DreamPages.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_dreampages')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (25, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/PageBuilder.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admin_tutorial_pagebuilder')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (26, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/CreationDefaultDream.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_creationDefaultDream')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (27, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/CreationSampleDream.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_defaultPage')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (28, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/CreationLessonMenu.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_dreamMenu')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (29, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/NewsControlPanel.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_newsAdminPanel')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (30, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/AddNews.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_addNews')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (31, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/EditNews.pdf" style="width:100%; height:650px;"></iframe>', 0, N'admintutorial_editNews')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (32, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, N'text_multimedia_com')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (33, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, N'First_cust')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (34, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, N'second_cust')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (35, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, N'third_cust')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (36, N'<div class="col-md-12 heading_image" style="position:absolute; left:100px; bottom:10px;">
<h1><a href="DreamView.html" style="color:white;">ECAT</a></h1>

<h3 style="color: #eb8c2e; margin-top: 15px;">University of Engineering &amp; Technology, Lahore</h3>
</div>
', 0, N'heading_test')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (37, N'<h1>Sample Dream</h1>
<p>This is my sample dream </p>', 0, N'side_test')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (38, N'<script type="text/javascript">
		jQuery(document).ready(function($){
			$(window).scroll(function(){
				$(''.hideme'').each(function(){
					var bottom = $(this).offset().top + $(this).outerHeight();
					var WindowBottom = $(window).scrollTop() + $(window).height();
					if(WindowBottom > bottom)
					{
						$(this).animate({''opacity'':''1''}, 500);
					}
				});
			});
		});
	</script>
<h3>What You''ll learn in this course</h3>
							<ul style="font-size:16px; display: block; list-style: none;">
								<li class="hideme" style="border: 10px solid #e6e6e6; padding:20px; width: 50%; margin:15px 0 15px 0;">Introduction to ECAT and History</li>
								<li class="hideme" style="border: 10px solid rgb(242, 255, 210);padding: 20px;width: 50%;margin: 15px 0px 15px 30%;">Total Recall of all the Intermediate Courses</li>
								<li class="hideme" style="border: 10px solid rgb(127, 173, 162);padding: 20px;width: 50%;margin: 15px 0px 15px 10%;">Exam Pattern</li>
								<li class="hideme" style="border: 10px solid rgb(255, 202, 219);padding: 20px;width: 50%;margin: 15px 0px 15px 25%;">Marking Criteria</li>
								<li class="hideme" style="border: 10px solid rgb(207, 253, 255);padding: 20px;width: 50%;margin: 15px 0px 15px 5%;">Tips on how to be successful in ECAT</li>
								<li class="hideme" style="border: 10px solid #e6e6e6; padding:20px; width: 50%; margin:15px 0 15px 0; margin-left: 25%;">Reference from Past Papers</li>
								<li class="hideme" style="border: 10px solid rgb(225, 226, 147);padding: 20px;width: 50%;margin: 15px 0px;">Sample Papers</li>
							</ul>
', 0, N'peroperties_sample')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (39, N'<iframe id="pdf" src="../../Components/FileBank/Content/.pdf/MediaBank.pdf" style="width:100%; height:650px;"></iframe>', 0, N'pdf_test')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (42, N'<p align="center" style="margin-left:16.85pt;">Linear Inequalities</p>

<p style="margin-left:.25pt;"><strong>Introduction to Inequalities</strong></p>

<p style="margin-left:.25pt;">&nbsp;</p>

<p style="margin-left:.25pt;">As their name suggests, inequalities are fundamentally different from equations. Inequalities represent a range of values less than or greater than some number or variable!</p>

<p>&nbsp;</p>

<p>Inequalities tell us about the relative sizes and amounts of two objects or variables.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<table cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td height="0">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><img alt="inequality" height="53" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_122_clip_image001.gif" width="339" /></td>
		</tr>
	</tbody>
</table>
<br clear="ALL" />
On the above number line, &lsquo;a&rsquo; is on the left side of &lsquo;b&rsquo; therefore <img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_124_clip_image003.png" width="36" />&nbsp;and since &lsquo;b&rsquo; is on the right side of &lsquo;a&rsquo; therefore &nbsp;<img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_126_clip_image005.png" width="39" />
<p><a href="#_msocom_1" id="_anchor_1" name="_msoanchor_1" uage="JavaScript">[wi1]</a>&nbsp;</p>

<p>The following table lists all the type of inequalities and the symbols used to represent them.</p>

<p>&nbsp;</p>

<table align="center" border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td style="width:211px;height:38px;">
			<p align="center"><strong>Name</strong></p>
			</td>
			<td style="width:211px;height:38px;">
			<p align="center"><strong>Symbol</strong></p>
			</td>
			<td style="width:120px;height:38px;">
			<p align="center"><strong>Example</strong></p>

			<p align="center">&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td style="width:211px;height:20px;">
			<p align="center"><strong>Greater than</strong></p>
			</td>
			<td style="width:211px;height:20px;">
			<p align="center"><img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_128_clip_image007.png" width="11" />&nbsp;</p>
			</td>
			<td style="width:120px;height:20px;">
			<p align="center">7<img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_128_clip_image007.png" width="11" />3</p>
			</td>
		</tr>
		<tr>
			<td style="width:211px;height:20px;">
			<p align="center"><strong>lesser than</strong></p>
			</td>
			<td style="width:211px;height:20px;">
			<p align="center"><img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1210_clip_image009.png" width="11" />&nbsp;</p>
			</td>
			<td style="width:120px;height:20px;">
			<p align="center">2<img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1210_clip_image009.png" width="11" />8</p>
			</td>
		</tr>
		<tr>
			<td style="width:211px;height:26px;">
			<p align="center"><strong>Greater than or equal to</strong></p>
			</td>
			<td style="width:211px;height:26px;">
			<p align="center"><img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1212_clip_image011.png" width="11" /></p>
			</td>
			<td style="width:120px;height:26px;">
			<p align="center">5y<img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1212_clip_image011.png" width="11" />5</p>
			</td>
		</tr>
		<tr>
			<td style="width:211px;height:23px;">
			<p align="center"><strong>lesser than&nbsp; or equal to</strong></p>
			</td>
			<td style="width:211px;height:23px;">
			<p align="center"><img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1214_clip_image013.png" width="11" /></p>
			</td>
			<td style="width:120px;height:23px;">
			<p align="center">3x<img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1214_clip_image013.png" width="11" />4</p>
			</td>
		</tr>
	</tbody>
</table>

<div style="clear:both;">&nbsp;</div>

<p style="margin-left:.25pt;">&nbsp;</p>

<div>
<hr align="left" size="1" width="33%" />
<div>
<div id="_com_1" uage="JavaScript"><a name="_msocom_1"></a>

<p>&nbsp;<a href="#_msoanchor_1">[wi1]</a>Add arrows below to show increasing values and decreasing values just for more visuals</p>

<p>&nbsp;</p>
</div>
</div>
</div>
', 0, N'afsagasdfdfas')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (43, N'<p align="center" style="margin-left:16.85pt;">Linear Inequalities</p>

<p style="margin-left:.25pt;"><strong>Introduction to Inequalities</strong></p>

<p style="margin-left:.25pt;">&nbsp;</p>

<p style="margin-left:.25pt;">As their name suggests, inequalities are fundamentally different from equations. Inequalities represent a range of values less than or greater than some number or variable!</p>

<p>&nbsp;</p>

<p>Inequalities tell us about the relative sizes and amounts of two objects or variables.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<table cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td height="0">&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><img alt="inequality" height="53" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_122_clip_image001.gif" width="339" /></td>
		</tr>
	</tbody>
</table>
<br clear="ALL" />
On the above number line, &lsquo;a&rsquo; is on the left side of &lsquo;b&rsquo; therefore <img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_124_clip_image003.png" width="36" />&nbsp;and since &lsquo;b&rsquo; is on the right side of &lsquo;a&rsquo; therefore &nbsp;<img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_126_clip_image005.png" width="39" />
<p><a href="#_msocom_1" id="_anchor_1" name="_msoanchor_1" uage="JavaScript">[wi1]</a>&nbsp;</p>

<p>The following table lists all the type of inequalities and the symbols used to represent them.</p>

<p>&nbsp;</p>

<table align="center" border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td style="width:211px;height:38px;">
			<p align="center"><strong>Name</strong></p>
			</td>
			<td style="width:211px;height:38px;">
			<p align="center"><strong>Symbol</strong></p>
			</td>
			<td style="width:120px;height:38px;">
			<p align="center"><strong>Example</strong></p>

			<p align="center">&nbsp;</p>
			</td>
		</tr>
		<tr>
			<td style="width:211px;height:20px;">
			<p align="center"><strong>Greater than</strong></p>
			</td>
			<td style="width:211px;height:20px;">
			<p align="center"><img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_128_clip_image007.png" width="11" />&nbsp;</p>
			</td>
			<td style="width:120px;height:20px;">
			<p align="center">7<img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_128_clip_image007.png" width="11" />3</p>
			</td>
		</tr>
		<tr>
			<td style="width:211px;height:20px;">
			<p align="center"><strong>lesser than</strong></p>
			</td>
			<td style="width:211px;height:20px;">
			<p align="center"><img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1210_clip_image009.png" width="11" />&nbsp;</p>
			</td>
			<td style="width:120px;height:20px;">
			<p align="center">2<img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1210_clip_image009.png" width="11" />8</p>
			</td>
		</tr>
		<tr>
			<td style="width:211px;height:26px;">
			<p align="center"><strong>Greater than or equal to</strong></p>
			</td>
			<td style="width:211px;height:26px;">
			<p align="center"><img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1212_clip_image011.png" width="11" /></p>
			</td>
			<td style="width:120px;height:26px;">
			<p align="center">5y<img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1212_clip_image011.png" width="11" />5</p>
			</td>
		</tr>
		<tr>
			<td style="width:211px;height:23px;">
			<p align="center"><strong>lesser than&nbsp; or equal to</strong></p>
			</td>
			<td style="width:211px;height:23px;">
			<p align="center"><img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1214_clip_image013.png" width="11" /></p>
			</td>
			<td style="width:120px;height:23px;">
			<p align="center">3x<img height="20" src="../../Components/FileBank/Content/Inline_Images/2017_01_10_11_24_1214_clip_image013.png" width="11" />4</p>
			</td>
		</tr>
	</tbody>
</table>

<div style="clear:both;">&nbsp;</div>

<p style="margin-left:.25pt;">&nbsp;</p>

<div>
<hr align="left" size="1" width="33%" />
<div>
<div id="_com_1" uage="JavaScript"><a name="_msocom_1"></a>

<p>&nbsp;<a href="#_msoanchor_1">[wi1]</a>Add arrows below to show increasing values and decreasing values just for more visuals</p>

<p>&nbsp;</p>
</div>
</div>
</div>
', 0, N'gasseerf')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (46, N'<a href="../Physics/Video1?FID=42">This is my textarea to be replaced Editor.</a>', 0, N'wraefsddFD')
SET IDENTITY_INSERT [dbo].[TextBank] OFF
SET IDENTITY_INSERT [dbo].[TransPort] ON 

INSERT [dbo].[TransPort] ([id], [Name]) VALUES (1, N'Lemosine')
SET IDENTITY_INSERT [dbo].[TransPort] OFF
SET IDENTITY_INSERT [dbo].[UserHintStatus] ON 

INSERT [dbo].[UserHintStatus] ([id], [QuestionID], [Page], [UserID], [HintOption], [HintMarks]) VALUES (11, 4, 80, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'Normal', CAST(50.00 AS Decimal(18, 2)))
INSERT [dbo].[UserHintStatus] ([id], [QuestionID], [Page], [UserID], [HintOption], [HintMarks]) VALUES (12, 4, 79, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'Zero', CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[UserHintStatus] ([id], [QuestionID], [Page], [UserID], [HintOption], [HintMarks]) VALUES (13, 5, 80, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'Normal', CAST(50.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[UserHintStatus] OFF
SET IDENTITY_INSERT [dbo].[UserLessonProgress] ON 

INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (32, 60, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', CAST(99.999 AS Decimal(18, 3)))
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (33, 61, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', CAST(83.330 AS Decimal(18, 3)))
SET IDENTITY_INSERT [dbo].[UserLessonProgress] OFF
SET IDENTITY_INSERT [dbo].[UserQuizStatus] ON 

INSERT [dbo].[UserQuizStatus] ([id], [QuizID], [QuestionID], [QuestionStatus], [UserID], [Page]) VALUES (261, 1, 4, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 80)
INSERT [dbo].[UserQuizStatus] ([id], [QuizID], [QuestionID], [QuestionStatus], [UserID], [Page]) VALUES (262, 1, 5, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 80)
SET IDENTITY_INSERT [dbo].[UserQuizStatus] OFF
SET IDENTITY_INSERT [dbo].[UserResponse] ON 

INSERT [dbo].[UserResponse] ([id], [QuestionID], [UserID], [Page], [UserPerformance], [UserReply], [quizID], [AwardedMarks]) VALUES (190, 4, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 80, 1, N'127', 1, CAST(33.33 AS Decimal(18, 2)))
INSERT [dbo].[UserResponse] ([id], [QuestionID], [UserID], [Page], [UserPerformance], [UserReply], [quizID], [AwardedMarks]) VALUES (191, 5, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 80, 1, N'None of these', 1, CAST(50.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[UserResponse] OFF
SET IDENTITY_INSERT [dbo].[VideoTranscript] ON 

INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (1, 38, CAST(1.00 AS Decimal(18, 2)), N'Contrary to popular belief')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (2, 38, CAST(2.00 AS Decimal(18, 2)), N'Lorem Ipsum is not simply random text')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (3, 40, CAST(1.00 AS Decimal(18, 2)), N'There are many variations of passages')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (4, 40, CAST(2.00 AS Decimal(18, 2)), N'Lorem Ipsum available, ')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (5, 40, CAST(3.00 AS Decimal(18, 2)), N'but the majority have suffered')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (6, 40, CAST(4.00 AS Decimal(18, 2)), N'alteration in some form,')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (7, 40, CAST(4.00 AS Decimal(18, 2)), N'by injected humour,')
SET IDENTITY_INSERT [dbo].[VideoTranscript] OFF
SET IDENTITY_INSERT [dbo].[VisaPackages] ON 

INSERT [dbo].[VisaPackages] ([id], [visaTitle], [amount], [issueDate], [expireDate], [AspNetUserID]) VALUES (1, N'Ramzan', 12000, CAST(N'2017-01-17' AS Date), CAST(N'2017-01-31' AS Date), N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
SET IDENTITY_INSERT [dbo].[VisaPackages] OFF
SET IDENTITY_INSERT [dbo].[Ziarat] ON 

INSERT [dbo].[Ziarat] ([id], [text]) VALUES (1, N'pkg2')
INSERT [dbo].[Ziarat] ([id], [text]) VALUES (2, N'pkg2')
SET IDENTITY_INSERT [dbo].[Ziarat] OFF
/****** Object:  Index [UQ__LessonMe__C99ED251146E34D9]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED25119B6DD1A]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED2512ED1F8B5]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED2513AF31001]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED2514286007D]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED25147DC3544]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED25159FC8F5D]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED2515CA6709D]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED2516CCC61B6]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED25182E8A119]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED25187196270]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED2519D2B455C]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED251A31AB06F]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED251AEC43183]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED251C8F2BCC2]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED251D32ABDC3]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED251E01AC2AC]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__LessonMe__C99ED251E76C1044]    Script Date: 2/21/2017 9:44:06 AM ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD UNIQUE NONCLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CustomPackage] ADD  CONSTRAINT [DF_CustomPackage_returnAirLineID]  DEFAULT ((1)) FOR [returnAirLineID]
GO
ALTER TABLE [dbo].[Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_Accommodation_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[Accommodation] CHECK CONSTRAINT [FK_Accommodation_Hotel]
GO
ALTER TABLE [dbo].[AirLine]  WITH CHECK ADD FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD FOREIGN KEY([AccomMakkahID])
REFERENCES [dbo].[Accommodation] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD FOREIGN KEY([AccomMadinaID])
REFERENCES [dbo].[Accommodation] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD  CONSTRAINT [FK_AlharmainUserPackage_AlharmainUser1] FOREIGN KEY([userID])
REFERENCES [dbo].[AlharmainUser] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage] CHECK CONSTRAINT [FK_AlharmainUserPackage_AlharmainUser1]
GO
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD  CONSTRAINT [FK_AlharmainUserPackage_DiscountPackage] FOREIGN KEY([discountID])
REFERENCES [dbo].[DiscountPackage] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage] CHECK CONSTRAINT [FK_AlharmainUserPackage_DiscountPackage]
GO
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD  CONSTRAINT [FK_AlharmainUserPackage_PackageDetail] FOREIGN KEY([packageDetailID])
REFERENCES [dbo].[PackageDetail] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage] CHECK CONSTRAINT [FK_AlharmainUserPackage_PackageDetail]
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
ALTER TABLE [dbo].[AssignmentBank]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[AssignmentCategories] ([id])
GO
ALTER TABLE [dbo].[AssignmentBank]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[AssignmentCategories] ([id])
GO
ALTER TABLE [dbo].[AssignmentBank]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[AssignmentCategories] ([id])
GO
ALTER TABLE [dbo].[AssignmentResponse]  WITH CHECK ADD FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
ALTER TABLE [dbo].[AssignmentResponse]  WITH CHECK ADD FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
ALTER TABLE [dbo].[AssignmentResponse]  WITH CHECK ADD FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
ALTER TABLE [dbo].[ChatAdmin]  WITH CHECK ADD  CONSTRAINT [FK_ChatAdmin_DreamLayouts] FOREIGN KEY([layoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[ChatAdmin] CHECK CONSTRAINT [FK_ChatAdmin_DreamLayouts]
GO
ALTER TABLE [dbo].[ClientPage]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[ClientPage]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[ClientPage]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([IconURL])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([IconURL])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([IconURL])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Accommodation] FOREIGN KEY([roomMakkahID])
REFERENCES [dbo].[Accommodation] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Accommodation]
GO
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Accommodation1] FOREIGN KEY([roomMadinaID])
REFERENCES [dbo].[Accommodation] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Accommodation1]
GO
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_AirLine] FOREIGN KEY([returnAirLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_AirLine]
GO
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_AirLine1] FOREIGN KEY([departureAirLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_AirLine1]
GO
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Flight] FOREIGN KEY([depFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Flight]
GO
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Flight1] FOREIGN KEY([retFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Flight1]
GO
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Hotel] FOREIGN KEY([hotelMakkahID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Hotel]
GO
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Hotel1] FOREIGN KEY([hotelMadinaID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Hotel1]
GO
ALTER TABLE [dbo].[DiscountPackage]  WITH CHECK ADD  CONSTRAINT [FK_DiscountPackage_PackageDetail] FOREIGN KEY([packageDetailID])
REFERENCES [dbo].[PackageDetail] ([id])
GO
ALTER TABLE [dbo].[DiscountPackage] CHECK CONSTRAINT [FK_DiscountPackage_PackageDetail]
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
ON DELETE CASCADE
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
ALTER TABLE [dbo].[DreamPageAuthorization]  WITH CHECK ADD  CONSTRAINT [FK__DreamPage__Dream__1CBC4616] FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamPageAuthorization] CHECK CONSTRAINT [FK__DreamPage__Dream__1CBC4616]
GO
ALTER TABLE [dbo].[DreamPageControls]  WITH CHECK ADD FOREIGN KEY([Component_ID])
REFERENCES [dbo].[Controls] ([id])
GO
ALTER TABLE [dbo].[DreamPageControls]  WITH CHECK ADD FOREIGN KEY([Component_ID])
REFERENCES [dbo].[Controls] ([id])
GO
ALTER TABLE [dbo].[DreamPageControls]  WITH CHECK ADD FOREIGN KEY([Component_ID])
REFERENCES [dbo].[Controls] ([id])
GO
ALTER TABLE [dbo].[DreamPageControls]  WITH CHECK ADD  CONSTRAINT [FK__DreamPage__Layou__54CB950F] FOREIGN KEY([Layout_ID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamPageControls] CHECK CONSTRAINT [FK__DreamPage__Layou__54CB950F]
GO
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
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
ALTER TABLE [dbo].[FIBOptions]  WITH CHECK ADD  CONSTRAINT [FK__FIBOption__Quest__2B0A656D] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[FIBOptions] CHECK CONSTRAINT [FK__FIBOption__Quest__2B0A656D]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([FileCategory_ID])
REFERENCES [dbo].[FileCategories] ([id])
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([FileCategory_ID])
REFERENCES [dbo].[FileCategories] ([id])
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([FileCategory_ID])
REFERENCES [dbo].[FileCategories] ([id])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_AirLine] FOREIGN KEY([airLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_AirLine]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_MediaItems]
GO
ALTER TABLE [dbo].[HotelFacility]  WITH CHECK ADD  CONSTRAINT [FK_HotelFacility_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelFacility] CHECK CONSTRAINT [FK_HotelFacility_Hotel]
GO
ALTER TABLE [dbo].[HotelFacility]  WITH CHECK ADD  CONSTRAINT [FK_HotelFacility_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[HotelFacility] CHECK CONSTRAINT [FK_HotelFacility_MediaItems]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_MediaItems]
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
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD FOREIGN KEY([Assignment_id])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD FOREIGN KEY([Assignment_id])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD FOREIGN KEY([Assignment_id])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD  CONSTRAINT [FK__LessonAss__Layou__30C33EC3] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonAssignments] CHECK CONSTRAINT [FK__LessonAss__Layou__30C33EC3]
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
ALTER TABLE [dbo].[LessonMenuPreRequisite]  WITH CHECK ADD  CONSTRAINT [FK__LessonMen__menu___2704CA5F] FOREIGN KEY([menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenuPreRequisite] CHECK CONSTRAINT [FK__LessonMen__menu___2704CA5F]
GO
ALTER TABLE [dbo].[LessonMenuPreRequisite]  WITH CHECK ADD  CONSTRAINT [FK__LessonMen__pre_r__2610A626] FOREIGN KEY([pre_req_menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenuPreRequisite] CHECK CONSTRAINT [FK__LessonMen__pre_r__2610A626]
GO
ALTER TABLE [dbo].[LessonMultimedia]  WITH CHECK ADD  CONSTRAINT [FK__LessonMul__Layou__4589517F] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonMultimedia] CHECK CONSTRAINT [FK__LessonMul__Layou__4589517F]
GO
ALTER TABLE [dbo].[LessonMultimedia]  WITH CHECK ADD FOREIGN KEY([MultimediaID])
REFERENCES [dbo].[Multimediabank] ([id])
GO
ALTER TABLE [dbo].[LessonMultimedia]  WITH CHECK ADD FOREIGN KEY([MultimediaID])
REFERENCES [dbo].[Multimediabank] ([id])
GO
ALTER TABLE [dbo].[LessonMultimedia]  WITH CHECK ADD FOREIGN KEY([MultimediaID])
REFERENCES [dbo].[Multimediabank] ([id])
GO
ALTER TABLE [dbo].[LessonProgressControl]  WITH CHECK ADD  CONSTRAINT [FK__LessonPro__Layou__5C6CB6D7] FOREIGN KEY([OriginalLayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonProgressControl] CHECK CONSTRAINT [FK__LessonPro__Layou__5C6CB6D7]
GO
ALTER TABLE [dbo].[LessonProgressControl]  WITH CHECK ADD  CONSTRAINT [FK__LessonPro__MenuI__5B78929E] FOREIGN KEY([MenuID])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonProgressControl] CHECK CONSTRAINT [FK__LessonPro__MenuI__5B78929E]
GO
ALTER TABLE [dbo].[LessonProgressDashBoard]  WITH CHECK ADD  CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonProgressDashBoard] CHECK CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts]
GO
ALTER TABLE [dbo].[LessonQuestion]  WITH CHECK ADD  CONSTRAINT [FK__LessonQue__Layou__4B7734FF] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonQuestion] CHECK CONSTRAINT [FK__LessonQue__Layou__4B7734FF]
GO
ALTER TABLE [dbo].[LessonQuestion]  WITH CHECK ADD  CONSTRAINT [FK__LessonQue__Quest__3587F3E0] FOREIGN KEY([Question_id])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[LessonQuestion] CHECK CONSTRAINT [FK__LessonQue__Quest__3587F3E0]
GO
ALTER TABLE [dbo].[LessonQuiz]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
ALTER TABLE [dbo].[LessonQuiz]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
ALTER TABLE [dbo].[LessonQuiz]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
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
ALTER TABLE [dbo].[MultiFIBComponents]  WITH CHECK ADD  CONSTRAINT [FK__MultiFIBC__Quest__0169315C] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[MultiFIBComponents] CHECK CONSTRAINT [FK__MultiFIBC__Quest__0169315C]
GO
ALTER TABLE [dbo].[MultiFIBMarkup]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[MultiFIBMarkup]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[MultiFIBMarkup]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_DreamLayoutsnew] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
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
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_MediaItems]
GO
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Dreams] FOREIGN KEY([dreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Dreams]
GO
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Flight] FOREIGN KEY([returnFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Flight]
GO
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Flight1] FOREIGN KEY([departureFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Flight1]
GO
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_HotelMadina] FOREIGN KEY([hotelIDMadina])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_HotelMadina]
GO
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_HotelMakkah] FOREIGN KEY([hotelIDMakkah])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_HotelMakkah]
GO
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_TransPort] FOREIGN KEY([transportID])
REFERENCES [dbo].[TransPort] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_TransPort]
GO
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_VisaPackages] FOREIGN KEY([visaID])
REFERENCES [dbo].[VisaPackages] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_VisaPackages]
GO
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Ziarat] FOREIGN KEY([ziaratID])
REFERENCES [dbo].[Ziarat] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Ziarat]
GO
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK__QuestionB__Categ__42E1EEFE] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[QuestionCategories] ([id])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK__QuestionB__Categ__42E1EEFE]
GO
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK__QuestionB__SubCa__43D61337] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[QuestionSubCategories] ([id])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK__QuestionB__SubCa__43D61337]
GO
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK__QuestionB__TypeI__44CA3770] FOREIGN KEY([TypeID])
REFERENCES [dbo].[QuestionType] ([id])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK__QuestionB__TypeI__44CA3770]
GO
ALTER TABLE [dbo].[QuestionHints]  WITH CHECK ADD  CONSTRAINT [FK__QuestionH__Quest__436BFEE3] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[QuestionHints] CHECK CONSTRAINT [FK__QuestionH__Quest__436BFEE3]
GO
ALTER TABLE [dbo].[QuestionSubCategories]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[QuestionCategories] ([id])
GO
ALTER TABLE [dbo].[QuestionSubCategories]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[QuestionCategories] ([id])
GO
ALTER TABLE [dbo].[QuestionSubCategories]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[QuestionCategories] ([id])
GO
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[QuizCategories] ([id])
GO
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[QuizCategories] ([id])
GO
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[QuizCategories] ([id])
GO
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([MediaItemID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([MediaItemID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([MediaItemID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[QuizBankQuestions]  WITH CHECK ADD  CONSTRAINT [FK__QuizBankQ__Quest__489AC854] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[QuizBankQuestions] CHECK CONSTRAINT [FK__QuizBankQ__Quest__489AC854]
GO
ALTER TABLE [dbo].[QuizBankQuestions]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
ALTER TABLE [dbo].[QuizBankQuestions]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
ALTER TABLE [dbo].[QuizBankQuestions]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
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
ALTER TABLE [dbo].[UserHintStatus]  WITH CHECK ADD  CONSTRAINT [FK__UserHintS__Quest__30592A6F] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[UserHintStatus] CHECK CONSTRAINT [FK__UserHintS__Quest__30592A6F]
GO
ALTER TABLE [dbo].[UserHintStatus]  WITH CHECK ADD  CONSTRAINT [FK__UserHintSt__Page__314D4EA8] FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[UserHintStatus] CHECK CONSTRAINT [FK__UserHintSt__Page__314D4EA8]
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
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD  CONSTRAINT [FK__UserQuizS__Quest__4E53A1AA] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[UserQuizStatus] CHECK CONSTRAINT [FK__UserQuizS__Quest__4E53A1AA]
GO
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD  CONSTRAINT [FK__UserQuizSt__Page__29E1370A] FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserQuizStatus] CHECK CONSTRAINT [FK__UserQuizSt__Page__29E1370A]
GO
ALTER TABLE [dbo].[UserResponse]  WITH CHECK ADD  CONSTRAINT [FK__UserRespo__Quest__51300E55] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[UserResponse] CHECK CONSTRAINT [FK__UserRespo__Quest__51300E55]
GO
ALTER TABLE [dbo].[UserResponse]  WITH CHECK ADD  CONSTRAINT [FK__UserRespon__Page__46B27FE2] FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserResponse] CHECK CONSTRAINT [FK__UserRespon__Page__46B27FE2]
GO
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[VisaPackages]  WITH CHECK ADD FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'possible values are: video, audio, image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MediaItems', @level2type=N'COLUMN',@level2name=N'mediaType'
GO
USE [master]
GO
ALTER DATABASE [DreamBird] SET  READ_WRITE 
GO
