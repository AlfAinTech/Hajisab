USE [15_marc]
GO
/****** Object:  Table [dbo].[BotConversation]    Script Date: 04/18/2017 16:32:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BotConversation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](max) NULL,
	[answer] [nvarchar](max) NOT NULL,
	[functionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_BotConversation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BotConversation] ON
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (1, N'setResponse', N'Asalam o Alaikum , How Can We Help You Planning For Umrah? Yes or No', NULL)
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (2, N'setMonth', N'Which month?', N'getResponse')
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (3, N'setBudget', N' There are pkgs  packages available in Month of get_month Ranging from minRange-maxRange R.s.  , What is Your Budget', N'getMonths')
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (4, N'setNight', N'There are packages with budget_pkg available numbers of nights in your budget. , How many Nights are you Planning?', N'getBudget')
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (5, N'setRating', N'pkgs Packages contain different hotels in your budget., What are your preferred hotel ratings?', N'getNights')
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (6, N'setRoom', N' There are some featured rooms available for get_night  days in your budget. , So which type of room you want?', N'getRatings')
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (7, N'setVisa', N'We have shortlisted count_room packages., You want package with or without visa?', N'getRooms')
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (8, N'setAirlineChk', N' Package are available visaMsg visa for get_night  nights in your Budget., There are Packages with and without Airline ticket. Do you want us to buy air ticket for you?', N'getVisa')
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (9, N'setAirline', N'Which Airline do you prefer?', N'getAirLineChk')
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (10, N'setfeedBack', N' Thank you very much! Here is the package according to your answers.,Are you satisfied with package?', N'getAirLine')
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (11, N'setfeedBack', N'Thank you very much!  Here is the package according to your answers.,Are you satisfied with package?', NULL)
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (12, NULL, N'Thank you very much! Visit again some time.', N'clearSession')
INSERT [dbo].[BotConversation] ([id], [question], [answer], [functionName]) VALUES (13, NULL, N'Thanks for Your feedBack', N'clearSession')
SET IDENTITY_INSERT [dbo].[BotConversation] OFF
