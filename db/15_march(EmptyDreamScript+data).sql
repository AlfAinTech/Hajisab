USE [master]
GO
/****** Object:  Database [15_marc]    Script Date: 03/15/2017 14:32:51 ******/
CREATE DATABASE [15_marc] ON  PRIMARY 
( NAME = N'15_marc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\15_marc.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'15_marc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\15_marc_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [15_marc] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [15_marc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [15_marc] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [15_marc] SET ANSI_NULLS OFF
GO
ALTER DATABASE [15_marc] SET ANSI_PADDING OFF
GO
ALTER DATABASE [15_marc] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [15_marc] SET ARITHABORT OFF
GO
ALTER DATABASE [15_marc] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [15_marc] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [15_marc] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [15_marc] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [15_marc] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [15_marc] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [15_marc] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [15_marc] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [15_marc] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [15_marc] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [15_marc] SET  DISABLE_BROKER
GO
ALTER DATABASE [15_marc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [15_marc] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [15_marc] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [15_marc] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [15_marc] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [15_marc] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [15_marc] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [15_marc] SET  READ_WRITE
GO
ALTER DATABASE [15_marc] SET RECOVERY SIMPLE
GO
ALTER DATABASE [15_marc] SET  MULTI_USER
GO
ALTER DATABASE [15_marc] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [15_marc] SET DB_CHAINING OFF
GO
USE [15_marc]
GO
/****** Object:  Table [dbo].[Ziarat]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[Ziarat] ([id], [text]) VALUES (1, N'pkg2')
INSERT [dbo].[Ziarat] ([id], [text]) VALUES (2, N'pkg2')
SET IDENTITY_INSERT [dbo].[Ziarat] OFF
/****** Object:  Table [dbo].[TextBank]    Script Date: 03/15/2017 14:32:52 ******/
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
<div id="blue"><img alt="blue_muffin" src="/Components/MediaBank/Content/Images/Original/15_marc-logo.png" style="border-radius: 50px; width: 100px;" />
<h3>Imran</h3>

<p>Assistant Professor</p>
</div>

<div id="pink"><img alt="light_pink_muffin" src="/Components/MediaBank/Content/Images/Original/15_marc-logo.png" style="width: 100px;" />
<h3>Jahanzaib</h3>

<p>Professor</p>
</div>

<div id="white"><img alt="white_muffin" src="/Components/MediaBank/Content/Images/100x100/15_marc-logo.png" style="width: 100px;" />
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
<div class="col-md-12" style="background-color: #e6e6e6; padding-bottom: 15px; padding-top: 15px;"><img src="/Components/MediaBank/Content/Images/Original/15_marc-logo.png" style="width:100%; padding:5px;" /></div>
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
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (47, N' <link rel="stylesheet" href="css/bootstrap.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.0.0/animate.min.css">
    <link rel="stylesheet" href="css/liquid-slider.css">
    <link rel="stylesheet" href="css/bootstrap-theme.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Latest compiled and minified JavaScript -->

    <script src="js/jquery.cycle.lite.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($){
            $(''#right'').cycle({ 
                fx:      ''scrollRight'', 
                next:   ''#chat_now'',
                timeout:  0, 
                easing:  ''easeInOutBack'' 
            });
            $(''#learn_more'').click(function(e){
                e.preventDefault();
                window.location.href = "http://www.google.com";
            });
        });
        
    </script>
    <script src="js/bootstrap.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<nav class="navbar navbar-default">
<div class="container-fluid"><!-- Brand and toggle get grouped for better mobile display -->
<div class="navbar-header"><button aria-expanded="false" class="navbar-toggle collapsed" data-target="#bs-example-navbar-collapse-1" data-toggle="collapse" type="button"><span class="sr-only">Toggle navigation</span></button><a class="navbar-brand" href="#">Haji sb</a></div>
<!-- Collect the nav links, forms, and other content for toggling -->

<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav navbar-right">
	<li><a href="#">Packages</a></li>
	<li><a href="#">Agents</a></li>
	<li><a href="#">Policies</a></li>
	<li><a href="#">About Us</a></li>
</ul>
</div>
<!-- /.navbar-collapse --></div>
<!-- /.container-fluid --></nav>

<div id="slider_wrapper">
<div id="slider_overlay">
<div id="right">
<div id="first">
<div class="bot">
<div class="oval-thought">
<p>Welcome! I&#39;m Haji sb. I&#39;m here to answer all your queries</p>
</div>
</div>

<h1>Planning for Umrah</h1>

<h3>Want to book <strong>Online? </strong> Need <strong>Guidline? </strong> Best <strong>Packages?</strong></h3>

<h3>We are here for you available <strong>24/7!</strong></h3>

<h3>Lets <strong>Chat &amp; Plan</strong></h3>

<div class="col-md-6" style="margin-right: auto; margin-left: auto; float: none; margin-top: 20px;">
<div class="col-md-3">&nbsp;</div>

<div class="col-md-3"><button class="btn btn-primary" id="chat_now" style="width:100%;">Chat Now</button></div>

<div class="col-md-3"><button class="btn btn-default" id="learn_more" style="width:100%;">Learn More</button></div>

<div class="col-md-3">&nbsp;</div>
</div>
</div>

<div id="second">
<div class="container">
<div class="col-md-7">
<div class="col-md-12" style="padding:0;">
<div class="chat_haji">
<div class="col-md-12" style="padding:0">
<div class="chat_icons">
<div class="col-md-4" style="border:none;">
<div class="row">
<div class="col-md-4" style="border:none;">&nbsp;</div>
<!-- this column empty -->

<div class="col-md-4">
<div class="col-md-12" style="padding:0"><img src="img/404-200.png" width="100%" /></div>

<div class="col-md-12" style="padding:0;">
<h6>2 Feb - 5 Feb</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-12" style="padding:0"><img src="img/two-passports-white.png" width="100%" /></div>

<div class="col-md-12" style="padding:0;">
<h6>5 Weeks</h6>
</div>
</div>
</div>
</div>

<div class="col-md-8">
<div class="row">
<div class="col-md-2">
<div class="col-md-12" style="padding:0"><img src="img/kaba-icon-white.png" width="100%" /></div>

<div class="col-md-12" style="padding:0;">
<h6>2 Weeks</h6>
</div>
</div>

<div class="col-md-2">
<div class="col-md-12" style="padding:0"><img src="img/madina-icon-white.png" width="100%" /></div>

<div class="col-md-12" style="padding:0;">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-2">
<div class="col-md-12" style="padding:0"><img src="img/kaba-hotel-icon-white.png" width="100%" /></div>

<div class="col-md-12" style="padding:0;">
<h6>Al Haram</h6>
</div>
</div>

<div class="col-md-2">
<div class="col-md-12" style="padding:0"><img src="img/madina-hotel-icon-white.png" width="100%" /></div>

<div class="col-md-12" style="padding:0;">
<h6>Al Haram</h6>
</div>
</div>

<div class="col-md-2">
<div class="col-md-12" style="padding:0"><img src="img/jahaz-white.png" width="100%" /></div>

<div class="col-md-12" style="padding:0;">
<h6>Emirates</h6>
</div>
</div>

<div class="col-md-2" style="border: none;">&nbsp;</div>
<!-- this column empty --></div>
</div>
</div>
</div>

<div class="col-md-12">
<div class="chat_box">
<div class="col-md-12">
<div class="col-md-1" style="padding:5px; padding-top: 0;"><img src="img/HajiSb.png" width="100%" /></div>

<div class="col-md-7 hajisb">
<h6>Alsalam o Alikum</h6>
</div>
</div>

<div class="col-md-12">
<div class="col-md-7 clientsb">
<h6>Wa Alikum Salam</h6>
</div>
</div>
</div>
</div>
</div>
</div>

<div class="col-md-12" style="padding:0;">
<div class="col-md-9" style="padding: 0"><input class="form-control" name="message" placeholder="Enter your message here" type="text" /></div>

<div class="col-md-3" style="padding: 0"><button class="btn btn-success">Send</button></div>
</div>
</div>

<div class="col-md-5">
<h4 style="color: white; text-align: center; margin-top: 0;">Recommended Packages</h4>

<div class="col-md-10" id="recommended_packages" style="margin-right: auto; margin-left: auto; float: none; padding:0;">
<div class="col-md-12 slider_item banner">
<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>1 Week</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>2 Weeks</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Emirates</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Al-Mehdi</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Marhaba</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0; margin-top: 10px;">
<div class="col-md-7">
<h3>2,45,750 PKR</h3>
</div>

<div class="col-md-5"><button class="btn btn-primary">Book Now</button></div>
</div>
</div>
</div>

<div class="col-md-12 slider_item banner">
<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>1 Week</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>2 Weeks</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Emirates</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Al-Mehdi</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Marhaba</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0; margin-top: 10px;">
<div class="col-md-7">
<h3>2,45,750 PKR</h3>
</div>

<div class="col-md-5"><button class="btn btn-primary">Book Now</button></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<div id="special_package_wrapper">
<h3>Out Best Packages</h3>

<div class="carousel slide" data-ride="carousel" id="carousel-example-generic"><!-- Indicators -->
<ol class="carousel-indicators">
	<li class="active" data-slide-to="0" data-target="#carousel-example-generic">&nbsp;</li>
	<li data-slide-to="1" data-target="#carousel-example-generic">&nbsp;</li>
	<li data-slide-to="2" data-target="#carousel-example-generic">&nbsp;</li>
</ol>
<!-- Wrapper for slides -->

<div class="carousel-inner" role="listbox">
<div class="item active">
<div class="container">
<div class="col-md-12">
<div class="col-md-4">
<div class="col-md-12 slider_item">
<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>1 Week</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>2 Weeks</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Emirates</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Al-Mehdi</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Marhaba</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0; margin-top: 10px;">
<div class="col-md-7">
<h3>2,45,750 PKR</h3>
</div>

<div class="col-md-5"><button class="btn btn-primary">Book Now</button></div>
</div>
</div>
</div>
</div>

<div class="col-md-4">
<div class="col-md-12 slider_item">
<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>1 Week</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>2 Weeks</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Emirates</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Al-Mehdi</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Marhaba</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0; margin-top: 10px;">
<div class="col-md-7">
<h3>2,45,750 PKR</h3>
</div>

<div class="col-md-5"><button class="btn btn-primary">Book Now</button></div>
</div>
</div>
</div>
</div>

