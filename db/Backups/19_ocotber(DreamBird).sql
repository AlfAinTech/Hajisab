USE [master]
GO
/****** Object:  Database [DreamBird]    Script Date: 10/19/2016 14:58:14 ******/
CREATE DATABASE [DreamBird] ON  PRIMARY 
( NAME = N'DreamBird', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DreamBird.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DreamBird_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DreamBird_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DreamBird] SET COMPATIBILITY_LEVEL = 100
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
ALTER DATABASE [DreamBird] SET AUTO_CREATE_STATISTICS ON
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
ALTER DATABASE [DreamBird] SET  READ_WRITE
GO
ALTER DATABASE [DreamBird] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DreamBird] SET  MULTI_USER
GO
ALTER DATABASE [DreamBird] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DreamBird] SET DB_CHAINING OFF
GO
USE [DreamBird]
GO
/****** Object:  Table [dbo].[ControlCategory]    Script Date: 10/19/2016 14:58:16 ******/
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
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (1, N'DreamControls', N'None')
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (3, N'Dynamic', N'None')
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (4, N'Animated', N'None')
SET IDENTITY_INSERT [dbo].[ControlCategory] OFF
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/19/2016 14:58:16 ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0b17386b-3283-40bc-9013-b9b21041b700', NULL, 0, N'AD+4qjpCHN5obgjqbPTqjoVr4ZW1VNwZndJZiEw86wAsDjUdvQ+jZbcVhOEEAe2YGA==', N'6e5796eb-f945-4e42-9c9c-538ff1ee2eec', NULL, 0, 0, NULL, 0, 0, N'jojo3')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'12c7f563-1599-410b-8114-f0543a68de42', NULL, 0, N'ALU+O0VP4qAgXxtMf/rKUcX/MCo9H+QssBE1pxZY+h5khM0ZdpiVRI32ucHVMOYwwQ==', N'28652e6a-9a09-41ec-8d45-b091998f397f', NULL, 0, 0, NULL, 0, 0, N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3254a27a-1a30-475c-95a3-373f8ef3ba84', N'201150cs@gmail.com', 0, N'AOEhB+o6i5b5pNKKHxYk2bbX+8STdSQHSUw4pHjKQv3R6UqBLebAYFEmSDum8Ropkg==', N'eb5162fd-b7a5-480b-b992-f3775480bdf4', NULL, 0, 0, NULL, 0, 0, N'saba23akmal')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'734b7dd7-5c1e-4d17-a09f-f730a1f2f836', NULL, 0, N'AM3K9aXixepMaUqb+Nv/ZTFHJJ/Yg1dRTFczn9Kbi2Mo3Uk5TysoJoi2GTl8B7Vh3g==', N'2b3965be-c11b-4e53-bc97-f198d9531c2a', NULL, 0, 0, NULL, 0, 0, N'ali')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8d594b8d-1965-455e-96ed-871730ecfd0e', NULL, 0, N'ADKtjMEnlSOPpQLNc0N1zm3DLaXu+oeFE/qyV1pwQw8zu25aUGUcwCi3v7o0NBrzvw==', N'a4b3c5c4-a3ae-4a67-8512-dc1872374ad3', NULL, 0, 0, NULL, 0, 0, N'fatima')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9025c418-b3e7-40a1-8645-6e3d218d1057', N'201150cs@gmail.com', 0, N'AJ09kE4OhhzzEp5ggmmGwRGtSVGaVatZFHWrbXm6lopuzC1HbnwWI1KaY3yKxrMx1A==', N'9d9e3fbb-2dfe-46b4-a2c1-79644d0a584d', NULL, 0, 0, NULL, 0, 0, N'abc')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a22dacf2-2c06-43c6-9532-aa4d2f933f50', N'dreambirdapp@outlook.com', 0, NULL, N'120c8212-7226-4996-b0d0-caac6fce6ece', NULL, 0, 0, NULL, 0, 0, N'DogarBrothers')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c15db4c0-af50-45f7-be19-ec57aabf949a', NULL, 0, N'AMlKD2V2tOD85oRMA14cldFAwwvfzEZ+ccopO1mt/FH3zoQ2DzjnbrxvJ294fIJf7g==', N'e9d66652-757c-4819-ba6a-817880c57d9b', NULL, 0, 0, NULL, 0, 0, N'rabia')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd1e30fbd-d40b-4a32-8cd5-1294df51c620', NULL, 0, N'ALhTckEyGHseiC4QWxu4Gsf17GCxGn7A1VW6RuCG+ivpBBmOvhQ4NJalDhsvqdCe4Q==', N'29fa48e3-4e74-41de-96d6-53e590ae3c77', NULL, 0, 0, NULL, 0, 0, N'jojo')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd5ba58f6-addd-4781-9a0f-5595ef5a4413', N'dreambirdapp@gmail.com', 0, N'ADLtsG36pLGHLZ7396RQ/CWlYcktmv2U6EAVcsuEj9B4crGpWc1A5AKm2Zd26D/xQw==', N'0fb5de13-604e-4008-a168-999d81cea5a5', NULL, 0, 0, NULL, 0, 0, N'jojo2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'df411e14-5ad3-4ff9-b9c8-ef221168aa71', N'saba.akmal@kics.edu.pk', 0, NULL, N'09953cbf-76f9-4575-a0d3-272313cfa6d8', NULL, 0, 0, NULL, 0, 0, N'SabaKics')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e42107bf-0c2e-4f48-a720-ce64736cd393', NULL, 0, N'AF2e7WPM3dGvL833MLVTNXtcc5Y6t7lgN4gP92UIDtAwLdMECOtpgIq9cAMOnqN5Ag==', N'93876401-a105-4ae6-8863-5bc939379fb7', NULL, 0, 0, NULL, 0, 0, N'jojo1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fbdacf86-f076-4ac0-a052-dea653bdb788', NULL, 0, N'AJHXI2Vi9x1bw7agcv/2w/jRQlhvb70ayIZYX3k2DUIPsqHGnGqKEd29BgpDXRqMxw==', N'a3b033fa-5ba2-49d6-9f00-58df3537fcaf', NULL, 0, 0, NULL, 0, 0, N'hareem')
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/19/2016 14:58:16 ******/
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
/****** Object:  Table [dbo].[AdminsettingsNewsFeed]    Script Date: 10/19/2016 14:58:16 ******/
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
SET IDENTITY_INSERT [dbo].[AdminsettingsNewsFeed] ON
INSERT [dbo].[AdminsettingsNewsFeed] ([is_horizontal], [is_featured_news], [id]) VALUES (0, 0, 1)
SET IDENTITY_INSERT [dbo].[AdminsettingsNewsFeed] OFF
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/19/2016 14:58:16 ******/
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
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201608150452124_InitialCreate', N'DreamBird.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C468EFC2D3B63746C6174C7B167933D812BB2D8C446929CA6B23C897E5219F945F4851A26EBCE8D22D77B7170B2CA6C5E2A962B148164B47FEDF7FFE3BFDE9250CAC674C133F2267F6D1E4D0B6307123CF27AB333B65CB1F3ED93FFDF8C73F4C2FBDF0C5FAA5903BE172D0932467F61363F1A9E324EE130E5132097D974649B46413370A1DE445CEF1E1E1DF9CA3230703840D589635FD9A12E68738FB013F67117171CC5214DC441E0E12F11C5AE619AA758B429CC4C8C567F605C528FCEC53CFB6CE031F8101731C2C6D0B111231C4C0BCD36F099E331A91D53C86072878788D31C82D51906061F66925DE770487C77C044ED5B18072D38445E140C0A313E11247EEBE9663EDD265E0B44B702E7BE5A3CE1C77665F7B387BF4350AC001B2C2D35940B9F0997D53AA384FE25BCC2645C7490E794501EEB7887E9FD4110FACDEFD0ECA103A9E1CF2FF0EAC591AB094E233825346517060DDA78BC077FF815F1FA2EF989C9D1C2D96279F3E7C44DEC9C7BFE2930FF591C25841AEF1001EDDD328C6146CC3CB72FCB6E534FB3972C7B25BAD4FEE158825580DB675835EBE60B2624FB04E8E3FD9D695FF82BDE28908AE6FC487C5039D184DE1E76D1A046811E0B2DD69D5C9FFDFA2F5F8C3C751B4DEA2677F954DBDA41F160E4D6CEB2B0EB2D6E4C98FF3E5D598EF47217645A390FF6EC657DEFA388F52EAF2C14446910744579835AD9B3A55F0F60A690E357E5817A8FB1FDADC5235BCB5A27C40EBAC8442C5B6574361EFDBEAED1D71E7710C93978516F7485BC09567D444EA7460C183C719D836395E78CFA9F74CABB839EC1B3704C6F37BDE062F43E40723EC833DB440E6B1F46988CB517E8E20EA10196CF33D4A12D806BCBFA3E4A9C574F8E708A6CFB19B5288CE394361FCE6DAEE9F22826FD370C1837E7BBA469B9A87DFA22BE4B2885E12DE6B63BC2F91FB3D4AD925F12E10C3DF985B00F29F0F7ED81F601473CE5D1727C9150433F6661124D605E0356127C783E1F836B5EB3C6416203FD42722D286FA588856C9885E4249480C62BAA4A4CDD42FD1CA27FD4C2D44CDA6E6129DA60AB1A1A672B07E960A49B3A19940A79DB9D468695E3643E3E77919ECFE277A9B1DDEA6BDA0E6C639EC90F8674C30856DCCBB478C614AAA19E8B36FEC2259C8A68F2B7DF3B329D3F40B0AD2B155ADB51AB24D60FCD590C1EEFF6AC8CC84C7CFBEC7B3921EB79F4218E07BC9EB2F56DD6B4EB26CDBCBA131CC6D2BDFCE1E605A2EE74912B97EB60A34752F51B568DA0F399CD55DC2C847239741606010E83E3FF2E0098CCD9683EA8E5CE000336C9DBB795D7086121779AA1B6140DE00C38A13556358550E691AF7174527443AA6BC13E297A00456AA4F98BA2C7CE2FA310A3ABD24F5EC7984F1B1973AE4960B1C63C215767AA28F727DF5831B50EA9126A5CB4353A71671ED8168C85A4D73DE95C256F3AE1425B612931DB9B3212E45FEF62681D9EEB12D0467BB4BFA1860ACE4ED2240C55DA56F00C817977D0B50E9C664085091526D25409B1EDB4180365DF2EE0234BFA2F69D7FE9BEBA6FE1D9BC286FFF586F75D70E62B3E18F3D0BCD3CF7843E0C7A60AA86E7C58237E217A6B99C819DE27E968854570E110E3EC7AC59B2A9F25D6D1EEAB483C841D40658055A07A87807A800290B6A8071452DAFD53A91450C802DEA6EADB062EF97606B31A062D7DF85D604CD6F4CE5E0EC75FB284756468312E4BD2E0B351C4D40C89B5773E03D9C62AACBAA8EE9930B0FC9866B031393D1E2A08ECCD5E0A46230A37BA908CD6E2FE912B22129D9465E92D22783978AC18CEE2511A3DD4ED2240503D2828D5CD43CC2475A6C45A5A33C6DCAB6A99333A3C483A963A0504D6F501CFB6455A3548927D63CE753CD7E980F671C853986E3261AE251696DA9894514ADB0D40AAAC1D22B9F26EC0231B440BCCE33F342454C7BB61AB6FF4265FDF85427B138070A69FEEFBC47F5E6BE71C4AA3988E87A05030B79229355CF35D3AEEF6E71661B0A10D514EC67519086C49C57997BE7AFEDEAFDF3272AC2D491EC57F226C5494A76DBF478AFF950D7C2667353662BEBCF8F19C2E4E522D7ACFBD9947F9A518A72541DC554A2DAD97C99D2963E73242782C3A7A813E16D5691609FD401C4A3811835028302566BEB8FDAE498D4319B2DFD112522491D526A1A60659D2ED230B2DEB0169EC1A37A89FE1A5482481D5D6DED8FACA18AD4A135CD6B606B6C96DBFAA36AD82475604D737FEC8A5A22EF9D7B7C4E19AF27430FAAFCE2BAD94965C0789B8D709C83AEF67EBE0E547B3C104BBC8157C0C4F3BD0C22E3ED6D6810E5658ACD82C88061DE671A2FB49BDB4CEB5B783366E32D75632B6F7B4B6FC61B16AA6F1A10CA9D4D1629B5977737E98E3615F7A5EE6F61940B542E625B851BE1187F4D180E275C6032FF3598053EE69B7621708388BFC409CB991936DCEF3E49DFD5ECCF372E4E927881E6BE69FAD0A539675B2059916744DD274455CAC306DF8154A04A35F99A78F8E5CCFE57D6EB342B4CF07F658F0FACEBE41BF17F4DA1E181A6D8FAB74AE11C8717DF7E93DAD3AF18FA7BF5FA9F8F79D703EB8EC28A39B50E255FAE33C3CD6F1B06599377DDC09AB5BF7878BF0BAAF1458116555A10EB7F40B0F0D9281F0F1456FE29442F7F1E6A9AF603818D10351F018C85378A0B4D24FF75B08C047F0F7EB28CE03F6CB07AC2FF3AA619C9FE3E190E2653FDFB6F4345CF1D1E359AABD036B6A4CCCF9D54E98D7893BB3E9B1446F5460B5D654D0F80DB8019BD4664BC3352F168A7A386333C1AF62E43FBCD89C2FBC20DAE581BBBA5046F9305DCF2EEE77745FEDD03BA9A867EB37B8AEFB663CD54BEDD739EE43022EF9E059B2065ED9EAEBBED60339579F73CD8069172F72CD676757EEE38D27A1FA13BA7D8AA6C21C36B185D2DB88B429B17CEE186BF882008F28C32FFF251CFD96AE39B7628AC44CC4ACD643159B1B27014BD8A44BBDA616315077EEB60854CBB5A03C5B24DB7D8FF5B750B9976DD06E2E22EC8BF5AEAA08E90DDB18FB5319DDE13D9B731920E6E7957CEDAFA4EFD3D717B47714A63F518DE11BF1F2AEF282E1973E90CA0EEAAAF7BE1ECACFD814438BF137F5541F03F9748B0DB38354B996BB28C8AC35BB2A810912A343798210F8ED473CAFC25721934F31A73F6E97656B7E36F3A16D8BB2677298B530643C6E1226814BC7812D0A63FE327376D9EDEC5D95F2119630860A6CF6BF377E473EA075E69F795A6266480E0D985A8E8F2B964BCB2BB7A2D916E23D21348B8AF4C8A1E7018070096DC91397AC6EBD806E1F705AF90FB5A55004D20DD13D174FBF4C2472B8AC2446054FDE127C4B017BEFCF87F4199151527540000, N'6.1.3-40302')
/****** Object:  Table [dbo].[DynamicLayouts]    Script Date: 10/19/2016 14:58:16 ******/
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
SET IDENTITY_INSERT [dbo].[DynamicLayouts] ON
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (1, N'Layout 1', 1, 1, N'3:9')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (2, N'Layout 2', 1, 1, N'6:6')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (3, N'Layout 3', 1, 1, N'9:3')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (4, N'Layout 4', 1, 0, N'8:4')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (5, N'Layout 5', 1, 1, N'3/3/3')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (6, N'page2', 1, 1, N'1:2:3:5:1')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (7, N'New Layout', 1, 1, N'3:4:5/2:3:7')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (10, N'Layout10', 0, 0, N'12')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (11, N'LayoutHome', 0, 0, N'12')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (12, N'LayoutDreamHome', 1, 1, N'12')
SET IDENTITY_INSERT [dbo].[DynamicLayouts] OFF
/****** Object:  Table [dbo].[MediaCategories]    Script Date: 10/19/2016 14:58:16 ******/
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
SET IDENTITY_INSERT [dbo].[MediaCategories] ON
INSERT [dbo].[MediaCategories] ([id], [CategoryName]) VALUES (1, N'Default')
SET IDENTITY_INSERT [dbo].[MediaCategories] OFF
/****** Object:  Table [dbo].[TextBank]    Script Date: 10/19/2016 14:58:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextBank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[textdata] [nvarchar](max) NULL,
	[IsShared] [bit] NULL,
 CONSTRAINT [PK_TextBank] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TextBank] ON
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared]) VALUES (2, N'<p>My Text is given here</p>
', 1)
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared]) VALUES (3, N'hi', 0)
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared]) VALUES (4, N'<p><a href="http://yahoo.com">http://yahoo.com</a></p>

<hr />
<p><strong>abv</strong></p>
', 0)
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared]) VALUES (5, N'<p>This is my textarea to be replaced Editor. my tree</p>
', 0)
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared]) VALUES (6, N'<p>This is my textarea to be replaced Editor. tree 2</p>
', 0)
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared]) VALUES (7, N'<p>This is my textarea to be replaced Editor.</p>
', 0)
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared]) VALUES (8, N'<p>This is my textarea to be replaced Editor. my field</p>
', 0)
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared]) VALUES (9, N'<p>This is shared Text Bank</p>', 1)
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared]) VALUES (10, N'<p>My shared text bank given here</p>
', 1)
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared]) VALUES (11, N'<p>Text given here for y first shared text</p>
', 1)
SET IDENTITY_INSERT [dbo].[TextBank] OFF
/****** Object:  Table [dbo].[Tags]    Script Date: 10/19/2016 14:58:16 ******/
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
/****** Object:  Table [dbo].[Controls]    Script Date: 10/19/2016 14:58:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Controls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ControlCategory_id] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IconURL] [nvarchar](max) NULL,
	[NormalMarkup] [nvarchar](max) NULL,
	[OnEditMarkup] [nvarchar](max) NULL,
	[OnSettingChangedMarkup] [nvarchar](max) NULL,
	[AdminControlName] [nvarchar](max) NULL,
	[DefautControlName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Controls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MediaItems]    Script Date: 10/19/2016 14:58:16 ******/
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
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (26, N'4.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6750103847F AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (27, N'1.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A675010640A6 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (28, N'1.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A67501064B85 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (29, N'5.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A67900C6CBEE AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (30, N'3.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A67B0095C206 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (31, N'2.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A67B0097F684 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (32, N'gmat.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A68600A9FD15 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (33, N'gre.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A68600ACB157 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (34, N'issb.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A68600ACEF8D AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (35, N'uet_et.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A68600E5400C AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (36, N'success_sumaira.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A68600E64213 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (37, N'success_abd.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A68600E9BFCE AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (38, N'uet_et.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A68600EA248E AS DateTime))
SET IDENTITY_INSERT [dbo].[MediaItems] OFF
/****** Object:  Table [dbo].[DreamUserProfile]    Script Date: 10/19/2016 14:58:16 ******/
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
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (1, N'd1e30fbd-d40b-4a32-8cd5-1294df51c620', N'jojo', NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (2, N'e42107bf-0c2e-4f48-a720-ce64736cd393', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (3, N'0b17386b-3283-40bc-9013-b9b21041b700', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (4, N'd5ba58f6-addd-4781-9a0f-5595ef5a4413', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (5, N'12c7f563-1599-410b-8114-f0543a68de42', N'Adminabca', N'', CAST(0x0000A67C00000000 AS DateTime), N'~/Components/DreamProfile/UserProfileImages/Chrysanthemum.jpg', 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (6, N'a22dacf2-2c06-43c6-9532-aa4d2f933f50', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (7, N'9025c418-b3e7-40a1-8645-6e3d218d1057', N'abc', N'msc', CAST(0x0000A65700000000 AS DateTime), N'~/Components/DreamProfile/UserProfileImages/Hydrangeas.jpg', 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (8, N'8d594b8d-1965-455e-96ed-871730ecfd0e', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (9, N'df411e14-5ad3-4ff9-b9c8-ef221168aa71', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (10, N'fbdacf86-f076-4ac0-a052-dea653bdb788', N'', N'', CAST(0x0000A67800000000 AS DateTime), N'', 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (11, N'3254a27a-1a30-475c-95a3-373f8ef3ba84', N'saba23akmal', N'msc', CAST(0x0000A67F00000000 AS DateTime), N'~/Components/DreamProfile/UserProfileImages/success_abd.jpg', 1)
SET IDENTITY_INSERT [dbo].[DreamUserProfile] OFF
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/19/2016 14:58:16 ******/
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
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'12c7f563-1599-410b-8114-f0543a68de42', N'271D901E-1B8A-4ADE-92D3-1311C220B571')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'734b7dd7-5c1e-4d17-a09f-f730a1f2f836', N'271D901E-1B8A-4ADE-92D3-1311C220B571')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c15db4c0-af50-45f7-be19-ec57aabf949a', N'0176297C-F40E-459B-94C0-444A41E032FC')
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/19/2016 14:58:16 ******/
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
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Twitter', N'2838179670', N'3254a27a-1a30-475c-95a3-373f8ef3ba84')
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/19/2016 14:58:16 ******/
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
/****** Object:  Table [dbo].[DreamTags]    Script Date: 10/19/2016 14:58:16 ******/
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
/****** Object:  Table [dbo].[Dreams]    Script Date: 10/19/2016 14:58:16 ******/
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
 CONSTRAINT [PK_Dreams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Dreams] ON
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (28, N'Home', 26, NULL, 0, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (29, N'GAT', 35, N'abc', 1, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (30, N'GRE', 33, N'fvd', 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (34, N'ISSB', 34, N'sdcyjhn', 1, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (35, N'MyDream1', 32, N'abcdefghijklmnopqrstuvwxyz', 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (36, N'abc', 33, N'fvc', 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (37, N'cccccctv', 34, N'cccccc', 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (38, N'MY Pages of Dream', 34, N'dream', 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (39, N'Cleared', 33, N'dex', 1, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (40, N'MyDreamnew', 34, N'abcd', 1, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (41, N'MyDreamnew', 37, N'abcd', 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (42, N'jh', 34, N'ghfb', 1, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (43, N'hgb', 33, N'hgfbv', 1, 0)
SET IDENTITY_INSERT [dbo].[Dreams] OFF
/****** Object:  Table [dbo].[DreamMessages]    Script Date: 10/19/2016 14:58:16 ******/
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
/****** Object:  Table [dbo].[VideoTranscript]    Script Date: 10/19/2016 14:58:16 ******/
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
/****** Object:  Table [dbo].[MediaTags]    Script Date: 10/19/2016 14:58:16 ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 10/19/2016 14:58:16 ******/
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
SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (22, N'News1                                             ', N'', CAST(0xD63B0B00 AS Date), CAST(0xD63B0B00 AS Date), 1, 0, CAST(0xD03B0B00 AS Date), 0, 27, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (23, N'News2                                             ', N'abchgjk', CAST(0xCF3B0B00 AS Date), CAST(0xE73B0B00 AS Date), 1, 0, CAST(0xD63B0B00 AS Date), 1, 31, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (24, N'gfvc                                              ', N'hvhghgfhhhhhhhhhhhhhhgj', CAST(0xD33B0B00 AS Date), CAST(0xE23B0B00 AS Date), NULL, 0, CAST(0xD73B0B00 AS Date), 1, 27, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (25, N'UET to Hold ECAT at September 29, 2016            ', N'abc', CAST(0xD63B0B00 AS Date), CAST(0xD43B0B00 AS Date), NULL, 1, CAST(0xE13B0B00 AS Date), 0, 35, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (26, N'sc                                                ', N'dsx', CAST(0xD43B0B00 AS Date), CAST(0xDC3B0B00 AS Date), NULL, 0, CAST(0xE13B0B00 AS Date), 0, 36, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (27, N'See Success story of Sumaira shaheen              ', N'hgb', CAST(0xD43B0B00 AS Date), CAST(0xCD3B0B00 AS Date), NULL, 1, CAST(0xE13B0B00 AS Date), 0, 36, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (28, N'how achieved my dreams                            ', N'hnb', CAST(0xCD3B0B00 AS Date), CAST(0xD43B0B00 AS Date), NULL, 1, CAST(0xE13B0B00 AS Date), 0, 37, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (29, N'UET to Hold9, 2016                                ', N'hb', CAST(0xDB3B0B00 AS Date), CAST(0xCC3B0B00 AS Date), NULL, 1, CAST(0xE13B0B00 AS Date), 1, 35, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (30, N'hvhghgfhhhhhhhhhhhhhhgj                           ', N'2016-09-05', CAST(0xE23B0B00 AS Date), NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (31, N'News1   is here                                   ', N'', CAST(0xD63B0B00 AS Date), CAST(0xD63B0B00 AS Date), 1, 0, CAST(0xD03B0B00 AS Date), 0, 27, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (32, N'Prime Minister of Pakistan Imran Khan             ', N'', CAST(0xD63B0B00 AS Date), CAST(0xD63B0B00 AS Date), 1, 0, CAST(0xD03B0B00 AS Date), 0, 27, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (33, N'DreamBird Sign MOU with MIT,                      ', N'', CAST(0xD63B0B00 AS Date), CAST(0xD63B0B00 AS Date), 1, 0, CAST(0xD03B0B00 AS Date), 0, 27, NULL)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (34, N'Last Date for Registration in LMS                 ', N'', CAST(0xD63B0B00 AS Date), CAST(0xD63B0B00 AS Date), 1, 0, CAST(0xD03B0B00 AS Date), 0, 27, NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  Table [dbo].[NewsRelatedNews]    Script Date: 10/19/2016 14:58:16 ******/
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
SET IDENTITY_INSERT [dbo].[NewsRelatedNews] ON
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (9, 26, 22)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (10, 27, 23)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (11, 28, 24)
INSERT [dbo].[NewsRelatedNews] ([id], [news_id], [related_news_id]) VALUES (12, 29, 23)
SET IDENTITY_INSERT [dbo].[NewsRelatedNews] OFF
/****** Object:  Table [dbo].[NewsDreamNews]    Script Date: 10/19/2016 14:58:16 ******/
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
SET IDENTITY_INSERT [dbo].[NewsDreamNews] ON
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (7, 22, 28)
SET IDENTITY_INSERT [dbo].[NewsDreamNews] OFF
/****** Object:  Table [dbo].[Navigations]    Script Date: 10/19/2016 14:58:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Navigations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MediaItem_id] [int] NULL,
	[Dream_id] [int] NULL,
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
SET IDENTITY_INSERT [dbo].[Navigations] ON
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (15, 27, 29, N'nav1', N'www.yahoo.com', 1, 1)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (16, 31, 29, N'NAV2', N'~/DreamHome/GAT/Page1', 1, 0)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (17, 30, 29, N'nav3', N'~/DreamHome/Home/Default', 1, 0)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (18, 29, 29, N'jkhmn', N'~/DreamHome/Home/Default', 1, 0)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (23, 31, 29, N'yhhhhhhhhhhhgb', N'jnh', 1, 1)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (24, 30, 29, N'GAT', N'~/DreamHome/Home/Default', 1, 0)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (26, 31, 34, N'nave1', N'yahoo.com', 1, 1)
SET IDENTITY_INSERT [dbo].[Navigations] OFF
/****** Object:  Table [dbo].[DreamLayouts]    Script Date: 10/19/2016 14:58:16 ******/
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
	[NavEnable] [bit] NOT NULL,
	[IsPublished] [bit] NOT NULL,
	[IsDefaultPage] [bit] NOT NULL,
 CONSTRAINT [PK_DreamLayouts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DreamLayouts] ON
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (30, N'<%@ Register Src="~/Components/Core/BaseDreamControl.ascx" TagPrefix="uc1" TagName="BaseDreamControl" %> 
<uc1:BaseDreamControl runat="server" ID="BaseDreamControl2"  DefaultControl="~/Components/TopNav/TopNavAnonymous.ascx" AdminSettingControl="~/Components/TopNav/TopNavAnonymous.ascx"/>
     <uc1:BaseDreamControl runat="server" ID="BaseDreamControl"  DefaultControl="~/Components/Header/SearchWithHeader.ascx" AdminSettingControl="~/Components/Header/SearchWithHeader.ascx"/>
        <%--<uc1:FeatureDreams runat="server" ID="FeatureDreams" />--%>
        <uc1:BaseDreamControl runat="server" ID="BaseDreamControl3"  DefaultControl="~/Components/Dreams/FeatureDreams.ascx" AdminSettingControl="~/Components/Dreams/FeatureDreams.ascx"/>

        <%--<uc1:DreamView runat="server" ID="DreamView"  SearchControlName="SearchWithHeader"/>--%>
       <uc1:BaseDreamControl runat="server" ID="BaseDreamControl1"  DefaultControl="~/Components/Dreams/DreamView.ascx" AdminSettingControl="~/Components/Dreams/DreamView.ascx"/>

		
        <%--<uc1:GeneralNewsView runat="server" ID="GeneralNewsView" />--%>
               <uc1:BaseDreamControl runat="server" ID="BaseDreamControl4"  DefaultControl="~/Components/News/NewControls/GeneralNewsView.ascx" AdminSettingControl="~/Components/News/NewControls/GeneralNewsView.ascx"/>

    <%--<uc1:RegisterEmail runat="server" ID="RegisterEmail" />--%>
     <uc1:BaseDreamControl runat="server" ID="BaseDreamControl5"  DefaultControl="~/Components/Account/RegisterEmail.ascx" AdminSettingControl="~/Components/Account/RegisterEmail.ascx"/>

    <%--<uc1:FooterControl runat="server" ID="FooterControl" />--%>
             <uc1:BaseDreamControl runat="server" ID="BaseDreamControl6"  DefaultControl="~/Components/Footer/FooterControl.ascx" AdminSettingControl="~/Components/Footer/FooterControl.ascx"/>
', 28, N'Default', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (31, N'<%@ Register src = ''Components/Core/BaseDreamControl.ascx'' tagname = ''BaseDreamControl'' tagprefix = ''uc2'' %><div><div class="row"><div id="header-wrap" class="col-md-12 mainLayout" style="background: rgb(246, 246, 246); border: 1px solid rgb(193, 193, 193);"><div id="sortable-header" class="ui-sortable Temp1"><div class="ui-sortable-handle" admindreamcontrol="~/Components/TextBank/TextBankAdmin.ascx" defaultcontrolname="~/Components/TextBank/TextBankView.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl1'' runat=''server'' DefaultControl=''~/Components/TextBank/TextBankView.ascx'' AdminSettingControl=''~/Components/TextBank/AdminTextBank.ascx'' /></div></div></div></div><div class="row" style="margin:0;"><div class="row"><div class="col-md-3 mainLayout" style="padding-right: 0px; padding-left: 0px; background: rgb(246, 246, 246); border: 1px solid rgb(193, 193, 193);"><div id="sortable2" class="ui-sortable Temp1"></div></div><div class="col-md-9 mainLayout" style="padding-right: 0px; padding-left: 0px; background: rgb(246, 246, 246); border: 1px solid rgb(193, 193, 193);"><div id="sortable3" class="ui-sortable Temp1"></div></div></div></div><div class="row"><div class="col-md-12 mainLayout" id="footer-wrap" style="background: rgb(246, 246, 246); border: 1px solid rgb(193, 193, 193);"><div id="sortable-footer" class="ui-sortable Temp1"></div></div></div></div>', 29, N'Page1', N'abc', 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (35, N'<%@ Register Src="~/Components/LessonMenu/LessonMenuUserView.ascx" TagPrefix="uc1" TagName="LessonMenuUserView" %>
<uc1:LessonMenuUserView runat="server" ID="LessonMenuUserView" />', 34, N'Page1', N'abcd', 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (36, NULL, 34, N'Page2', N'', 0, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (37, N'<%@ Register src = ''Components/Core/BaseDreamControl.ascx'' tagname = ''BaseDreamControl'' tagprefix = ''uc2'' %><div><div class="row"><div id="header-wrap" class="col-md-12 mainLayout"><div id="sortable-header" class="Temp1"></div></div></div><div class="row" style="margin:0;"><div class="row"><div class="col-md-6 mainLayout" style="padding-right:0;padding-left:0;"><div id="sortable2" class="Temp1"></div></div><div class="col-md-6 mainLayout" style="padding-right:0;padding-left:0;"><div id="sortable3" class="Temp1"></div></div></div></div><div class="row"><div class="col-md-12 mainLayout" id="footer-wrap"><div id="sortable-footer" class="Temp1"></div></div></div></div>', 30, N'Page1', N'', 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (38, NULL, 37, N'Page1', NULL, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (39, NULL, 37, N'Page2', NULL, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (40, N'<%@ Register src="Components/Core/BaseDreamControl.ascx" tagname="BaseDreamControl" tagprefix="uc2" %>

<uc2:BaseDreamControl ID="BaseDreamControl1" runat="server" DefaultControl="~/Components/TextBank/TextBankView.ascx" AdminSettingControl="~/Components/TextBank/AdminTextBank.ascx" />


<uc2:BaseDreamControl ID="BaseDreamControl2" runat="server" DefaultControl="~/Components/TextBank/TextBankView.ascx" AdminSettingControl="~/Components/TextBank/AdminTextBank.ascx" />

<uc2:BaseDreamControl ID="BaseDreamControl3" runat="server" DefaultControl="~/Components/TextBank/TextBankView.ascx" AdminSettingControl="~/Components/TextBank/AdminTextBank.ascx" />', 30, N'Page5', NULL, 0, 1, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (41, NULL, 37, N'Page5', NULL, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (42, NULL, 37, N'Page6', NULL, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (43, NULL, 37, N'Page62', N'', 0, 1, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (44, N' 
<%@ Register Src="~/Components/LessonMenu/LessonMenuManager.ascx" TagPrefix="uc1" TagName="LessonMenuManager" %>
<uc1:LessonMenuManager runat="server" id="LessonMenuManager" />', 29, N'Page2', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (49, NULL, 29, N'Page', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (50, NULL, 29, N'Page3', NULL, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (51, NULL, 29, N'Page7', NULL, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (66, N'Menu1 55', 29, N'Menu1', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (67, N'menu2', 29, N'Menu2', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (68, N'menuchild2', 29, N'child2', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (69, N'menuchild22', 29, N'child22', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (70, N'hello', 29, N'mychild', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (71, N'hi here', 29, N'mytree', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (72, N'<%@ Register src = ''Components/Core/BaseDreamControl.ascx'' tagname = ''BaseDreamControl'' tagprefix = ''uc2'' %>  <div><div class="row"><div id="header-wrap" class="col-md-12 mainLayout" style="border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable-header" class="ui-sortable Temp1"><div class="ui-sortable-handle" admindreamcontrol="~/Components/NAV_General/NavigationAdminSetting.ascx" defaultcontrolname="~/Components/NAV_General/NavigationView.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl1'' runat=''server'' DefaultControl=''~/Components/NAV_General/NavigationView.ascx'' AdminSettingControl=''~/Components/NAV_General/NavigationAdminSetting.ascx'' /></div></div></div></div><div class="row" style="margin:0;"><div class="row"><div class="col-md-3 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable2" class="ui-sortable Temp1"></div></div><div class="col-md-4 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable3" class="ui-sortable Temp1"><div class="ui-sortable-handle" admindreamcontrol="~/Components/News/FeatureNewsHomeAdmin.ascx" defaultcontrolname="~/Components/News/FeatureNewsHome.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl2'' runat=''server'' DefaultControl=''~/Components/News/FeatureNewsHome.ascx'' AdminSettingControl=''~/Components/News/FeatureNewsHomeAdmin.ascx'' /></div></div></div><div class="col-md-5 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable4" class="ui-sortable Temp1"></div></div></div></div><div class="row"><div class="col-md-12 mainLayout" id="footer-wrap" style="border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable-footer" class="ui-sortable Temp1"></div></div></div></div>', 29, N'mytree', N'fv', 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (73, N'<%@ Register Src="~/Components/Core/BaseDreamControl.ascx" TagPrefix="uc1" TagName="BaseDreamControl" %>
 <uc1:BaseDreamControl runat="server" ID="BaseDreamControl"  DefaultControl="~/Components/NAV_General/NavigationView.ascx" AdminSettingControl="~/Components/NAV_General/NavigationView.ascx"/>', 29, N'tree2', NULL, 0, 1, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (74, N'Hello World', 29, N'treewww', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (75, N'<!DOCTYPE html>
<html>
<head>
    <title></title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="css/bootstrap.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/style.css">
	<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
</head>
<body>
<div class="header-wrapper">
<nav class="navbar navbar-default navbar-fixed-top">
<div class="container">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.html"><img src="img/dreambird-logo.png" width="100px"></a>
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li id="login"><a href="login.html">Login</a></li>
        <li class="active" id="register"><a href="register.html">Register</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right" id="main-menu">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dreams<span class="caret"></span></a>
          <ul class="dropdown-menu column-3">
          <div class="row">
          <div class="col-md-8">
          	<h3>Dreams By Subject</h3>
          </div>
          <div class="col-md-4">
          	<button type="button" style="width:100%" class="btn btn-default">See all dreams</button>
          </div>
          </div>
          <div class="row">
            <div class="col-md-6">
	            <li><a href="#">Action</a></li>
	            <li><a href="#">Another action</a></li>
	            <li><a href="#">Something else here</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">Separated link</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">One more separated link</a></li>
            </div>
            <div class="col-md-6">
	            <li><a href="#">Action</a></li>
	            <li><a href="#">Another action</a></li>
	            <li><a href="#">Something else here</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">Separated link</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">One more separated link</a></li>
            </div>
          </div>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Programs<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
        <li><a href="#">Institutions</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">About Us<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
  </div>
</nav>
</div>
<div class="main_image">
	<div class="col-md-12" id="searchbar">
	<div class="col-md-8" style="margin-left:auto; margin-right:auto; float:none;">
		<div class="col-md-9">
			<input type="text" class="form-control" />
		</div>
		<div class="col-md-3">
			 <button type="button" style="width:100%" class="btn btn-default">Search Everything</button>
		</div>
		</div>
	</div>
</div>
<div class="featured_wrapper">
	<div class="container">
		<div class="featured_item">
			<img src="img/uet.png">
		</div>
		<div class="featured_item">
			<img src="img/uhs.png">
		</div>
		<div class="featured_item">
			<img src="img/lums.png">
		</div>
		<div class="featured_item">
			<img src="img/ets.png">
		</div>
		<div class="featured_item">
			<img src="img/nts.png">
		</div>
		<div class="featured_item">
			<img src="img/vu.png">
		</div>
	</div>
</div>
<div class="content_wrapper">
	<div class="container" id="content_wrap">
		<h2>Most Popular Dreams</h2>
		<div class="col-md-3">
			<div class="content_item container_featured">
				<div class="cont_img_wrap">
					<img src="img/gmat.jpg" />
				</div>
				<div class="cont_label_featured"></div>
				<div class="content_pan">
				<h3>GMAT</h3>
				<h5>LUMS</h5>
				<div class="content_desc"></div>
				<div class="content_social_detail">
					<div class="soc_det likes" style="text-align:left;">
						200 Likes
					</div>
					<div class="soc_det comments" style="text-align:right;">
						40 Comments
					</div>
				</div>
				<div class="dream_footer">
					<div style="width:16%; float:left; margin-right:38%;">
						<img src="img/like.png" width="100%">
					</div>
					<div style="width:46%; float:left;">
						<button class="btn btn-default">View Detail</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="content_item container_featured">
				<div class="cont_img_wrap">
					<img src="img/gre.jpg" />
				</div>
				<div class="cont_label_featured"></div>
				<div class="content_pan">
				<h3>GRE</h3>
				<h5>GIKI</h5>
				<div class="content_desc"></div>
				<div class="content_social_detail">
					<div class="soc_det likes" style="text-align:left;">
						200 Likes
					</div>
					<div class="soc_det comments" style="text-align:right;">
						40 Comments
					</div>
				</div>
				<div class="dream_footer">
					<div style="width:16%; float:left; margin-right:38%;">
						<img src="img/like.png" width="100%">
					</div>
					<div style="width:46%; float:left;">
						<button class="btn btn-default">View Detail</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="content_item container_ws">
				<div class="cont_img_wrap">
					<img src="img/issb.jpg" />
				</div>
				<div class="cont_label_ws"></div>
				<div class="content_pan">
				<h3>ISSB</h3>
				<h5>Pakistan Army</h5>
				<div class="content_desc"></div>
				<div class="content_social_detail">
					<div class="soc_det likes" style="text-align:left;">
						200 Likes
					</div>
					<div class="soc_det comments" style="text-align:right;">
						40 Comments
					</div>
				</div>
				<div class="dream_footer">
					<div style="width:16%; float:left; margin-right:38%;">
						<img src="img/like.png" width="100%">
					</div>
					<div style="width:46%; float:left;">
						<button class="btn btn-default">View Detail</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="content_item container_cs">
				<div class="cont_img_wrap">
					<img src="img/gmat.jpg" />
				</div>
				<div class="cont_label_cs"></div>
				<div class="content_pan">
				<h3>GMAT</h3>
				<h5>LUMS</h5>
				<div class="content_desc"></div>
				<div class="content_social_detail">
					<div class="soc_det likes" style="text-align:left;">
						200 Likes
					</div>
					<div class="soc_det comments" style="text-align:right;">
						40 Comments
					</div>
				</div>
				<div class="dream_footer">
					<div style="width:16%; float:left; margin-right:38%;">
						<img src="img/like.png" width="100%">
					</div>
					<div style="width:46%; float:left;">
						<button class="btn btn-default">View Detail</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="content_item container_featured">
				<div class="cont_img_wrap">
					<img src="img/gmat.jpg" />
				</div>
				<div class="cont_label_featured"></div>
				<div class="content_pan">
				<h3>GMAT</h3>
				<h5>LUMS</h5>
				<div class="content_desc"></div>
				<div class="content_social_detail">
					<div class="soc_det likes" style="text-align:left;">
						200 Likes
					</div>
					<div class="soc_det comments" style="text-align:right;">
						40 Comments
					</div>
				</div>
				<div class="dream_footer">
					<div style="width:16%; float:left; margin-right:38%;">
						<img src="img/like.png" width="100%">
					</div>
					<div style="width:46%; float:left;">
						<button class="btn btn-default">View Detail</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="content_item container_featured">
				<div class="cont_img_wrap">
					<img src="img/gre.jpg" />
				</div>
				<div class="cont_label_featured"></div>
				<div class="content_pan">
				<h3>GRE</h3>
				<h5>GIKI</h5>
				<div class="content_desc"></div>
				<div class="content_social_detail">
					<div class="soc_det likes" style="text-align:left;">
						200 Likes
					</div>
					<div class="soc_det comments" style="text-align:right;">
						40 Comments
					</div>
				</div>
				<div class="dream_footer">
					<div style="width:16%; float:left; margin-right:38%;">
						<img src="img/like.png" width="100%">
					</div>
					<div style="width:46%; float:left;">
						<button class="btn btn-default">View Detail</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="content_item container_ws">
				<div class="cont_img_wrap">
					<img src="img/issb.jpg" />
				</div>
				<div class="cont_label_ws"></div>
				<div class="content_pan">
				<h3>ISSB</h3>
				<h5>Pakistan Army</h5>
				<div class="content_desc"></div>
				<div class="content_social_detail">
					<div class="soc_det likes" style="text-align:left;">
						200 Likes
					</div>
					<div class="soc_det comments" style="text-align:right;">
						40 Comments
					</div>
				</div>
				<div class="dream_footer">
					<div style="width:16%; float:left; margin-right:38%;">
						<img src="img/like.png" width="100%">
					</div>
					<div style="width:46%; float:left;">
						<button class="btn btn-default">View Detail</button>
					</div>
				</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="content_item container_cs">
				<div class="cont_img_wrap">
					<img src="img/gmat.jpg" />
				</div>
				<div class="cont_label_cs"></div>
				<div class="content_pan">
				<h3>GMAT</h3>
				<h5>LUMS</h5>
				<div class="content_desc"></div>
				<div class="content_social_detail">
					<div class="soc_det likes" style="text-align:left;">
						200 Likes
					</div>
					<div class="soc_det comments" style="text-align:right;">
						40 Comments
					</div>
				</div>
				<div class="dream_footer">
					<div style="width:16%; float:left; margin-right:38%;">
						<img src="img/like.png" width="100%">
					</div>
					<div style="width:46%; float:left;">
						<button class="btn btn-default">View Detail</button>
					</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<div class="load_more">
		<a href="#" id="load_more"><h3>Load More</h3></a>
	</div>
</div>
<div class="news_wrapper">
	<div class="container">
		<h2>Latest News & Announcements</h2>
		<div class="col-md-6" id="featured_news" style="border-right:3px solid #eb8c2e">
		<h3>Featured News</h3>
			<div class="col-md-6">
				<a href="#">
					<div class="featured_news thumb">
						<img src="img/uet_et.jpg">
					</div>
					<div class="news_detail">
						<p>UET to Hold ECAT at September 29, 2016</p>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="#">
					<div class="featured_news thumb">
						<img src="img/success_sumaira.jpg">
					</div>
					<div class="news_detail">
						<p>Success Story: See how Sumaira Shaheen achieved her dreams</p>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="#">
					<div class="featured_news thumb">
						<img src="img/asplogo-square.png">
					</div>
					<div class="news_detail">
						<p>Last Date for Registration to "Intro to ASP.NET" has extended</p>
					</div>
				</a>
			</div>
			<div class="col-md-6">
				<a href="#">
					<div class="featured_news thumb">
						<img src="img/success_abd.jpg">
					</div>
					<div class="news_detail">
						<p>Success Story: See how Abdullah Maud achieved his dreams</p>
					</div>
				</a>
			</div>
		</div>
		<div class="col-md-6">
			<div class="col-md-12">
				<a href="#">
					<div class="news_detail latest">
						<p>Welcome to DreamBird</p>
					</div>
				</a>
			</div>
			<div class="col-md-12">
				<a href="#">
					<div class="news_detail latest">
						<p>Last Date for Registration to "Introduction to Java" has been extended</p>
					</div>
				</a>
			</div>
			<div class="col-md-12">
				<a href="#">
					<div class="news_detail latest">
						<p>Last Date for Registration to "Introduction to Java" has been extended</p>
					</div>
				</a>
			</div>
			<div class="col-md-12">
				<a href="#">
					<div class="news_detail latest">
						<p>Last Date for Registration to "Introduction to Java" has been extended</p>
					</div>
				</a>
			</div>
			<div class="col-md-12">
				<a href="#">
					<div class="news_detail latest">
						<p>Last Date for Registration to "Introduction to Java" has been extended</p>
					</div>
				</a>
			</div>
			<div class="col-md-12">
				<a href="#">
					<div class="news_detail latest">
						<p>Last Date for Registration to "Introduction to Java" has been extended</p>
					</div>
				</a>
			</div>
			<div class="col-md-12">
				<a href="#">
					<div class="news_detail latest">
						<p>DreamBird Sign MOU with MIT, USA regarding affiliation with edX</p>
					</div>
				</a>
			</div>
			<div class="col-md-12">
				<a href="#">
					<div class="news_detail latest">
						<p>Prime Minister of Pakistan Imran Khan Visited DreamBird Headquarter</p>
					</div>
				</a>
			</div>
			<div class="col-md-12">
				<div style="float:right">
					<button class="btn btn-default">View More News</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="registration_wrapper">
<div class="container">
	<div class="col-md-7">
		<p style="text-align:justify;">Let us inform you about new dreams, programs and courses. Register your Email Address here to become upto dated.</p>
	</div>
	<div class="col-md-5">
		<div class="row">
		<div class="col-md-12">
			<input type="text" class="form-control" />
		</div>
		</div>
		<div class="row">
		<div class="col-md-6" style="float:right;">
			<button class="btn btn-default">Register</button>
		</div>
		</div>
	</div>
</div>
</div>
<div class="footer_wrapper">
	<div class="container">
		<div class="col-md-1">
			<a href="#"><img src="img/dreambird-logo.png" width="100px"></a>
		</div>
		<div class="col-md-6" style="padding-top:20px; padding-bottom:20px;">
			<div class="row">
					<a href="#">About</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">Blog</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">News</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">Help Center</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">Contact</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">Sitemap</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">Terms of Services & Honour Code</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">Privacy Policy</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">Accessibility Policy</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div class="row" style="margin-top:20px;">
			<p>Copyright &copy; 2016, DreamBird Inc. All Rights Reserved except where noted.</p>
			</div>
		</div>
		<div class="col-md-4">
			<div class="row">
				<div class="col-md-2" style="width:70px; float:left;">
					<img src="img/fb_icon.png">
				</div>
				<div class="col-md-2" style="width:70px; float:left;">
					<img src="img/twiiter-icon.png">
				</div>
				<div class="col-md-2" style="width:70px; float:left;">
				<img src="img/youtube-logo.png">
				</div>
				<div class="col-md-2" style="width:70px; float:left;">
					<img src="img/linkedin-icon.png">
				</div>
				<div class="col-md-2" style="width:70px; float:left;">
					<img src="img/g+.png">
				</div>
			</div>
			<div class="row">
				<div class="col-md-5" style="width:180px; float:left;">
					<img src="img/gp.jpg">
				</div>
				<div class="col-md-5" style="width:180px; float:left;">
					<img src="img/ps.jpg">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
 ', 29, N'trrrrrrrrrrrrrrr', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (76, N'Hello Worldhg', 29, N'mytree', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (77, N'Hello World', 29, N'mystyle', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (78, N'<%@ Register src="Components/Core/BaseDreamControl.ascx" tagname="BaseDreamControl" tagprefix="uc2" %>

<uc2:BaseDreamControl ID="BaseDreamControl1" runat="server" DefaultControl="~/Components/TextBank/TextBankView.ascx" AdminSettingControl="~/Components/TextBank/TextBankAdmin.ascx" />


<uc2:BaseDreamControl ID="BaseDreamControl2" runat="server" DefaultControl="~/Components/TextBank/TextBankView.ascx" AdminSettingControl="~/Components/TextBank/TextBankAdmin.ascx" />

<uc2:BaseDreamControl ID="BaseDreamControl3" runat="server" DefaultControl="~/Components/TextBank/TextBankView.ascx" AdminSettingControl="~/Components/TextBank/TextBankAdmin.ascx" />




<uc2:BaseDreamControl ID="BaseDreamControl5" runat="server" DefaultControl="~/Components/TextBank/TextBankView.ascx" AdminSettingControl="~/Components/TextBank/TextBankAdmin.ascx" />', 29, N'tree', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (79, N'Hello World', 29, N'mytree', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (80, N'Hello World', 29, N'mychild1', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (81, N'Hello World', 29, N'node', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (82, N'Hello World', 29, N'treeeeee', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (83, N'<%@ Register Src="~/Components/Core/BaseDreamControl.ascx" TagPrefix="uc1" TagName="BaseDreamControl" %>

 <uc1:BaseDreamControl runat="server" ID="BaseDreamControl4"  DefaultControl="~/Components/News/NewControls/GeneralNewsView.ascx" AdminSettingControl="~/Components/News/NewControls/GeneralNewsView.ascx"/>', 29, N'abc', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (84, N'<%@ Register Src="~/Components/Core/BaseDreamControl.ascx" TagPrefix="uc1" TagName="BaseDreamControl" %>

<uc2:BaseDreamControl ID="BaseDreamControl1" runat="server" DefaultControl="~/Components/Dreams/DreamView.ascx" AdminSettingControl="~/Components/dreams/DreamAdminSetting.ascx" />', 29, N'teee2', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (85, N'hi
<a href="" onclick="return SelectMenu(''../../dreamhome/GAT/teee2'',''2'');">parent</a>', 29, N'Measurement', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (86, N'<%@ Register Src="~/Components/Core/BaseDreamControl.ascx" TagPrefix="uc1" TagName="BaseDreamControl" %>
 <uc1:BaseDreamControl runat="server" ID="BaseDreamControl"  DefaultControl="~/Components/NAV_General/NavigationView.ascx" AdminSettingControl="~/Components/NAV_General/NavigationView.ascx"/>', 29, N'tree2', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (87, N'Hello World', 29, N'mychild5', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (88, N'Hello World', 29, N'Course Labels', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (89, N'Hello World', 29, N'Label1', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (90, N'Hello World', 29, N'Labell2', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (91, N'Hello World', 29, N'Label3', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (92, N'Hello World', 29, N'Label6', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (93, N'Hello World', 29, N'Label7', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (94, N'Hello World', 29, N'Label8', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (95, N'Hello World', 29, N'Label9', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (96, N'Hello World', 29, N'Label10', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (97, N'Hello World', 29, N'Label11', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (98, NULL, 34, N'Page7', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (99, N'Hello World', 29, N'abc', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (100, N'Hello World', 29, N'My_New_file', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (101, N'Hello World', 29, N'My_New_file', NULL, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[DreamLayouts] OFF
/****** Object:  Table [dbo].[DreamUserLikes]    Script Date: 10/19/2016 14:58:16 ******/
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
SET IDENTITY_INSERT [dbo].[DreamUserLikes] ON
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (246, 36, N'12c7f563-1599-410b-8114-f0543a68de42')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (247, 38, N'12c7f563-1599-410b-8114-f0543a68de42')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (250, 29, N'3254a27a-1a30-475c-95a3-373f8ef3ba84')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (252, 39, N'3254a27a-1a30-475c-95a3-373f8ef3ba84')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (253, 36, N'3254a27a-1a30-475c-95a3-373f8ef3ba84')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (255, 34, N'3254a27a-1a30-475c-95a3-373f8ef3ba84')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (256, 38, N'3254a27a-1a30-475c-95a3-373f8ef3ba84')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (257, 30, N'3254a27a-1a30-475c-95a3-373f8ef3ba84')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (260, 37, N'3254a27a-1a30-475c-95a3-373f8ef3ba84')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (261, 35, N'3254a27a-1a30-475c-95a3-373f8ef3ba84')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (262, 29, N'12c7f563-1599-410b-8114-f0543a68de42')
SET IDENTITY_INSERT [dbo].[DreamUserLikes] OFF
/****** Object:  Table [dbo].[LessonMenu]    Script Date: 10/19/2016 14:58:16 ******/
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
	[menuRighter] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LessonMenu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LessonMenu] ON
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (1, N'Parent', 1, NULL, NULL, 78, N'Parent', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (2, N'Parent1', 1, 1, 44, 78, N'Parent1', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (3, N'tree', 0, 1, 44, 78, N'tree', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (4, N'mytree', 0, 1, 44, 79, N'mytree', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (5, N'mychild1', 0, 2, 44, 80, N'mychild1', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (9, N'node', 1, 1, 44, 81, N'node', N'user', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (10, N'treeeeee', 0, 9, 44, 82, N'treeeeee', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (11, N'abc', 1, 1, 44, 83, N'abc', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (12, N'teee2', 1, 11, 44, 84, N'teee2', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (13, N'treeeeeeeee', 0, 12, 44, 86, N'treeeeeeeee', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (14, N'Course_Content', 1, 1, 44, 86, N'Course Content', N'user', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (15, N'Physics', 1, 14, 44, 86, N'Physics', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (16, N'Chemistry', 0, 14, 44, 86, N'Chemistry', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (17, N'Mathematics', 0, 14, 44, 86, N'Mathematics', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (18, N'Week1', 1, 15, 44, 85, N'Week1', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (19, N'Week2', 0, 15, 44, 85, N'Week2', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (20, N'Measurement', 0, 18, 44, 85, N'Measurement', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (21, N'tree2', 0, 1, 44, 86, N'tree2', N'user', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (22, N'mychild5', 0, 2, 44, 87, N'mychild5 cs', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (23, N'Course_Labels', 1, 1, 44, 88, N'Course Labels', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (24, N'Label1', 1, 23, 44, 89, N'Label1', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (25, N'Labell2', 1, 23, 44, 90, N'Labell2', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (26, N'Label3', 0, 23, 44, 91, N'Label3', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (27, N'Label6', 0, 24, 44, 92, N'Label6', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (28, N'Label7', 1, 25, 44, 93, N'Label7', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (29, N'Label8', 1, 28, 44, 94, N'Label8', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (30, N'Label9', 0, 29, 44, 95, N'Label9', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (31, N'Label10', 0, 23, 44, 96, N'Label10', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (32, N'Label11', 0, 23, 44, 97, N'Label11', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (33, N'abctry', 0, 1, 44, 99, N'bbbbbbbb', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (39, N'My_New_file', 0, 1, 44, 100, N'user', N'public', N'user')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuRighter]) VALUES (40, N'My_New_file', 0, 1, 44, 101, N'user', N'public', N'user')
SET IDENTITY_INSERT [dbo].[LessonMenu] OFF
/****** Object:  Table [dbo].[LayoutTextBank]    Script Date: 10/19/2016 14:58:16 ******/
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
SET IDENTITY_INSERT [dbo].[LayoutTextBank] ON
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (2, 31, 2, 2, N'ctl05_BaseDreamControl1                           ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (3, 40, 3, NULL, N'ctl05_BaseDreamControl2                           ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (4, 40, 4, 9, N'ctl05_BaseDreamControl3                           ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (5, 78, 5, NULL, N'ctl05_BaseDreamControl1                           ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (6, 78, 6, NULL, N'ctl05_BaseDreamControl2                           ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (7, 78, 7, 9, N'ctl05_BaseDreamControl3                           ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (8, 78, 8, NULL, N'ctl05_BaseDreamControl5                           ', 0)
SET IDENTITY_INSERT [dbo].[LayoutTextBank] OFF
/****** Object:  Table [dbo].[InviteSharePage]    Script Date: 10/19/2016 14:58:16 ******/
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
SET IDENTITY_INSERT [dbo].[InviteSharePage] ON
INSERT [dbo].[InviteSharePage] ([id], [LayoutID], [shareText], [shareURL]) VALUES (1, 30, N'"Share Dream Home Page"                                                                             ', N'http://localhost:64671/DreamHome.aspx/Home/Default                                                  ')
INSERT [dbo].[InviteSharePage] ([id], [LayoutID], [shareText], [shareURL]) VALUES (2, 44, N'Page Text                                                                                           ', N'yahoo.com                                                                                           ')
SET IDENTITY_INSERT [dbo].[InviteSharePage] OFF
/****** Object:  Default [DF__DreamUser__IsAct__2E1BDC42]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamUserProfile] ADD  CONSTRAINT [DF__DreamUser__IsAct__2E1BDC42]  DEFAULT ((0)) FOR [IsActivated]
GO
/****** Object:  Default [DF_Dreams_IsFeatured]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsFeatured]  DEFAULT ((0)) FOR [IsFeatured]
GO
/****** Object:  Default [DF_Dreams_IsDefault]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
/****** Object:  Default [DF_DreamLayouts_NavEnable]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_NavEnable]  DEFAULT ((0)) FOR [NavEnable]
GO
/****** Object:  Default [DF_DreamLayouts_IsPublished]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_IsPublished]  DEFAULT ((1)) FOR [IsPublished]
GO
/****** Object:  Default [DF__DreamLayo__IsDef__44FF419A]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  DEFAULT ((0)) FOR [IsDefaultPage]
GO
/****** Object:  Default [DF_LessonMenu_IsContainer]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_IsContainer]  DEFAULT ((0)) FOR [IsContainer]
GO
/****** Object:  Default [DF_LessonMenu_DisplayName]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_DisplayName]  DEFAULT ('') FOR [DisplayName]
GO
/****** Object:  Default [DF__LessonMen__menuR__5224328E]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  DEFAULT ('user') FOR [menuRighter]
GO
/****** Object:  ForeignKey [FK__Controls__Contro__57DD0BE4]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
/****** Object:  ForeignKey [FK_MediaItems_MediaCategories]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[MediaItems]  WITH CHECK ADD  CONSTRAINT [FK_MediaItems_MediaCategories] FOREIGN KEY([MediaCategory_id])
REFERENCES [dbo].[MediaCategories] ([id])
GO
ALTER TABLE [dbo].[MediaItems] CHECK CONSTRAINT [FK_MediaItems_MediaCategories]
GO
/****** Object:  ForeignKey [FK_DreamUserProfile_AspNetUsers]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamUserProfile]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserProfile_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserProfile] CHECK CONSTRAINT [FK_DreamUserProfile_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_Tag]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamTags]  WITH CHECK ADD  CONSTRAINT [FK_Tag] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamTags] CHECK CONSTRAINT [FK_Tag]
GO
/****** Object:  ForeignKey [FK_Dreams_MediaItems]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD  CONSTRAINT [FK_Dreams_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Dreams] CHECK CONSTRAINT [FK_Dreams_MediaItems]
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile] FOREIGN KEY([SenderId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile]
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile1]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile1] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile1]
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__4F7CD00D]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK_MediaTags_MediaItems]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_MediaItems]
GO
/****** Object:  ForeignKey [FK_MediaTags_Tags]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_Tags] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_Tags]
GO
/****** Object:  ForeignKey [FK_News_MediaItems]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_MediaItems]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News] FOREIGN KEY([related_news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News1]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News1] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News1]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_Dreams]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_Dreams] FOREIGN KEY([dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_Dreams]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_News]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_News] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_News]
GO
/****** Object:  ForeignKey [FK_Navigations_Dreams]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_Dreams] FOREIGN KEY([Dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_Dreams]
GO
/****** Object:  ForeignKey [FK_Navigations_MediaItems]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_MediaItems]
GO
/****** Object:  ForeignKey [FK_DreamLayouts_Dreams]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamLayouts]  WITH CHECK ADD  CONSTRAINT [FK_DreamLayouts_Dreams] FOREIGN KEY([DreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamLayouts] CHECK CONSTRAINT [FK_DreamLayouts_Dreams]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_AspNetUsers]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_Dreams]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_Dreams] FOREIGN KEY([DreamId])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_Dreams]
GO
/****** Object:  ForeignKey [FK_LessonMenu_DreamLayouts]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[LessonMenu]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenu_DreamLayouts] FOREIGN KEY([DreamLayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[LessonMenu] CHECK CONSTRAINT [FK_LessonMenu_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_LessonMenu_DreamLayouts1]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[LessonMenu]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenu_DreamLayouts1] FOREIGN KEY([ParentLayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[LessonMenu] CHECK CONSTRAINT [FK_LessonMenu_DreamLayouts1]
GO
/****** Object:  ForeignKey [FK_LessonMenu_LessonMenu]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[LessonMenu]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenu_LessonMenu] FOREIGN KEY([parentMenu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenu] CHECK CONSTRAINT [FK_LessonMenu_LessonMenu]
GO
/****** Object:  ForeignKey [FK_LayoutTextBank_DreamLayouts]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[LayoutTextBank]  WITH CHECK ADD  CONSTRAINT [FK_LayoutTextBank_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[LayoutTextBank] CHECK CONSTRAINT [FK_LayoutTextBank_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_LayoutTextBank_sharedTextBank]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[LayoutTextBank]  WITH CHECK ADD  CONSTRAINT [FK_LayoutTextBank_sharedTextBank] FOREIGN KEY([SharedTextID])
REFERENCES [dbo].[TextBank] ([id])
GO
ALTER TABLE [dbo].[LayoutTextBank] CHECK CONSTRAINT [FK_LayoutTextBank_sharedTextBank]
GO
/****** Object:  ForeignKey [FK_LayoutTextBank_TextBank]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[LayoutTextBank]  WITH CHECK ADD  CONSTRAINT [FK_LayoutTextBank_TextBank] FOREIGN KEY([TextID])
REFERENCES [dbo].[TextBank] ([id])
GO
ALTER TABLE [dbo].[LayoutTextBank] CHECK CONSTRAINT [FK_LayoutTextBank_TextBank]
GO
/****** Object:  ForeignKey [FK_InviteSharePage_DreamLayouts]    Script Date: 10/19/2016 14:58:16 ******/
ALTER TABLE [dbo].[InviteSharePage]  WITH CHECK ADD  CONSTRAINT [FK_InviteSharePage_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[InviteSharePage] CHECK CONSTRAINT [FK_InviteSharePage_DreamLayouts]
GO
