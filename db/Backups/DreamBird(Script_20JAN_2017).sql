USE [master]
GO
/****** Object:  Database [27_dec]    Script Date: 01/20/2017 10:09:29 ******/
CREATE DATABASE [27_dec] ON  PRIMARY 
( NAME = N'27_dec', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\27_dec.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'27_dec_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\27_dec_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [27_dec] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [27_dec].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [27_dec] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [27_dec] SET ANSI_NULLS OFF
GO
ALTER DATABASE [27_dec] SET ANSI_PADDING OFF
GO
ALTER DATABASE [27_dec] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [27_dec] SET ARITHABORT OFF
GO
ALTER DATABASE [27_dec] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [27_dec] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [27_dec] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [27_dec] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [27_dec] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [27_dec] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [27_dec] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [27_dec] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [27_dec] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [27_dec] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [27_dec] SET  DISABLE_BROKER
GO
ALTER DATABASE [27_dec] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [27_dec] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [27_dec] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [27_dec] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [27_dec] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [27_dec] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [27_dec] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [27_dec] SET  READ_WRITE
GO
ALTER DATABASE [27_dec] SET RECOVERY SIMPLE
GO
ALTER DATABASE [27_dec] SET  MULTI_USER
GO
ALTER DATABASE [27_dec] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [27_dec] SET DB_CHAINING OFF
GO
USE [27_dec]
GO
/****** Object:  Table [dbo].[Ziarat]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ziarat] ON
INSERT [dbo].[Ziarat] ([id], [text]) VALUES (1, N'Packag1')
INSERT [dbo].[Ziarat] ([id], [text]) VALUES (2, N'Packag2')
SET IDENTITY_INSERT [dbo].[Ziarat] OFF
/****** Object:  Table [dbo].[VisaPackages]    Script Date: 01/20/2017 10:09:31 ******/
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
 CONSTRAINT [PK_VisaPackages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VisaPackages] ON
INSERT [dbo].[VisaPackages] ([id], [visaTitle], [amount], [issueDate], [expireDate]) VALUES (1, N'Ramzan', 12900, CAST(0x433C0B00 AS Date), CAST(0x353C0B00 AS Date))
INSERT [dbo].[VisaPackages] ([id], [visaTitle], [amount], [issueDate], [expireDate]) VALUES (2, N'Shawaal', 10000, CAST(0x493C0B00 AS Date), CAST(0x673C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[VisaPackages] OFF
/****** Object:  Table [dbo].[TransPort]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TransPort] ON
INSERT [dbo].[TransPort] ([id], [Name]) VALUES (1, N'Lemosine')
SET IDENTITY_INSERT [dbo].[TransPort] OFF
/****** Object:  Table [dbo].[TextBank]    Script Date: 01/20/2017 10:09:31 ******/
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
<div id="blue"><img alt="blue_muffin" src="/Components/MediaBank/Content/Images/Original/27_dec-logo.png" style="border-radius: 50px; width: 100px;" />
<h3>Imran</h3>

<p>Assistant Professor</p>
</div>

<div id="pink"><img alt="light_pink_muffin" src="/Components/MediaBank/Content/Images/Original/27_dec-logo.png" style="width: 100px;" />
<h3>Jahanzaib</h3>

<p>Professor</p>
</div>

<div id="white"><img alt="white_muffin" src="/Components/MediaBank/Content/Images/100x100/27_dec-logo.png" style="width: 100px;" />
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
<div class="col-md-12" style="background-color: #e6e6e6; padding-bottom: 15px; padding-top: 15px;"><img src="/Components/MediaBank/Content/Images/Original/27_dec-logo.png" style="width:100%; padding:5px;" /></div>
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
<h3 style="text-align:center">Pay attention to the details</h3>', 0, N'title_admntutorial')
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
SET IDENTITY_INSERT [dbo].[TextBank] OFF
/****** Object:  Table [dbo].[Tags]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[Tags] ON
INSERT [dbo].[Tags] ([id], [Name]) VALUES (1, N'GRE')
INSERT [dbo].[Tags] ([id], [Name]) VALUES (2, N'IELTS')
INSERT [dbo].[Tags] ([id], [Name]) VALUES (3, N'NCEES')
INSERT [dbo].[Tags] ([id], [Name]) VALUES (4, N'music')
SET IDENTITY_INSERT [dbo].[Tags] OFF
/****** Object:  Table [dbo].[QuizCategories]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuizCategories] ON
INSERT [dbo].[QuizCategories] ([id], [CategoryName]) VALUES (1, N'ECAT')
INSERT [dbo].[QuizCategories] ([id], [CategoryName]) VALUES (2, N'MCAT')
SET IDENTITY_INSERT [dbo].[QuizCategories] OFF
/****** Object:  Table [dbo].[QuestionType]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuestionType] ON
INSERT [dbo].[QuestionType] ([id], [QTypeName], [EditTypeControl], [ViewTypeControl]) VALUES (1, N'MCQ''s', N'Components/QuestionBank/MCQHandler.aspx', N'~/Components/QuestionBank/User/MCQUserView.ascx')
INSERT [dbo].[QuestionType] ([id], [QTypeName], [EditTypeControl], [ViewTypeControl]) VALUES (2, N'FillInBlanks', N'Components/QuestionBank/FillInBlanksHandler.aspx', N'~/Components/QuestionBank/User/FillInBlanksUserView.ascx')
INSERT [dbo].[QuestionType] ([id], [QTypeName], [EditTypeControl], [ViewTypeControl]) VALUES (3, N'ShortQuestions', N'Default', NULL)
INSERT [dbo].[QuestionType] ([id], [QTypeName], [EditTypeControl], [ViewTypeControl]) VALUES (4, N'NewQeustion', N'Components/QuestionBank/FillInBlanksHandler.aspx', NULL)
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
/****** Object:  Table [dbo].[QuestionCategories]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuestionCategories] ON
INSERT [dbo].[QuestionCategories] ([id], [CategoryName]) VALUES (1, N'Math')
INSERT [dbo].[QuestionCategories] ([id], [CategoryName]) VALUES (2, N'SocialStudies')
INSERT [dbo].[QuestionCategories] ([id], [CategoryName]) VALUES (3, N'Physics')
SET IDENTITY_INSERT [dbo].[QuestionCategories] OFF
/****** Object:  Table [dbo].[MediaCategories]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[MediaCategories] ([id], [CategoryName]) VALUES (1, N'Dream Images')
SET IDENTITY_INSERT [dbo].[MediaCategories] OFF
/****** Object:  Table [dbo].[MCQOptions]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MCQOptions] ON
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (1, 4, N'125', 1)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (2, 4, N'120', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (3, 4, N'127', 0)
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
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (23, 9, N'shows that an influx of manpower from Europe was not critical for the survival of the Crusader states', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (24, 9, N'shows that Muslims vastly outnumbered Europeans in the Crusader states', 0)
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
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (36, 8, N'bbb', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (37, 8, N'bbb', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (38, 6, N'ugjk', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (39, 6, N'tfjg', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (40, 19, N'gbh', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (41, 19, N'hb', 0)
INSERT [dbo].[MCQOptions] ([id], [QuestionID], [OptionText], [isCorrect]) VALUES (42, 21, N'l,', 0)
SET IDENTITY_INSERT [dbo].[MCQOptions] OFF
/****** Object:  Table [dbo].[LessonMenu]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (2, N'Progress', 0, 1, 3, 4, N'Progress', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (3, N'Week01', 1, 1, 3, 5, N'Week 01', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (4, N'Video01', 0, 3, 3, 6, N'Video 01', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (5, N'Quiz01', 0, 3, 3, 7, N'Quiz 01', N'user', N'quiz')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (6, N'Reading01', 0, 3, 3, 8, N'Reading', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (7, N'Week02', 1, 1, 3, 9, N'Week 02', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (8, N'Activity01', 0, 7, 3, 10, N'Activity 01', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (9, N'Activity02', 0, 7, 3, 11, N'Activity 02', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (10, N'Acitivity03', 0, 7, 3, 12, N'Activity 03', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (11, N'Lesson1', 0, 1, 13, 14, N'Login', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (12, N'MediaBank', 1, 1, 13, 15, N'Media Bank', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (13, N'MediaSelection', 0, 12, 13, 16, N'Media Selection', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (14, N'Templates', 1, 1, 13, 17, N'Templates', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (15, N'LayoutCreation', 0, 14, 13, 18, N'Layout Creation', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (16, N'AddComponents', 0, 14, 13, 19, N'Adding Components', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (17, N'Components', 1, 1, 13, 20, N'Components', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (18, N'AddNewComponent', 0, 17, 13, 21, N'Add New Component', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (19, N'ComponentList', 0, 17, 13, 22, N'Component List', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (20, N'FileBank', 0, 1, 13, 23, N'File Bank', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (21, N'DreamAdminPanel', 1, 1, 13, 24, N'Dream Admin Panel', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (22, N'DreamPages', 0, 21, 13, 25, N'Dream Pages', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (23, N'PageBuilder', 0, 21, 13, 26, N'Page Design Builder', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (24, N'CreationDefaultDream', 0, 1, 13, 27, N'Creation of Default Dream', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (25, N'CreationSampleDream', 1, 1, 13, 28, N'Creation of Sample Dream', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (26, N'DefaultPage', 0, 25, 13, 29, N'Default Page', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (27, N'DreamMenu', 0, 25, 13, 30, N'Dream Menu', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (28, N'NewsAdminPanel', 1, 1, 13, 31, N'News Admin Panel', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (29, N'AddNews', 0, 28, 13, 32, N'Add News', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (30, N'EditNews', 0, 28, 13, 33, N'Edit News', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (31, N'Week0', 1, 1, 3, 34, N'Week 0', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (32, N'Week03', 0, 1, 3, 35, N'Week 03', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (33, N'Week04', 0, 1, 3, 36, N'Week 04', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (34, N'First', 0, 31, 3, 37, N'First', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (35, N'Second', 0, 31, 3, 38, N'Second', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (36, N'Third', 0, 31, 3, 39, N'Third', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (37, N'Menu1', 1, 1, 43, 44, N'Menu 1', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (38, N'SubMenu1', 0, 37, 43, 45, N'Sub Menu 1', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (39, N'Menu2', 0, 1, 43, 46, N'Menu 2', N'user', N'none')
SET IDENTITY_INSERT [dbo].[LessonMenu] OFF
/****** Object:  Table [dbo].[FileCategories]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlharmainUser]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AlharmainUser] ON
INSERT [dbo].[AlharmainUser] ([id], [Name], [mobileNo], [email], [contect], [city], [province], [adults], [children], [infants]) VALUES (1, N'abc', N'133', N'sssss', N'sc', N'Karachi', N'Sindh', 0, 0, 0)
INSERT [dbo].[AlharmainUser] ([id], [Name], [mobileNo], [email], [contect], [city], [province], [adults], [children], [infants]) VALUES (2, N'nn', N'11', N'bb', N'bb', N'Lahore', N'Punjab', 2, 0, 0)
SET IDENTITY_INSERT [dbo].[AlharmainUser] OFF
/****** Object:  Table [dbo].[AirLine]    Script Date: 01/20/2017 10:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirLine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AirLine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AirLine] ON
INSERT [dbo].[AirLine] ([id], [Name]) VALUES (1, N'flight1')
INSERT [dbo].[AirLine] ([id], [Name]) VALUES (3, N'Air Blue')
SET IDENTITY_INSERT [dbo].[AirLine] OFF
/****** Object:  Table [dbo].[AdminsettingsNewsFeed]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00e15ddc-48b6-400e-9d5a-7dc89cb0cbcd', N'27_decapp@gmail.com', 0, N'AATGX+lfjpsaVLnXP0qyHT0Mha7lqn9iafL3BFkMLKg9/ABQvb52l2mysKEjn0278Q==', N'c6488e26-b8e9-43dc-9024-cb5103fa88c2', NULL, 0, 0, NULL, 0, 0, N'haris')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', N'jahanzaib@uet.edu.pk', 0, N'AJ40ttPY3TVaa9x2eNxehQn04TAZU0mmvPusHUiAH0DjDU2qf+1PvMFZElhKQ6GXaw==', N'e07829c2-821f-480b-bfeb-8b08876b7017', NULL, 0, 0, NULL, 0, 0, N'jahanzaibbabar')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'27_decapp@gmail.com', 0, N'APUlWFqACsVGWmPdPaszKzyXLt6W5w0dlNzr9K68RWh2ZifsNMeNVfUligGx3Bo9ZQ==', N'0d67e239-ce93-4b8c-9c7f-07b6501d4af4', NULL, 0, 0, NULL, 0, 0, N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3c41f5f6-5e0e-488a-b740-cf6732213f49', N'27_decapp@gmail.com', 0, NULL, N'4ccc8deb-0ce0-4e1e-8c0b-00e359e8ba1d', NULL, 0, 0, NULL, 0, 0, N'27_decapp')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'447b2ff1-48a0-4094-ad9f-1a2e8be568ce', N'27_decapp@gmail.com', 0, NULL, N'ab6d6468-2fb7-4d68-8846-f84f79560666', NULL, 0, 0, NULL, 0, 0, N'27_decapps')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'48ff644d-46ef-4412-913e-46994fe283b0', N'saba.akmal@kics.edu.pk', 0, NULL, N'515dded7-7086-4df6-92ee-06db254f3a20', NULL, 0, 0, NULL, 0, 0, N'SabaAkmal')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6a6328ff-530b-40e3-9635-6f040941aa02', N'jahanzaib996@gmail.com', 0, NULL, N'f7c2e612-6cd3-4841-a1fc-357cc40cdd7e', NULL, 0, 0, NULL, 0, 0, N'jzeebe')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8ede996c-fa92-4655-8b91-282af6d3cd49', N'resonotech@gmail.com', 0, NULL, N'76d80ac5-2633-4209-9dae-812e12547b73', NULL, 0, 0, NULL, 0, 0, N'resonotech')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'985d0276-bba6-4d8a-8b02-b8440f3a176e', N'27_decapp@gmail.com', 0, N'AMkcl8XqJLmFMTg6DKzlK0OejsOlYM8Iod19y1mKYU6BMk4fYFkhE1DbmhSVnJ5DRA==', N'f212c614-494a-4cf2-b049-afd18d417e83', NULL, 0, 0, NULL, 0, 0, N'amin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9ec276e3-6ca1-486f-ab56-362b09217745', N'awais.hassan@kics.edu.pk', 0, NULL, N'22d42093-6316-40c0-ba06-c8cf4ec6cdaa', NULL, 0, 0, NULL, 0, 0, N'M.AwaisHassan')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a0e8a11e-0a02-4361-bbc6-cfa8ae2f41ce', N'27_decapp@gmail.com', 0, N'AHJXkje22mOlaB9eXNwRvBSkCGKMW2WjP1QXRLkHQeP7XyKfAiDZwYHOU9qSvazOWg==', N'53c5364d-bdbe-4366-83f2-e2d9bf577339', NULL, 0, 0, NULL, 0, 0, N'asif')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b12ebd32-72e6-4d7d-a544-e1caa179db0a', N'saba.akmal@kics.edu.pk', 0, N'AEJ6Pf9VRet2xNaZCybpNlsV5cpezEjOgLW7Yst3EheqA1QF8kMIt/l2JFfmxuNzpw==', N'f18342a3-c2e6-49ed-a6be-b93dfed0b782', NULL, 0, 0, NULL, 0, 0, N'sabaakmal23')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b3afc247-bd2f-4be2-ab35-6d6a71e17816', N'jahanzaib996@gmail.com', 0, N'AKH4S9FEcExUM6PDNxs0XFSBy34L7SQbnCoFJMVyaUh8qUiWJxMKIjYl6990wUfQ4w==', N'9a78b00f-1f5c-45a8-a4f9-9dbfa84d9841', NULL, 0, 0, NULL, 0, 0, N'jzeebee')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c3b70fc3-2c17-487f-b023-503f5c0232c5', N'october.pink.10@gmail.com', 0, NULL, N'2f31711d-2263-4cfe-82e2-f6e5cb29e92c', NULL, 0, 0, NULL, 0, 0, N'FaizaJahanzaib')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cde4eb97-41d7-4936-84e2-e915ed50e8f0', N'27_decapp@gmail.com', 0, N'AE/Gw7J9eIzUx5I+U0M3aJVFlL9uzUC945VqluOA0+N2J+GOBUVMYYNn2fB/xj7Lhg==', N'c2eef060-807a-4cab-9a8f-bd04aa49adbe', NULL, 0, 0, NULL, 0, 0, N'ali')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e40b58ec-a049-423a-bdb3-ce988352056c', N'saba.akmal@kics.edu.pk', 0, N'AHj9k2dWiNi6pDagyI5V4kN1CJev8oAORsPoAf2jKqSOwcmHZPG0s/Ayb18Zyajzkg==', N'1faed6b0-1812-466f-b37c-d19d25148512', NULL, 0, 0, NULL, 0, 0, N'saba')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'edba741d-aac8-4959-a79c-e18f24f86c87', N'jahanzaib996@gmail.com', 0, NULL, N'55984a33-16d9-44cf-ab9f-c5aa9036ba01', NULL, 0, 0, NULL, 0, 0, N'MuhammadJahanzaib')
/****** Object:  Table [dbo].[DreamType]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DreamType] ON
INSERT [dbo].[DreamType] ([id], [Name], [DetailPath]) VALUES (1, N'BasicDream', NULL)
INSERT [dbo].[DreamType] ([id], [Name], [DetailPath]) VALUES (2, N'UmrahDetail', N'~/UmrahComponents/AdminControls/Packages/PackageDetail.ascx')
SET IDENTITY_INSERT [dbo].[DreamType] OFF
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'271D901E-1B8A-4ADE-92D3-1311C220B571', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'41E87D97-EB5B-481D-BAE4-EF517EA58C8C', N'RegisteredUser')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'B0067FFA-6714-4454-B3BA-920AA78F655C', N'AnonymousUser')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'C3A2048D-D8F2-4951-A4AC-7CC556BC9EAD', N'EnrolledUser')
/****** Object:  Table [dbo].[ClientLayout]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (3, N'DetailLayout', N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <h4 style=''margin: 0;''>Container</h4>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''></div>')
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (4, N'UmrahDetail', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''PackageHeader''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <div class=''btn btn-success col-md-9 sortable ui-sortable'' data-size=''col-md-9'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-9''><div class=''col-md-12 btn btn-warning'' data-name=''umrah detail''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>umrah detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''col-md-3''><div class=''col-md-12 btn btn-warning'' data-name=''discount detail''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>discount detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''content_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (5, N'BookingForm', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''PackageHeader''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
SET IDENTITY_INSERT [dbo].[ClientLayout] OFF
/****** Object:  Table [dbo].[AssignmentCategories]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssignmentCategories] ON
INSERT [dbo].[AssignmentCategories] ([id], [CategoryName]) VALUES (1, N'Physics')
INSERT [dbo].[AssignmentCategories] ([id], [CategoryName]) VALUES (2, N'Chemistry')
INSERT [dbo].[AssignmentCategories] ([id], [CategoryName]) VALUES (3, N'Mathematics')
SET IDENTITY_INSERT [dbo].[AssignmentCategories] OFF
/****** Object:  Table [dbo].[ControlCategory]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (2, N'test', NULL)
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (3, N'test 2', NULL)
SET IDENTITY_INSERT [dbo].[ControlCategory] OFF
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[DynamicLayouts]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[DreamUserProfile]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (2, N'b3afc247-bd2f-4be2-ab35-6d6a71e17816', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (3, N'cde4eb97-41d7-4936-84e2-e915ed50e8f0', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (4, N'985d0276-bba6-4d8a-8b02-b8440f3a176e', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (5, N'a0e8a11e-0a02-4361-bbc6-cfa8ae2f41ce', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (6, N'e40b58ec-a049-423a-bdb3-ce988352056c', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (7, N'b12ebd32-72e6-4d7d-a544-e1caa179db0a', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (8, N'6a6328ff-530b-40e3-9635-6f040941aa02', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (9, N'c3b70fc3-2c17-487f-b023-503f5c0232c5', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (10, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', N'Test', N'BBCS', CAST(0x0000722A00000000 AS DateTime), NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (11, N'8ede996c-fa92-4655-8b91-282af6d3cd49', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (12, N'9ec276e3-6ca1-486f-ab56-362b09217745', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (13, N'00e15ddc-48b6-400e-9d5a-7dc89cb0cbcd', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[DreamUserProfile] OFF
/****** Object:  Table [dbo].[Flight]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Flight] ON
INSERT [dbo].[Flight] ([id], [Name], [departureDate], [returnDate], [fromCity], [destinationCity], [price], [flightType], [airLineID]) VALUES (1, N'pk-123', CAST(0x3F3C0B00 AS Date), CAST(0x313C0B00 AS Date), N'Karachi', N'Jaddah', 586, 2, 1)
INSERT [dbo].[Flight] ([id], [Name], [departureDate], [returnDate], [fromCity], [destinationCity], [price], [flightType], [airLineID]) VALUES (2, N'NL 123', CAST(0x4C3C0B00 AS Date), CAST(0x603C0B00 AS Date), N'Lahore', N'Jeddah', 45000, 2, 3)
SET IDENTITY_INSERT [dbo].[Flight] OFF
/****** Object:  Table [dbo].[Files]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Files] ON
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (1, N'jquery.vticker.min.js', N'/Components/FileBank/Content/.js', NULL, N'.js', CAST(0x0000A6D401719DEC AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (2, N'jquery.carouFredSel-6.0.4-packed.js', N'/Components/FileBank/Content/.js', NULL, N'.js', CAST(0x0000A6D4017C9D1A AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (3, N'ragdoll_rumble.swf', N'/Components/FileBank/Content/.swf', NULL, N'.swf', CAST(0x0000A6D50018EA98 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (4, N'sdf.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D50054694A AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (5, N'Login.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500C3A7F3 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (6, N'MediaBank.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500C4F34B AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (7, N'MediaSelection.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500C5C07B AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (8, N'Templates.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500C651F1 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (9, N'LayoutCreation.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500C71C9A AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (10, N'AddingComponents.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500C7C865 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (11, N'Components.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500C861CF AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (12, N'AddNewComponent.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500C97C05 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (13, N'ComponentList.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500C9EDFB AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (14, N'FileBank.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500CA8E1E AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (15, N'IntroAdminPanel.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500CB6D9D AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (16, N'DreamPages.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500CC2ED0 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (17, N'PageBuilder.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500CCB0E3 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (18, N'CreationDefaultDream.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500CD561F AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (19, N'CreationSampleDream.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500CE3529 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (20, N'CreationLessonMenu.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500CEB7C6 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (21, N'NewsControlPanel.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500CF4806 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (22, N'AddNews.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500CFE278 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (23, N'EditNews.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6D500D059E1 AS DateTime))
INSERT [dbo].[Files] ([id], [name], [path], [FileCategory_ID], [FileType], [DateAdded]) VALUES (24, N'thai.pdf', N'/Components/FileBank/Content/.pdf', NULL, N'.pdf', CAST(0x0000A6E10109F141 AS DateTime))
SET IDENTITY_INSERT [dbo].[Files] OFF
/****** Object:  Table [dbo].[AssignmentBank]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssignmentBank] ON
INSERT [dbo].[AssignmentBank] ([id], [Name], [Description], [FileStorageDirectory], [CategoryID]) VALUES (1, N'Momentum', N'Write the definition of Momentum', N'~/Components/Assignments/Content/Files/Momentum/', 1)
SET IDENTITY_INSERT [dbo].[AssignmentBank] OFF
/****** Object:  Table [dbo].[DreamTags]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (34, 4, 1)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (35, 4, 2)
INSERT [dbo].[DreamTags] ([id], [Dream_id], [Tag_id]) VALUES (36, 4, 3)
SET IDENTITY_INSERT [dbo].[DreamTags] OFF
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Facebook', N'1279151828792833', N'6a6328ff-530b-40e3-9635-6f040941aa02')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Facebook', N'1772561323009364', N'c3b70fc3-2c17-487f-b023-503f5c0232c5')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'106503808014110465900', N'8ede996c-fa92-4655-8b91-282af6d3cd49')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'115983989610436776729', N'9ec276e3-6ca1-486f-ab56-362b09217745')
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[MediaItems]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (3, N'asplogo-square.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6C600EFE385 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (4, N'imgres.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400CBF11A AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (5, N'images.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400CCF509 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (6, N'image.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400CE1863 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (7, N'im.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400CEB3E2 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (8, N'video.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D400E9FF81 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (9, N'videosone.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400EA4BF8 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (10, N'check-tick-icon-25.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400EA8B53 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (11, N'sharing-music-on-music-paradise.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400EA9E96 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (12, N'search-text-512.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400EAC1E2 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (13, N'activation.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400EB22E4 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (14, N'enrollment.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400EB606A AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (15, N'direction.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400EBF231 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (16, N'profile-icon-28.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400EC3B26 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (17, N'activity_grid1600.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400ED3607 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (18, N'27_dec-logo.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D4004C9D03 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (19, N'News Icon.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400548B25 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (20, N'uet.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D40057D234 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (21, N'COL9-6.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D40058E8D8 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (22, N'content-tree-94741.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D4005A302A AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (23, N'GRE.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D4005B61D6 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (24, N'GRE.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D4005B6FD6 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (25, N'CRE-icon-square_0.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D4005BB189 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (26, N'GRE.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D4005BDDA8 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (27, N'Picture1.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D4005BEE0A AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (28, N'uet.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D4005C975E AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (29, N'lums.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D4005D4C12 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (30, N'Picture1.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D4005D633D AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (31, N'text_document_complete-512.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400605078 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (32, N'file-share-_-_-512.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400614C61 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (33, N'uet.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D400621C9D AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (34, N'uet.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D400627420 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (35, N'SummaryIcon.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400660947 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (36, N'UET.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D400672330 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (37, N'uet.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D400676322 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (38, N'34 - Query Parameters Solution.mp4', N'/Components/MediaBank/Content/Video', 1, N'video', CAST(0x0000A6D4016D84A7 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (39, N'icon-ecommunications.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D4016EEE4C AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (40, N'video1.mp4', N'/Components/MediaBank/Content/Video', 1, N'video', CAST(0x0000A6D4016F0908 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (41, N'uet.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D4016F5646 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (42, N'UET Lahore.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D6002A95BA AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (43, N'uet_et.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D6005C3671 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (44, N'success_sum.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D6005CE3CA AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (45, N'success_abd.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D6005DF5E0 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (46, N'grebooks.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D60062BDEA AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (47, N'cnAsVm.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D600657245 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (48, N'success.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D60066DF97 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (49, N'nust-university-islamabad.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D600771F5A AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (50, N'campus1.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D600788885 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (51, N'PU-Fee-Structure-2016.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D600792051 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (52, N'understandislam.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D6007C0AF0 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (53, N'ncees.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D70042C016 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (54, N'ETS_TOEFL_iBT_310.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D700430457 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (55, N'ielts.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D700432068 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (56, N'WPoeWnSt.jpeg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6D7004342AB AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (57, N'content.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6E100FCF434 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (58, N'content.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6E100FD2165 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (59, N'Untitled-3.gif', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6E101035E63 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (60, N'3.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6E5018A421A AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (61, N'chem.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6E5018A63DE AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (62, N'physics.gif', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6E60000FC95 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (63, N'mnabvi.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6F200976FEE AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (64, N'mnabvi.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6F2009772DC AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (65, N'khana_kaba.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6F200979EBB AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (66, N'pkg-3.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6F20097B3E7 AS DateTime))
SET IDENTITY_INSERT [dbo].[MediaItems] OFF
/****** Object:  Table [dbo].[LessonMenuAvailability]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[LessonMenuAvailability] ON
INSERT [dbo].[LessonMenuAvailability] ([id], [MenuID], [AvailableFrom], [DeadLine], [TimeLimit], [EnableAvailability], [EnableDeadLine], [EnableTimeLimit]) VALUES (1, 31, CAST(0x0000A68100000000 AS DateTime), CAST(0x0000A6D200000000 AS DateTime), 0, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[LessonMenuAvailability] OFF
/****** Object:  Table [dbo].[QuestionSubCategories]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuestionSubCategories] ON
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (1, 1, N'Al-Jebra')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (2, 1, N'Trigonometery')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (3, 1, N'Unit Conversion')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (4, 2, N'National')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (5, 2, N'International')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (6, 3, N'Momentum')
INSERT [dbo].[QuestionSubCategories] ([id], [CategoryID], [SubCategoryName]) VALUES (7, 3, N'Velocity')
SET IDENTITY_INSERT [dbo].[QuestionSubCategories] OFF
/****** Object:  Table [dbo].[TextBankTag]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[UserLessonProgress]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[UserLessonProgress] ON
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (1, 5, N'8ede996c-fa92-4655-8b91-282af6d3cd49', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (2, 6, N'8ede996c-fa92-4655-8b91-282af6d3cd49', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (3, 5, N'9ec276e3-6ca1-486f-ab56-362b09217745', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (4, 5, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (5, 6, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (6, 4, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (7, 34, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (8, 32, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', 100)
SET IDENTITY_INSERT [dbo].[UserLessonProgress] OFF
/****** Object:  Table [dbo].[VideoTranscript]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[VideoTranscript] ON
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (1, 38, CAST(1.00 AS Decimal(18, 2)), N'Contrary to popular belief')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (2, 38, CAST(2.00 AS Decimal(18, 2)), N'Lorem Ipsum is not simply random text')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (3, 40, CAST(1.00 AS Decimal(18, 2)), N'There are many variations of passages')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (4, 40, CAST(2.00 AS Decimal(18, 2)), N'Lorem Ipsum available, ')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (5, 40, CAST(3.00 AS Decimal(18, 2)), N'but the majority have suffered')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (6, 40, CAST(4.00 AS Decimal(18, 2)), N'alteration in some form,')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (7, 40, CAST(4.00 AS Decimal(18, 2)), N'by injected humour,')
SET IDENTITY_INSERT [dbo].[VideoTranscript] OFF
/****** Object:  Table [dbo].[QuizBank]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuizBank] ON
INSERT [dbo].[QuizBank] ([id], [Name], [Description], [Categoryid], [MediaItemID]) VALUES (1, N'New Quiz for ECAT', N'New Quiz', 1, 13)
INSERT [dbo].[QuizBank] ([id], [Name], [Description], [Categoryid], [MediaItemID]) VALUES (2, N'Quiz2', N'tbg', 2, 13)
INSERT [dbo].[QuizBank] ([id], [Name], [Description], [Categoryid], [MediaItemID]) VALUES (3, N'quiz2', N'tgvf', 1, 13)
INSERT [dbo].[QuizBank] ([id], [Name], [Description], [Categoryid], [MediaItemID]) VALUES (4, N'quiz2', N'tgvf', 1, 13)
INSERT [dbo].[QuizBank] ([id], [Name], [Description], [Categoryid], [MediaItemID]) VALUES (5, N'quiz2', N'tgvf', 1, 13)
INSERT [dbo].[QuizBank] ([id], [Name], [Description], [Categoryid], [MediaItemID]) VALUES (6, N'quiz2', N'hgbv', 1, 47)
INSERT [dbo].[QuizBank] ([id], [Name], [Description], [Categoryid], [MediaItemID]) VALUES (7, N'quiz2', N'gfdc', 1, 21)
INSERT [dbo].[QuizBank] ([id], [Name], [Description], [Categoryid], [MediaItemID]) VALUES (8, N'jm', N'ngbv ', 1, 17)
SET IDENTITY_INSERT [dbo].[QuizBank] OFF
/****** Object:  Table [dbo].[Package]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Package] ON
INSERT [dbo].[Package] ([id], [name], [description], [startDate], [duration], [mediaID]) VALUES (1, N'pkg1', N'    		fvc', CAST(0x3D3C0B00 AS Date), 0, 66)
INSERT [dbo].[Package] ([id], [name], [description], [startDate], [duration], [mediaID]) VALUES (2, N'pkg2', N'    		n', CAST(0x413C0B00 AS Date), 4, 65)
INSERT [dbo].[Package] ([id], [name], [description], [startDate], [duration], [mediaID]) VALUES (3, N'pkg3', N'    		', CAST(0x313C0B00 AS Date), 6, 59)
INSERT [dbo].[Package] ([id], [name], [description], [startDate], [duration], [mediaID]) VALUES (4, N'pkg4', N'    		', CAST(0x483C0B00 AS Date), 4, 66)
INSERT [dbo].[Package] ([id], [name], [description], [startDate], [duration], [mediaID]) VALUES (5, N'pkg5', N'    		', CAST(0x3D3C0B00 AS Date), 3, 66)
INSERT [dbo].[Package] ([id], [name], [description], [startDate], [duration], [mediaID]) VALUES (6, N'pkg6', N'    		', CAST(0x593C0B00 AS Date), 7, 63)
INSERT [dbo].[Package] ([id], [name], [description], [startDate], [duration], [mediaID]) VALUES (7, N'Pkg7', N'    		rf', CAST(0x5A3C0B00 AS Date), 4, 51)
SET IDENTITY_INSERT [dbo].[Package] OFF
/****** Object:  Table [dbo].[News]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (1, N'Start your GRE Preparation                        ', N'The Graduate Record Examination (GRE) is a standardized test that is an admissions requirement for most Graduate Schools in the United States.[7] Created and administered by the Educational Testing Service (ETS) in 1949,[8] the exam aims to measure verbal reasoning, quantitative reasoning, analytical writing, and critical thinking skills that have been acquired over a long period of learning and that are not entirely based on any specific field of study outside of the GRE itself. The GRE General Test is offered as a computer-based exam administered at Prometric testing centers.', CAST(0x303C0B00 AS Date), CAST(0x393C0B00 AS Date), 1, 1, CAST(0x313C0B00 AS Date), 0, 46, N'national       ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (2, N'Start GMAT Preparation Now!                       ', N'The Graduate Management Admission Test (GMAT (/''d?i?mæt/ (jee-mat))) is a computer adaptive test (CAT) intended to assess certain analytical, writing, quantitative, verbal, and reading skills in written English for use in admission to a graduate management program, such as an MBA. It requires knowledge of certain grammar and knowledge of certain algebra, geometry, and arithmetic. The GMAT does not measure business knowledge or skill, nor does it measure intelligence. According to the test owning company, the Graduate Management Admission Council (GMAC), the GMAT assesses analytical writing and problem-solving abilities, while also addressing data sufficiency, logic, and critical reasoning skills that it believes to be vital to real-world business and management success. It can be taken up to five times a year. Each attempt must be at least 16 days apart', CAST(0x313C0B00 AS Date), CAST(0x473C0B00 AS Date), 0, 1, CAST(0x313C0B00 AS Date), 0, 44, N'national       ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (3, N'IELTS                                             ', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', CAST(0x303C0B00 AS Date), CAST(0x473C0B00 AS Date), 0, 1, CAST(0x323C0B00 AS Date), 0, 55, N'national       ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (4, N'Success Story                                     ', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

', CAST(0x303C0B00 AS Date), CAST(0x463C0B00 AS Date), 1, 1, CAST(0x313C0B00 AS Date), 0, 45, N'international  ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (5, N'Dream Big                                         ', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', CAST(0x2F3C0B00 AS Date), CAST(0x483C0B00 AS Date), 1, 1, CAST(0x313C0B00 AS Date), 0, 47, N'national       ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (6, N'How to be Successful?                             ', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).

', CAST(0x303C0B00 AS Date), CAST(0x483C0B00 AS Date), 1, 1, CAST(0x313C0B00 AS Date), 0, 48, N'international  ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (7, N'Preparing for NCEES?                              ', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', CAST(0x313C0B00 AS Date), CAST(0x473C0B00 AS Date), 1, 1, CAST(0x323C0B00 AS Date), 0, 53, N'national       ')
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id], [Category]) VALUES (8, N'Appear in GRE                                     ', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', CAST(0x313C0B00 AS Date), CAST(0x483C0B00 AS Date), 0, 1, CAST(0x323C0B00 AS Date), 0, 30, N'national       ')
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  Table [dbo].[MediaTags]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[QuestionBank]    Script Date: 01/20/2017 10:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionBank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NULL,
	[Level] [decimal](18, 3) NULL,
	[CategoryID] [int] NULL,
	[SubCategoryID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuestionBank] ON
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (4, 1, N'Find the greatest number which on dividing 1657 and 2037 leaves remainders 6 and 5 respectively.', CAST(25.000 AS Decimal(18, 3)), 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (5, 1, N'Seats for Mathematics, Physics and Biology in a school are in the ratio 5 : 7 : 8. There is a proposal to increase these seats by 40%, 50% and 75% respectively. What will be the ratio of increased seats?', CAST(1.000 AS Decimal(18, 3)), 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (6, 1, N'If log10 2 = 0.3010, the value of log10 80 is:', CAST(1.000 AS Decimal(18, 3)), 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (7, 1, N'When iron pyrite (FeS2) is heated in air, the process known as &quot;roasting&quot; forms sulfur dioxide and iron(III) oxide. When the equation for this process is completed and balanced, using the smallest whole number coefficients, what is the coefficient for &quot;O2&quot;?&nbsp;<br />
&nbsp; &nbsp; FeS2 + &nbsp;O2 --&gt; &nbsp; SO2 + &nbsp;Fe2O3', CAST(1.000 AS Decimal(18, 3)), 1, 2)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (8, 1, N'Balance the following equation with the smallest whole number coefficients. Choose the answer that is the sum of the coefficients in the balanced equation. Do not forget coefficients of &quot;one.&quot;&nbsp;<br />
&nbsp; &nbsp;Cr2(SO4)3 + RbOH --&gt; &nbsp;Cr(OH)3 + Rb2SO4', CAST(2.000 AS Decimal(18, 3)), 1, 2)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (9, 1, N'<p>Passage 1</p>

<p>&nbsp; &nbsp;Whenever I visited Jerusalem, I always entered the al-Aqsa Mosque, beside which stood a small mosque which the Franks had converted into a church.... [T]he Templars, ... who were my friends, would evacuate the little adjoining mosque so that I could pray in it.</p>

<p>&nbsp; &nbsp;Usamah ibn Munqidh, Muslim historian, Jerusalem, circa 1138</p>

<p>&nbsp; &nbsp;Passage 2</p>

<p>&nbsp; &nbsp;The Crusader states were able to cling to survival only through frequent delivery of supplies and manpower from Europe.</p>

<p>&nbsp; &nbsp;[They] were defended primarily by three semi-monastic military orders: the Templars, the Hospitallers, and the Teutonic Knights. Combining monasticism and militarism, these orders served to protect pilgrims and to wage perpetual war against the Muslims.</p>

<p>&nbsp; &nbsp;Palmira Brummett, world historian, 2007</p>

<p><br />
&nbsp; &nbsp;The second passage does not support the first passage because the second passage</p>
', CAST(1.000 AS Decimal(18, 3)), 2, 4)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (10, 1, N'0.5 mole of each of H<sub>2</sub>, SO<sub>2</sub>&nbsp;and CH<sub>4</sub>&nbsp;are kept in a container. A hole was made in the container. After 3 hours, the order of partial pressures in the container will be', CAST(1.000 AS Decimal(18, 3)), 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (11, 1, N'The teacher has arranged a meeting with Tim&rsquo;s mother to discuss these concerns. Which of the following statements is best for the teacher to say to Tim&rsquo;s mother?', CAST(1.000 AS Decimal(18, 3)), 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (12, 1, N'Which of the following biphenyls is optically active<strong>?</strong>', CAST(1.000 AS Decimal(18, 3)), 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (13, 1, N'A car has a linear velocity v on a circular track of radius r. If its speed is increasing at a rate of a m/s<sup>2</sup>, then its resultant acceleration will be', CAST(1.000 AS Decimal(18, 3)), 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (14, 2, N'This is my textarea to be replaced Editor.', CAST(3.000 AS Decimal(18, 3)), 2, 5)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (15, 2, N'This is my textarea to be replaced Editor.', CAST(4.000 AS Decimal(18, 3)), 2, 5)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (16, 2, N'This is my textarea to be replaced Editor.', CAST(4.000 AS Decimal(18, 3)), 2, 5)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (17, 2, N'This is my textarea to be replaced Editor.', CAST(1.000 AS Decimal(18, 3)), 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (18, 2, N'This is my textarea to be replaced Editor.', CAST(4.000 AS Decimal(18, 3)), 2, 5)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (19, 1, N'gvf', CAST(1.000 AS Decimal(18, 3)), 2, 5)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (20, 2, N'This is my textarea to be replaced Editor.', CAST(1.000 AS Decimal(18, 3)), 1, 1)
INSERT [dbo].[QuestionBank] ([id], [TypeID], [QuestionText], [Level], [CategoryID], [SubCategoryID]) VALUES (21, 1, N'This is my textarea to be replaced Editor.', CAST(1.000 AS Decimal(18, 3)), 2, 5)
SET IDENTITY_INSERT [dbo].[QuestionBank] OFF
/****** Object:  Table [dbo].[DreamMessages]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[Dreams]    Script Date: 01/20/2017 10:09:31 ******/
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
	[dreamTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Dreams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Dreams] ON
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (1, N'Test dream', 10, N'This is a dream.', 1, 1, 1, 10, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (2, N'TOEFL', 54, N'TOEFL', 1, 0, 1, 40, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (3, N'AdminTutorial', 47, N'یہ ٹیوٹوریل ایک کورس منظم کرنے کے لئے تمام ضروری اقدامات ایڈمنسٹریٹرکو سکھانے گا', 0, 0, 1, 0, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (4, N'IELTS', 3, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, 1, 100, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (5, N'SAT', 56, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, 1, 60, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (6, N'NCEES', 53, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, 1, 190, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (7, N'GRE', 30, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, 1, 230, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (8, N'Islam', 52, N'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ .إِنَّكَ حَمِيدٌ مَجِيدٌ اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ، ...', 0, 0, 1, 218, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (9, N'GMAT', 36, N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 0, 0, 1, 45, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (10, N'Test', 25, N'', 0, 0, 1, 10, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (11, N'Home', 13, N'', 0, 0, 1, 0, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (12, N'UmrahComponent', 66, N'', 0, 0, 1, 3, 2)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (14, N'UmrahComponent1', 66, N'', 0, 0, 1, 3, 2)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (15, N'mydreamUmrah', 66, N'', 0, 0, 1, 3, 2)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (16, N'umrahcontrol', 64, N'', 0, 0, 1, 2, 2)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (17, N'umrahcontrol1', 66, N'', 1, 0, 1, 0, 2)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (18, N'bb', 66, N'', 0, 0, 1, 0, 2)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (19, N'umrah tour', 66, N'', 0, 0, 1, 0, 2)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (20, N'newumrahpkg', 66, N'', 1, 0, 1, 0, 2)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (21, N'myumrahpkg', 66, N'', 0, 0, 1, 0, 2)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (22, N'myumrah', 66, N'', 0, 0, 1, 0, 2)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished], [LikeSeed], [dreamTypeID]) VALUES (23, N'comp1', 66, N'', 0, 0, 1, 0, 2)
SET IDENTITY_INSERT [dbo].[Dreams] OFF
/****** Object:  Table [dbo].[Hotel]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[Hotel] ON
INSERT [dbo].[Hotel] ([id], [hotelName], [description], [rating], [distance], [mediaID]) VALUES (1, N'hotel1', N'    		fvc', 3, 0, 65)
INSERT [dbo].[Hotel] ([id], [hotelName], [description], [rating], [distance], [mediaID]) VALUES (2, N'hotel2', N'      fvc', 1, 0, 63)
INSERT [dbo].[Hotel] ([id], [hotelName], [description], [rating], [distance], [mediaID]) VALUES (3, N'Hilton', N'    		', 5, 200, 65)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
/****** Object:  Table [dbo].[Controls]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (1, 1, N'Top Menu Bar', 4, N'xyz', N'~/Components/TopNav/TopNavAnonymous.ascx', N'/Components/TextBank/SuperAdminTextBank.aspx', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (2, 1, N'Lesson Menu', 22, N'xyz', N'~/Components/LessonMenu/LessonMenuManager.ascx', N'/Components/LessonMenu/LessonMenuAdminPage.aspx', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (3, 1, N'Progress DashBoard', 5, N'xyz', N'~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx', N'/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (4, 1, N'Multimedia Control', 10, N'xyz', N'~/Components/LessonBank/Lesson/LessonMultiMedia.ascx', N'null', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (5, 1, N'Quiz', 7, N'xyz', N'~/Components/QuizBank/User/QuizView.ascx', N'/Components/QuizBank/QuizBankAdmin.aspx', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (6, 1, N'video Control', 9, N'xyz', N'~/Components/LessonBank/Lesson/LessonVideo.ascx', N'/LessonVideoAdminPage.aspx', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (17, 1, N'Dream Enrollment', 14, N'xyz', N'~/Components/DreamEnrollment/DreamEnroll.ascx', N'null', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (18, 1, N'Custom Text Bank', 31, N'xyz', N'~/Components/TextBank/TextBankView.ascx', N'/Components/TextBank/CustomAdminPage.aspx', 1, N'/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (19, 1, N'Shared TextBank', 32, N'xyz', N'~/Components/TextBank/TextBankView.ascx', N'/Components/TextBank/SharedTextBankPage.aspx', 0, N'/Components/TextBank/SharedTextBank/DeleteSharedTextBank.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (20, 1, N'Dream Content Summary', 35, N'xyz', N'~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx', N'null', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (21, 1, N'Footer', 3, N'xyz', N'~/Components/Footer/FooterControl.ascx', N'null', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (22, 1, N'Navigation', 15, N'xyz', N'~/Components/NAV_General/NavigationView.ascx', N'/Components/NAV_General/NavigationAdminPage.aspx', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (24, 1, N'useractivation', 13, N'xyz', N'~/Components/Account/UserActivation.ascx', N'null', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (25, 1, N'Dream Profile', 16, N'xyz', N'~/Components/DreamProfile/DreamProfileView.ascx', N'null', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (26, 1, N'Share', 11, N'xyz', N'~/Components/Account/InviteShare.ascx', N'~/Components/Account/InviteshareAdminpage.ascx', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (27, 1, N'Dreamview', 17, N'xyz', N'~/Components/Dreams/DreamView.ascx', N'null', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (30, 1, N'Search', 12, N'xyz', N'~/Components/Header/SearchWithHeader.ascx', N'null', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (31, 1, N'Related Dreams', 25, N'xyz', N'~/Components/Dreams/RelatedDreams.ascx', N'null', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (32, 1, N'Featured Dreams', 10, N'Featured Dreams', N'~/Components/Dreams/FeatureDreams.ascx', N'~/Components/Dreams/FeatureDreams.ascx', 0, N'.')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (33, 1, N'General News ', 19, N'General News', N'~/Components/News/NewControls/GeneralNewsView.ascx', N'~/Components/News/NewControls/GeneralNewsView.ascx', 0, N'null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (34, 1, N'Register Email', 39, N'Register Email', N'~/Components/Account/RegisterEmail.ascx', N'~/Components/Account/RegisterEmail.ascx', 0, N'.null')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (35, 1, N'Assignment', 32, N'Assignment', N'~/Components/Assignments/AssignmentUserView.ascx', N'/Components/Assignments/AssignmentAdmin.aspx', 1, N'.')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (39, 2, N'UmrahList', 32, N'abc', N'~/UmrahComponents/PackageComponent/PackageListView.ascx', N'~/UmrahComponents/PackageComponent/PackageListView.ascx', 1, N'.')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (40, 2, N'Bookinform', 47, N'hbkj', N'~/UmrahComponents/PackageComponent/BookingForm.ascx', N'~/UmrahComponents/PackageComponent/BookingForm.ascx', 0, N'abc')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (41, 2, N'PackageHeader', 15, N'vvv', N'~/UmrahComponents/headerFooter/Packageheader.ascx', N'~/UmrahComponents/headerFooter/Packageheader.ascx', 0, N'vvv')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (42, 2, N'pkg footer', 22, N'vv', N'~/UmrahComponents/headerFooter/PackageFooter.ascx', N'~/UmrahComponents/headerFooter/PackageFooter.ascx', 0, N'vv')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (43, 2, N'umrah detail', 25, N'vv', N'~/UmrahComponents/PackageComponent/PackagePageDetail.ascx', N'~/UmrahComponents/PackageComponent/PackagePageDetail.ascx', 0, N'cc')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (44, 2, N'discount detail', 5, N'vv', N'~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx', N'~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx', 0, N'vv')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath]) VALUES (45, 2, N'searchUmrahComponent', 4, N'abc', N'~/UmrahComponents/PackageComponent/DetailSearch.ascx', N'~/UmrahComponents/PackageComponent/DetailSearch.ascx', 0, N'123')
SET IDENTITY_INSERT [dbo].[Controls] OFF
/****** Object:  Table [dbo].[DreamUserLikes]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (14, 2, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (21, 4, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab')
SET IDENTITY_INSERT [dbo].[DreamUserLikes] OFF
/****** Object:  Table [dbo].[ClientPage]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[ClientPage] ON
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (1, 1, N'Default', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/SuperAdminTextBank.aspx?DID=1&PID=1&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.comnull?DID=1&PID=1&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Search''><a href=''http://s19390994.onlinehome-server.comnull?DID=1&PID=1&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Search</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl2'' data-remove="http://s19390994.onlinehome-server.comnull?DID=1&PID=1&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Featured Dreams''><a href=''http://s19390994.onlinehome-server.com~/Components/Dreams/FeatureDreams.ascx?DID=1&PID=1&CID=BaseDreamControl3'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Featured Dreams</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237.?DID=1&amp;PID=1&amp;CID=BaseDreamControl3'' data-remove="http://s19390994.onlinehome-server.com.?DID=1&PID=1&CID=BaseDreamControl3"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12 featured_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Dreamview''><a href=''http://s19390994.onlinehome-server.comnull?DID=1&PID=1&CID=BaseDreamControl4'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dreamview</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl4'' data-remove="http://s19390994.onlinehome-server.comnull?DID=1&PID=1&CID=BaseDreamControl4"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12 content_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-7''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-8''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-8'' value=''''><input type=''hidden'' id=''hidden-class-sortable-8'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''General News ''><a href=''http://s19390994.onlinehome-server.com~/Components/News/NewControls/GeneralNewsView.ascx?DID=1&PID=1&CID=BaseDreamControl5'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>General News </h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237..?DID=1&amp;PID=1&amp;CID=BaseDreamControl5'' data-remove="http://s19390994.onlinehome-server.comnull?DID=1&PID=1&CID=BaseDreamControl5"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-7'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-7'' value=''col-md-12 news_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-11''>
    
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-12''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-12'' value=''''><input type=''hidden'' id=''hidden-class-sortable-12'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''footer''><a href=''http://s19390994.onlinehome-server.comnull?DID=1&PID=1&CID=BaseDreamControl6'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.comnull?DID=1&PID=1&CID=BaseDreamControl6"></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-11'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-11'' value=''col-md-12 footer_wrapper''></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (2, 2, N'Default', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/SuperAdminTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=2&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.comnull?DID=2&PID=2&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding:0; background-position: center top 0px;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12 main_image_gre''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl2'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl2'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl3'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl3'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl3"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding:0; padding-top:30px; padding-bottom:30px;''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12 featured_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    <div class=''btn btn-success col-md-8 sortable ui-sortable'' data-size=''col-md-8'' style=''display: block; margin: 0px;'' id=''sortable-8''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-8'' value=''''><input type=''hidden'' id=''hidden-class-sortable-8'' value=''col-md-8''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://s19390994.onlinehome-server.com/LessonVideoAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl4'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=2&amp;CID=BaseDreamControl4'' data-remove="http://s19390994.onlinehome-server.comnull?DID=2&PID=2&CID=BaseDreamControl4"></span></div></div><div class=''btn btn-success col-md-4 sortable ui-sortable'' data-size=''col-md-4'' style=''display: block; margin: 0px;'' id=''sortable-7''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-7'' value=''margin-top:35px;''><input type=''hidden'' id=''hidden-class-sortable-7'' value=''col-md-4''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Content Summary''><a href=''http://s19390994.onlinehome-server.comnull?DID=2&PID=2&CID=BaseDreamControl5'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Content Summary</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=2&amp;CID=BaseDreamControl5'' data-remove="http://s19390994.onlinehome-server.comnull?DID=2&PID=2&CID=BaseDreamControl5"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''container''></div>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-9''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-10''>
    
    <div class=''btn btn-success col-md-8 sortable ui-sortable'' data-size=''col-md-8'' style=''display: block; margin: 0px;'' id=''sortable-12''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-12'' value=''''><input type=''hidden'' id=''hidden-class-sortable-12'' value=''col-md-8''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl6'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl6'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl6"></span></div></div><div class=''btn btn-success col-md-4 sortable ui-sortable'' data-size=''col-md-4'' style=''display: block; margin: 0px;'' id=''sortable-11''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-11'' value=''''><input type=''hidden'' id=''hidden-class-sortable-11'' value=''col-md-4''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://s19390994.onlinehome-server.comnull?DID=2&PID=2&CID=BaseDreamControl7'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=2&amp;CID=BaseDreamControl7'' data-remove="http://s19390994.onlinehome-server.comnull?DID=2&PID=2&CID=BaseDreamControl7"></span></div><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl8'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl8'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl8"></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-10'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-10'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-10'' value=''''><input type=''hidden'' id=''hidden-class-sortable-10'' value=''container''></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-9'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-9'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-9'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-9'' value=''col-md-12''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-13''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-14''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-14'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-14'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-14'' value=''''><input type=''hidden'' id=''hidden-class-sortable-14'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl9'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl9'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl9"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-13'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-13'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-13'' value=''''><input type=''hidden'' id=''hidden-class-sortable-13'' value=''col-md-12''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-15''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-16''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-16'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-16'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-16'' value=''padding:15px;''><input type=''hidden'' id=''hidden-class-sortable-16'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=2&PID=2&CID=BaseDreamControl10'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&amp;PID=2&amp;CID=BaseDreamControl10'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=2&PID=2&CID=BaseDreamControl10"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-15'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-15'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-15'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-15'' value=''col-md-12 news_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-17''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-18''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-18'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-18'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-18'' value=''''><input type=''hidden'' id=''hidden-class-sortable-18'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Footer''><a href=''http://s19390994.onlinehome-server.comnull?DID=2&PID=2&CID=BaseDreamControl11'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=2&amp;PID=2&amp;CID=BaseDreamControl11'' data-remove="http://s19390994.onlinehome-server.comnull?DID=2&PID=2&CID=BaseDreamControl11"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-17'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-17'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-17'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-17'' value=''col-md-12 footer_wrapper''></div>')
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
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/SuperAdminTextBank.aspx?DID=3&PID=13&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.comnull?DID=3&PID=13&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=13&CID=BaseDreamControl2'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=13&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Lesson Menu''><a href=''http://s19390994.onlinehome-server.com/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=3&PID=13&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>Lesson Menu</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.comnull?DID=3&PID=13&CID=BaseDreamControl3"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (12, 3, N'Lesson1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=14&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''="" return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=14&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=14&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (13, 3, N'MediaBank', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=15&CID=BaseDreamControl1'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&amp;PID=15&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=15&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (14, 3, N'MediaSelection', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=16&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=16&CID=BaseDreamControl1"></span></div></div>')
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
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=23&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=23&CID=BaseDreamControl1"></span></div></div>')
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
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=3&PID=27&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=3&PID=27&CID=BaseDreamControl1"></span></div></div>')
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
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (35, 5, N'satphys', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Quiz''><a href=''http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=5&PID=41&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Quiz</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=5&amp;PID=41&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=5&PID=41&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (36, 10, N'Sample', N' <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/SuperAdminTextBank.aspx?DID=10&PID=42&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=10&amp;PID=42&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.comnull?DID=10&PID=42&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding:0; background-position: center top 0px;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12 main_image_gre''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=10&PID=42&CID=BaseDreamControl2'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left=''20,top=20,width=500,height=500,toolbar=1,resizable=0'' );''='''' return='''' false;''='''' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&amp;PID=42&amp;CID=BaseDreamControl2'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&PID=42&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    <div class=''btn btn-success col-md-8 sortable ui-sortable'' data-size=''col-md-8'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-8''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://s19390994.onlinehome-server.com/LessonVideoAdminPage.aspx?DID=10&PID=42&CID=BaseDreamControl3'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=10&amp;PID=42&amp;CID=BaseDreamControl3'' data-remove="http://s19390994.onlinehome-server.comnull?DID=10&PID=42&CID=BaseDreamControl3"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><div class=''btn btn-success col-md-4 sortable ui-sortable'' data-size=''col-md-4'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''col-md-4''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=10&PID=42&CID=BaseDreamControl4'' target=''_blank'' onclick=''window.open(this.href, '' mywin'',''left="20,top=20,width=500,height=500,toolbar=1,resizable=0'');" return="" false;''="" target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&amp;PID=42&amp;CID=BaseDreamControl4'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&PID=42&CID=BaseDreamControl4"></span></div></div><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''container''></div>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12 content_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-7''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-8''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-8'' value=''''><input type=''hidden'' id=''hidden-class-sortable-8'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/CustomAdminPage.aspx?DID=10&PID=42&CID=BaseDreamControl5'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com/Components/TextBank/CustomTextBank/DeleteCustomTextBank.aspx?DID=10&PID=42&CID=BaseDreamControl5"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-7'' value=''''><input type=''hidden'' id=''hidden-class-sortable-7'' value=''col-md-12''></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (37, 10, N'Default', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/SuperAdminTextBank.aspx?DID=10&PID=43&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=10&amp;PID=43&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.comnull?DID=10&PID=43&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Lesson Menu''><a href=''http://s19390994.onlinehome-server.com/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=10&PID=43&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Lesson Menu</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=10&amp;PID=43&amp;CID=BaseDreamControl2'' data-remove="http://s19390994.onlinehome-server.comnull?DID=10&PID=43&CID=BaseDreamControl2"></span></div><div class=''col-md-12 btn btn-warning'' data-name=''Share''><a href=''http://s19390994.onlinehome-server.com~/Components/Account/InviteshareAdminpage.ascx?DID=10&PID=43&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>Share</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.comnull?DID=10&PID=43&CID=BaseDreamControl3"></span></div></div>')
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
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (43, 11, N'Home1', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://s19390994.onlinehome-server.com/Components/TextBank/SuperAdminTextBank.aspx?DID=11&PID=53&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl1'' data-remove="http://s19390994.onlinehome-server.comnull?DID=11&PID=53&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Search''><a href=''http://s19390994.onlinehome-server.comnull?DID=11&PID=53&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Search</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl2'' data-remove="http://s19390994.onlinehome-server.comnull?DID=11&PID=53&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Featured Dreams''><a href=''http://s19390994.onlinehome-server.com~/Components/Dreams/FeatureDreams.ascx?DID=11&PID=53&CID=BaseDreamControl3'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Featured Dreams</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237.?DID=1&amp;PID=1&amp;CID=BaseDreamControl3'' data-remove="http://s19390994.onlinehome-server.com.?DID=11&PID=53&CID=BaseDreamControl3"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12 featured_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Dreamview''><a href=''http://s19390994.onlinehome-server.comnull?DID=11&PID=53&CID=BaseDreamControl4'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dreamview</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237null?DID=1&amp;PID=1&amp;CID=BaseDreamControl4'' data-remove="http://s19390994.onlinehome-server.comnull?DID=11&PID=53&CID=BaseDreamControl4"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12 content_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-7''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-8''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-8'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-8'' value=''''><input type=''hidden'' id=''hidden-class-sortable-8'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''General News ''><a href=''http://s19390994.onlinehome-server.com~/Components/News/NewControls/GeneralNewsView.ascx?DID=11&PID=53&CID=BaseDreamControl5'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>General News </h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://74.208.125.237..?DID=1&amp;PID=1&amp;CID=BaseDreamControl5'' data-remove="http://s19390994.onlinehome-server.comnull?DID=11&PID=53&CID=BaseDreamControl5"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-7'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-7'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-7'' value=''col-md-12 news_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-11''>
    
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-12''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-12'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-12'' value=''''><input type=''hidden'' id=''hidden-class-sortable-12'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''footer''><a href=''http://s19390994.onlinehome-server.comnull?DID=11&PID=53&CID=BaseDreamControl6'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://s19390994.onlinehome-server.comnull?DID=1&amp;PID=1&amp;CID=BaseDreamControl6'' data-remove="http://s19390994.onlinehome-server.comnull?DID=11&PID=53&CID=BaseDreamControl6"></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-11'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-11'' value=''padding:0;''><input type=''hidden'' id=''hidden-class-sortable-11'' value=''col-md-12 footer_wrapper''></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (44, 1, N'QuizTest', N'<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Assignment''><a href=''http://s19390994.onlinehome-server.com/Components/Assignments/AssignmentAdmin.aspx?DID=1&PID=54&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>Assignment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://s19390994.onlinehome-server.com.?DID=1&PID=54&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (45, 2, N'Quizpage', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Quiz''><a href=''http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=2&PID=55&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Quiz</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=2&amp;PID=56&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=2&PID=55&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (46, 2, N'quiz3', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Quiz''><a href=''http://localhost:64671/Components/QuizBank/QuizBankAdmin.aspx?DID=2&PID=56&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Quiz</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671null?DID=2&amp;PID=56&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671null?DID=2&PID=56&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (47, 14, N'page1', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=14&PID=58&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vvv?DID=14&PID=58&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-3''><div class=''col-md-12 btn btn-warning'' data-name=''searchUmrahComponent''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/DetailSearch.ascx?DID=14&PID=58&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>searchUmrahComponent</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671123?DID=14&PID=58&CID=BaseDreamControl2"></span></div></div>
    <div class=''btn btn-success col-md-9 sortable ui-sortable'' data-size=''col-md-9'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-9''><div class=''col-md-12 btn btn-warning'' data-name=''UmrahList''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackageListView.ascx?DID=14&PID=58&CID=BaseDreamControl3'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>UmrahList</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671.?DID=14&PID=58&CID=BaseDreamControl3"></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/PackageFooter.ascx?DID=14&PID=58&CID=BaseDreamControl4'' target="_blank"><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=14&PID=58&CID=BaseDreamControl4"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (48, 14, N'detailPage', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/BookingForm.ascx?DID=14&PID=59&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671abc?DID=14&PID=59&CID=BaseDreamControl1"></span></div></div>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (49, 17, N'umrahDetail', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=17&PID=62&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671vvv?DID=17&amp;PID=62&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671vvv?DID=17&PID=62&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <div class=''btn btn-success col-md-9 sortable ui-sortable'' data-size=''col-md-9'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''col-md-9''><div class=''col-md-12 btn btn-warning'' data-name=''umrah detail''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackagePageDetail.ascx?DID=17&PID=62&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>umrah detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671cc?DID=17&amp;PID=62&amp;CID=BaseDreamControl3'' data-remove="http://localhost:64671cc?DID=17&PID=62&CID=BaseDreamControl2"></span></div></div><span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-3''><div class=''col-md-12 btn btn-warning'' data-name=''discount detail''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx?DID=17&PID=62&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>discount detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=17&PID=62&CID=BaseDreamControl3"></span></div></div><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''container''></div>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''content_wrapper''></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (50, 17, N'bookingForm', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=17&PID=63&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671vvv?DID=17&amp;PID=63&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671vvv?DID=17&PID=63&CID=BaseDreamControl1"></span></div></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''padding-top:12px;''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/BookingForm.ascx?DID=17&PID=63&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671abc?DID=17&amp;PID=63&amp;CID=BaseDreamControl1'' data-remove="http://localhost:64671abc?DID=17&PID=63&CID=BaseDreamControl2"></span></div><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position:absolute; top:2px; left:4px;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12 btn btn-success container sortable ui-sortable''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/PackageFooter.ascx?DID=17&PID=63&CID=BaseDreamControl3'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove=''http://localhost:64671vv?DID=17&amp;PID=63&amp;CID=BaseDreamControl3'' data-remove="http://localhost:64671vv?DID=17&PID=63&CID=BaseDreamControl3"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (51, 18, N'pp1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/BookingForm.ascx?DID=18&PID=74&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671abc?DID=18&PID=74&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (52, 20, N'umrahDetail', N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <h4 style=''margin: 0;''>Container</h4>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (53, 21, N'umrahDetail', N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <h4 style=''margin: 0;''>Container</h4>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (54, 21, N'bookingForm', N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/BookingForm.ascx?DID=21&PID=78&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671abc?DID=21&PID=78&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (55, 22, N'umrahDetail', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=22&PID=79&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vvv?DID=22&PID=79&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <div class=''btn btn-success col-md-9 sortable ui-sortable'' data-size=''col-md-9'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-9''><div class=''col-md-12 btn btn-warning'' data-name=''umrah detail''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackagePageDetail.ascx?DID=22&PID=79&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>umrah detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671cc?DID=22&PID=79&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''col-md-3''><div class=''col-md-12 btn btn-warning'' data-name=''discount detail''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx?DID=22&PID=79&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>discount detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=22&PID=79&CID=BaseDreamControl3"></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''content_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/PackageFooter.ascx?DID=22&PID=79&CID=BaseDreamControl4'' target="_blank"><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=22&PID=79&CID=BaseDreamControl4"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (56, 22, N'bookingForm', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=22&PID=80&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vvv?DID=22&PID=80&CID=BaseDreamControl1"></span></div></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/BookingForm.ascx?DID=22&PID=80&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671abc?DID=22&PID=80&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/PackageFooter.ascx?DID=22&PID=80&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=22&PID=80&CID=BaseDreamControl3"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (57, 14, N'mypage11', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''UmrahList''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackageListView.ascx?DID=14&PID=81&CID=BaseDreamControl1'' target="_blank" onclick="window.open(this.href, ''mywin'',''left=20,top=20,width=500,height=500,toolbar=1,resizable=0''); return false;"><h4 style=''margin:0;''>UmrahList</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671.?DID=14&PID=81&CID=BaseDreamControl1"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (58, 23, N'umrahDetail', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-5''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-5'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-5'' value=''''><input type=''hidden'' id=''hidden-class-sortable-5'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=23&PID=82&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vvv?DID=23&PID=82&CID=BaseDreamControl1"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    <div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <div class=''btn btn-success col-md-9 sortable ui-sortable'' data-size=''col-md-9'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-9''><div class=''col-md-12 btn btn-warning'' data-name=''umrah detail''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackagePageDetail.ascx?DID=23&PID=82&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>umrah detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671cc?DID=23&PID=82&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><input type=''hidden'' id=''hidden-class-sortable-4'' value=''col-md-3''><div class=''col-md-12 btn btn-warning'' data-name=''discount detail''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx?DID=23&PID=82&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>discount detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=23&PID=82&CID=BaseDreamControl3"></span></div></div><span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''></div>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''content_wrapper''></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-6''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-6'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-6'' value=''''><input type=''hidden'' id=''hidden-class-sortable-6'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/PackageFooter.ascx?DID=23&PID=82&CID=BaseDreamControl4'' target="_blank"><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=23&PID=82&CID=BaseDreamControl4"></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (59, 23, N'bookingForm', N'

    		<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''PackageHeader''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/Packageheader.ascx?DID=23&PID=83&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vvv?DID=23&PID=83&CID=BaseDreamControl1"></span></div></div><div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform''><a href=''http://localhost:64671~/UmrahComponents/PackageComponent/BookingForm.ascx?DID=23&PID=83&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671abc?DID=23&PID=83&CID=BaseDreamControl2"></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><input type=''hidden'' id=''hidden-class-sortable-3'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''pkg footer''><a href=''http://localhost:64671~/UmrahComponents/headerFooter/PackageFooter.ascx?DID=23&PID=83&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true'' data-remove="http://localhost:64671vv?DID=23&PID=83&CID=BaseDreamControl3"></span></div></div>')
SET IDENTITY_INSERT [dbo].[ClientPage] OFF
/****** Object:  Table [dbo].[Accommodation]    Script Date: 01/20/2017 10:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accommodation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[availability] [bit] NOT NULL,
	[hotelID] [int] NOT NULL,
 CONSTRAINT [PK_Accommodation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accommodation] ON
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (0, N'1 bed', 1200, 1, 1)
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (2, N'2 bed', 1300, 1, 1)
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (3, N'4 bed', 6700, 1, 1)
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (4, N'bed1', 123, 1, 2)
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (5, N'Double Bed', 50000, 1, 3)
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (6, N'Triple Bed', 4000, 1, 3)
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (7, N'Quad Bed', 3000, 1, 3)
SET IDENTITY_INSERT [dbo].[Accommodation] OFF
/****** Object:  Table [dbo].[DreamLayouts]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[DreamLayouts] ON
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (1, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
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
</div>', 1, N'Default', NULL, 1, 0, 1)
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
    
</div>', 2, N'Default', NULL, 1, 0, 1)
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
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol></div>', 3, N'Default', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (14, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'Lesson1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (15, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'MediaBank', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (16, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'MediaSelection', NULL, 1, 0, 0)
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
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'FileBank', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (24, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'DreamAdminPanel', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (25, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'DreamPages', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (26, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'PageBuilder', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (27, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 3, N'CreationDefaultDream', NULL, 1, 0, 0)
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
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (41, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/QuizBank/User/QuizView.ascx''></uc2:basedreamcontrol></div>', 5, N'satphys', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (42, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12 main_image_gre" style="padding:0; background-position: center top 0px;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12 content_wrapper" style="">
    <div id=''sortable-4'' class="container" style="">
    <div id=''sortable-5'' class="col-md-8" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>
    
<div id=''sortable-6'' class="col-md-4" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div></div>
    
</div><div id=''sortable-7'' class="col-md-12" style="">
    <div id=''sortable-8'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl5'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>
    
</div>', 10, N'Sample', NULL, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (43, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="padding:0;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/Account/InviteShare.ascx''></uc2:basedreamcontrol></div>', 10, N'Default', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (44, N'Hello World', 10, N'Menu1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (45, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 10, N'SubMenu1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (46, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 10, N'Menu2', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (47, NULL, 10, N'tedst', NULL, 0, 0, 0)
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
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (53, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
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
</div>', 11, N'Home1', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (54, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/Assignments/AssignmentUserView.ascx''></uc2:basedreamcontrol></div>', 1, N'QuizTest', NULL, 0, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (55, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/QuizBank/User/QuizView.ascx''></uc2:basedreamcontrol></div>', 2, N'Quizpage', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (56, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/QuizBank/User/QuizView.ascx''></uc2:basedreamcontrol></div>', 2, N'quiz3', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (58, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-4'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-1'' class="col-md-12" style="">
    <div id=''sortable-2'' class="col-md-3" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/DetailSearch.ascx''></uc2:basedreamcontrol></div>
    <div id=''sortable-3'' class="col-md-9" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackageListView.ascx''></uc2:basedreamcontrol></div>
</div><div id=''sortable-5'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/PackageFooter.ascx''></uc2:basedreamcontrol></div>', 14, N'page1', NULL, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (59, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    <div id=''sortable-2'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/BookingForm.ascx''></uc2:basedreamcontrol></div>
    
</div>', 14, N'detailPage', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (60, N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <h4 style=''margin: 0;''>Container</h4>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''></div>', 16, N'umrahDetail', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (61, N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <h4 style=''margin: 0;''>Container</h4>
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''></div>', 16, N'bookingForm', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (62, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="content_wrapper" style="">
    
    <div id=''sortable-3'' class="container" style="">
    
    <div id=''sortable-4'' class="col-md-9" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackagePageDetail.ascx''></uc2:basedreamcontrol></div>
<div id=''sortable-5'' class="col-md-3" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx''></uc2:basedreamcontrol></div></div>
</div>', 17, N'umrahDetail', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (63, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-1'' class="container" style="padding-top:12px;">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/BookingForm.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/PackageFooter.ascx''></uc2:basedreamcontrol></div>', 17, N'bookingForm', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (64, N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    <h4 style=''margin: 0;''>Container</h4>
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''></div>', 18, N'umrahDetail', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (65, N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>', 18, N'bookingForm', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (74, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/BookingForm.ascx''></uc2:basedreamcontrol></div>', 18, N'pp1', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (75, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-1'' class="container" style="">
    <h4 style=''margin: 0;''>Container</h4>
    
</div>', 20, N'umrahDetail', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (76, N'

    		<div class=''col-md-12 btn btn-success container sortable ui-sortable'' data-size=''container'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''container''><div class=''col-md-12 btn btn-warning'' data-name=''Bookinform''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Bookinform</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>', 20, N'bookingForm', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (77, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-1'' class="container" style="">
    <h4 style=''margin: 0;''>Container</h4>
    
</div>', 21, N'umrahDetail', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (78, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/BookingForm.ascx''></uc2:basedreamcontrol></div>', 21, N'bookingForm', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (79, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-5'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="content_wrapper" style="">
    <div id=''sortable-1'' class="container" style="">
    
    <div id=''sortable-3'' class="col-md-9" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackagePageDetail.ascx''></uc2:basedreamcontrol></div><div id=''sortable-4'' class="col-md-3" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx''></uc2:basedreamcontrol></div>
</div>
    
</div><div id=''sortable-6'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/PackageFooter.ascx''></uc2:basedreamcontrol></div>', 22, N'umrahDetail', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (80, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/BookingForm.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/PackageFooter.ascx''></uc2:basedreamcontrol></div>', 22, N'bookingForm', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (81, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackageListView.ascx''></uc2:basedreamcontrol></div>', 14, N'mypage11', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (82, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-5'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="content_wrapper" style="">
    <div id=''sortable-1'' class="container" style="">
    
    <div id=''sortable-3'' class="col-md-9" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackagePageDetail.ascx''></uc2:basedreamcontrol></div><div id=''sortable-4'' class="col-md-3" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx''></uc2:basedreamcontrol></div>
</div>
    
</div><div id=''sortable-6'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/PackageFooter.ascx''></uc2:basedreamcontrol></div>', 23, N'umrahDetail', NULL, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (83, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %>

    		<div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/Packageheader.ascx''></uc2:basedreamcontrol></div><div id=''sortable-1'' class="container" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/UmrahComponents/PackageComponent/BookingForm.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/UmrahComponents/headerFooter/PackageFooter.ascx''></uc2:basedreamcontrol></div>', 23, N'bookingForm', NULL, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[DreamLayouts] OFF
/****** Object:  Table [dbo].[DreamEnrollment]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[DreamEnrollment] ON
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (1, 2, N'b3afc247-bd2f-4be2-ab35-6d6a71e17816', CAST(0x0000A6D401895217 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (2, 2, N'c3b70fc3-2c17-487f-b023-503f5c0232c5', CAST(0x0000A6D5003F0B6A AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (3, 2, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', CAST(0x0000A6D500405733 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (4, 2, N'6a6328ff-530b-40e3-9635-6f040941aa02', CAST(0x0000A6D500456275 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (5, 2, N'8ede996c-fa92-4655-8b91-282af6d3cd49', CAST(0x0000A6D600646CBF AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (6, 2, N'9ec276e3-6ca1-486f-ab56-362b09217745', CAST(0x0000A6D600753642 AS DateTime))
SET IDENTITY_INSERT [dbo].[DreamEnrollment] OFF
/****** Object:  Table [dbo].[HotelImage]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HotelImage] ON
INSERT [dbo].[HotelImage] ([id], [mediaID], [hotelID]) VALUES (9, 32, 1)
INSERT [dbo].[HotelImage] ([id], [mediaID], [hotelID]) VALUES (10, 53, 1)
INSERT [dbo].[HotelImage] ([id], [mediaID], [hotelID]) VALUES (12, 47, 2)
INSERT [dbo].[HotelImage] ([id], [mediaID], [hotelID]) VALUES (16, 50, 2)
INSERT [dbo].[HotelImage] ([id], [mediaID], [hotelID]) VALUES (17, 46, 1)
INSERT [dbo].[HotelImage] ([id], [mediaID], [hotelID]) VALUES (18, 50, 3)
INSERT [dbo].[HotelImage] ([id], [mediaID], [hotelID]) VALUES (19, 49, 3)
INSERT [dbo].[HotelImage] ([id], [mediaID], [hotelID]) VALUES (20, 51, 3)
SET IDENTITY_INSERT [dbo].[HotelImage] OFF
/****** Object:  Table [dbo].[HotelFacility]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HotelFacility] ON
INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (10, N'messages', 0, 39, 1)
INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (11, N'writing', 0, 14, 2)
INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (12, N'Transportation abc', 1, 5, 1)
INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (13, N'Navigation', 0, 15, 1)
INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (14, N'Breakfast', 1, 59, 3)
INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (15, N'Transportation', 1, 15, 3)
INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (16, N'Haram View', 1, 10, 3)
INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (17, N'Swimming Pool', 1, 4, 3)
INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (18, N'wifi', 1, 46, 3)
SET IDENTITY_INSERT [dbo].[HotelFacility] OFF
/****** Object:  Table [dbo].[FIBOptions]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FIBOptions] ON
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (1, 14, N'jkyt yu')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (2, 14, N'jkyt yu')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (3, 14, N'jkyt yu')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (4, 15, N'bjk')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (5, 15, N'bjk')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (6, 15, N'bjk')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (7, 15, N'bjk')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (8, 16, N'')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (9, 16, N'abc')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (10, 16, N'abc')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (11, 17, N'xtarea to be replaced Edit')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (12, 17, N'xtarea to be replaced Edit')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (13, 17, N'xtarea to be replaced Edit')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (14, 17, N'xtarea to be replaced Edit')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (15, 17, N'xtarea to be replaced Edit')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (16, 18, N'yhg')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (17, 18, N'yhg')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (18, 20, N'bhn')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (19, 20, N'bhn')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (20, 20, N'bhn')
INSERT [dbo].[FIBOptions] ([id], [QuestionID], [OptionText]) VALUES (21, 17, N'xtarea to be replaced Edit')
SET IDENTITY_INSERT [dbo].[FIBOptions] OFF
/****** Object:  Table [dbo].[PackageDetail]    Script Date: 01/20/2017 10:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dreamID] [int] NOT NULL,
	[hotelIDMakkah] [int] NOT NULL,
	[nightsInMakkah] [int] NOT NULL,
	[hotelIDMadina] [int] NOT NULL,
	[nightsInMadina] [int] NOT NULL,
	[returnFlight] [bit] NOT NULL,
	[departureFlightID] [int] NULL,
	[returnFlightID] [int] NULL,
	[isTransportAvailable] [bit] NOT NULL,
	[transportID] [int] NULL,
	[isZiaratAvailable] [bit] NOT NULL,
	[ziaratID] [int] NULL,
	[isVisaAvailable] [bit] NOT NULL,
	[visaID] [int] NULL,
	[totalAmount] [int] NOT NULL,
	[additionalExpense] [int] NOT NULL,
	[additionalDetail] [nvarchar](max) NULL,
	[isAirLineAvailable] [bit] NOT NULL,
 CONSTRAINT [PK_PackageDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PackageDetail] ON
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [totalAmount], [additionalExpense], [additionalDetail], [isAirLineAvailable]) VALUES (7, 12, 1, 2, 1, 2, 1, 1, 1, 0, NULL, 0, NULL, 0, NULL, 8900, 9000, N'', 1)
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [totalAmount], [additionalExpense], [additionalDetail], [isAirLineAvailable]) VALUES (8, 14, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9900, 0, N'', 1)
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [totalAmount], [additionalExpense], [additionalDetail], [isAirLineAvailable]) VALUES (9, 16, 1, 2, 1, 3, 1, 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, N'', 1)
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [totalAmount], [additionalExpense], [additionalDetail], [isAirLineAvailable]) VALUES (10, 17, 1, 2, 1, 2, 1, 1, 1, 0, NULL, 1, 1, 0, NULL, 0, 0, N'', 1)
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [totalAmount], [additionalExpense], [additionalDetail], [isAirLineAvailable]) VALUES (11, 18, 1, 1, 1, 1, 1, 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, N'', 0)
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [totalAmount], [additionalExpense], [additionalDetail], [isAirLineAvailable]) VALUES (15, 19, 1, 1, 1, 1, 1, 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, N'', 0)
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [totalAmount], [additionalExpense], [additionalDetail], [isAirLineAvailable]) VALUES (16, 20, 1, 1, 1, 1, 1, 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, N'', 0)
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [totalAmount], [additionalExpense], [additionalDetail], [isAirLineAvailable]) VALUES (17, 21, 1, 1, 1, 1, 1, 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, N'', 0)
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [totalAmount], [additionalExpense], [additionalDetail], [isAirLineAvailable]) VALUES (18, 22, 1, 2, 1, 2, 1, 1, 1, 0, NULL, 0, NULL, 0, NULL, 12000, 0, N'', 0)
INSERT [dbo].[PackageDetail] ([id], [dreamID], [hotelIDMakkah], [nightsInMakkah], [hotelIDMadina], [nightsInMadina], [returnFlight], [departureFlightID], [returnFlightID], [isTransportAvailable], [transportID], [isZiaratAvailable], [ziaratID], [isVisaAvailable], [visaID], [totalAmount], [additionalExpense], [additionalDetail], [isAirLineAvailable]) VALUES (19, 23, 1, 2, 1, 2, 1, 1, 1, 0, NULL, 0, NULL, 0, NULL, 0, 0, N'', 0)
SET IDENTITY_INSERT [dbo].[PackageDetail] OFF
/****** Object:  Table [dbo].[LessonQuiz]    Script Date: 01/20/2017 10:09:31 ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LessonQuiz] ON
INSERT [dbo].[LessonQuiz] ([id], [Layout_id], [BaseControlID], [QuizID], [Graded], [Marks], [TimeBased], [TotalTime], [visibleQuestions], [QuestionsPerPage]) VALUES (1, 54, N'BaseDreamControl1', 1, 1, CAST(26.000 AS Decimal(15, 3)), 1, 154, 21, 1)
INSERT [dbo].[LessonQuiz] ([id], [Layout_id], [BaseControlID], [QuizID], [Graded], [Marks], [TimeBased], [TotalTime], [visibleQuestions], [QuestionsPerPage]) VALUES (2, 55, N'BaseDreamControl1', 6, 1, CAST(20.000 AS Decimal(15, 3)), 1, 150, 2, 1)
INSERT [dbo].[LessonQuiz] ([id], [Layout_id], [BaseControlID], [QuizID], [Graded], [Marks], [TimeBased], [TotalTime], [visibleQuestions], [QuestionsPerPage]) VALUES (3, 55, N'BaseDreamControl1', 7, 0, CAST(26.000 AS Decimal(15, 3)), 0, 4, 0, 1)
SET IDENTITY_INSERT [dbo].[LessonQuiz] OFF
/****** Object:  Table [dbo].[QuizBankQuestions]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuizBankQuestions] ON
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (1, 1, 4, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (2, 1, 5, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (3, 1, 6, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (4, 1, 7, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (5, 1, 8, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (6, 1, 9, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (7, 5, 4, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (8, 5, 5, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (9, 5, 6, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (10, 5, 12, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (11, 5, 13, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (12, 6, 5, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (13, 6, 6, 1)
INSERT [dbo].[QuizBankQuestions] ([id], [QuizID], [QuestionID], [isActive]) VALUES (16, 8, 4, 1)
SET IDENTITY_INSERT [dbo].[QuizBankQuestions] OFF
/****** Object:  Table [dbo].[NewsRelatedNews]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[NewsDreamNews]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[UserResponse]    Script Date: 01/20/2017 10:09:31 ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserResponse] ON
INSERT [dbo].[UserResponse] ([id], [QuestionID], [UserID], [Page], [UserPerformance], [UserReply], [quizID]) VALUES (7, 6, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54, 0, N'3.9030', 1)
INSERT [dbo].[UserResponse] ([id], [QuestionID], [UserID], [Page], [UserPerformance], [UserReply], [quizID]) VALUES (8, 7, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54, 0, N'2', 1)
INSERT [dbo].[UserResponse] ([id], [QuestionID], [UserID], [Page], [UserPerformance], [UserReply], [quizID]) VALUES (9, 4, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54, 0, N'127', 1)
INSERT [dbo].[UserResponse] ([id], [QuestionID], [UserID], [Page], [UserPerformance], [UserReply], [quizID]) VALUES (10, 8, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54, 0, N'10', 1)
INSERT [dbo].[UserResponse] ([id], [QuestionID], [UserID], [Page], [UserPerformance], [UserReply], [quizID]) VALUES (11, 5, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54, 0, N'6 : 8 : 9', 1)
INSERT [dbo].[UserResponse] ([id], [QuestionID], [UserID], [Page], [UserPerformance], [UserReply], [quizID]) VALUES (12, 9, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54, 0, N'shows that an influx of manpower from Europe was not critical for the survival of the Crusader states', 1)
INSERT [dbo].[UserResponse] ([id], [QuestionID], [UserID], [Page], [UserPerformance], [UserReply], [quizID]) VALUES (13, 5, N'd0a2b1fb-f6f0-4fbb-960b-f5884bdd0467', 55, 0, N'Time_out', 6)
INSERT [dbo].[UserResponse] ([id], [QuestionID], [UserID], [Page], [UserPerformance], [UserReply], [quizID]) VALUES (14, 5, N'd0a2b1fb-f6f0-4fbb-960b-f5884bdd0467', 55, 0, N'Time_out', 6)
SET IDENTITY_INSERT [dbo].[UserResponse] OFF
/****** Object:  Table [dbo].[UserQuizStatus]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserQuizStatus] ON
INSERT [dbo].[UserQuizStatus] ([id], [QuizID], [QuestionID], [QuestionStatus], [UserID], [Page]) VALUES (7, 1, 4, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54)
INSERT [dbo].[UserQuizStatus] ([id], [QuizID], [QuestionID], [QuestionStatus], [UserID], [Page]) VALUES (8, 1, 5, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54)
INSERT [dbo].[UserQuizStatus] ([id], [QuizID], [QuestionID], [QuestionStatus], [UserID], [Page]) VALUES (9, 1, 6, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54)
INSERT [dbo].[UserQuizStatus] ([id], [QuizID], [QuestionID], [QuestionStatus], [UserID], [Page]) VALUES (10, 1, 7, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54)
INSERT [dbo].[UserQuizStatus] ([id], [QuizID], [QuestionID], [QuestionStatus], [UserID], [Page]) VALUES (11, 1, 8, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54)
INSERT [dbo].[UserQuizStatus] ([id], [QuizID], [QuestionID], [QuestionStatus], [UserID], [Page]) VALUES (12, 1, 9, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54)
INSERT [dbo].[UserQuizStatus] ([id], [QuizID], [QuestionID], [QuestionStatus], [UserID], [Page]) VALUES (13, 6, 5, 1, N'd0a2b1fb-f6f0-4fbb-960b-f5884bdd0467', 55)
INSERT [dbo].[UserQuizStatus] ([id], [QuizID], [QuestionID], [QuestionStatus], [UserID], [Page]) VALUES (14, 6, 6, 1, N'd0a2b1fb-f6f0-4fbb-960b-f5884bdd0467', 55)
SET IDENTITY_INSERT [dbo].[UserQuizStatus] OFF
/****** Object:  Table [dbo].[Navigations]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[LessonQuestion]    Script Date: 01/20/2017 10:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LessonQuestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Layout_id] [int] NOT NULL,
	[BaseControlID] [nvarchar](50) NOT NULL,
	[Question_id] [int] NULL,
 CONSTRAINT [PK_LessonQuestion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonProgressDashBoard]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[LessonProgressDashBoard] ON
INSERT [dbo].[LessonProgressDashBoard] ([id], [BaseControlID], [ShowSiblingsProgress], [LayoutID]) VALUES (1, N'BaseDreamControl1', 1, 4)
SET IDENTITY_INSERT [dbo].[LessonProgressDashBoard] OFF
/****** Object:  Table [dbo].[LessonVideo]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[LessonVideo] ON
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id], [showTranscript]) VALUES (1, 2, N'BaseDreamControl4', 40, 1)
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id], [showTranscript]) VALUES (2, 6, N'BaseDreamControl1', 40, 1)
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id], [showTranscript]) VALUES (3, 42, N'BaseDreamControl3', 40, 1)
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id], [showTranscript]) VALUES (4, 45, N'BaseDreamControl1', 40, 0)
SET IDENTITY_INSERT [dbo].[LessonVideo] OFF
/****** Object:  Table [dbo].[LessonAssignments]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LessonAssignments] ON
INSERT [dbo].[LessonAssignments] ([id], [Layout_id], [BaseControlID], [Assignment_id]) VALUES (1, 54, N'BaseDreamControl1', 1)
SET IDENTITY_INSERT [dbo].[LessonAssignments] OFF
/****** Object:  Table [dbo].[LayoutTextBank]    Script Date: 01/20/2017 10:09:31 ******/
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
SET IDENTITY_INSERT [dbo].[LayoutTextBank] OFF
/****** Object:  Table [dbo].[InviteSharePage]    Script Date: 01/20/2017 10:09:31 ******/
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
/****** Object:  Table [dbo].[DiscountPackage]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DiscountPackage] ON
INSERT [dbo].[DiscountPackage] ([id], [name], [availableFrom], [availableTill], [packageDetailID], [discountPercent]) VALUES (7, N'3 Bed', CAST(0x3C380B00 AS Date), CAST(0x3C380B00 AS Date), 10, 10)
INSERT [dbo].[DiscountPackage] ([id], [name], [availableFrom], [availableTill], [packageDetailID], [discountPercent]) VALUES (9, N'pkj1', CAST(0x5A3C0B00 AS Date), CAST(0x583C0B00 AS Date), 18, 10)
INSERT [dbo].[DiscountPackage] ([id], [name], [availableFrom], [availableTill], [packageDetailID], [discountPercent]) VALUES (10, N'pkg1', CAST(0x533C0B00 AS Date), CAST(0x623C0B00 AS Date), 19, 2)
SET IDENTITY_INSERT [dbo].[DiscountPackage] OFF
/****** Object:  Table [dbo].[CustomPackage]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomPackage] ON
INSERT [dbo].[CustomPackage] ([id], [month], [hotelMakkahID], [nightsMakkah], [hotelMadinaID], [nightsMadina], [isRoundTrip], [returnAirLineID], [departureAirLineID], [roomMakkahID], [roomMadinaID], [depFlightID], [retFlightID]) VALUES (1, 12, 1, 2, 1, 3, 0, 1, 1, 2, 3, 1, 1)
INSERT [dbo].[CustomPackage] ([id], [month], [hotelMakkahID], [nightsMakkah], [hotelMadinaID], [nightsMadina], [isRoundTrip], [returnAirLineID], [departureAirLineID], [roomMakkahID], [roomMadinaID], [depFlightID], [retFlightID]) VALUES (2, 12, 2, 0, 2, 0, 0, 1, 1, 4, 4, 1, 1)
INSERT [dbo].[CustomPackage] ([id], [month], [hotelMakkahID], [nightsMakkah], [hotelMadinaID], [nightsMadina], [isRoundTrip], [returnAirLineID], [departureAirLineID], [roomMakkahID], [roomMadinaID], [depFlightID], [retFlightID]) VALUES (3, 12, 2, 0, 2, 0, 0, 1, 1, 4, 4, 1, 1)
INSERT [dbo].[CustomPackage] ([id], [month], [hotelMakkahID], [nightsMakkah], [hotelMadinaID], [nightsMadina], [isRoundTrip], [returnAirLineID], [departureAirLineID], [roomMakkahID], [roomMadinaID], [depFlightID], [retFlightID]) VALUES (4, 12, 1, 0, 2, 0, 0, 1, 1, 0, 4, 1, 1)
INSERT [dbo].[CustomPackage] ([id], [month], [hotelMakkahID], [nightsMakkah], [hotelMadinaID], [nightsMadina], [isRoundTrip], [returnAirLineID], [departureAirLineID], [roomMakkahID], [roomMadinaID], [depFlightID], [retFlightID]) VALUES (5, 1, 2, 0, 2, 0, 0, 1, 1, 4, 4, 1, 1)
INSERT [dbo].[CustomPackage] ([id], [month], [hotelMakkahID], [nightsMakkah], [hotelMadinaID], [nightsMadina], [isRoundTrip], [returnAirLineID], [departureAirLineID], [roomMakkahID], [roomMadinaID], [depFlightID], [retFlightID]) VALUES (6, 2, 2, 0, 2, 0, 0, 1, 1, 4, 4, 1, 1)
INSERT [dbo].[CustomPackage] ([id], [month], [hotelMakkahID], [nightsMakkah], [hotelMadinaID], [nightsMadina], [isRoundTrip], [returnAirLineID], [departureAirLineID], [roomMakkahID], [roomMadinaID], [depFlightID], [retFlightID]) VALUES (7, 1, 2, 0, 2, 0, 0, 1, 1, 4, 4, 1, 1)
INSERT [dbo].[CustomPackage] ([id], [month], [hotelMakkahID], [nightsMakkah], [hotelMadinaID], [nightsMadina], [isRoundTrip], [returnAirLineID], [departureAirLineID], [roomMakkahID], [roomMadinaID], [depFlightID], [retFlightID]) VALUES (8, 1, 2, 0, 2, 0, 0, 1, 1, 4, 4, 1, 1)
SET IDENTITY_INSERT [dbo].[CustomPackage] OFF
/****** Object:  Table [dbo].[DreamPageAuthorization]    Script Date: 01/20/2017 10:09:31 ******/
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
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (103, 34, N'RegisteredUser', 1)
GO
print 'Processed 100 total records'
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
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (160, 55, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (161, 55, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (162, 55, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (163, 56, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (164, 56, N'AnonymousUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (165, 56, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (169, 58, N'RegisteredUser', 1)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (170, 58, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (171, 58, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (172, 59, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (173, 59, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (174, 59, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (175, 74, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (176, 74, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (177, 74, N'EnrolledUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (178, 81, N'RegisteredUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (179, 81, N'AnonymousUser', 0)
INSERT [dbo].[DreamPageAuthorization] ([id], [DreamLayout_id], [PageRole], [isAllowed]) VALUES (180, 81, N'EnrolledUser', 0)
SET IDENTITY_INSERT [dbo].[DreamPageAuthorization] OFF
/****** Object:  Table [dbo].[AssignmentResponse]    Script Date: 01/20/2017 10:09:31 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AssignmentResponse] ON
INSERT [dbo].[AssignmentResponse] ([id], [AssignmentID], [UserID], [Page], [isSubmitted], [UploadedFilePath], [UploadedFileType], [AssignmentResult]) VALUES (1, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54, 1, N'D:\27_dec\27_dec\Components\Assignments\Content\Files\Momentum\3ad5b021-ffea-486d-8640-9de2f6e161ca_Momentum.pdf', N'.pdf', CAST(0.000 AS Decimal(15, 3)))
INSERT [dbo].[AssignmentResponse] ([id], [AssignmentID], [UserID], [Page], [isSubmitted], [UploadedFilePath], [UploadedFileType], [AssignmentResult]) VALUES (2, 1, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', 54, 1, N'D:\27_dec\27_dec\Components\Assignments\Content\Files\Momentum\1ee8e6c2-1582-48e2-9900-1a6e095bc3ab_Momentum.docx', N'.docx', CAST(9.000 AS Decimal(15, 3)))
SET IDENTITY_INSERT [dbo].[AssignmentResponse] OFF
/****** Object:  Table [dbo].[AlharmainUserPackage]    Script Date: 01/20/2017 10:09:31 ******/
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
 CONSTRAINT [PK_AlharmainUserPackage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AlharmainUserPackage] ON
INSERT [dbo].[AlharmainUserPackage] ([id], [userID], [packageDetailID], [isCustomPackage], [discountID]) VALUES (1, 1, 10, 1, 7)
INSERT [dbo].[AlharmainUserPackage] ([id], [userID], [packageDetailID], [isCustomPackage], [discountID]) VALUES (2, 2, 10, 1, 7)
SET IDENTITY_INSERT [dbo].[AlharmainUserPackage] OFF
/****** Object:  Default [DF_TextBank_TextName]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[TextBank] ADD  CONSTRAINT [DF_TextBank_TextName]  DEFAULT ('') FOR [TextName]
GO
/****** Object:  Default [DF_LessonMenu_IsContainer]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_IsContainer]  DEFAULT ((0)) FOR [IsContainer]
GO
/****** Object:  Default [DF_LessonMenu_DisplayName]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_DisplayName]  DEFAULT ('') FOR [DisplayName]
GO
/****** Object:  Default [DF_LessonMenu_menuType]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_menuType]  DEFAULT (N'multimedia') FOR [menuType]
GO
/****** Object:  Default [DF__DreamUser__IsAct__2E1BDC42]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamUserProfile] ADD  CONSTRAINT [DF__DreamUser__IsAct__2E1BDC42]  DEFAULT ((0)) FOR [IsActivated]
GO
/****** Object:  Default [DF_LessonMenuAvailability_TimeLimit]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_TimeLimit]  DEFAULT ((0)) FOR [TimeLimit]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableAvailability]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableAvailability]  DEFAULT ((0)) FOR [EnableAvailability]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableDeadLine]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableDeadLine]  DEFAULT ((0)) FOR [EnableDeadLine]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableTimeLimit]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableTimeLimit]  DEFAULT ((0)) FOR [EnableTimeLimit]
GO
/****** Object:  Default [DF_UserLessonProgress_progress]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[UserLessonProgress] ADD  CONSTRAINT [DF_UserLessonProgress_progress]  DEFAULT ((0)) FOR [progress]
GO
/****** Object:  Default [DF_Dreams_IsFeatured]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsFeatured]  DEFAULT ((0)) FOR [IsFeatured]
GO
/****** Object:  Default [DF_Dreams_IsDefault]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
/****** Object:  Default [DF_Dreams_IsPublished]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsPublished]  DEFAULT ((0)) FOR [IsPublished]
GO
/****** Object:  Default [DF_Dreams_dreamTypeID]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_dreamTypeID]  DEFAULT ((1)) FOR [dreamTypeID]
GO
/****** Object:  Default [DF_Hotel_rating]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_rating]  DEFAULT ((0)) FOR [rating]
GO
/****** Object:  Default [DF_Hotel_distance]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_distance]  DEFAULT ((0)) FOR [distance]
GO
/****** Object:  Default [DF_Accommodation_availability]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Accommodation] ADD  CONSTRAINT [DF_Accommodation_availability]  DEFAULT ((0)) FOR [availability]
GO
/****** Object:  Default [DF_DreamLayouts_IsPublished]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_IsPublished]  DEFAULT ((1)) FOR [IsPublished]
GO
/****** Object:  Default [DF__DreamLayo__IsDef__403A8C7D]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF__DreamLayo__IsDef__403A8C7D]  DEFAULT ((0)) FOR [IsUserDefaultPage]
GO
/****** Object:  Default [DF_DreamLayouts_IsPublicDefaultPage]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_IsPublicDefaultPage]  DEFAULT ((0)) FOR [IsPublicDefaultPage]
GO
/****** Object:  Default [DF_PackageDetail_nightsInMakkah]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_nightsInMakkah]  DEFAULT ((0)) FOR [nightsInMakkah]
GO
/****** Object:  Default [DF_PackageDetail_nightsInMadina]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_nightsInMadina]  DEFAULT ((0)) FOR [nightsInMadina]
GO
/****** Object:  Default [DF_Table_1_isTransport]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_Table_1_isTransport]  DEFAULT ((0)) FOR [isTransportAvailable]
GO
/****** Object:  Default [DF_PackageDetail_additionalExpense]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_additionalExpense]  DEFAULT ((0)) FOR [additionalExpense]
GO
/****** Object:  Default [DF_PackageDetail_isAirLineAvailable]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_isAirLineAvailable]  DEFAULT ((0)) FOR [isAirLineAvailable]
GO
/****** Object:  Default [DF_LessonProgressDashBoard_ShowSiblingsProgress]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonProgressDashBoard] ADD  CONSTRAINT [DF_LessonProgressDashBoard_ShowSiblingsProgress]  DEFAULT ((0)) FOR [ShowSiblingsProgress]
GO
/****** Object:  Default [DF_LessonVideo_showTranscript]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonVideo] ADD  CONSTRAINT [DF_LessonVideo_showTranscript]  DEFAULT ((0)) FOR [showTranscript]
GO
/****** Object:  Default [DF_CustomPackage_returnAirLineID]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[CustomPackage] ADD  CONSTRAINT [DF_CustomPackage_returnAirLineID]  DEFAULT ((1)) FOR [returnAirLineID]
GO
/****** Object:  ForeignKey [FK_LessonMenu_LessonMenu]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonMenu]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenu_LessonMenu] FOREIGN KEY([parentMenu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenu] CHECK CONSTRAINT [FK_LessonMenu_LessonMenu]
GO
/****** Object:  ForeignKey [FK_DreamUserProfile_AspNetUsers]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamUserProfile]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserProfile_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserProfile] CHECK CONSTRAINT [FK_DreamUserProfile_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_Flight_AirLine]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_AirLine] FOREIGN KEY([airLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_AirLine]
GO
/****** Object:  ForeignKey [FK__Files__FileCateg__4C6B5938]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([FileCategory_ID])
REFERENCES [dbo].[FileCategories] ([id])
GO
/****** Object:  ForeignKey [FK__Assignmen__Categ__3A4CA8FD]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[AssignmentBank]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[AssignmentCategories] ([id])
GO
/****** Object:  ForeignKey [FK_Tag]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamTags]  WITH CHECK ADD  CONSTRAINT [FK_Tag] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamTags] CHECK CONSTRAINT [FK_Tag]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_MediaItems_MediaCategories]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[MediaItems]  WITH CHECK ADD  CONSTRAINT [FK_MediaItems_MediaCategories] FOREIGN KEY([MediaCategory_id])
REFERENCES [dbo].[MediaCategories] ([id])
GO
ALTER TABLE [dbo].[MediaItems] CHECK CONSTRAINT [FK_MediaItems_MediaCategories]
GO
/****** Object:  ForeignKey [FK_LessonMenuAvailability_LessonMenu]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonMenuAvailability]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenuAvailability_LessonMenu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenuAvailability] CHECK CONSTRAINT [FK_LessonMenuAvailability_LessonMenu]
GO
/****** Object:  ForeignKey [FK__QuestionS__Categ__662B2B3B]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[QuestionSubCategories]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[QuestionCategories] ([id])
GO
/****** Object:  ForeignKey [FK_TextBankTag_Tags]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[TextBankTag]  WITH CHECK ADD  CONSTRAINT [FK_TextBankTag_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[TextBankTag] CHECK CONSTRAINT [FK_TextBankTag_Tags]
GO
/****** Object:  ForeignKey [FK_TextBankTag_TextBank]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[TextBankTag]  WITH CHECK ADD  CONSTRAINT [FK_TextBankTag_TextBank] FOREIGN KEY([TextID])
REFERENCES [dbo].[TextBank] ([id])
GO
ALTER TABLE [dbo].[TextBankTag] CHECK CONSTRAINT [FK_TextBankTag_TextBank]
GO
/****** Object:  ForeignKey [FK_UserLessonProgress_AspNetUsers]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_AspNetUsers] FOREIGN KEY([AspNetUser_id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_UserLessonProgress_LessonMenu]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_LessonMenu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_LessonMenu]
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__73852659]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBank__Catego__671F4F74]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[QuizCategories] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBank__MediaI__681373AD]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([MediaItemID])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK_Package_MediaItems]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_MediaItems]
GO
/****** Object:  ForeignKey [FK_News_MediaItems]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_MediaItems]
GO
/****** Object:  ForeignKey [FK_MediaTags_MediaItems]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_MediaItems]
GO
/****** Object:  ForeignKey [FK_MediaTags_Tags]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_Tags] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_Tags]
GO
/****** Object:  ForeignKey [FK__QuestionB__Categ__634EBE90]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[QuestionCategories] ([id])
GO
/****** Object:  ForeignKey [FK__QuestionB__SubCa__6442E2C9]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[QuestionSubCategories] ([id])
GO
/****** Object:  ForeignKey [FK__QuestionB__TypeI__65370702]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD FOREIGN KEY([TypeID])
REFERENCES [dbo].[QuestionType] ([id])
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile] FOREIGN KEY([SenderId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile]
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile1]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile1] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile1]
GO
/****** Object:  ForeignKey [FK_Dreams_DreamType]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD  CONSTRAINT [FK_Dreams_DreamType] FOREIGN KEY([dreamTypeID])
REFERENCES [dbo].[DreamType] ([id])
GO
ALTER TABLE [dbo].[Dreams] CHECK CONSTRAINT [FK_Dreams_DreamType]
GO
/****** Object:  ForeignKey [FK_Dreams_MediaItems]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD  CONSTRAINT [FK_Dreams_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Dreams] CHECK CONSTRAINT [FK_Dreams_MediaItems]
GO
/****** Object:  ForeignKey [FK_Hotel_MediaItems]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_MediaItems]
GO
/****** Object:  ForeignKey [FK__Controls__Contro__3E1D39E1]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
/****** Object:  ForeignKey [FK__Controls__IconUR__3F115E1A]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([IconURL])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_AspNetUsers]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_Dreams]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_Dreams] FOREIGN KEY([DreamId])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_Dreams]
GO
/****** Object:  ForeignKey [FK__ClientPag__Dream__3D2915A8]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[ClientPage]  WITH CHECK ADD  CONSTRAINT [FK__ClientPag__Dream__3D2915A8] FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[ClientPage] CHECK CONSTRAINT [FK__ClientPag__Dream__3D2915A8]
GO
/****** Object:  ForeignKey [FK_Accommodation_Hotel]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_Accommodation_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[Accommodation] CHECK CONSTRAINT [FK_Accommodation_Hotel]
GO
/****** Object:  ForeignKey [FK_DreamLayouts_Dreams]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamLayouts]  WITH CHECK ADD  CONSTRAINT [FK_DreamLayouts_Dreams] FOREIGN KEY([DreamID])
REFERENCES [dbo].[Dreams] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamLayouts] CHECK CONSTRAINT [FK_DreamLayouts_Dreams]
GO
/****** Object:  ForeignKey [FK_DreamEnrollment_AspNetUsers]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_DreamEnrollment_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamEnrollment] CHECK CONSTRAINT [FK_DreamEnrollment_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_DreamEnrollment_Dreams]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_DreamEnrollment_Dreams] FOREIGN KEY([dreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamEnrollment] CHECK CONSTRAINT [FK_DreamEnrollment_Dreams]
GO
/****** Object:  ForeignKey [FK_HotelImage_Hotel]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
/****** Object:  ForeignKey [FK_HotelImage_MediaItems]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_MediaItems]
GO
/****** Object:  ForeignKey [FK_HotelFacility_Hotel]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[HotelFacility]  WITH CHECK ADD  CONSTRAINT [FK_HotelFacility_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelFacility] CHECK CONSTRAINT [FK_HotelFacility_Hotel]
GO
/****** Object:  ForeignKey [FK_HotelFacility_MediaItems]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[HotelFacility]  WITH CHECK ADD  CONSTRAINT [FK_HotelFacility_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[HotelFacility] CHECK CONSTRAINT [FK_HotelFacility_MediaItems]
GO
/****** Object:  ForeignKey [FK__FIBOption__Quest__4B7734FF]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[FIBOptions]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
/****** Object:  ForeignKey [FK_PackageDetail_Dreams]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Dreams] FOREIGN KEY([dreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Dreams]
GO
/****** Object:  ForeignKey [FK_PackageDetail_Flight]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Flight] FOREIGN KEY([returnFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Flight]
GO
/****** Object:  ForeignKey [FK_PackageDetail_Flight1]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Flight1] FOREIGN KEY([departureFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Flight1]
GO
/****** Object:  ForeignKey [FK_PackageDetail_HotelMadina]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_HotelMadina] FOREIGN KEY([hotelIDMadina])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_HotelMadina]
GO
/****** Object:  ForeignKey [FK_PackageDetail_HotelMakkah]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_HotelMakkah] FOREIGN KEY([hotelIDMakkah])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_HotelMakkah]
GO
/****** Object:  ForeignKey [FK_PackageDetail_TransPort]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_TransPort] FOREIGN KEY([transportID])
REFERENCES [dbo].[TransPort] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_TransPort]
GO
/****** Object:  ForeignKey [FK_PackageDetail_VisaPackages]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_VisaPackages] FOREIGN KEY([visaID])
REFERENCES [dbo].[VisaPackages] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_VisaPackages]
GO
/****** Object:  ForeignKey [FK_PackageDetail_Ziarat]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Ziarat] FOREIGN KEY([ziaratID])
REFERENCES [dbo].[Ziarat] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Ziarat]
GO
/****** Object:  ForeignKey [FK__LessonQui__QuizI__56E8E7AB]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonQuiz]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBankQ__Quest__690797E6]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[QuizBankQuestions]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBankQ__QuizI__69FBBC1F]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[QuizBankQuestions]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News] FOREIGN KEY([related_news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News1]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News1] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News1]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_Dreams]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_Dreams] FOREIGN KEY([dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_Dreams]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_News]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_News] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_News]
GO
/****** Object:  ForeignKey [FK__UserRespo__Quest__719CDDE7]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[UserResponse]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
/****** Object:  ForeignKey [FK__UserRespon__Page__46B27FE2]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[UserResponse]  WITH CHECK ADD  CONSTRAINT [FK__UserRespon__Page__46B27FE2] FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserResponse] CHECK CONSTRAINT [FK__UserRespon__Page__46B27FE2]
GO
/****** Object:  ForeignKey [FK__UserQuizS__Quest__6EC0713C]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
/****** Object:  ForeignKey [FK__UserQuizS__QuizI__6FB49575]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK__UserQuizSt__Page__29E1370A]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD  CONSTRAINT [FK__UserQuizSt__Page__29E1370A] FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserQuizStatus] CHECK CONSTRAINT [FK__UserQuizSt__Page__29E1370A]
GO
/****** Object:  ForeignKey [FK_Navigations_DreamLayoutsnew]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_DreamLayoutsnew] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_DreamLayoutsnew]
GO
/****** Object:  ForeignKey [FK_Navigations_MediaItems]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_MediaItems]
GO
/****** Object:  ForeignKey [FK__LessonQue__Layou__4B7734FF]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonQuestion]  WITH CHECK ADD  CONSTRAINT [FK__LessonQue__Layou__4B7734FF] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonQuestion] CHECK CONSTRAINT [FK__LessonQue__Layou__4B7734FF]
GO
/****** Object:  ForeignKey [FK__LessonQue__Quest__55F4C372]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonQuestion]  WITH CHECK ADD FOREIGN KEY([Question_id])
REFERENCES [dbo].[QuestionBank] ([id])
GO
/****** Object:  ForeignKey [FK_LessonProgressDashBoard_DreamLayouts]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonProgressDashBoard]  WITH CHECK ADD  CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonProgressDashBoard] CHECK CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_LessonVideo_DreamLayouts1]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonVideo]  WITH CHECK ADD  CONSTRAINT [FK_LessonVideo_DreamLayouts1] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonVideo] CHECK CONSTRAINT [FK_LessonVideo_DreamLayouts1]
GO
/****** Object:  ForeignKey [FK_LessonVideo_MediaItems]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonVideo]  WITH CHECK ADD  CONSTRAINT [FK_LessonVideo_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonVideo] CHECK CONSTRAINT [FK_LessonVideo_MediaItems]
GO
/****** Object:  ForeignKey [FK__LessonAss__Assig__503BEA1C]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD FOREIGN KEY([Assignment_id])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
/****** Object:  ForeignKey [FK__LessonAss__Layou__51300E55]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
/****** Object:  ForeignKey [FK_LayoutTextBank_DreamLayouts]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[LayoutTextBank]  WITH CHECK ADD  CONSTRAINT [FK_LayoutTextBank_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LayoutTextBank] CHECK CONSTRAINT [FK_LayoutTextBank_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_InviteSharePage_DreamLayouts]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[InviteSharePage]  WITH CHECK ADD  CONSTRAINT [FK_InviteSharePage_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InviteSharePage] CHECK CONSTRAINT [FK_InviteSharePage_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_DiscountPackage_PackageDetail]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DiscountPackage]  WITH CHECK ADD  CONSTRAINT [FK_DiscountPackage_PackageDetail] FOREIGN KEY([packageDetailID])
REFERENCES [dbo].[PackageDetail] ([id])
GO
ALTER TABLE [dbo].[DiscountPackage] CHECK CONSTRAINT [FK_DiscountPackage_PackageDetail]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Accommodation]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Accommodation] FOREIGN KEY([roomMakkahID])
REFERENCES [dbo].[Accommodation] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Accommodation]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Accommodation1]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Accommodation1] FOREIGN KEY([roomMadinaID])
REFERENCES [dbo].[Accommodation] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Accommodation1]
GO
/****** Object:  ForeignKey [FK_CustomPackage_AirLine]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_AirLine] FOREIGN KEY([returnAirLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_AirLine]
GO
/****** Object:  ForeignKey [FK_CustomPackage_AirLine1]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_AirLine1] FOREIGN KEY([departureAirLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_AirLine1]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Flight]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Flight] FOREIGN KEY([depFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Flight]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Flight1]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Flight1] FOREIGN KEY([retFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Flight1]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Hotel]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Hotel] FOREIGN KEY([hotelMakkahID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Hotel]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Hotel1]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Hotel1] FOREIGN KEY([hotelMadinaID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Hotel1]
GO
/****** Object:  ForeignKey [FK__DreamPage__Dream__1CBC4616]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamPageAuthorization]  WITH CHECK ADD  CONSTRAINT [FK__DreamPage__Dream__1CBC4616] FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamPageAuthorization] CHECK CONSTRAINT [FK__DreamPage__Dream__1CBC4616]
GO
/****** Object:  ForeignKey [FK__DreamPage__Dream__45BE5BA9]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[DreamPageAuthorization]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
/****** Object:  ForeignKey [FK__Assignmen__Assig__3B40CD36]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[AssignmentResponse]  WITH CHECK ADD FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
/****** Object:  ForeignKey [FK__Assignment__Page__3C34F16F]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[AssignmentResponse]  WITH CHECK ADD FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
/****** Object:  ForeignKey [FK_AlharmainUserPackage_AlharmainUser1]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD  CONSTRAINT [FK_AlharmainUserPackage_AlharmainUser1] FOREIGN KEY([userID])
REFERENCES [dbo].[AlharmainUser] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage] CHECK CONSTRAINT [FK_AlharmainUserPackage_AlharmainUser1]
GO
/****** Object:  ForeignKey [FK_AlharmainUserPackage_DiscountPackage]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD  CONSTRAINT [FK_AlharmainUserPackage_DiscountPackage] FOREIGN KEY([discountID])
REFERENCES [dbo].[DiscountPackage] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage] CHECK CONSTRAINT [FK_AlharmainUserPackage_DiscountPackage]
GO
/****** Object:  ForeignKey [FK_AlharmainUserPackage_PackageDetail]    Script Date: 01/20/2017 10:09:31 ******/
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD  CONSTRAINT [FK_AlharmainUserPackage_PackageDetail] FOREIGN KEY([packageDetailID])
REFERENCES [dbo].[PackageDetail] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage] CHECK CONSTRAINT [FK_AlharmainUserPackage_PackageDetail]
GO