<div class="col-md-4">
<div class="col-md-12 slider_item">
<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>1 Week</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>2 Weeks</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Emirates</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Al-Mehdi</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Marhaba</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0; margin-top: 10px;">
<div class="col-md-7">
<h3>2,45,750 PKR</h3>
</div>

<div class="col-md-5"><button class="btn btn-primary">Book Now</button></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

<div class="item">
<div class="container">
<div class="col-md-12">
<div class="col-md-4">
<div class="col-md-12 slider_item">
<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>1 Week</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>2 Weeks</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Emirates</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Al-Mehdi</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Marhaba</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0; margin-top: 10px;">
<div class="col-md-7">
<h3>2,45,750 PKR</h3>
</div>

<div class="col-md-5"><button class="btn btn-primary">Book Now</button></div>
</div>
</div>
</div>
</div>

<div class="col-md-4">
<div class="col-md-12 slider_item">
<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>1 Week</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>2 Weeks</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Emirates</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Al-Mehdi</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Marhaba</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0; margin-top: 10px;">
<div class="col-md-7">
<h3>2,45,750 PKR</h3>
</div>

<div class="col-md-5"><button class="btn btn-primary">Book Now</button></div>
</div>
</div>
</div>
</div>

<div class="col-md-4">
<div class="col-md-12 slider_item">
<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>1 Week</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>2 Weeks</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0;">
<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Emirates</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Al-Mehdi</h6>
</div>
</div>

<div class="col-md-4">
<div class="col-md-3" style="padding:0"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0">
<h6>Marhaba</h6>
</div>
</div>
</div>
</div>

<div class="row">
<div class="col-md-12" style="padding:0; margin-top: 10px;">
<div class="col-md-7">
<h3>2,45,750 PKR</h3>
</div>

<div class="col-md-5"><button class="btn btn-primary">Book Now</button></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
...</div>
<!-- Controls --><a class="left carousel-control" data-slide="prev" href="#carousel-example-generic" role="button"><span class="sr-only">Previous</span> </a> <a class="right carousel-control" data-slide="next" href="#carousel-example-generic" role="button"> <span class="sr-only">Next</span> </a></div>
</div>

<div id="primary_package_wrapper">
<h2>Primary Packages</h2>

<h4>Our Primary Umrah Packages have been divided into three major categories</h4>

<div class="container">
<div class="col-md-4">
<div class="col-md-12 primary_packages">
<div class="primary_package_overlay">
<div class="col-md-9" style="float:right;">
<div class="col-md-12" style="padding:0;">
<h3>BRONZE</h3>
</div>

<div class="col-md-12" style="padding:0; border-bottom: 1px solid white;">
<h4>Starting From <span>100,000</span> PKR</h4>
</div>

<div class="col-md-12" style="padding:0;">
<ul>
	<li>Feature 01</li>
	<li>Feature 02</li>
	<li>Feature 03</li>
</ul>
</div>

<div class="col-md-6" style="padding:0; margin-right: auto; margin-left: auto; float: none;"><button class="btn btn-default">Explore</button></div>
</div>
</div>
</div>
</div>

<div class="col-md-4">
<div class="col-md-12 primary_packages">
<div class="primary_package_overlay">
<div class="col-md-9" style="float:right;">
<div class="col-md-12" style="padding:0;">
<h3>GOLD</h3>
</div>

<div class="col-md-12" style="padding:0; border-bottom: 1px solid white;">
<h4>Starting From <span>300,000</span> PKR</h4>
</div>

<div class="col-md-12" style="padding:0;">
<ul>
	<li>Feature 01</li>
	<li>Feature 02</li>
	<li>Feature 03</li>
</ul>
</div>

<div class="col-md-6" style="padding:0; margin-right: auto; margin-left: auto; float: none;"><button class="btn btn-default">Explore</button></div>
</div>
</div>
</div>
</div>

<div class="col-md-4">
<div class="col-md-12 primary_packages">
<div class="primary_package_overlay">
<div class="col-md-9" style="float:right;">
<div class="col-md-12" style="padding:0;">
<h3>SILVER</h3>
</div>

<div class="col-md-12" style="padding:0; border-bottom: 1px solid white;">
<h4>Starting From <span>200,000</span> PKR</h4>
</div>

<div class="col-md-12" style="padding:0;">
<ul>
	<li>Feature 01</li>
	<li>Feature 02</li>
	<li>Feature 03</li>
</ul>
</div>

<div class="col-md-6" style="padding:0; margin-right: auto; margin-left: auto; float: none;"><button class="btn btn-default">Explore</button></div>
</div>
</div>
</div>
</div>
</div>
</div>

<div id="what_we_offer">
<h1>What we offer?</h1>

<h4>We offer a great variety of umrah packages based on your needs. Filter by:</h4>
</div>

<div class="col-md-12 offer_tabs" style="padding:0">
<div class="container">
<div id="what_we_offer_tabs">
<ul class="nav nav-tabs nav-justified" role="tablist">
	<li class="active" role="presentation">
	<h2><a aria-controls="budget" data-toggle="tab" href="#budget" role="tab">Budget Packages</a></h2>
	</li>
	<li role="presentation">
	<h2><a aria-controls="hotel" data-toggle="tab" href="#hotel" role="tab">Hotel Based</a></h2>
	</li>
	<li role="presentation">
	<h2><a aria-controls="nights" data-toggle="tab" href="#nights" role="tab">No of Nights</a></h2>
	</li>
</ul>
<!-- Tab panes -->

<div class="tab-content">
<div class="tab-pane active" id="budget" role="tabpanel">
<div id="what_we_offer_tabs_inner">
<div class="col-md-3" style="padding:0;"><!-- Nav tabs -->
<ul class="nav nav-tabs nav-stacked" role="tablist">
	<li class="active" role="presentation">
	<h2><a aria-controls="bronze" data-toggle="tab" href="#bronze" role="tab">Bronze</a></h2>
	</li>
	<li role="presentation">
	<h2><a aria-controls="gold" data-toggle="tab" href="#gold" role="tab">Gold</a></h2>
	</li>
	<li role="presentation">
	<h2><a aria-controls="silver" data-toggle="tab" href="#silver" role="tab">Silver</a></h2>
	</li>
</ul>
</div>

<div class="col-md-9" style="padding:0;"><!-- Tab panes -->
<div class="tab-content">
<div class="tab-pane active" id="bronze" role="tabpanel">
<div class="col-md-11" style="margin-right: auto; margin-left: auto; float: none;">
<div class="col-md-4">
<div class="col-md-12 what_we_offer_item">
<div class="item_overlay">
<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0;"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>PIA</h6>
</div>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0;"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>5 Days</h6>
</div>
</div>

<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0;"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>5 Days</h6>
</div>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-2" style="padding:0;"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-10" style="padding:0;">
<h6>Ritz Carlton, Makkah</h6>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-2" style="padding:0;"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-10" style="padding:0;">
<h6>Marriot, Madina</h6>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-top: 5px;">
<h3>2,74,500 PKR</h3>
</div>

<div class="col-md-12" style="margin-top: 5px;"><button class="btn btn-default">Book Now</button></div>
</div>
</div>
</div>

<div class="col-md-4">
<div class="col-md-12 what_we_offer_item">
<div class="item_overlay">
<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0;"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>PIA</h6>
</div>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0;"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>5 Days</h6>
</div>
</div>

<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0;"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>5 Days</h6>
</div>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-2" style="padding:0;"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-10" style="padding:0;">
<h6>Ritz Carlton, Makkah</h6>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-2" style="padding:0;"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-10" style="padding:0;">
<h6>Marriot, Madina</h6>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-top: 5px;">
<h3>2,74,500 PKR</h3>
</div>

<div class="col-md-12" style="margin-top: 5px;"><button class="btn btn-default">Book Now</button></div>
</div>
</div>
</div>

<div class="col-md-4">
<div class="col-md-12 what_we_offer_item">
<div class="item_overlay">
<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0"><img src="img/two-passports.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>3 Weeks</h6>
</div>
</div>

<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0;"><img src="img/jahaz.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>PIA</h6>
</div>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0;"><img src="img/kaba-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>5 Days</h6>
</div>
</div>

<div class="col-md-6" style="padding:0">
<div class="col-md-3" style="padding:0;"><img src="img/madina-icon.png" width="100%" /></div>

<div class="col-md-9" style="padding:0;">
<h6>5 Days</h6>
</div>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-2" style="padding:0;"><img src="img/kaba-hotel-icon.png" width="100%" /></div>

<div class="col-md-10" style="padding:0;">
<h6>Ritz Carlton, Makkah</h6>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-bottom: 5px;">
<div class="col-md-2" style="padding:0;"><img src="img/madina-hotel-icon.png" width="100%" /></div>

<div class="col-md-10" style="padding:0;">
<h6>Marriot, Madina</h6>
</div>
</div>

<div class="col-md-12" style="padding:0; margin-top: 5px;">
<h3>2,74,500 PKR</h3>
</div>

<div class="col-md-12" style="margin-top: 5px;"><button class="btn btn-default">Book Now</button></div>
</div>
</div>
</div>

<div class="col-md-12">
<div class="col-md-4" style="padding-top: 20px; margin-right: auto; margin-left: auto; float: none;"><button class="btn btn-primary">Learn More</button></div>
</div>
</div>
</div>

<div class="tab-pane" id="gold" role="tabpanel">...</div>

<div class="tab-pane" id="silver" role="tabpanel">...</div>
</div>
</div>
</div>
</div>

<div class="tab-pane" id="hotel" role="tabpanel">&nbsp;</div>

<div class="tab-pane" id="nights" role="tabpanel">&nbsp;</div>
</div>
</div>
</div>
</div>

<div class="advertisement col-md-12"><img src="img/ad.jpg" width="100%" /></div>

<div class="col-md-12" style="padding:0;">
<div id="footer_wrapper">
<div id="upper_footer">
<div class="container">
<div class="col-md-4">
<h3>About Alharmain.org</h3>

<p>In hendrerit lorem in tellus aliquet, eu posuere nibh tempor. Nunc convallis tortor nec diam fringilla, in viverra urna tristique. Curabitur volutpat eu odio tempor ultricies. Duis accumsan posuere nisi, ut bibendum lacus feugiat a. Ut sagittis est nec ligula viverra, a aliquet dui cursus. Duis ac dolor non tortor varius condimentum. Maecenas efficitur faucibus turpis, sit amet dictum turpis. Vestibulum convallis, nulla ac faucibus pellentesque, lectus nibh vehicula quam, eget sollicitudin arcu sapien eget dolor. Sed sed ligula fringilla, hendrerit nunc id, tincidunt magna. Integer vel tristique massa.</p>
</div>

<div class="col-md-5" style="padding:0">
<div class="col-md-12">
<div class="col-md-2" style="padding:25px; padding-right:0; padding-left: 50px;"><img src="img/phone.png" width="100%" /></div>

<div class="col-md-10" style="padding:15px;">
<h4>+92-321 8818813</h4>
</div>
</div>

<div class="col-md-12" style="margin-top:-25px;">
<div class="col-md-2" style="padding:25px; padding-right:0; padding-left: 50px;"><img src="img/mail.png" width="100%" /></div>

<div class="col-md-10" style="padding:15px;">
<h4>info@alharmain.org</h4>
</div>
</div>

<div class="col-md-12" style="margin-top:-25px;">
<div class="col-md-2" style="padding:25px; padding-right:0; padding-left: 50px;"><img src="img/address.png" width="100%" /></div>

<div class="col-md-10" style="padding:15px;">
<h4>162-H, Block-C, DHA Phase-6, Lahore, Punjab, Pakistan</h4>
</div>
</div>
</div>

<div class="col-md-3" style="float:right">
<div class="col-md-12" style="padding:0">
<div class="col-md-3" style="padding:15px;"><img src="img/fb_icon.png" width="100%" /></div>

<div class="col-md-3" style="padding:15px;">&nbsp;</div>

<div class="col-md-3" style="padding:15px;"><img src="img/linkedin-icon.png" width="100%" /></div>

<div class="col-md-3" style="padding:15px;"><img src="img/twiiter-icon.png" width="100%" /></div>
</div>

<div class="col-md-12" style="padding:0">
<h4><a href="#">Privacy Policy</a></h4>
</div>

<div class="col-md-12" style="padding:0">
<h4><a href="#">Terms &amp; Conditions</a></h4>
</div>

<div class="col-md-12" style="padding:0">
<h4><a href="#">Cookie Policy &amp; client side regulations</a></h4>
</div>

<div class="col-md-12" style="padding:0">
<h4><a href="#">About Alfain Technologies (Pvt) Limited</a></h4>
</div>
</div>
</div>
</div>

<div id="lower_footer">
<div class="container">
<h5 style="padding-top: 5px; color: white;">Copyrights &copy; Hajisb.com All Rights Reserved</h5>
</div>
</div>
</div>
</div>
', 0, N'mttextbnk')
SET IDENTITY_INSERT [dbo].[TextBank] OFF
/****** Object:  Table [dbo].[Tags]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[QuizCategories]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[TransPort]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[QuestionCategories]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[Multimediabank]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Multimediabank] ON
INSERT [dbo].[Multimediabank] ([id], [Name], [Description], [DirectoryPath], [IndexFilePath]) VALUES (7, N'Bank1', N'nss', N'~/Components/MultimediaBank/Items/AlharmainHome', N'../../Components/MultimediaBank/Items/AlharmainHome/index.html')
SET IDENTITY_INSERT [dbo].[Multimediabank] OFF
/****** Object:  Table [dbo].[QuestionType]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[QuestionType] ([id], [QTypeName], [EditTypeControl], [ViewTypeControl]) VALUES (4, N'MultipleFIB', N'Components/QuestionBank/MultipleFIBHandler.aspx', N'~/Components/QuestionBank/User/MultiFIBUserView.ascx')
SET IDENTITY_INSERT [dbo].[QuestionType] OFF
/****** Object:  Table [dbo].[LessonMenu]    Script Date: 03/15/2017 14:32:52 ******/
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
	[previous_LayoutID] [int] NULL,
	[next_LayoutID] [int] NULL,
	[DisplayName] [nvarchar](50) NOT NULL,
	[menuRight] [varchar](50) NULL,
	[menuType] [nvarchar](50) NOT NULL,
	[isActive] [bit] NULL,
	[isDefault] [bit] NULL,
	[AppOrder] [int] NULL,
	[isShowNP] [bit] NULL,
 CONSTRAINT [PK_LessonMenu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
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
/****** Object:  Table [dbo].[FileCategories]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[MediaCategories]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[MCQOptions]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[AdminsettingsNewsFeed]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[AlharmainUser]    Script Date: 03/15/2017 14:32:52 ******/
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
 CONSTRAINT [PK_AlharmainUser] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'00e15ddc-48b6-400e-9d5a-7dc89cb0cbcd', N'15_marcapp@gmail.com', 0, N'AATGX+lfjpsaVLnXP0qyHT0Mha7lqn9iafL3BFkMLKg9/ABQvb52l2mysKEjn0278Q==', N'c6488e26-b8e9-43dc-9024-cb5103fa88c2', NULL, 0, 0, NULL, 0, 0, N'haris')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', N'jahanzaib@uet.edu.pk', 0, N'AJ40ttPY3TVaa9x2eNxehQn04TAZU0mmvPusHUiAH0DjDU2qf+1PvMFZElhKQ6GXaw==', N'e07829c2-821f-480b-bfeb-8b08876b7017', NULL, 0, 0, NULL, 0, 0, N'jahanzaibbabar')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3ad5b021-ffea-486d-8640-9de2f6e161ca', N'15_marcapp@gmail.com', 0, N'APUlWFqACsVGWmPdPaszKzyXLt6W5w0dlNzr9K68RWh2ZifsNMeNVfUligGx3Bo9ZQ==', N'0d67e239-ce93-4b8c-9c7f-07b6501d4af4', NULL, 0, 0, NULL, 0, 0, N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3c41f5f6-5e0e-488a-b740-cf6732213f49', N'15_marcapp@gmail.com', 0, NULL, N'4ccc8deb-0ce0-4e1e-8c0b-00e359e8ba1d', NULL, 0, 0, NULL, 0, 0, N'15_marcapp')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'447b2ff1-48a0-4094-ad9f-1a2e8be568ce', N'15_marcapp@gmail.com', 0, NULL, N'ab6d6468-2fb7-4d68-8846-f84f79560666', NULL, 0, 0, NULL, 0, 0, N'15_marcapps')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'48ff644d-46ef-4412-913e-46994fe283b0', N'saba.akmal@kics.edu.pk', 0, NULL, N'515dded7-7086-4df6-92ee-06db254f3a20', NULL, 0, 0, NULL, 0, 0, N'SabaAkmal')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6a6328ff-530b-40e3-9635-6f040941aa02', N'jahanzaib996@gmail.com', 0, NULL, N'f7c2e612-6cd3-4841-a1fc-357cc40cdd7e', NULL, 0, 0, NULL, 0, 0, N'jzeebe')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8ede996c-fa92-4655-8b91-282af6d3cd49', N'resonotech@gmail.com', 0, NULL, N'76d80ac5-2633-4209-9dae-812e12547b73', NULL, 0, 0, NULL, 0, 0, N'resonotech')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'985d0276-bba6-4d8a-8b02-b8440f3a176e', N'15_marcapp@gmail.com', 0, N'AMkcl8XqJLmFMTg6DKzlK0OejsOlYM8Iod19y1mKYU6BMk4fYFkhE1DbmhSVnJ5DRA==', N'f212c614-494a-4cf2-b049-afd18d417e83', NULL, 0, 0, NULL, 0, 0, N'amin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9ec276e3-6ca1-486f-ab56-362b09217745', N'awais.hassan@kics.edu.pk', 0, NULL, N'22d42093-6316-40c0-ba06-c8cf4ec6cdaa', NULL, 0, 0, NULL, 0, 0, N'M.AwaisHassan')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a0e8a11e-0a02-4361-bbc6-cfa8ae2f41ce', N'15_marcapp@gmail.com', 0, N'AHJXkje22mOlaB9eXNwRvBSkCGKMW2WjP1QXRLkHQeP7XyKfAiDZwYHOU9qSvazOWg==', N'53c5364d-bdbe-4366-83f2-e2d9bf577339', NULL, 0, 0, NULL, 0, 0, N'asif')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b12ebd32-72e6-4d7d-a544-e1caa179db0a', N'saba.akmal@kics.edu.pk', 0, N'AEJ6Pf9VRet2xNaZCybpNlsV5cpezEjOgLW7Yst3EheqA1QF8kMIt/l2JFfmxuNzpw==', N'f18342a3-c2e6-49ed-a6be-b93dfed0b782', NULL, 0, 0, NULL, 0, 0, N'sabaakmal23')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'b3afc247-bd2f-4be2-ab35-6d6a71e17816', N'jahanzaib996@gmail.com', 0, N'AKH4S9FEcExUM6PDNxs0XFSBy34L7SQbnCoFJMVyaUh8qUiWJxMKIjYl6990wUfQ4w==', N'9a78b00f-1f5c-45a8-a4f9-9dbfa84d9841', NULL, 0, 0, NULL, 0, 0, N'jzeebee')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c3b70fc3-2c17-487f-b023-503f5c0232c5', N'october.pink.10@gmail.com', 0, NULL, N'2f31711d-2263-4cfe-82e2-f6e5cb29e92c', NULL, 0, 0, NULL, 0, 0, N'FaizaJahanzaib')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cde4eb97-41d7-4936-84e2-e915ed50e8f0', N'15_marcapp@gmail.com', 0, N'AE/Gw7J9eIzUx5I+U0M3aJVFlL9uzUC945VqluOA0+N2J+GOBUVMYYNn2fB/xj7Lhg==', N'c2eef060-807a-4cab-9a8f-bd04aa49adbe', NULL, 0, 0, NULL, 0, 0, N'ali')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e40b58ec-a049-423a-bdb3-ce988352056c', N'saba.akmal@kics.edu.pk', 0, N'AHj9k2dWiNi6pDagyI5V4kN1CJev8oAORsPoAf2jKqSOwcmHZPG0s/Ayb18Zyajzkg==', N'1faed6b0-1812-466f-b37c-d19d25148512', NULL, 0, 0, NULL, 0, 0, N'saba')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'edba741d-aac8-4959-a79c-e18f24f86c87', N'jahanzaib996@gmail.com', 0, NULL, N'55984a33-16d9-44cf-ab9f-c5aa9036ba01', NULL, 0, 0, NULL, 0, 0, N'MuhammadJahanzaib')
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'C3A2048D-D8F2-4951-A4AC-657853C6BC9EAD', N'UmrahAdmin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'C3A2048D-D8F2-4951-A4AC-7CC556BC9EAD', N'EnrolledUser')
/****** Object:  Table [dbo].[BloomsTaxonomy]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BloomsTaxonomy] ON
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (1, N'Knowledge')
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (2, N'Comprehension')
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (3, N'Application')
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (4, N'Analysis')
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (5, N'Synthesis')
INSERT [dbo].[BloomsTaxonomy] ([id], [TaxonomyName]) VALUES (6, N'Evaluation')
SET IDENTITY_INSERT [dbo].[BloomsTaxonomy] OFF
/****** Object:  Table [dbo].[AssignmentCategories]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[DreamType]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[ClientLayout]    Script Date: 03/15/2017 14:32:52 ******/
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
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''PackageHeader''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Detail Page Header''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Detail Page Header</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''2'' data-name=''Umrah Detail''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Umrah Detail</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><input type=''hidden'' id=''counter_current'' value=''4''><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''3'' data-name=''pkg footer''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientLayout] ([id], [layoutName], [layoutContent]) VALUES (8, N'BookingForm', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle ui-sortable-handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid='''' data-name=''PackageHeader''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>PackageHeader</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''1'' data-name=''Booking Form Header''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Booking Form Header</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''2'' data-name=''Booking Form''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>Booking Form</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><input type=''hidden'' id=''counter_current'' value=''4''><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-basedreamserverid=''3'' data-name=''pkg footer''><a href=''#'' style=''pointer-events:none; color:white;''><h4 style=''margin:0;''>pkg footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
SET IDENTITY_INSERT [dbo].[ClientLayout] OFF
/****** Object:  Table [dbo].[ControlCategory]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[DynamicLayouts]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[DreamUserProfile]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[DreamTags]    Script Date: 03/15/2017 14:32:52 ******/
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
SET IDENTITY_INSERT [dbo].[DreamTags] OFF
/****** Object:  Table [dbo].[AssignmentBank]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[AirLine]    Script Date: 03/15/2017 14:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirLine](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[AspNetUserID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_AirLine] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AirLine] ON
INSERT [dbo].[AirLine] ([id], [Name], [AspNetUserID]) VALUES (1, N'Pakistan International Airline', N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
SET IDENTITY_INSERT [dbo].[AirLine] OFF
/****** Object:  Table [dbo].[MediaItems]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (18, N'15_marc-logo.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6D4004C9D03 AS DateTime))
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
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (57, N'content.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6E100FCF434 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (58, N'content.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6E100FD2165 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (59, N'Untitled-3.gif', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6E101035E63 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (60, N'3.jpg', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6E5018A421A AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (61, N'chem.jpg', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6E5018A63DE AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (62, N'physics.gif', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6E60000FC95 AS DateTime))
SET IDENTITY_INSERT [dbo].[MediaItems] OFF
/****** Object:  Table [dbo].[Files]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[QuestionSubCategories]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[LessonMenuPreRequisite]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LessonMenuPreRequisite] ON
INSERT [dbo].[LessonMenuPreRequisite] ([id], [menu_id], [pre_req_menu_id]) VALUES (27, 20, 11)
INSERT [dbo].[LessonMenuPreRequisite] ([id], [menu_id], [pre_req_menu_id]) VALUES (28, 20, 13)
INSERT [dbo].[LessonMenuPreRequisite] ([id], [menu_id], [pre_req_menu_id]) VALUES (29, 41, 48)
SET IDENTITY_INSERT [dbo].[LessonMenuPreRequisite] OFF
/****** Object:  Table [dbo].[LessonMenuAvailability]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[TextBankTag]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[UserLessonProgress]    Script Date: 03/15/2017 14:32:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLessonProgress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menu_id] [int] NOT NULL,
	[AspNetUser_id] [nvarchar](128) NOT NULL,
	[progress] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_UserLessonProgress] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserLessonProgress] ON
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (32, 60, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', CAST(99.999 AS Decimal(18, 3)))
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (33, 61, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', CAST(83.330 AS Decimal(18, 3)))
SET IDENTITY_INSERT [dbo].[UserLessonProgress] OFF
/****** Object:  Table [dbo].[VisaPackages]    Script Date: 03/15/2017 14:32:52 ******/
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
	[AspNetUserID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_VisaPackages] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VisaPackages] ON
INSERT [dbo].[VisaPackages] ([id], [visaTitle], [amount], [issueDate], [expireDate], [AspNetUserID]) VALUES (1, N'Ramzan', 12000, CAST(0x593C0B00 AS Date), CAST(0x673C0B00 AS Date), N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
SET IDENTITY_INSERT [dbo].[VisaPackages] OFF
/****** Object:  Table [dbo].[MediaTags]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[VideoTranscript]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[QuizBank]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[QuizBank] ([id], [Name], [Description], [Categoryid], [MediaItemID]) VALUES (1, N'New Quiz for ECAT', N'New Quiz', 1, 14)
SET IDENTITY_INSERT [dbo].[QuizBank] OFF
/****** Object:  Table [dbo].[News]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[Package]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[QuestionBank]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
/****** Object:  Table [dbo].[Controls]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
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
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (42, 2, N'PackageHeader', 15, N'vvv', N'~/UmrahComponents/headerFooter/Packageheader.ascx', N'~/UmrahComponents/headerFooter/Packageheader.ascx', 0, N'vvv', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (43, 2, N'pkg footer', 22, N'vv', N'~/UmrahComponents/headerFooter/PackageFooter.ascx', N'~/UmrahComponents/headerFooter/PackageFooter.ascx', 0, N'vv', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (47, 1, N'recentDreams', 4, N'abc', N'~/Components/Dreams/RecentDreams.ascx', N'~/Components/Dreams/RecentDreams.ascx', 0, N'123', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (50, 1, N'ChatBot', 5, N'xyz', N'~/chat/ChatControl.ascx', N'/chat/Connect.aspx', 0, N'cyrr', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (60, 2, N'BestUmrahPackage', 50, N'abc', N'~/UmrahComponents/HomePageControls/BestUmrahPackages.ascx', N'.', 0, N'123', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (61, 2, N'OfferedPackages', 50, N'abc', N'~/UmrahComponents/HomePageControls/OfferedPackages.ascx', N'.', 0, N'aa', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (62, 2, N'PrimaryPackages', 50, N'abc', N'~/UmrahComponents/HomePageControls/PrimaryUmrahPackages.ascx', N'.', 0, N'aa', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (63, 2, N'UmrahChatHeader', 50, N'abc', N'~/UmrahComponents/headerFooter/UmrahChatheader.ascx', N'/chat/Connect.aspx', 0, N'abc', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (67, 2, N'Umrah Detail', 50, N'abc', N'~/UmrahComponents/PackageComponent/UmrahPackageDetail.ascx', N'.', 0, N'abc', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (68, 2, N'Booking Form', 50, N'abc', N'~/UmrahComponents/PackageComponent/BookingForm.ascx', N'.', 0, N'abc', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (69, 2, N'Umrah Detail ListView', 50, N'abc', N'~/UmrahComponents/FilterPageControls/UmrahDetail_ListView.ascx', N'.', 0, N'.', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (70, 2, N'Umrah Search Filter', 50, N'abc', N'~/UmrahComponents/FilterPageControls/DetailSearchFilter.ascx', N'.', 0, N'.', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (71, 2, N'Booking Form Header', 50, N'abc', N'~/UmrahComponents/headerFooter/BookingFormHeader.ascx', NULL, 0, N'.', 0)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [DefautControlName], [AdminControlPath], [isSeperateWindow], [DeleteControlPath], [isProgress]) VALUES (72, 2, N'Detail Page Header', 50, N'abc', N'~/UmrahComponents/headerFooter/DetailHeader.ascx', N'.', 0, N'v', 0)
SET IDENTITY_INSERT [dbo].[Controls] OFF
/****** Object:  Table [dbo].[DreamMessages]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[AssignmentResponse]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[AssignmentResponse] ([id], [AssignmentID], [UserID], [Page], [isSubmitted], [UploadedFilePath], [UploadedFileType], [AssignmentResult]) VALUES (1, 1, N'3ad5b021-ffea-486d-8640-9de2f6e161ca', 54, 1, N'D:\15_marc\15_marc\Components\Assignments\Content\Files\Momentum\3ad5b021-ffea-486d-8640-9de2f6e161ca_Momentum.pdf', N'.pdf', CAST(0.000 AS Decimal(15, 3)))
INSERT [dbo].[AssignmentResponse] ([id], [AssignmentID], [UserID], [Page], [isSubmitted], [UploadedFilePath], [UploadedFileType], [AssignmentResult]) VALUES (2, 1, N'1ee8e6c2-1582-48e2-9900-1a6e095bc3ab', 54, 1, N'D:\15_marc\15_marc\Components\Assignments\Content\Files\Momentum\1ee8e6c2-1582-48e2-9900-1a6e095bc3ab_Momentum.docx', N'.docx', CAST(9.000 AS Decimal(15, 3)))
SET IDENTITY_INSERT [dbo].[AssignmentResponse] OFF
/****** Object:  Table [dbo].[Dreams]    Script Date: 03/15/2017 14:32:52 ******/
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
	[dreamTypeID] [int] NULL,
	[AspNetUserID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Dreams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 03/15/2017 14:32:52 ******/
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
	[AspNetUserID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON
INSERT [dbo].[Hotel] ([id], [hotelName], [description], [rating], [distance], [mediaID], [AspNetUserID]) VALUES (2, N'hotel1', N'    		xyz', 1, 4, 23, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
INSERT [dbo].[Hotel] ([id], [hotelName], [description], [rating], [distance], [mediaID], [AspNetUserID]) VALUES (3, N'hotel2', N'    		', 3, 2, 50, N'3ad5b021-ffea-486d-8640-9de2f6e161ca')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
/****** Object:  Table [dbo].[Flight]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[Flight] ([id], [Name], [departureDate], [returnDate], [fromCity], [destinationCity], [price], [flightType], [airLineID]) VALUES (1, N'PIA-123', CAST(0x553C0B00 AS Date), CAST(0x763C0B00 AS Date), N'Lahore', N'Jaddah', 120000, 2, 1)
SET IDENTITY_INSERT [dbo].[Flight] OFF
/****** Object:  Table [dbo].[DreamUserLikes]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[ClientPage]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[Accommodation]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (3, N'room 1', 1200, 1, 2)
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (4, N'room2', 13000, 1, 2)
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (5, N'single', 1200, 1, 3)
INSERT [dbo].[Accommodation] ([id], [Name], [price], [availability], [hotelID]) VALUES (6, N'double', 1500, 1, 3)
SET IDENTITY_INSERT [dbo].[Accommodation] OFF
/****** Object:  Table [dbo].[DreamLayouts]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[DreamEnrollment]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[HotelImage]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[HotelImage] ([id], [mediaID], [hotelID]) VALUES (1, 43, 2)
SET IDENTITY_INSERT [dbo].[HotelImage] OFF
/****** Object:  Table [dbo].[HotelFacility]    Script Date: 03/15/2017 14:32:52 ******/
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
INSERT [dbo].[HotelFacility] ([id], [Name], [availability], [mediaID], [hotelID]) VALUES (1, N'facility 1', 1, 25, 2)
SET IDENTITY_INSERT [dbo].[HotelFacility] OFF
/****** Object:  Table [dbo].[FIBOptions]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[LessonQuiz]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LessonQuiz] ON
INSERT [dbo].[LessonQuiz] ([id], [Layout_id], [BaseControlID], [QuizID], [Graded], [Marks], [TimeBased], [TotalTime], [visibleQuestions], [QuestionsPerPage], [HintOption]) VALUES (6, 80, N'BaseDreamControl', 1, 1, CAST(100.000 AS Decimal(15, 3)), 0, 200, 2, 2, N'Normal')
SET IDENTITY_INSERT [dbo].[LessonQuiz] OFF
/****** Object:  Table [dbo].[PackageDetail]    Script Date: 03/15/2017 14:32:52 ******/
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
	[additionalExpense] [int] NOT NULL,
	[additionalDetail] [nvarchar](max) NULL,
	[isAirLineAvailable] [bit] NOT NULL,
	[packageType] [nvarchar](50) NOT NULL,
	[startDate] [date] NULL,
	[minRange] [float] NOT NULL,
	[maxRange] [float] NOT NULL,
 CONSTRAINT [PK_PackageDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionHints]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QuestionHints] ON
INSERT [dbo].[QuestionHints] ([id], [QuestionID], [HintText]) VALUES (1, 12, N'You can feel it.&nbsp;')
INSERT [dbo].[QuestionHints] ([id], [QuestionID], [HintText]) VALUES (2, 15, N'This is my hint')
INSERT [dbo].[QuestionHints] ([id], [QuestionID], [HintText]) VALUES (3, 14, N'This is my hints')
INSERT [dbo].[QuestionHints] ([id], [QuestionID], [HintText]) VALUES (4, 4, N'This is Abdullah&#39;s hint.&nbsp;')
SET IDENTITY_INSERT [dbo].[QuestionHints] OFF
/****** Object:  Table [dbo].[NewsRelatedNews]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[NewsDreamNews]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[MultiFIBMarkup]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MultiFIBMarkup] ON
INSERT [dbo].[MultiFIBMarkup] ([id], [QuestionID], [QuestionMarkup]) VALUES (1, 18, N'

        <div class="col-md-3" data-type="Text" data-component="1"><div class="col-md-10"><span class="mfib" id="span_1">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="1" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="2"><div class="col-md-8"><span class="mfib" id="blank_2">Jahanzaib</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_2">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="2" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="3"><div class="col-md-10"><span class="mfib" id="span_3">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="3" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="4"><div class="col-md-8"><span class="mfib" id="blank_4">Muhammad</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_4">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="4" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="5"><div class="col-md-10"><span class="mfib" id="span_5">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="5" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="6"><div class="col-md-8"><span class="mfib" id="blank_6">Faiza</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_6">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="6" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="7"><div class="col-md-8"><span class="mfib" id="blank_7">Haider</span></div><div class="col-md-2"><span data-weightage="100" id="weightage_7">100</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="7" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div>')
INSERT [dbo].[MultiFIBMarkup] ([id], [QuestionID], [QuestionMarkup]) VALUES (2, 19, N'

        <div class="col-md-3" data-type="Text" data-component="1"><div class="col-md-10"><span class="mfib" id="span_1">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="1" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="2"><div class="col-md-8"><span class="mfib" id="blank_2">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_2">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="2" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="3"><div class="col-md-10"><span class="mfib" id="span_3">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="3" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="4"><div class="col-md-8"><span class="mfib" id="blank_4">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_4">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="4" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="5"><div class="col-md-10"><span class="mfib" id="span_5">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="5" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="6"><div class="col-md-8"><span class="mfib" id="blank_6">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_6">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="6" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="7"><div class="col-md-8"><span class="mfib" id="blank_7">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_7">90</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="7" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div>')
INSERT [dbo].[MultiFIBMarkup] ([id], [QuestionID], [QuestionMarkup]) VALUES (3, 20, N'

        <div class="col-md-3" data-type="Text" data-component="1"><div class="col-md-10"><span class="mfib" id="span_1">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="1" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="2"><div class="col-md-8"><span class="mfib" id="blank_2">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_2">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="2" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="3"><div class="col-md-10"><span class="mfib" id="span_3">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="3" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="4"><div class="col-md-8"><span class="mfib" id="blank_4">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_4">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="4" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Text" data-component="5"><div class="col-md-10"><span class="mfib" id="span_5">text area</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil edit" data-edit="5" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="6"><div class="col-md-8"><span class="mfib" id="blank_6">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_6">80</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="6" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div><div class="col-md-3" data-type="Blank" data-component="7"><div class="col-md-8"><span class="mfib" id="blank_7">blank area</span></div><div class="col-md-2"><span data-weightage="80" id="weightage_7">90</span></div><div class="col-md-2"><span class="glyphicon glyphicon-pencil fedit" data-edit="7" aria-hidden="true"></span><span class="glyphicon glyphicon-remove remove" aria-hidden="true"></span></div></div>')
SET IDENTITY_INSERT [dbo].[MultiFIBMarkup] OFF
/****** Object:  Table [dbo].[MultiFIBComponents]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MultiFIBComponents] ON
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (38, 18, N'Text', N'text area', CAST(0.00 AS Decimal(15, 2)), 1)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (39, 18, N'Blank', N'Jahanzaib', CAST(80.00 AS Decimal(15, 2)), 2)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (40, 18, N'Text', N'text area', CAST(0.00 AS Decimal(15, 2)), 3)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (41, 18, N'Blank', N'Muhammad ', CAST(80.00 AS Decimal(15, 2)), 4)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (42, 18, N'Text', N'text area', CAST(0.00 AS Decimal(15, 2)), 5)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (43, 18, N'Blank', N'Faiza', CAST(80.00 AS Decimal(15, 2)), 6)
INSERT [dbo].[MultiFIBComponents] ([id], [QuestionID], [TextType], [TextContent], [Weightage], [Sequence]) VALUES (44, 18, N'Blank', N'Haider', CAST(100.00 AS Decimal(15, 2)), 7)
SET IDENTITY_INSERT [dbo].[MultiFIBComponents] OFF
/****** Object:  Table [dbo].[QuizBankQuestions]    Script Date: 03/15/2017 14:32:52 ******/
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
SET IDENTITY_INSERT [dbo].[QuizBankQuestions] OFF
/****** Object:  Table [dbo].[UserResponse]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserQuizStatus]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[UserHintStatus]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Navigations]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[LessonVideo]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[LessonQuestion]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonProgressDashBoard]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[LessonProgressControl]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonMultimedia]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LessonAssignments]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[LayoutTextBank]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[InviteSharePage]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[DiscountPackage]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[CustomPackage]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[ChatAdmin]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DreamPageControls]    Script Date: 03/15/2017 14:32:52 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DreamPageAuthorization]    Script Date: 03/15/2017 14:32:52 ******/
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
/****** Object:  Table [dbo].[AlharmainUserPackage]    Script Date: 03/15/2017 14:32:52 ******/
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
	[adults] [int] NOT NULL,
	[children] [int] NOT NULL,
	[infants] [int] NOT NULL,
 CONSTRAINT [PK_AlharmainUserPackage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_TextBank_TextName]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[TextBank] ADD  CONSTRAINT [DF_TextBank_TextName]  DEFAULT ('') FOR [TextName]
GO
/****** Object:  Default [DF_LessonMenu_IsContainer]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_IsContainer]  DEFAULT ((0)) FOR [IsContainer]
GO
/****** Object:  Default [DF_LessonMenu_DisplayName]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_DisplayName]  DEFAULT ('') FOR [DisplayName]
GO
/****** Object:  Default [DF_LessonMenu_menuType]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_menuType]  DEFAULT (N'multimedia') FOR [menuType]
GO
/****** Object:  Default [DF__DreamUser__IsAct__2E1BDC42]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamUserProfile] ADD  CONSTRAINT [DF__DreamUser__IsAct__2E1BDC42]  DEFAULT ((0)) FOR [IsActivated]
GO
/****** Object:  Default [DF__AirLine__AspNetU__078C1F06]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AirLine] ADD  DEFAULT ('3ad5b021-ffea-486d-8640-9de2f6e161ca') FOR [AspNetUserID]
GO
/****** Object:  Default [DF_LessonMenuAvailability_TimeLimit]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_TimeLimit]  DEFAULT ((0)) FOR [TimeLimit]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableAvailability]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableAvailability]  DEFAULT ((0)) FOR [EnableAvailability]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableDeadLine]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableDeadLine]  DEFAULT ((0)) FOR [EnableDeadLine]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableTimeLimit]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableTimeLimit]  DEFAULT ((0)) FOR [EnableTimeLimit]
GO
/****** Object:  Default [DF_UserLessonProgress_progress]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserLessonProgress] ADD  CONSTRAINT [DF_UserLessonProgress_progress]  DEFAULT ((0)) FOR [progress]
GO
/****** Object:  Default [DF__VisaPacka__AspNe__0D44F85C]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[VisaPackages] ADD  DEFAULT ('3ad5b021-ffea-486d-8640-9de2f6e161ca') FOR [AspNetUserID]
GO
/****** Object:  Default [DF_Dreams_IsFeatured]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsFeatured]  DEFAULT ((0)) FOR [IsFeatured]
GO
/****** Object:  Default [DF_Dreams_IsDefault]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
/****** Object:  Default [DF_Dreams_IsPublished]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsPublished]  DEFAULT ((0)) FOR [IsPublished]
GO
/****** Object:  Default [DF_Dreams_dreamTypeID]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_dreamTypeID]  DEFAULT ((1)) FOR [dreamTypeID]
GO
/****** Object:  Default [DF__Dreams__AspNetUs__1209AD79]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Dreams] ADD  DEFAULT ('3ad5b021-ffea-486d-8640-9de2f6e161ca') FOR [AspNetUserID]
GO
/****** Object:  Default [DF_Hotel_rating]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_rating]  DEFAULT ((0)) FOR [rating]
GO
/****** Object:  Default [DF_Hotel_distance]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [DF_Hotel_distance]  DEFAULT ((0)) FOR [distance]
GO
/****** Object:  Default [DF__Hotel__AspNetUse__14E61A24]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Hotel] ADD  DEFAULT ('3ad5b021-ffea-486d-8640-9de2f6e161ca') FOR [AspNetUserID]
GO
/****** Object:  Default [DF_Accommodation_availability]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Accommodation] ADD  CONSTRAINT [DF_Accommodation_availability]  DEFAULT ((0)) FOR [availability]
GO
/****** Object:  Default [DF_DreamLayouts_IsPublished]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_IsPublished]  DEFAULT ((1)) FOR [IsPublished]
GO
/****** Object:  Default [DF__DreamLayo__IsDef__403A8C7D]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF__DreamLayo__IsDef__403A8C7D]  DEFAULT ((0)) FOR [IsUserDefaultPage]
GO
/****** Object:  Default [DF_DreamLayouts_IsPublicDefaultPage]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_IsPublicDefaultPage]  DEFAULT ((0)) FOR [IsPublicDefaultPage]
GO
/****** Object:  Default [DF_PackageDetail_nightsInMakkah]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_nightsInMakkah]  DEFAULT ((0)) FOR [nightsInMakkah]
GO
/****** Object:  Default [DF_PackageDetail_nightsInMadina]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_nightsInMadina]  DEFAULT ((0)) FOR [nightsInMadina]
GO
/****** Object:  Default [DF_Table_1_isTransport]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_Table_1_isTransport]  DEFAULT ((0)) FOR [isTransportAvailable]
GO
/****** Object:  Default [DF_PackageDetail_additionalExpense]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_additionalExpense]  DEFAULT ((0)) FOR [additionalExpense]
GO
/****** Object:  Default [DF_PackageDetail_isAirLineAvailable]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_isAirLineAvailable]  DEFAULT ((0)) FOR [isAirLineAvailable]
GO
/****** Object:  Default [DF__PackageDe__packa__65570293]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF__PackageDe__packa__65570293]  DEFAULT ((1)) FOR [packageType]
GO
/****** Object:  Default [DF_PackageDetail_minRange]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_minRange]  DEFAULT ((0)) FOR [minRange]
GO
/****** Object:  Default [DF_PackageDetail_maxRange]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail] ADD  CONSTRAINT [DF_PackageDetail_maxRange]  DEFAULT ((0)) FOR [maxRange]
GO
/****** Object:  Default [DF_LessonVideo_showTranscript]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonVideo] ADD  CONSTRAINT [DF_LessonVideo_showTranscript]  DEFAULT ((0)) FOR [showTranscript]
GO
/****** Object:  Default [DF_LessonProgressDashBoard_ShowSiblingsProgress]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonProgressDashBoard] ADD  CONSTRAINT [DF_LessonProgressDashBoard_ShowSiblingsProgress]  DEFAULT ((0)) FOR [ShowSiblingsProgress]
GO
/****** Object:  Default [DF_CustomPackage_returnAirLineID]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[CustomPackage] ADD  CONSTRAINT [DF_CustomPackage_returnAirLineID]  DEFAULT ((1)) FOR [returnAirLineID]
GO
/****** Object:  Default [DF__Alharmain__adult__24285DB4]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AlharmainUserPackage] ADD  DEFAULT ((0)) FOR [adults]
GO
/****** Object:  Default [DF__Alharmain__child__251C81ED]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AlharmainUserPackage] ADD  DEFAULT ((0)) FOR [children]
GO
/****** Object:  Default [DF__Alharmain__infan__2610A626]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AlharmainUserPackage] ADD  DEFAULT ((0)) FOR [infants]
GO
/****** Object:  ForeignKey [FK_LessonMenu_LessonMenu]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenu]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenu_LessonMenu] FOREIGN KEY([parentMenu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenu] CHECK CONSTRAINT [FK_LessonMenu_LessonMenu]
GO
/****** Object:  ForeignKey [FK_DreamUserProfile_AspNetUsers]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamUserProfile]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserProfile_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserProfile] CHECK CONSTRAINT [FK_DreamUserProfile_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_Tag]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamTags]  WITH CHECK ADD  CONSTRAINT [FK_Tag] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamTags] CHECK CONSTRAINT [FK_Tag]
GO
/****** Object:  ForeignKey [FK__Assignmen__Categ__29E1370A]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AssignmentBank]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[AssignmentCategories] ([id])
GO
/****** Object:  ForeignKey [FK__Assignmen__Categ__2AD55B43]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AssignmentBank]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[AssignmentCategories] ([id])
GO
/****** Object:  ForeignKey [FK__Assignmen__Categ__2BC97F7C]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AssignmentBank]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[AssignmentCategories] ([id])
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK__AirLine__AspNetU__308E3499]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AirLine]  WITH CHECK ADD FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
/****** Object:  ForeignKey [FK_MediaItems_MediaCategories]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[MediaItems]  WITH CHECK ADD  CONSTRAINT [FK_MediaItems_MediaCategories] FOREIGN KEY([MediaCategory_id])
REFERENCES [dbo].[MediaCategories] ([id])
GO
ALTER TABLE [dbo].[MediaItems] CHECK CONSTRAINT [FK_MediaItems_MediaCategories]
GO
/****** Object:  ForeignKey [FK__Files__FileCateg__32767D0B]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([FileCategory_ID])
REFERENCES [dbo].[FileCategories] ([id])
GO
/****** Object:  ForeignKey [FK__Files__FileCateg__336AA144]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([FileCategory_ID])
REFERENCES [dbo].[FileCategories] ([id])
GO
/****** Object:  ForeignKey [FK__Files__FileCateg__345EC57D]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Files]  WITH CHECK ADD FOREIGN KEY([FileCategory_ID])
REFERENCES [dbo].[FileCategories] ([id])
GO
/****** Object:  ForeignKey [FK__QuestionS__Categ__3552E9B6]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuestionSubCategories]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[QuestionCategories] ([id])
GO
/****** Object:  ForeignKey [FK__QuestionS__Categ__36470DEF]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuestionSubCategories]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[QuestionCategories] ([id])
GO
/****** Object:  ForeignKey [FK__QuestionS__Categ__373B3228]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuestionSubCategories]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[QuestionCategories] ([id])
GO
/****** Object:  ForeignKey [FK__LessonMen__menu___2704CA5F]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenuPreRequisite]  WITH CHECK ADD  CONSTRAINT [FK__LessonMen__menu___2704CA5F] FOREIGN KEY([menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenuPreRequisite] CHECK CONSTRAINT [FK__LessonMen__menu___2704CA5F]
GO
/****** Object:  ForeignKey [FK__LessonMen__pre_r__2610A626]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenuPreRequisite]  WITH CHECK ADD  CONSTRAINT [FK__LessonMen__pre_r__2610A626] FOREIGN KEY([pre_req_menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenuPreRequisite] CHECK CONSTRAINT [FK__LessonMen__pre_r__2610A626]
GO
/****** Object:  ForeignKey [FK_LessonMenuAvailability_LessonMenu]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMenuAvailability]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenuAvailability_LessonMenu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenuAvailability] CHECK CONSTRAINT [FK_LessonMenuAvailability_LessonMenu]
GO
/****** Object:  ForeignKey [FK_TextBankTag_Tags]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[TextBankTag]  WITH CHECK ADD  CONSTRAINT [FK_TextBankTag_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[TextBankTag] CHECK CONSTRAINT [FK_TextBankTag_Tags]
GO
/****** Object:  ForeignKey [FK_TextBankTag_TextBank]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[TextBankTag]  WITH CHECK ADD  CONSTRAINT [FK_TextBankTag_TextBank] FOREIGN KEY([TextID])
REFERENCES [dbo].[TextBank] ([id])
GO
ALTER TABLE [dbo].[TextBankTag] CHECK CONSTRAINT [FK_TextBankTag_TextBank]
GO
/****** Object:  ForeignKey [FK_UserLessonProgress_AspNetUsers]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_AspNetUsers] FOREIGN KEY([AspNetUser_id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_UserLessonProgress_LessonMenu]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_LessonMenu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_LessonMenu]
GO
/****** Object:  ForeignKey [FK__VisaPacka__AspNe__3EDC53F0]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[VisaPackages]  WITH CHECK ADD FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
/****** Object:  ForeignKey [FK_MediaTags_MediaItems]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_MediaItems]
GO
/****** Object:  ForeignKey [FK_MediaTags_Tags]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_Tags] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_Tags]
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__41B8C09B]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__42ACE4D4]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__43A1090D]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBank__Catego__44952D46]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[QuizCategories] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBank__Catego__4589517F]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[QuizCategories] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBank__Catego__467D75B8]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([Categoryid])
REFERENCES [dbo].[QuizCategories] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBank__MediaI__477199F1]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([MediaItemID])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBank__MediaI__4865BE2A]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([MediaItemID])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBank__MediaI__4959E263]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuizBank]  WITH CHECK ADD FOREIGN KEY([MediaItemID])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK_News_MediaItems]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_MediaItems]
GO
/****** Object:  ForeignKey [FK_Package_MediaItems]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_MediaItems]
GO
/****** Object:  ForeignKey [FK__QuestionB__Categ__42E1EEFE]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK__QuestionB__Categ__42E1EEFE] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[QuestionCategories] ([id])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK__QuestionB__Categ__42E1EEFE]
GO
/****** Object:  ForeignKey [FK__QuestionB__SubCa__43D61337]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK__QuestionB__SubCa__43D61337] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[QuestionSubCategories] ([id])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK__QuestionB__SubCa__43D61337]
GO
/****** Object:  ForeignKey [FK__QuestionB__TypeI__44CA3770]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuestionBank]  WITH CHECK ADD  CONSTRAINT [FK__QuestionB__TypeI__44CA3770] FOREIGN KEY([TypeID])
REFERENCES [dbo].[QuestionType] ([id])
GO
ALTER TABLE [dbo].[QuestionBank] CHECK CONSTRAINT [FK__QuestionB__TypeI__44CA3770]
GO
/****** Object:  ForeignKey [FK__Controls__Contro__4F12BBB9]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
/****** Object:  ForeignKey [FK__Controls__Contro__5006DFF2]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
/****** Object:  ForeignKey [FK__Controls__Contro__50FB042B]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
/****** Object:  ForeignKey [FK__Controls__IconUR__51EF2864]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([IconURL])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__Controls__IconUR__52E34C9D]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([IconURL])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__Controls__IconUR__53D770D6]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([IconURL])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile] FOREIGN KEY([SenderId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile]
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile1]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile1] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile1]
GO
/****** Object:  ForeignKey [FK__Assignmen__Assig__56B3DD81]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AssignmentResponse]  WITH CHECK ADD FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
/****** Object:  ForeignKey [FK__Assignmen__Assig__57A801BA]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AssignmentResponse]  WITH CHECK ADD FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
/****** Object:  ForeignKey [FK__Assignmen__Assig__589C25F3]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AssignmentResponse]  WITH CHECK ADD FOREIGN KEY([AssignmentID])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
/****** Object:  ForeignKey [FK__Dreams__AspNetUs__59904A2C]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
/****** Object:  ForeignKey [FK_Dreams_DreamType]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD  CONSTRAINT [FK_Dreams_DreamType] FOREIGN KEY([dreamTypeID])
REFERENCES [dbo].[DreamType] ([id])
GO
ALTER TABLE [dbo].[Dreams] CHECK CONSTRAINT [FK_Dreams_DreamType]
GO
/****** Object:  ForeignKey [FK_Dreams_MediaItems]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD  CONSTRAINT [FK_Dreams_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Dreams] CHECK CONSTRAINT [FK_Dreams_MediaItems]
GO
/****** Object:  ForeignKey [FK__Hotel__AspNetUse__5C6CB6D7]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
/****** Object:  ForeignKey [FK_Hotel_MediaItems]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_MediaItems]
GO
/****** Object:  ForeignKey [FK_Flight_AirLine]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD  CONSTRAINT [FK_Flight_AirLine] FOREIGN KEY([airLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[Flight] CHECK CONSTRAINT [FK_Flight_AirLine]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_AspNetUsers]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_Dreams]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_Dreams] FOREIGN KEY([DreamId])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_Dreams]
GO
/****** Object:  ForeignKey [FK__ClientPag__Dream__61316BF4]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[ClientPage]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[Dreams] ([id])
GO
/****** Object:  ForeignKey [FK__ClientPag__Dream__6225902D]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[ClientPage]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[Dreams] ([id])
GO
/****** Object:  ForeignKey [FK__ClientPag__Dream__6319B466]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[ClientPage]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[Dreams] ([id])
GO
/****** Object:  ForeignKey [FK_Accommodation_Hotel]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Accommodation]  WITH CHECK ADD  CONSTRAINT [FK_Accommodation_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[Accommodation] CHECK CONSTRAINT [FK_Accommodation_Hotel]
GO
/****** Object:  ForeignKey [FK_DreamLayouts_Dreams]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamLayouts]  WITH CHECK ADD  CONSTRAINT [FK_DreamLayouts_Dreams] FOREIGN KEY([DreamID])
REFERENCES [dbo].[Dreams] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamLayouts] CHECK CONSTRAINT [FK_DreamLayouts_Dreams]
GO
/****** Object:  ForeignKey [FK_DreamEnrollment_AspNetUsers]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_DreamEnrollment_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamEnrollment] CHECK CONSTRAINT [FK_DreamEnrollment_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_DreamEnrollment_Dreams]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_DreamEnrollment_Dreams] FOREIGN KEY([dreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamEnrollment] CHECK CONSTRAINT [FK_DreamEnrollment_Dreams]
GO
/****** Object:  ForeignKey [FK_HotelImage_Hotel]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
/****** Object:  ForeignKey [FK_HotelImage_MediaItems]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_MediaItems]
GO
/****** Object:  ForeignKey [FK_HotelFacility_Hotel]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[HotelFacility]  WITH CHECK ADD  CONSTRAINT [FK_HotelFacility_Hotel] FOREIGN KEY([hotelID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelFacility] CHECK CONSTRAINT [FK_HotelFacility_Hotel]
GO
/****** Object:  ForeignKey [FK_HotelFacility_MediaItems]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[HotelFacility]  WITH CHECK ADD  CONSTRAINT [FK_HotelFacility_MediaItems] FOREIGN KEY([mediaID])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[HotelFacility] CHECK CONSTRAINT [FK_HotelFacility_MediaItems]
GO
/****** Object:  ForeignKey [FK__FIBOption__Quest__2B0A656D]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[FIBOptions]  WITH CHECK ADD  CONSTRAINT [FK__FIBOption__Quest__2B0A656D] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[FIBOptions] CHECK CONSTRAINT [FK__FIBOption__Quest__2B0A656D]
GO
/****** Object:  ForeignKey [FK__LessonQui__QuizI__6CA31EA0]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonQuiz]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK__LessonQui__QuizI__6D9742D9]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonQuiz]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK__LessonQui__QuizI__6E8B6712]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonQuiz]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK_PackageDetail_Dreams]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Dreams] FOREIGN KEY([dreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Dreams]
GO
/****** Object:  ForeignKey [FK_PackageDetail_Flight]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Flight] FOREIGN KEY([returnFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Flight]
GO
/****** Object:  ForeignKey [FK_PackageDetail_Flight1]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Flight1] FOREIGN KEY([departureFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Flight1]
GO
/****** Object:  ForeignKey [FK_PackageDetail_HotelMadina]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_HotelMadina] FOREIGN KEY([hotelIDMadina])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_HotelMadina]
GO
/****** Object:  ForeignKey [FK_PackageDetail_HotelMakkah]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_HotelMakkah] FOREIGN KEY([hotelIDMakkah])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_HotelMakkah]
GO
/****** Object:  ForeignKey [FK_PackageDetail_TransPort]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_TransPort] FOREIGN KEY([transportID])
REFERENCES [dbo].[TransPort] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_TransPort]
GO
/****** Object:  ForeignKey [FK_PackageDetail_VisaPackages]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_VisaPackages] FOREIGN KEY([visaID])
REFERENCES [dbo].[VisaPackages] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_VisaPackages]
GO
/****** Object:  ForeignKey [FK_PackageDetail_Ziarat]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[PackageDetail]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetail_Ziarat] FOREIGN KEY([ziaratID])
REFERENCES [dbo].[Ziarat] ([id])
GO
ALTER TABLE [dbo].[PackageDetail] CHECK CONSTRAINT [FK_PackageDetail_Ziarat]
GO
/****** Object:  ForeignKey [FK__QuestionH__Quest__436BFEE3]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuestionHints]  WITH CHECK ADD  CONSTRAINT [FK__QuestionH__Quest__436BFEE3] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[QuestionHints] CHECK CONSTRAINT [FK__QuestionH__Quest__436BFEE3]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News] FOREIGN KEY([related_news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News1]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News1] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News1]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_Dreams]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_Dreams] FOREIGN KEY([dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_Dreams]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_News]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_News] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_News]
GO
/****** Object:  ForeignKey [FK__MultiFIBM__Quest__7BE56230]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[MultiFIBMarkup]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
/****** Object:  ForeignKey [FK__MultiFIBM__Quest__7CD98669]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[MultiFIBMarkup]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
/****** Object:  ForeignKey [FK__MultiFIBM__Quest__7DCDAAA2]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[MultiFIBMarkup]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
/****** Object:  ForeignKey [FK__MultiFIBC__Quest__0169315C]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[MultiFIBComponents]  WITH CHECK ADD  CONSTRAINT [FK__MultiFIBC__Quest__0169315C] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[MultiFIBComponents] CHECK CONSTRAINT [FK__MultiFIBC__Quest__0169315C]
GO
/****** Object:  ForeignKey [FK__QuizBankQ__Quest__489AC854]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuizBankQuestions]  WITH CHECK ADD  CONSTRAINT [FK__QuizBankQ__Quest__489AC854] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[QuizBankQuestions] CHECK CONSTRAINT [FK__QuizBankQ__Quest__489AC854]
GO
/****** Object:  ForeignKey [FK__QuizBankQ__QuizI__00AA174D]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuizBankQuestions]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBankQ__QuizI__019E3B86]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuizBankQuestions]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK__QuizBankQ__QuizI__02925FBF]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[QuizBankQuestions]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK__UserRespo__Quest__51300E55]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserResponse]  WITH CHECK ADD  CONSTRAINT [FK__UserRespo__Quest__51300E55] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[UserResponse] CHECK CONSTRAINT [FK__UserRespo__Quest__51300E55]
GO
/****** Object:  ForeignKey [FK__UserRespon__Page__46B27FE2]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserResponse]  WITH CHECK ADD  CONSTRAINT [FK__UserRespon__Page__46B27FE2] FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserResponse] CHECK CONSTRAINT [FK__UserRespon__Page__46B27FE2]
GO
/****** Object:  ForeignKey [FK__UserQuizS__Quest__4E53A1AA]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD  CONSTRAINT [FK__UserQuizS__Quest__4E53A1AA] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[UserQuizStatus] CHECK CONSTRAINT [FK__UserQuizS__Quest__4E53A1AA]
GO
/****** Object:  ForeignKey [FK__UserQuizS__QuizI__0662F0A3]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK__UserQuizS__QuizI__075714DC]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK__UserQuizS__QuizI__084B3915]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[QuizBank] ([id])
GO
/****** Object:  ForeignKey [FK__UserQuizSt__Page__29E1370A]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserQuizStatus]  WITH CHECK ADD  CONSTRAINT [FK__UserQuizSt__Page__29E1370A] FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserQuizStatus] CHECK CONSTRAINT [FK__UserQuizSt__Page__29E1370A]
GO
/****** Object:  ForeignKey [FK__UserHintS__Quest__30592A6F]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserHintStatus]  WITH CHECK ADD  CONSTRAINT [FK__UserHintS__Quest__30592A6F] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[UserHintStatus] CHECK CONSTRAINT [FK__UserHintS__Quest__30592A6F]
GO
/****** Object:  ForeignKey [FK__UserHintSt__Page__314D4EA8]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[UserHintStatus]  WITH CHECK ADD  CONSTRAINT [FK__UserHintSt__Page__314D4EA8] FOREIGN KEY([Page])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[UserHintStatus] CHECK CONSTRAINT [FK__UserHintSt__Page__314D4EA8]
GO
/****** Object:  ForeignKey [FK_Navigations_DreamLayoutsnew]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_DreamLayoutsnew] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_DreamLayoutsnew]
GO
/****** Object:  ForeignKey [FK_Navigations_MediaItems]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_MediaItems]
GO
/****** Object:  ForeignKey [FK_LessonVideo_DreamLayouts1]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonVideo]  WITH CHECK ADD  CONSTRAINT [FK_LessonVideo_DreamLayouts1] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonVideo] CHECK CONSTRAINT [FK_LessonVideo_DreamLayouts1]
GO
/****** Object:  ForeignKey [FK_LessonVideo_MediaItems]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonVideo]  WITH CHECK ADD  CONSTRAINT [FK_LessonVideo_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonVideo] CHECK CONSTRAINT [FK_LessonVideo_MediaItems]
GO
/****** Object:  ForeignKey [FK__LessonQue__Layou__4B7734FF]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonQuestion]  WITH CHECK ADD  CONSTRAINT [FK__LessonQue__Layou__4B7734FF] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonQuestion] CHECK CONSTRAINT [FK__LessonQue__Layou__4B7734FF]
GO
/****** Object:  ForeignKey [FK__LessonQue__Quest__3587F3E0]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonQuestion]  WITH CHECK ADD  CONSTRAINT [FK__LessonQue__Quest__3587F3E0] FOREIGN KEY([Question_id])
REFERENCES [dbo].[QuestionBank] ([id])
GO
ALTER TABLE [dbo].[LessonQuestion] CHECK CONSTRAINT [FK__LessonQue__Quest__3587F3E0]
GO
/****** Object:  ForeignKey [FK_LessonProgressDashBoard_DreamLayouts]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonProgressDashBoard]  WITH CHECK ADD  CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonProgressDashBoard] CHECK CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts]
GO
/****** Object:  ForeignKey [FK__LessonPro__Layou__5C6CB6D7]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonProgressControl]  WITH CHECK ADD  CONSTRAINT [FK__LessonPro__Layou__5C6CB6D7] FOREIGN KEY([OriginalLayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonProgressControl] CHECK CONSTRAINT [FK__LessonPro__Layou__5C6CB6D7]
GO
/****** Object:  ForeignKey [FK__LessonPro__MenuI__5B78929E]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonProgressControl]  WITH CHECK ADD  CONSTRAINT [FK__LessonPro__MenuI__5B78929E] FOREIGN KEY([MenuID])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonProgressControl] CHECK CONSTRAINT [FK__LessonPro__MenuI__5B78929E]
GO
/****** Object:  ForeignKey [FK__LessonMul__Layou__4589517F]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMultimedia]  WITH CHECK ADD  CONSTRAINT [FK__LessonMul__Layou__4589517F] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonMultimedia] CHECK CONSTRAINT [FK__LessonMul__Layou__4589517F]
GO
/****** Object:  ForeignKey [FK__LessonMul__Multi__15A53433]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMultimedia]  WITH CHECK ADD FOREIGN KEY([MultimediaID])
REFERENCES [dbo].[Multimediabank] ([id])
GO
/****** Object:  ForeignKey [FK__LessonMul__Multi__1699586C]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMultimedia]  WITH CHECK ADD FOREIGN KEY([MultimediaID])
REFERENCES [dbo].[Multimediabank] ([id])
GO
/****** Object:  ForeignKey [FK__LessonMul__Multi__178D7CA5]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonMultimedia]  WITH CHECK ADD FOREIGN KEY([MultimediaID])
REFERENCES [dbo].[Multimediabank] ([id])
GO
/****** Object:  ForeignKey [FK__LessonAss__Assig__1881A0DE]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD FOREIGN KEY([Assignment_id])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
/****** Object:  ForeignKey [FK__LessonAss__Assig__1975C517]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD FOREIGN KEY([Assignment_id])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
/****** Object:  ForeignKey [FK__LessonAss__Assig__1A69E950]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD FOREIGN KEY([Assignment_id])
REFERENCES [dbo].[AssignmentBank] ([id])
GO
/****** Object:  ForeignKey [FK__LessonAss__Layou__30C33EC3]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LessonAssignments]  WITH CHECK ADD  CONSTRAINT [FK__LessonAss__Layou__30C33EC3] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonAssignments] CHECK CONSTRAINT [FK__LessonAss__Layou__30C33EC3]
GO
/****** Object:  ForeignKey [FK_LayoutTextBank_DreamLayouts]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[LayoutTextBank]  WITH CHECK ADD  CONSTRAINT [FK_LayoutTextBank_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LayoutTextBank] CHECK CONSTRAINT [FK_LayoutTextBank_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_InviteSharePage_DreamLayouts]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[InviteSharePage]  WITH CHECK ADD  CONSTRAINT [FK_InviteSharePage_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InviteSharePage] CHECK CONSTRAINT [FK_InviteSharePage_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_DiscountPackage_PackageDetail]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DiscountPackage]  WITH CHECK ADD  CONSTRAINT [FK_DiscountPackage_PackageDetail] FOREIGN KEY([packageDetailID])
REFERENCES [dbo].[PackageDetail] ([id])
GO
ALTER TABLE [dbo].[DiscountPackage] CHECK CONSTRAINT [FK_DiscountPackage_PackageDetail]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Accommodation]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Accommodation] FOREIGN KEY([roomMakkahID])
REFERENCES [dbo].[Accommodation] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Accommodation]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Accommodation1]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Accommodation1] FOREIGN KEY([roomMadinaID])
REFERENCES [dbo].[Accommodation] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Accommodation1]
GO
/****** Object:  ForeignKey [FK_CustomPackage_AirLine]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_AirLine] FOREIGN KEY([returnAirLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_AirLine]
GO
/****** Object:  ForeignKey [FK_CustomPackage_AirLine1]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_AirLine1] FOREIGN KEY([departureAirLineID])
REFERENCES [dbo].[AirLine] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_AirLine1]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Flight]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Flight] FOREIGN KEY([depFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Flight]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Flight1]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Flight1] FOREIGN KEY([retFlightID])
REFERENCES [dbo].[Flight] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Flight1]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Hotel]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Hotel] FOREIGN KEY([hotelMakkahID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Hotel]
GO
/****** Object:  ForeignKey [FK_CustomPackage_Hotel1]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[CustomPackage]  WITH CHECK ADD  CONSTRAINT [FK_CustomPackage_Hotel1] FOREIGN KEY([hotelMadinaID])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[CustomPackage] CHECK CONSTRAINT [FK_CustomPackage_Hotel1]
GO
/****** Object:  ForeignKey [FK_ChatAdmin_DreamLayouts]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[ChatAdmin]  WITH CHECK ADD  CONSTRAINT [FK_ChatAdmin_DreamLayouts] FOREIGN KEY([layoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[ChatAdmin] CHECK CONSTRAINT [FK_ChatAdmin_DreamLayouts]
GO
/****** Object:  ForeignKey [FK__DreamPage__Compo__27C3E46E]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamPageControls]  WITH CHECK ADD FOREIGN KEY([Component_ID])
REFERENCES [dbo].[Controls] ([id])
GO
/****** Object:  ForeignKey [FK__DreamPage__Compo__28B808A7]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamPageControls]  WITH CHECK ADD FOREIGN KEY([Component_ID])
REFERENCES [dbo].[Controls] ([id])
GO
/****** Object:  ForeignKey [FK__DreamPage__Compo__29AC2CE0]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamPageControls]  WITH CHECK ADD FOREIGN KEY([Component_ID])
REFERENCES [dbo].[Controls] ([id])
GO
/****** Object:  ForeignKey [FK__DreamPage__Layou__54CB950F]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamPageControls]  WITH CHECK ADD  CONSTRAINT [FK__DreamPage__Layou__54CB950F] FOREIGN KEY([Layout_ID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamPageControls] CHECK CONSTRAINT [FK__DreamPage__Layou__54CB950F]
GO
/****** Object:  ForeignKey [FK__DreamPage__Dream__1CBC4616]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[DreamPageAuthorization]  WITH CHECK ADD  CONSTRAINT [FK__DreamPage__Dream__1CBC4616] FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamPageAuthorization] CHECK CONSTRAINT [FK__DreamPage__Dream__1CBC4616]
GO
/****** Object:  ForeignKey [FK__Alharmain__Accom__2C88998B]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD FOREIGN KEY([AccomMakkahID])
REFERENCES [dbo].[Accommodation] ([id])
GO
/****** Object:  ForeignKey [FK__Alharmain__Accom__2D7CBDC4]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD FOREIGN KEY([AccomMadinaID])
REFERENCES [dbo].[Accommodation] ([id])
GO
/****** Object:  ForeignKey [FK_AlharmainUserPackage_AlharmainUser1]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD  CONSTRAINT [FK_AlharmainUserPackage_AlharmainUser1] FOREIGN KEY([userID])
REFERENCES [dbo].[AlharmainUser] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage] CHECK CONSTRAINT [FK_AlharmainUserPackage_AlharmainUser1]
GO
/****** Object:  ForeignKey [FK_AlharmainUserPackage_DiscountPackage]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD  CONSTRAINT [FK_AlharmainUserPackage_DiscountPackage] FOREIGN KEY([discountID])
REFERENCES [dbo].[DiscountPackage] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage] CHECK CONSTRAINT [FK_AlharmainUserPackage_DiscountPackage]
GO
/****** Object:  ForeignKey [FK_AlharmainUserPackage_PackageDetail]    Script Date: 03/15/2017 14:32:52 ******/
ALTER TABLE [dbo].[AlharmainUserPackage]  WITH CHECK ADD  CONSTRAINT [FK_AlharmainUserPackage_PackageDetail] FOREIGN KEY([packageDetailID])
REFERENCES [dbo].[PackageDetail] ([id])
GO
ALTER TABLE [dbo].[AlharmainUserPackage] CHECK CONSTRAINT [FK_AlharmainUserPackage_PackageDetail]
GO
