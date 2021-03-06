USE [master]
GO
/****** Object:  Database [26oct_DreamBird]    Script Date: 11/18/2016 16:19:55 ******/
CREATE DATABASE [26oct_DreamBird] ON  PRIMARY 
( NAME = N'26oct_DreamBird', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\26oct_DreamBird.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'26oct_DreamBird_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\26oct_DreamBird_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [26oct_DreamBird] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [26oct_DreamBird].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [26oct_DreamBird] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [26oct_DreamBird] SET ANSI_NULLS OFF
GO
ALTER DATABASE [26oct_DreamBird] SET ANSI_PADDING OFF
GO
ALTER DATABASE [26oct_DreamBird] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [26oct_DreamBird] SET ARITHABORT OFF
GO
ALTER DATABASE [26oct_DreamBird] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [26oct_DreamBird] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [26oct_DreamBird] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [26oct_DreamBird] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [26oct_DreamBird] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [26oct_DreamBird] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [26oct_DreamBird] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [26oct_DreamBird] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [26oct_DreamBird] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [26oct_DreamBird] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [26oct_DreamBird] SET  DISABLE_BROKER
GO
ALTER DATABASE [26oct_DreamBird] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [26oct_DreamBird] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [26oct_DreamBird] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [26oct_DreamBird] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [26oct_DreamBird] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [26oct_DreamBird] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [26oct_DreamBird] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [26oct_DreamBird] SET  READ_WRITE
GO
ALTER DATABASE [26oct_DreamBird] SET RECOVERY SIMPLE
GO
ALTER DATABASE [26oct_DreamBird] SET  MULTI_USER
GO
ALTER DATABASE [26oct_DreamBird] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [26oct_DreamBird] SET DB_CHAINING OFF
GO
USE [26oct_DreamBird]
GO
/****** Object:  Table [dbo].[MediaCategories]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[TextBank]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (2, N'<p>My Text is given here</p>
', 1, N'')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (12, N'<p><strong>Shared Test Bank</strong></p>
', 1, N'TextBank1')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (13, N'<h2 style="font-style:italic;">Shared Test Bank</h2>
', 1, N'TextBank1')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (17, N'<p>This is my textarea to be replaced Edigfbbtor.</p>
', 0, N'NEWTEXT')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (18, N'<p>This is my textarea to be replaced fkncdtor.</p>
', 0, N'NEWTEXT')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (31, N'', 0, N'Default')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (32, N'<p>abced</p>
', 0, N'MyTextBank66')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (33, N'<p>This is my textarea to be replaced Editor.</p>

<h2 style="font-style:italic"><strong>this is my style text Display here</strong></h2>
', 0, N'MyTextBank1')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (36, N'<p>This is my textarea to be replaced Editor.</p>

<h2 style="font-style:italic">ghvb ttttttttttttttttttt</h2>
', 1, N'NewText')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (37, N'<h2 style="font-style:italic;"><img alt="" src="/Components/MediaBank/Content/Images/100x100/1.jpg" style="width: 100px; height: 100px;" />abcedtttttttttttttttttttttttttttttttttttttttttttthjn</h2>

<h2 style="font-style:italic;color:red">bhggggggg byhng hb<img alt="" src="/Components/MediaBank/Content/Images/100x100/readitlater-icon.png" style="width: 100px; height: 100px; float: left; border-width: 5px; border-style: solid; margin-top: 8px; margin-bottom: 8px;" /></h2>

<p>&nbsp;</p>

<p>&nbsp;</p>

<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav navbar-right">
	<li class="active" id="register"><a href="~/DreamHome.aspx">eDreamBird Hom</a></li>
</ul>

<ul class="nav navbar-nav navbar-right" id="main-menu">
	<li><a href="#Latest">Latest News</a></li>
	<li><a href="#Featured">Featured</a></li>
	<li><a href="#National">National</a></li>
	<li><a href="#International">International</a></li>
</ul>

<hr />
<hr />
<ul>
	<li>&nbsp;</li>
</ul>
</div>
', 0, N'MyNBame')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (38, N'', 0, N'Default')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (39, N'', 0, N'Default')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (40, N'<p>This is my textarea to be replaced Editor. This text is added here<img alt="" src="/Components/MediaBank/Content/Images/100x100/issb.jpg" style="width: 100px; height: 100px;" /></p>
', 1, N'TextBank4')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (41, N'<p>This is my textarea to be replaced Editor.</p>
', 1, N'text5')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (42, N'<p>This is my textarea to be replacedjmn m Editor.</p>
', 1, N'text7')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (43, N'<p>This is my textarea to be replaced Editor.bhbhbhgv</p>
', 0, N'mytext')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (44, N'<p>This is my textarea to be replaced Editor.gbgbgbgbgbgbgbgbv</p>
', 0, N'text6')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (45, N'<p>This is my textarea to be replaced Editor.bgffffffffffffffffffff</p>

<p><strong>ghfbc&nbsp;</strong></p>

<h2 style="font-style:italic;"><strong>hyyyyyyyyyyyyyyyy</strong></h2>
', 0, N'tree')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (46, N'', 0, N'Default')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (47, N'<table border="1" cellpadding="1" cellspacing="1" style="width:500px">
	<tbody>
		<tr>
			<td>
			<h3><strong>FV</strong></h3>
			</td>
			<td>
			<h3><strong>VFFD</strong></h3>
			</td>
		</tr>
		<tr>
			<td>FVVV</td>
			<td>VFFFFFF</td>
		</tr>
		<tr>
			<td>VFFFFFF</td>
			<td>VFFFFFFFFFF</td>
		</tr>
	</tbody>
</table>

<h2 style="font-style:italic">This is my textarea to be replaced Editor.gvfr</h2>
', 1, N'Texrr9')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (48, N'<p>This is my textarea to be replaced Editor.treeeeeeeeeeeeeeeeeeeeeeeeeeee</p>
', 0, N'text')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (49, N'', 0, N'Default')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (50, N'', 0, N'Default')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (51, N'', 0, N'Default')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (52, N'<p><strong>The research on automatic hypertext construction emerges rapidly in the last decade because there exists a urgent need to translate the</strong><br />
gigantic amount of legacy documents into web pages. Unlike traditional &lsquo;flat&rsquo; texts, a hypertext contains a number of navigational hyperlinks<br />
that point to some related hypertexts or locations of the same hypertext. Traditionally, these hyperlinks were constructed by the creators of<br />
the web pages with or without the help of some authoring tools. However, the gigantic amount of documents produced each day prevent from<br />
such manual construction. Thus an automatic hypertext construction method is necessary for content providers to efficiently produce<br />
adequate information that can be used by web surfers. Although most of the web pages contain a number of non-textual data such as images,<br />
sounds, and video clips, text data still contribute the major part of information about the pages. Therefore, it is not surprising that most of<br />
automatic hypertext construction methods inherit from traditional information retrieval research. In this work, we will propose a new<br />
automatic hypertext construction method based on a text mining approach. Our method applies the self-organizing map algorithm to cluster<br />
some at text documents in a training corpus and generate two maps. We then use these maps to identify the sources and destinations of some<br />
important hyperlinks within these training documents. The constructed hyperlinks are then inserted into the training documents to translate<br />
them into hypertext form. Such translated documents will form the new corpus. Incoming documents can also be translated into hypertext<br />
form and added to the corpus through the same approach. Our method had been tested on a set of at text documents collected from a newswire<br />
site. Although we only use Chinese text documents, our approach can be applied to any documents that can be transformed to a set of index<br />
terms.<br />
&nbsp;</p>
', 0, N'Label one')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (53, N'<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" />/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg">/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg">/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg">/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg">/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg">/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p>The research on automatic hypertext construction emerges rapidly in the last decade because there exists a urgent need to translate the<br />
gigantic amount of legacy documents into web pages. Unlike traditional &lsquo;flat&rsquo; texts, a hypertext contains a number of navigational hyperlinks<br />
that point to some related hypertexts or locations of the same hypertext. Traditionally, these hyperlinks were constructed by the creators of<br />
the web pages with or without the help of some authoring tools. However, the gigantic amount of documents produced each day prevent from<br />
such manual construction. Thus an automatic hypertext construction method is necessary for content providers to efficiently produce<br />
adequate information that can be used by web surfers. Although most of the web pages contain a number of non-textual data such as images,<br />
sounds, and video clips, text data still contribute the major part of information about the pages. Therefore, it is not surprising that most of<br />
automatic hypertext construction methods inherit from traditional information retrieval research. In this work, we will propose a new<br />
automatic hypertext construction method based on a text mining approach. Our method applies the self-organizing map algorithm to cluster<br />
some at text documents in a training corpus and generate two maps. We then use these maps to identify the sources and destinations of some<br />
important hyperlinks within these training documents. The constructed hyperlinks are then inserted into the training documents to translate<br />
them into hypertext form. Such translated documents will form the new corpus. Incoming documents can also be translated into hypertext<br />
form and added to the corpus through the same approach. Our method had been tested on a set of at text documents collected from a newswire<br />
site. Although we only use Chinese text documents, our approach can be applied to any documents that can be transformed to a set of index<br />
terms.</p>
', 0, N'label four')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (54, N'', 0, N'Default')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (55, N'<h2><strong>NTS (New Testing System), Pakistan</strong></h2>

<p><strong>Introduction:</strong></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; NTS is a newly introduced system which conducts &ldquo;Test&rdquo; for&nbsp;admission&nbsp;into various government colleges and universities in Pakistan. The tests conducted by NTS for&nbsp;admission&nbsp;into colleges and universities called &ldquo;NAT&rdquo; (National Aptitude Test) and &ldquo;GAT&rdquo;.</p>

<ol>
	<li>Test for students who have completed 12 years &nbsp;of their education (Intermediate or equivalent) is called NAT-I</li>
	<li>Test for students who have completed 14 years &nbsp;of their education (Graduation or equivalent) is called NAT-II</li>
	<li>Tests for students who have completed 16 years of their education (MA, MSc, BSc Honour etc) are called GAT-General or GAT-Subject.</li>
</ol>
', 0, N'nts description')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (56, N'<h1>NTS (New Testing System), Pakistan</h1>

<p>&nbsp;</p>

<p><strong>Introduction:</strong></p>

<p>&nbsp;</p>

<p>NTS is a newly introduced system which conducts &ldquo;Test&rdquo; for&nbsp;admission&nbsp;into various government colleges and universities in Pakistan. The tests conducted by NTS for&nbsp;admission&nbsp;into colleges and universities called &ldquo;NAT&rdquo; (National Aptitude Test) and &ldquo;GAT&rdquo;.</p>

<ol>
	<li>Test for students who have completed 12 years &nbsp;of their education (Intermediate or equivalent) is called NAT-I</li>
	<li>Test for students who have completed 14 years &nbsp;of their education (Graduation or equivalent) is called NAT-II</li>
	<li>Tests for students who have completed 16 years of their education (MA, MSc, BSc Honour etc) are called GAT-General or GAT-Subject.</li>
</ol>
', 0, N'nts detail')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (57, N'', 0, N'ntsdata')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (58, N'<h1>What You&#39;ll learn in this course</h1>

<ul style="font-size:16px; display: block; list-style: none;">
					<li class="hideme" style="border: 10px solid rgb(230, 230, 230); padding: 20px; width: 50%; margin: 15px 0px; opacity: 1;">Introduction to NTS and History</li>
					<li class="hideme" style="border: 10px solid rgb(242, 255, 210); padding: 20px; width: 50%; margin: 15px 0px 15px 30%; opacity: 1;">Total Recall of all the Intermediate Courses</li>
					<li class="hideme" style="border: 10px solid rgb(127, 173, 162); padding: 20px; width: 50%; margin: 15px 0px 15px 10%; opacity: 1;">Exam Pattern</li>
					<li class="hideme" style="border: 10px solid rgb(255, 202, 219); padding: 20px; width: 50%; margin: 15px 0px 15px 25%; opacity: 1;">Marking Criteria</li>
					<li class="hideme" style="border: 10px solid rgb(207, 253, 255); padding: 20px; width: 50%; margin: 15px 0px 15px 5%; opacity: 1;">Tips on how to be successful in NTS</li>
					<li class="hideme" style="border: 10px solid rgb(230, 230, 230); padding: 20px; width: 50%; margin: 15px 0px 15px 25%; opacity: 1;">Reference from Past Papers</li>
					<li class="hideme" style="border: 10px solid rgb(225, 226, 147); padding: 20px; width: 50%; margin: 15px 0px; opacity: 1;">Sample Papers</li>
				</ul>', 0, N'fbtree')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (59, N'<hr />
<p><strong>Measurement</strong>&nbsp;is the assignment of a number to a characteristic of an object or event, which can be compared with other objects or events.<sup><a href="https://en.wikipedia.org/wiki/Measurement#cite_note-pedhazur-1">[1]</a></sup><sup><a href="https://en.wikipedia.org/wiki/Measurement#cite_note-bipm-2">[2]</a></sup>&nbsp;The scope and application of a measurement is dependent on the context and discipline. In the&nbsp;<a href="https://en.wikipedia.org/wiki/Natural_sciences" title="Natural sciences">natural sciences</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Engineering" title="Engineering">engineering</a>, measurements do not apply to&nbsp;<a href="https://en.wikipedia.org/wiki/Level_of_measurement#Nominal_scale" title="Level of measurement">nominal properties</a>&nbsp;of objects or events, which is consistent with the guidelines of the&nbsp;<em>International vocabulary of metrology</em>&nbsp;published by the&nbsp;<a href="https://en.wikipedia.org/wiki/International_Bureau_of_Weights_and_Measures" title="International Bureau of Weights and Measures">International Bureau of Weights and Measures</a>.<sup><a href="https://en.wikipedia.org/wiki/Measurement#cite_note-bipm-2">[2]</a></sup>&nbsp;However, in other fields such as&nbsp;<a href="https://en.wikipedia.org/wiki/Statistics" title="Statistics">statistics</a>&nbsp;as well as the&nbsp;<a href="https://en.wikipedia.org/wiki/Social_Sciences" title="Social Sciences">social</a>&nbsp;and&nbsp;<a href="https://en.wikipedia.org/wiki/Behavioral_sciences" title="Behavioral sciences">behavioral sciences</a>, measurements can have&nbsp;<a href="https://en.wikipedia.org/wiki/Level_of_measurement" title="Level of measurement">multiple levels</a>, which would include nominal, ordinal, interval, and ratio scales.<sup><a href="https://en.wikipedia.org/wiki/Measurement#cite_note-pedhazur-1">[1]</a></sup><sup><a href="https://en.wikipedia.org/wiki/Measurement#cite_note-Koch_2008-3">[3]</a></sup></p>

<p>Measurement is a cornerstone of&nbsp;<a href="https://en.wikipedia.org/wiki/Trade" title="Trade">trade</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Science" title="Science">science</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Technology" title="Technology">technology</a>, and&nbsp;<a href="https://en.wikipedia.org/wiki/Quantitative_research" title="Quantitative research">quantitative research</a>&nbsp;in many disciplines. Historically, many&nbsp;<a href="https://en.wikipedia.org/wiki/System_of_measurement" title="System of measurement">measurement systems</a>&nbsp;existed for the varied fields of human existence to facilitate comparisons in these fields. Often these were achieved by local agreements between trading partners or collaborators. Since the 18th century, developments progressed towards unifying, widely accepted standards that resulted in the modern&nbsp;<a href="https://en.wikipedia.org/wiki/International_System_of_Units" title="International System of Units">International System of Units</a>&nbsp;(SI). This system reduces all physical measurements to a mathematical combination of seven base units. The science of measurement is pursued in the field of&nbsp;<a href="https://en.wikipedia.org/wiki/Metrology" title="Metrology">metrology</a>.</p>

<p>The measurement of a property may be categorized by the following criteria:&nbsp;<a href="https://en.wikipedia.org/wiki/Level_of_measurement" title="Level of measurement">type</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Magnitude_(mathematics)" title="Magnitude (mathematics)">magnitude</a>,&nbsp;<a href="https://en.wikipedia.org/wiki/Units_of_measurement" title="Units of measurement">unit</a>, and&nbsp;<a href="https://en.wikipedia.org/wiki/Uncertainty" title="Uncertainty">uncertainty</a>.<sup>[<em><a href="https://en.wikipedia.org/wiki/Wikipedia:Citation_needed" title="Wikipedia:Citation needed">citation needed</a></em>]</sup>&nbsp;They enable unambiguous comparisons between measurements.</p>

<ul>
	<li>The&nbsp;<em>type</em>&nbsp;or&nbsp;<em>level</em>&nbsp;of measurement is a taxonomy for the methodological character of a comparison. For example, two states of a property may be compared by ratio, difference, or ordinal preference. The type is commonly not explicitly expressed, but implicit in the definition of a measurement procedure.</li>
	<li>The&nbsp;<em>magnitude</em>&nbsp;is the numerical value of the characterization, usually obtained with a suitably chosen&nbsp;<a href="https://en.wikipedia.org/wiki/Measuring_instrument" title="Measuring instrument">measuring instrument</a>.</li>
	<li>A&nbsp;<em>unit</em>&nbsp;assigns a mathematical weighting factor to the magnitude that is derived as a ratio to the property of an artifact used as standard or a natural physical quantity.</li>
	<li>An&nbsp;<em>uncertainty</em>&nbsp;represents the&nbsp;<a href="https://en.wikipedia.org/wiki/Observational_error" title="Observational error">random and systemic errors</a>&nbsp;of the measurement procedure; it indicates a confidence level in the measurement. Errors are evaluated by methodically repeating measurements and considering the&nbsp;<a href="https://en.wikipedia.org/wiki/Accuracy_and_precision" title="Accuracy and precision">accuracy and precision</a>&nbsp;of the measuring instrument.</li>
</ul>

<hr />
<p>&nbsp;</p>
', 0, N'measurement')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (60, N'<strong>This is my textarea to be replaced Editor.</strong>', 1, N'texttag1')
INSERT [dbo].[TextBank] ([id], [textdata], [IsShared], [TextName]) VALUES (61, N'<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" /></a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg"><img alt="" src="/Components/MediaBank/Content/Images/100x100/gre.jpg" style="height:200px; width:300px" />/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg">/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg">/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg">/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg">/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p><a href="/Components/MediaBank/Content/Images/100x100/1.jpg">/Components/MediaBank/Content/Images/100x100/1.jpg</a></p>

<p>The research on automatic hypertext construction emerges rapidly in the last decade because there exists a urgent need to translate the<br />
gigantic amount of legacy documents into web pages. Unlike traditional &lsquo;flat&rsquo; texts, a hypertext contains a number of navigational hyperlinks<br />
that point to some related hypertexts or locations of the same hypertext. Traditionally, these hyperlinks were constructed by the creators of<br />
the web pages with or without the help of some authoring tools. However, the gigantic amount of documents produced each day prevent from<br />
such manual construction. Thus an automatic hypertext construction method is necessary for content providers to efficiently produce<br />
adequate information that can be used by web surfers. Although most of the web pages contain a number of non-textual data such as images,<br />
sounds, and video clips, text data still contribute the major part of information about the pages. Therefore, it is not surprising that most of<br />
automatic hypertext construction methods inherit from traditional information retrieval research. In this work, we will propose a new<br />
automatic hypertext construction method based on a text mining approach. Our method applies the self-organizing map algorithm to cluster<br />
some at text documents in a training corpus and generate two maps. We then use these maps to identify the sources and destinations of some<br />
important hyperlinks within these training documents. The constructed hyperlinks are then inserted into the training documents to translate<br />
them into hypertext form. Such translated documents will form the new corpus. Incoming documents can also be translated into hypertext<br />
form and added to the corpus through the same approach. Our method had been tested on a set of at text documents collected from a newswire<br />
site. Although we only use Chinese text documents, our approach can be applied to any documents that can be transformed to a set of index<br />
terms.</p>
', 1, N'texttag1')
SET IDENTITY_INSERT [dbo].[TextBank] OFF
/****** Object:  Table [dbo].[Tags]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[Tags] ([id], [Name]) VALUES (1, N'tag1')
INSERT [dbo].[Tags] ([id], [Name]) VALUES (2, N'tag2')
INSERT [dbo].[Tags] ([id], [Name]) VALUES (3, N'tag3')
SET IDENTITY_INSERT [dbo].[Tags] OFF
/****** Object:  Table [dbo].[LessonMenu]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (1, N'Parent', 1, NULL, NULL, 78, N'Parent', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (2, N'Parent1', 1, 1, 44, 78, N'Parent1', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (3, N'tree', 0, 1, 44, 78, N'tree', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (4, N'mytree', 0, 1, 44, 79, N'mytree', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (5, N'mychild1', 0, 2, 44, 80, N'mychild1', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (9, N'node', 1, 1, 44, 81, N'node', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (10, N'treeeeee', 0, 9, 44, 82, N'treeeeee', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (11, N'abc', 1, 1, 44, 83, N'abc', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (12, N'teee2', 1, 11, 44, 84, N'teee2', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (13, N'treeeeeeeee', 0, 12, 44, 86, N'treeeeeeeee', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (14, N'Course_Content', 1, 1, 44, 86, N'Course Content', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (15, N'Physics', 1, 14, 44, 86, N'Physics', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (16, N'Chemistry', 0, 14, 44, 86, N'Chemistry', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (17, N'Mathematics', 0, 14, 44, 86, N'Mathematics', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (18, N'Week1', 1, 15, 44, 85, N'Week1', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (19, N'Week2', 0, 15, 44, 85, N'Week2', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (20, N'Measurement', 0, 18, 44, 85, N'Measurement', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (21, N'tree2', 0, 1, 44, 86, N'tree2', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (22, N'mychild5', 0, 2, 44, 87, N'mychild5 cs', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (23, N'Course_Labels', 1, 1, 44, 88, N'Course Labels', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (24, N'Label1', 1, 23, 44, 89, N'Label1', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (25, N'Labell2', 1, 23, 44, 90, N'Labell2', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (26, N'Label3', 0, 23, 44, 91, N'Label3', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (27, N'Label6', 0, 24, 44, 92, N'Label6', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (28, N'Label7', 1, 25, 44, 93, N'Label7', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (29, N'Label8', 1, 28, 44, 94, N'Label8', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (30, N'Label9', 0, 29, 44, 95, N'Label9', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (31, N'Label10', 0, 23, 44, 96, N'Label10', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (32, N'Label11', 0, 23, 44, 97, N'Label11', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (33, N'abctry', 0, 1, 44, 99, N'bbbbbbbb', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (39, N'My_New_file', 0, 1, 44, 100, N'user', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (40, N'My_New_file', 0, 1, 44, 101, N'user', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (41, N'w1', 0, 1, 44, 104, N'w1', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (42, N'week1', 0, 1, 44, 105, N'w1yg', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (43, N'week1', 1, 1, 44, 106, N'abc', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (44, N'week1', 1, 1, 44, 107, N'h', N'public', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (45, N'computerscience', 1, 1, 44, 136, N'Computer Science1', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (46, N'computerscienceweek1', 1, 45, 44, 137, N'Week 1', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (47, N'computerscienceweek2', 1, 45, 44, 138, N'Week 2', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (48, N'computerscienceweek1database', 1, 47, 44, 139, N'DataBase', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (49, N'computerscienceweek1softwhareengineering', 1, 47, 44, 140, N'Software Engineering', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (52, N'selesson', 0, 49, 44, 146, N'Text Lesson', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (53, N'sevideo', 0, 49, 44, 147, N'Video Lesson', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (54, N'csweek1html', 1, 46, 44, 148, N'Website Development', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (55, N'wdlesson', 0, 54, 44, 149, N'Lesson Text', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (56, N'wdvideo', 0, 54, 44, 150, N'Lesson Video', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (57, N'dbtext', 0, 48, 44, 151, N'Text Lesson', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (58, N'dbvideo', 0, 48, 44, 152, N'Video Lesson', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (59, N'wdQuiz1', 0, 54, 44, 153, N'Quiz 1', N'user', N'quiz')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (60, N'NewTreetree', 0, 1, 44, 154, N'New Treeee', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (61, N'qwerty', 0, 1, 44, 155, N'qwertyu', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (62, N'ggggggggggtggg', 0, 1, 44, 156, N'gfffffffffffff', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (63, N'Physics', 0, 1, 44, 157, N'Physicss', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (64, N'computerscience', 1, 45, 44, 158, N'Physics333', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (65, N'treefv', 0, 1, 44, 159, N'gvrrrrrrrrrrrrrr', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (66, N'mycontainer', 0, 64, 44, 160, N'Name', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (67, N'Phusics', 0, 64, 44, 161, N'fd c', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (68, N'NewDream_Progress_Menu', 0, 1, 164, 166, N'Progress', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (69, N'Main_menu', 1, 1, 164, 167, N'Main Menu', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (70, N'first_leveMenu', 1, 1, 164, 168, N'Menu level1', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (71, N'menu_one', 1, 69, 164, 169, N'Menu one', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (72, N'menu_two', 1, 69, 164, 170, N'Menu two', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (73, N'lablel_one', 0, 71, 164, 171, N'Label one', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (74, N'Label_two', 0, 71, 164, 172, N'label Two', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (75, N'label_four', 0, 72, 164, 173, N'Label four', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (76, N'label_five', 0, 72, 164, 174, N'Label Five', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (77, N'level_one_child', 0, 70, 164, 175, N'Level 1', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (78, N'level-two_child', 0, 70, 164, 176, N'Level 2', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (79, N'level_quiz', 0, 70, 164, 177, N'Quiz', N'user', N'quiz')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (80, N'level_three_child', 0, 70, 164, 178, N'level 3', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (81, N'progress', 0, 1, 180, 181, N'Progress', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (82, N'Physics', 1, 1, 180, 182, N'Physics', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (83, N'weekone', 1, 82, 180, 183, N'Week 1', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (84, N'weektwo', 1, 82, 180, 184, N'Week 2', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (85, N'chemistry', 1, 1, 180, 185, N'chemistry', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (86, N'weekonechem', 1, 85, 180, 186, N'Week 1', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (87, N'weektwochem', 1, 85, 180, 187, N'Week 2', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (88, N'measurement', 0, 83, 180, 188, N'Measurement', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (89, N'basicunits', 0, 83, 180, 189, N'Basic Units', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (90, N'motionEquation', 0, 84, 180, 190, N'Equations of Motion', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (91, N'NewtonLaw', 0, 84, 180, 191, N'Newton''s Law', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (92, N'atom', 0, 86, 180, 192, N'Atom', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (93, N'chemicalEquation', 0, 86, 180, 193, N'Chemical Equations', N'user', N'video')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (94, N'Carbon', 0, 87, 180, 194, N'Carbon', N'user', N'multimedia')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (95, N'Mathematics', 0, 1, 180, 195, N'Mathematics', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (96, N'englishComprehension', 0, 1, 180, 196, N'English comprehension ', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (97, N'Mainmenu', 1, 1, 164, 198, N'Main Menu', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (98, N'Mainfvgvf', 0, 97, 164, 199, N'Main Menu', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (99, N'ffffffffffffv', 0, 97, 164, 200, N'fgvb', N'user', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (100, N'fvg', 0, 1, 164, 201, N'gfbv', N'public', N'none')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (101, N'quizdream,', 0, 64, 44, 202, N'quiz', N'user', N'quiz')
INSERT [dbo].[LessonMenu] ([id], [menuName], [IsContainer], [parentMenu_id], [ParentLayoutID], [DreamLayoutID], [DisplayName], [menuRight], [menuType]) VALUES (102, N'h', 0, 1, 164, 207, N'h', N'user', N'none')
SET IDENTITY_INSERT [dbo].[LessonMenu] OFF
/****** Object:  Table [dbo].[ControlCategory]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (5, N'New', NULL)
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (20, N'Newest', NULL)
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (21, N'Check', NULL)
INSERT [dbo].[ControlCategory] ([id], [Name], [remarks]) VALUES (22, N'Check Again', NULL)
SET IDENTITY_INSERT [dbo].[ControlCategory] OFF
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[AdminsettingsNewsFeed]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[DynamicLayouts]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[ClientLayout]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'16e3f6b6-c3e2-4e82-b09a-7265524713c1', N'u', 0, N'AEAp5KAZelnBaGZ9N5K4xMpiBBIfcSGjN4DOPs+amqDGBi1JQfjXjQz3ba+7iulIng==', N'e8eb7420-508b-494b-9c2e-2022759296ae', NULL, 0, 0, NULL, 0, 0, N'u')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'3254a27a-1a30-475c-95a3-373f8ef3ba84', N'201150cs@gmail.com', 0, N'AOEhB+o6i5b5pNKKHxYk2bbX+8STdSQHSUw4pHjKQv3R6UqBLebAYFEmSDum8Ropkg==', N'eb5162fd-b7a5-480b-b992-f3775480bdf4', NULL, 0, 0, NULL, 0, 0, N'saba23akmal')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'377686f4-572c-462c-9f73-a69e01770791', N'sabaakmal23@yahoo.com', 0, NULL, N'ec2070a1-3c91-45d8-b04f-cad2bf70aaa9', NULL, 0, 0, NULL, 0, 0, N'SabaAkmalfgbv')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5bd075ca-9d22-444d-ae28-4fac5100a33f', N'201150cs@gmail.com', 0, N'ANclaVH0eaAf7TeBMl8BMIv9ISWbHlsg3fDugrOvKFne/AE4hKWQcoLzC3eLHXHWTg==', N'3f06750e-b586-4850-96bb-4c04fe783ece', NULL, 0, 0, NULL, 0, 0, N'almas')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'5e3ddbc2-c69e-4270-9e91-9d17cf5f8117', N'201150cs@gmail.com', 0, N'AI8P5C7wLc46iApWGH1B2DboDwZeWKvcl9jaNvVAkrUwPyEP+Gv4EYvCvk+OCZAaRg==', N'ac3f93f3-5a40-49bc-8b1a-6e64d24254b0', NULL, 0, 0, NULL, 0, 0, N'rida')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'734b7dd7-5c1e-4d17-a09f-f730a1f2f836', NULL, 0, N'AM3K9aXixepMaUqb+Nv/ZTFHJJ/Yg1dRTFczn9Kbi2Mo3Uk5TysoJoi2GTl8B7Vh3g==', N'2b3965be-c11b-4e53-bc97-f198d9531c2a', NULL, 0, 0, NULL, 0, 0, N'ali')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8d594b8d-1965-455e-96ed-871730ecfd0e', NULL, 0, N'ADKtjMEnlSOPpQLNc0N1zm3DLaXu+oeFE/qyV1pwQw8zu25aUGUcwCi3v7o0NBrzvw==', N'a4b3c5c4-a3ae-4a67-8512-dc1872374ad3', NULL, 0, 0, NULL, 0, 0, N'fatima')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9025c418-b3e7-40a1-8645-6e3d218d1057', N'201150cs@gmail.com', 0, N'AJ09kE4OhhzzEp5ggmmGwRGtSVGaVatZFHWrbXm6lopuzC1HbnwWI1KaY3yKxrMx1A==', N'9d9e3fbb-2dfe-46b4-a2c1-79644d0a584d', NULL, 0, 0, NULL, 0, 0, N'abc')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a22dacf2-2c06-43c6-9532-aa4d2f933f50', N'dreambirdapp@outlook.com', 0, NULL, N'120c8212-7226-4996-b0d0-caac6fce6ece', NULL, 0, 0, NULL, 0, 0, N'DogarBrothers')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a236f8b4-b848-4eba-8059-8cce4e141683', N'pakmats23@gmail.com', 0, NULL, N'1adb84d2-6ade-465f-99c3-f2245b68c9ef', NULL, 0, 0, NULL, 0, 0, N'pakmatspakmats')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a3824288-6b8a-4e91-9518-7c7f4fe85c32', N'bilal', 0, N'AFfmksH1VNhuQSYSbU5WQ0/9TUttWgeZvyOIuHFf+LGVNyMXEr+atgOVxmyrB6jikw==', N'71a5697c-9149-4752-8eb1-eaf3c0f70e47', NULL, 0, 0, NULL, 0, 0, N'bilal')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c034f15e-258b-416e-9550-f741b8c2af73', N'hina', 0, N'AIGD6a8fQ6e7SeuPnXAxtRZEGKX1r7+0Dst4K37MdZhQdmPiLVh34IWARf4Pa2FFdA==', N'8ca71b65-7203-4c0c-9972-e3b9363d508d', NULL, 0, 0, NULL, 0, 0, N'hina')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c15db4c0-af50-45f7-be19-ec57aabf949a', NULL, 0, N'AMlKD2V2tOD85oRMA14cldFAwwvfzEZ+ccopO1mt/FH3zoQ2DzjnbrxvJ294fIJf7g==', N'e9d66652-757c-4819-ba6a-817880c57d9b', NULL, 0, 0, NULL, 0, 0, N'rabia')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c45715e9-0c54-4275-8cd2-8903c9939acd', N'umer', 0, N'AE4OIvjKjO4ADFl5Jy9darNO0JKWVjfnT/XCc37hj/Xi3BS59BHwB4g4ksWwCXfdTQ==', N'bc78ab82-414b-4630-a3fb-22e22ebcdab2', NULL, 0, 0, NULL, 0, 0, N'umer')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ce629f2b-b90c-41e3-8e26-75e563c74519', N'201150cs@gmail.com', 0, NULL, N'4de209d0-2d7b-410c-8c29-a65f7740e567', NULL, 0, 0, NULL, 0, 0, N'sabaakmal')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'cf09b3d4-02c4-4d15-97a1-dbb1c63a512f', N'maida', 0, N'APzcklG8h2zbf0h6uVkM2yTr+qBASO8a74NrJBuHcrMGJgrKqbdIANGrJXyCc/s4ug==', N'2c4d7de1-9c52-4e03-a36d-af7d77938aea', NULL, 0, 0, NULL, 0, 0, N'maida')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd1e30fbd-d40b-4a32-8cd5-1294df51c620', NULL, 0, N'ALhTckEyGHseiC4QWxu4Gsf17GCxGn7A1VW6RuCG+ivpBBmOvhQ4NJalDhsvqdCe4Q==', N'29fa48e3-4e74-41de-96d6-53e590ae3c77', NULL, 0, 0, NULL, 0, 0, N'jojo')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd5ba58f6-addd-4781-9a0f-5595ef5a4413', N'dreambirdapp@gmail.com', 0, N'ADLtsG36pLGHLZ7396RQ/CWlYcktmv2U6EAVcsuEj9B4crGpWc1A5AKm2Zd26D/xQw==', N'0fb5de13-604e-4008-a168-999d81cea5a5', NULL, 0, 0, NULL, 0, 0, N'jojo2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'da3486d1-16f2-4488-8334-346d961eb4a5', N'201150cs@gmail.com', 0, N'AJh0tpV+QuXSBr0U+wq+VtV1LkzKbkwF5ijRhStvxdKintYvdfQwKnfCahZ5YYOMbA==', N'e446b53e-d361-4afd-98f9-c9e695c3ef95', NULL, 0, 0, NULL, 0, 0, N'nadia')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'df411e14-5ad3-4ff9-b9c8-ef221168aa71', N'saba.akmal@kics.edu.pk', 0, NULL, N'09953cbf-76f9-4575-a0d3-272313cfa6d8', NULL, 0, 0, NULL, 0, 0, N'SabaKics')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e42107bf-0c2e-4f48-a720-ce64736cd393', NULL, 0, N'AF2e7WPM3dGvL833MLVTNXtcc5Y6t7lgN4gP92UIDtAwLdMECOtpgIq9cAMOnqN5Ag==', N'93876401-a105-4ae6-8863-5bc939379fb7', NULL, 0, 0, NULL, 0, 0, N'jojo1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', N'saba.akmal@kics.edu.pk', 0, N'ADHyFOJhcDjtK/DegH6Y67xkSfakShlIGqV+KYmTjqYJzkUnkz6jh7e7atuVJUh9og==', N'66fa7bc2-e589-4bcd-b8c9-aacf014b9e68', NULL, 0, 0, NULL, 0, 0, N'Qaswa')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e759f2bd-b120-42fe-818e-71c3aa6ab6fc', N'sidra', 0, N'ALZJ3qFxJVMDClRijVu6UbYR6eYOHCs/BbzMLXAGBQsOvYBNxUlGNdHd6G+VpbCNBQ==', N'445d8827-cdcf-40e8-80f7-78e846a4b6ec', NULL, 0, 0, NULL, 0, 0, N'sidra')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ef94d63b-330d-4591-95f4-b6c02b9c1fdd', N'201150cs@gmail.com', 0, N'ACe25LPE+MgbgqcU94SO3yx/6STBLTqQolV0xK6/Z8tz91VeotL6IGt1nS2rr1Jrlg==', N'85e36221-cc72-4bc1-83c2-b5d0d76889e4', NULL, 0, 0, NULL, 0, 0, N'jannat')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'fbdacf86-f076-4ac0-a052-dea653bdb788', NULL, 0, N'AJHXI2Vi9x1bw7agcv/2w/jRQlhvb70ayIZYX3k2DUIPsqHGnGqKEd29BgpDXRqMxw==', N'a3b033fa-5ba2-49d6-9f00-58df3537fcaf', NULL, 0, 0, NULL, 0, 0, N'hareem')
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'16e3f6b6-c3e2-4e82-b09a-7265524713c1', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'377686f4-572c-462c-9f73-a69e01770791', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5bd075ca-9d22-444d-ae28-4fac5100a33f', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5e3ddbc2-c69e-4270-9e91-9d17cf5f8117', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'734b7dd7-5c1e-4d17-a09f-f730a1f2f836', N'271D901E-1B8A-4ADE-92D3-1311C220B571')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a3824288-6b8a-4e91-9518-7c7f4fe85c32', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c15db4c0-af50-45f7-be19-ec57aabf949a', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c45715e9-0c54-4275-8cd2-8903c9939acd', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'da3486d1-16f2-4488-8334-346d961eb4a5', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e759f2bd-b120-42fe-818e-71c3aa6ab6fc', N'0176297C-F40E-459B-94C0-444A41E032FC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ef94d63b-330d-4591-95f4-b6c02b9c1fdd', N'0176297C-F40E-459B-94C0-444A41E032FC')
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Facebook', N'945690605553226', N'377686f4-572c-462c-9f73-a69e01770791')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'100387325251940711746', N'a236f8b4-b848-4eba-8059-8cce4e141683')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'101250850373993370250', N'ce629f2b-b90c-41e3-8e26-75e563c74519')
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Twitter', N'2838179670', N'3254a27a-1a30-475c-95a3-373f8ef3ba84')
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[DreamTags]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[DreamUserProfile]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (5, N'12c7f563-1599-410b-8114-f0543a68de42', N'Adminabca', N'try', CAST(0x0000A67C00000000 AS DateTime), N'~/Components/DreamProfile/UserProfileImages/Chrysanthemum.jpg', 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (6, N'a22dacf2-2c06-43c6-9532-aa4d2f933f50', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (7, N'9025c418-b3e7-40a1-8645-6e3d218d1057', N'abc', N'msc', CAST(0x0000A65700000000 AS DateTime), N'~/Components/DreamProfile/UserProfileImages/Hydrangeas.jpg', 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (8, N'8d594b8d-1965-455e-96ed-871730ecfd0e', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (9, N'df411e14-5ad3-4ff9-b9c8-ef221168aa71', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (10, N'fbdacf86-f076-4ac0-a052-dea653bdb788', N'', N'', CAST(0x0000A67800000000 AS DateTime), N'', 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (11, N'3254a27a-1a30-475c-95a3-373f8ef3ba84', N'saba23akmal', N'msc', CAST(0x0000A67F00000000 AS DateTime), N'~/Components/DreamProfile/UserProfileImages/success_abd.jpg', 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (12, N'a3824288-6b8a-4e91-9518-7c7f4fe85c32', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (13, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (14, N'c034f15e-258b-416e-9550-f741b8c2af73', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (15, N'cf09b3d4-02c4-4d15-97a1-dbb1c63a512f', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (16, N'c45715e9-0c54-4275-8cd2-8903c9939acd', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (17, N'e759f2bd-b120-42fe-818e-71c3aa6ab6fc', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (18, N'16e3f6b6-c3e2-4e82-b09a-7265524713c1', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (19, N'16e3f6b6-c3e2-4e82-b09a-7265524713c1', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (20, N'ef94d63b-330d-4591-95f4-b6c02b9c1fdd', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (21, N'5bd075ca-9d22-444d-ae28-4fac5100a33f', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (22, N'a236f8b4-b848-4eba-8059-8cce4e141683', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (23, N'ce629f2b-b90c-41e3-8e26-75e563c74519', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (25, N'377686f4-572c-462c-9f73-a69e01770791', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (26, N'5e3ddbc2-c69e-4270-9e91-9d17cf5f8117', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (27, N'da3486d1-16f2-4488-8334-346d961eb4a5', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[DreamUserProfile] OFF
/****** Object:  Table [dbo].[LessonMenuAvailability]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[LessonMenuAvailability] ([id], [MenuID], [AvailableFrom], [DeadLine], [TimeLimit], [EnableAvailability], [EnableDeadLine], [EnableTimeLimit]) VALUES (8, 45, CAST(0x0000A6FF00000000 AS DateTime), CAST(0x0000A6B100000000 AS DateTime), 7, 0, 1, 1)
INSERT [dbo].[LessonMenuAvailability] ([id], [MenuID], [AvailableFrom], [DeadLine], [TimeLimit], [EnableAvailability], [EnableDeadLine], [EnableTimeLimit]) VALUES (9, 14, CAST(0x0000A6BF00000000 AS DateTime), NULL, 7, 0, 0, 1)
INSERT [dbo].[LessonMenuAvailability] ([id], [MenuID], [AvailableFrom], [DeadLine], [TimeLimit], [EnableAvailability], [EnableDeadLine], [EnableTimeLimit]) VALUES (10, 46, CAST(0x0000A6C500000000 AS DateTime), CAST(0x0000A6B100000000 AS DateTime), 7, 0, 0, 1)
INSERT [dbo].[LessonMenuAvailability] ([id], [MenuID], [AvailableFrom], [DeadLine], [TimeLimit], [EnableAvailability], [EnableDeadLine], [EnableTimeLimit]) VALUES (11, 47, NULL, NULL, 15, 0, 0, 1)
INSERT [dbo].[LessonMenuAvailability] ([id], [MenuID], [AvailableFrom], [DeadLine], [TimeLimit], [EnableAvailability], [EnableDeadLine], [EnableTimeLimit]) VALUES (12, 69, NULL, NULL, 2, 0, 0, 1)
INSERT [dbo].[LessonMenuAvailability] ([id], [MenuID], [AvailableFrom], [DeadLine], [TimeLimit], [EnableAvailability], [EnableDeadLine], [EnableTimeLimit]) VALUES (13, 70, CAST(0x0000A6CE00000000 AS DateTime), CAST(0x0000A6B900000000 AS DateTime), 0, 1, 1, 0)
SET IDENTITY_INSERT [dbo].[LessonMenuAvailability] OFF
/****** Object:  Table [dbo].[UserLessonProgress]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (1, 54, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (2, 55, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (3, 53, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (4, 56, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (5, 57, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (7, 58, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (8, 59, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (9, 73, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (10, 74, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (11, 77, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (12, 79, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (13, 73, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (14, 2, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (15, 3, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (16, 4, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (17, 89, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (18, 67, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (19, 66, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (20, 101, N'12c7f563-1599-410b-8114-f0543a68de42', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (21, 66, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (22, 54, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (23, 57, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', 100)
INSERT [dbo].[UserLessonProgress] ([id], [menu_id], [AspNetUser_id], [progress]) VALUES (24, 52, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', 100)
SET IDENTITY_INSERT [dbo].[UserLessonProgress] OFF
/****** Object:  Table [dbo].[TextBankTag]    Script Date: 11/18/2016 16:19:57 ******/
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
SET IDENTITY_INSERT [dbo].[TextBankTag] ON
INSERT [dbo].[TextBankTag] ([id], [TextID], [TagID]) VALUES (1, 17, 1)
INSERT [dbo].[TextBankTag] ([id], [TextID], [TagID]) VALUES (2, 17, 2)
INSERT [dbo].[TextBankTag] ([id], [TextID], [TagID]) VALUES (3, 17, 3)
INSERT [dbo].[TextBankTag] ([id], [TextID], [TagID]) VALUES (4, 37, 2)
INSERT [dbo].[TextBankTag] ([id], [TextID], [TagID]) VALUES (5, 37, 2)
INSERT [dbo].[TextBankTag] ([id], [TextID], [TagID]) VALUES (6, 37, 2)
INSERT [dbo].[TextBankTag] ([id], [TextID], [TagID]) VALUES (7, 45, 2)
SET IDENTITY_INSERT [dbo].[TextBankTag] OFF
/****** Object:  Table [dbo].[MediaItems]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (39, N'media.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6A6010D7050 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (40, N'lesson.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6A8017760C1 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (41, N'menu-bar.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6A900D01EC6 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (42, N'icon-22-512.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6A900D4DE2A AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (43, N'activity_grid1600.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6A900DAEB5D AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (44, N'ICON106-128.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6A900E50481 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (45, N'news-icon-13.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6A900E537CE AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (46, N'mail-icon.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6A900E56A36 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (47, N'readitlater-icon.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6A900E5AA9C AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (48, N'video2.mp4', N'/Components/MediaBank/Content/Video', 1, N'video', CAST(0x0000A6AA00A41E10 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (49, N'video1.mp4', N'/Components/MediaBank/Content/Video', 1, N'video', CAST(0x0000A6AC01026F33 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (50, N'nts.png', N'/Components/MediaBank/Content/Images', 1, N'Image', CAST(0x0000A6BB0098891B AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (51, N'nts.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6BB00988919 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (52, N'nts.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6BB0098A06E AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (53, N'nts.png', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6BB0098A070 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (54, N'gmail.PNG', N'/Components/MediaBank/Content/Images', NULL, N'Image', CAST(0x0000A6BF00A5871A AS DateTime))
SET IDENTITY_INSERT [dbo].[MediaItems] OFF
/****** Object:  Table [dbo].[News]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[VideoTranscript]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (7, 49, CAST(21.00 AS Decimal(18, 2)), N'The test is comprised of MCQs only. There are 90 MCQs in NAT-I paper and time duration of NAT-I paper is 2 hours (120 minutes). There are 100 MCQs in NAT-II paper and time duration of NAT-II is 2 hours (120 minutes).')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (8, 49, CAST(25.00 AS Decimal(18, 2)), N'')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (9, 49, CAST(32.00 AS Decimal(18, 2)), N'')
INSERT [dbo].[VideoTranscript] ([id], [MediaItem_id], [TimeStamp], [Text]) VALUES (10, 49, NULL, NULL)
SET IDENTITY_INSERT [dbo].[VideoTranscript] OFF
/****** Object:  Table [dbo].[MediaTags]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[Controls]    Script Date: 11/18/2016 16:19:57 ******/
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
	[AdminControlName] [nvarchar](max) NULL,
	[DefautControlName] [nvarchar](max) NULL,
	[AdminControlPath] [nvarchar](max) NULL,
 CONSTRAINT [PK_Controls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Controls] ON
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (1, 1, N'Top Menu Bar', 41, N'Top Menu Bar', N'~/Components/TopNav/TopNavAnonymous.ascx', N'~/Components/TopNav/TopNavAnonymous.ascx', N'/Components/TextBank/SuperAdminTextBank.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (10, 1, N'Lesson Menu', 39, N'abc', N'~/Components/LessonMenu/LessonMenuManager.ascx', N'~/Components/LessonMenu/LessonMenuManager.ascx', N'/Components/LessonMenu/LessonMenuAdminPage.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (13, 1, N'Progress DashBoard', 46, N'abc', N'~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx', N'~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx', N'/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (15, 1, N'Multimedia Control', 46, N'abc', N'~/Components/LessonBank/Lesson/LessonMultiMedia.ascx', N'~/Components/LessonBank/Lesson/LessonMultiMedia.ascx', N'xyz')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (20, 1, N'quiz', 39, N'abc', N'~/Components/LessonBank/Lesson/LessonQuiz.ascx', N'~/Components/LessonBank/Lesson/LessonQuiz.ascx', N'abc')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (21, 1, N'video Control', 47, N'abc', N'~/Components/LessonBank/Lesson/LessonVideo.ascx', N'~/Components/LessonBank/Lesson/LessonVideo.ascx', N'/LessonVideoAdminPage.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (22, 1, N'Custom Text Bank', 34, N'ab', N'~/Components/TextBank/TextBankView.ascx', N'~/Components/TextBank/TextBankView.ascx', N'/Components/TextBank/CustomAdminPage.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (24, 1, N'Dream Enrollment', 34, N'abc', N'~/Components/DreamEnrollment/DreamEnroll.ascx', N'~/Components/DreamEnrollment/DreamEnroll.ascx', NULL)
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (25, 1, N'Shared TextBank', 41, N'ABC', N'~/Components/TextBank/TextBankView.ascx', N'~/Components/TextBank/TextBankView.ascx', N'/Components/TextBank/SharedTextBankPage.aspx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (27, 1, N'Dream Content Summary', 40, N'dc', N'~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx', N'~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx', N'desx')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (28, 1, N'footer', 47, N'dsc', N'~/Components/Footer/FooterControl.ascx', N'~/Components/Footer/FooterControl.ascx', N'fdc')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (29, 1, N'Navigation', 50, N'fvc', N'~/Components/NAV_General/NavigationView.ascx', N'~/Components/NAV_General/NavigationView.ascx', N'bjb')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (30, 22, N'useractivation', 35, N'fvc', N'~/Components/Account/UserActivation.ascx', N'~/Components/Account/UserActivation.ascx', N'abc')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (31, 1, N'Dream Profile', 36, N'fbv', N'~/Components/DreamProfile/DreamProfileView.ascx', N'~/Components/DreamProfile/DreamProfileView.ascx', N'dfsc')
INSERT [dbo].[Controls] ([id], [ControlCategory_id], [Name], [IconURL], [NormalMarkup], [AdminControlName], [DefautControlName], [AdminControlPath]) VALUES (32, 1, N'share', 32, N'jhkh', N'~/Components/Account/InviteShare.ascx', N'~/Components/Account/InviteShare.ascx', N'~/Components/Account/InviteshareAdminpage.ascx')
SET IDENTITY_INSERT [dbo].[Controls] OFF
/****** Object:  Table [dbo].[Dreams]    Script Date: 11/18/2016 16:19:57 ******/
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
 CONSTRAINT [PK_Dreams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Dreams] ON
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (28, N'Home', 26, N'', 1, 1, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (29, N'GAT', 27, N'abc', 1, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (30, N'GRE', 48, N'fvd', 0, 0, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (34, N'ISSB', 34, N'sdcyjhn', 1, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (35, N'MyDream1', 32, N'abcdefghijklmnopqrstuvwxyz', 0, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (36, N'abc', 33, N'fvc', 0, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (37, N'cccccctv', 34, N'cccccc', 0, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (38, N'MY Pages of Dream', 34, N'dream', 0, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (39, N'Cleared', 33, N'dex', 1, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (40, N'MyDreamnew', 34, N'abcd', 1, 0, 1)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (42, N'jh', 34, N'ghfb', 1, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (43, N'hgb', 33, N'hgfbv', 1, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (44, N'NTS', 50, N'NTS is a newly introduced system which conducts “Test” for admission into various government colleges and universities in Pakistan. The tests conducted by NTS for admission into colleges and universities called “NAT” (National Aptitude Test) and “GAT”.', 0, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (46, N'tttttttttt', 39, N'gbvg', 0, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (47, N'bb', 47, N'', 0, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (54, N'dreamtry', 40, N'trgfb', 0, 0, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault], [IsPublished]) VALUES (55, N'mydreams', 39, N'fdc', 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Dreams] OFF
/****** Object:  Table [dbo].[DreamMessages]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[DreamLayouts]    Script Date: 11/18/2016 16:19:57 ******/
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
	[IsUserDefaultPage] [bit] NULL,
	[IsPublicDefaultPage] [bit] NOT NULL,
 CONSTRAINT [PK_DreamLayouts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DreamLayouts] ON
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (30, N'<%@ Register Src="~/Components/Core/BaseDreamControl.ascx" TagPrefix="uc1" TagName="BaseDreamControl" %> 
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
', 28, N'Default', NULL, 1, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (31, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-3" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx'' adminsettingcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-4" style=""><uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx'' adminsettingcontrol=''~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx''></uc2:basedreamcontrol></div>', 29, N'Page1', N'abc', 1, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (35, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol></div>', 34, N'Page1', N'abcd', 1, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (36, NULL, 34, N'Page2', N'', 0, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (37, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol></div>', 30, N'Page1', N'', 1, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (38, NULL, 37, N'Page1', NULL, 0, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (39, NULL, 37, N'Page2', NULL, 0, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (40, N'<%@ Register src="Components/Core/BaseDreamControl.ascx" tagname="BaseDreamControl" tagprefix="uc2" %>

<uc2:BaseDreamControl ID="BaseDreamControl1" runat="server" DefaultControl="~/Components/TextBank/TextBankView.ascx" AdminSettingControl="~/Components/TextBank/AdminTextBank.ascx" />


<uc2:BaseDreamControl ID="BaseDreamControl2" runat="server" DefaultControl="~/Components/TextBank/TextBankView.ascx" AdminSettingControl="~/Components/TextBank/AdminTextBank.ascx" />

<uc2:BaseDreamControl ID="BaseDreamControl3" runat="server" DefaultControl="~/Components/TextBank/TextBankView.ascx" AdminSettingControl="~/Components/TextBank/AdminTextBank.ascx" />', 30, N'Page5', NULL, 0, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (41, NULL, 37, N'Page5', NULL, 0, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (42, NULL, 37, N'Page6', NULL, 0, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (43, NULL, 37, N'Page62', N'', 0, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (44, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx'' adminsettingcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol></div>', 29, N'Page2', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (49, NULL, 29, N'Page', NULL, 1, 0, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (50, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 29, N'Page3', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (51, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 29, N'Page7', NULL, 0, 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (66, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx'' adminsettingcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div>', 29, N'Menu1', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (67, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 29, N'Menu2', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (68, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 29, N'child2', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (69, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-6" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 29, N'child22', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (70, N'<a href="" onclick="return SelectMenu(''../../dreamhome/GAT/teee2'',''2'');">parent</a>', 29, N'mychild', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (71, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/DreamProfile/DreamProfileView.ascx'' adminsettingcontrol=''~/Components/DreamProfile/DreamProfileView.ascx''></uc2:basedreamcontrol></div>', 29, N'mytree', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (72, N'<%@ Register src = ''Components/Core/BaseDreamControl.ascx'' tagname = ''BaseDreamControl'' tagprefix = ''uc2'' %>  <div><div class="row"><div id="header-wrap" class="col-md-12 mainLayout" style="border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable-header" class="ui-sortable Temp1"><div class="ui-sortable-handle" admindreamcontrol="~/Components/NAV_General/NavigationAdminSetting.ascx" defaultcontrolname="~/Components/NAV_General/NavigationView.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl1'' runat=''server'' DefaultControl=''~/Components/NAV_General/NavigationView.ascx'' AdminSettingControl=''~/Components/NAV_General/NavigationAdminSetting.ascx'' /></div></div></div></div><div class="row" style="margin:0;"><div class="row"><div class="col-md-3 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable2" class="ui-sortable Temp1"></div></div><div class="col-md-4 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable3" class="ui-sortable Temp1"><div class="ui-sortable-handle" admindreamcontrol="~/Components/News/FeatureNewsHomeAdmin.ascx" defaultcontrolname="~/Components/News/FeatureNewsHome.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl2'' runat=''server'' DefaultControl=''~/Components/News/FeatureNewsHome.ascx'' AdminSettingControl=''~/Components/News/FeatureNewsHomeAdmin.ascx'' /></div></div></div><div class="col-md-5 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable4" class="ui-sortable Temp1"></div></div></div></div><div class="row"><div class="col-md-12 mainLayout" id="footer-wrap" style="border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable-footer" class="ui-sortable Temp1"></div></div></div></div>', 29, N'mytree', N'fv', 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (73, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol></div>', 29, N'tree2', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (74, N'Hello World', 29, N'treewww', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (75, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/Account/UserActivation.ascx'' adminsettingcontrol=''~/Components/Account/UserActivation.ascx''></uc2:basedreamcontrol></div>', 29, N'trrrrrrrrrrrrrrr', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (76, N'Hello Worldhg', 29, N'mytree', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (77, N'Hello World', 29, N'mystyle', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (78, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 29, N'tree', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (79, N'Hello World', 29, N'mytree', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (80, N'Hello World', 29, N'mychild1', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (81, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol>


<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol>
</div>', 29, N'node', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (82, N'hg<a href="" onclick="return SelectMenu(''../../dreamhome/GAT/teee2'',''2'');">parent</a>', 29, N'treeeeee', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (83, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 29, N'abc', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (84, N'<%@ Register Src="~/Components/Core/BaseDreamControl.ascx" TagPrefix="uc1" TagName="BaseDreamControl" %>

<uc2:BaseDreamControl ID="BaseDreamControl1" runat="server" DefaultControl="~/Components/Dreams/DreamView.ascx" AdminSettingControl="~/Components/dreams/DreamAdminSetting.ascx" />', 29, N'teee2', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (85, N'hi
<a href="" onclick="return SelectMenu(''../../dreamhome/GAT/teee2'',''2'');">parent</a>', 29, N'Measurement', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (86, N'<%@ Register Src="~/Components/Core/BaseDreamControl.ascx" TagPrefix="uc1" TagName="BaseDreamControl" %>
 <uc1:BaseDreamControl runat="server" ID="BaseDreamControl"  DefaultControl="~/Components/NAV_General/NavigationView.ascx" AdminSettingControl="~/Components/NAV_General/NavigationView.ascx"/>', 29, N'tree2', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (87, N'Hello World', 29, N'mychild5', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (88, N'Hello World', 29, N'Course Labels', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (89, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 29, N'Label1', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (90, N'Hello World', 29, N'Labell2', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (91, N'Hello World', 29, N'Label3', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (92, N'Hello World', 29, N'Label6', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (93, N'Hello World', 29, N'Label7', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (94, N'Hello World', 29, N'Label8', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (95, N'Hello World', 29, N'Label9', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (96, N'Hello World', 29, N'Label10', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (97, N'Hello World', 29, N'Label11', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (98, NULL, 34, N'Page7', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (99, N'Hello World', 29, N'abc', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (100, N'Hello World', 29, N'My_New_file', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (101, N'Hello World', 29, N'My_New_file', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (102, N'Hello World', 29, N'Week1', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (103, N'Hello World', 29, N'Week1', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (104, N'hg<a href="" onclick="return SelectMenu(''../../dreamhome/GAT/teee2'',''2'');">parent</a>', 29, N'w1', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (105, N'Hello World', 29, N'week1', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (106, N'Hello World', 29, N'week1', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (107, N'Hello World', 29, N'week1', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (136, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx'' adminsettingcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx''></uc2:basedreamcontrol></div>', 29, N'computerscience', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (137, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx'' adminsettingcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx''></uc2:basedreamcontrol></div>', 29, N'computerscienceweek', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (138, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx'' adminsettingcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx''></uc2:basedreamcontrol></div>', 29, N'computerscienceweektwo', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (139, N'hello', 29, N'computerscienceweek1database', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (140, N'Hello World', 29, N'computerscienceweek1softwhareengineering', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (146, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 29, N'selesson', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (147, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 29, N'sevideo', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (148, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 29, N'csweek1html', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (149, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 29, N'wdlesson', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (150, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 29, N'wdvideo', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (151, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 29, N'dbtext', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (152, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 29, N'dbvideo', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (153, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonQuiz.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonQuiz.ascx''></uc2:basedreamcontrol></div>', 29, N'wdQuiz1', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (154, N'Hello World', 29, N'NewTree', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (155, N'Hello World', 29, N'qwerty', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (156, N'Hello World', 29, N'ggggggggggtggg', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (157, N'Hello World', 29, N'Physics', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (158, N'Hello World', 29, N'Physicstyg', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (159, N'Hello World', 29, N'treefv', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (160, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 29, N'mycontainer', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (161, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 29, N'Phusics', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (162, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 29, N'NewGatpage', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (163, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-9" style=""><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div>', 30, N'page0', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (164, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx'' adminsettingcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol></div>', 40, N'DefaultPage', NULL, 1, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (165, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-2" style=""><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-3" style=""><uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx'' adminsettingcontrol=''~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx''></uc2:basedreamcontrol></div>', 40, N'DetailPage', NULL, 0, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (166, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx'' adminsettingcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx''></uc2:basedreamcontrol></div>', 40, N'NewDreamProgressMenu', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (167, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx'' adminsettingcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx''></uc2:basedreamcontrol></div>', 40, N'Mainmenu', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (168, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx'' adminsettingcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx''></uc2:basedreamcontrol></div>', 40, N'firstleveMenu', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (169, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/NAV_General/NavigationView.ascx'' adminsettingcontrol=''~/Components/NAV_General/NavigationView.ascx''></uc2:basedreamcontrol></div>', 40, N'menuone', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (170, N'Hello World', 40, N'menutwo', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (171, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %> <div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 40, N'labelone', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (172, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 40, N'Labeltwo', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (173, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 40, N'labelfour', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (174, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 40, N'labelfive', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (175, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 40, N'levelonechild', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (176, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 40, N'leveltwochild', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (177, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonQuiz.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonQuiz.ascx''></uc2:basedreamcontrol></div>', 40, N'levelquiz', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (178, N'Hello World', 40, N'level_three_child', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (179, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="padding-top:20;"><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx'' adminsettingcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-4" style="padding-right:100;"><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx'' adminsettingcontrol=''~/Components/LessonBank/contentSummary/Dreamcontentsummary.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl4'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-8" style="padding-right:30;"><uc2:basedreamcontrol id=''BaseDreamControl5'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl6'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol></div><div id=''sortable-4'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl7'' runat=''server'' defaultcontrol=''~/Components/Footer/FooterControl.ascx'' adminsettingcontrol=''~/Components/Footer/FooterControl.ascx''></uc2:basedreamcontrol></div>', 44, N'defaultPage', NULL, 0, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (180, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TopNav/TopNavAnonymous.ascx'' adminsettingcontrol=''~/Components/TopNav/TopNavAnonymous.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx'' adminsettingcontrol=''~/Components/LessonMenu/LessonMenuManager.ascx''></uc2:basedreamcontrol></div><div id=''sortable-3'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl3'' runat=''server'' defaultcontrol=''~/Components/Footer/FooterControl.ascx'' adminsettingcontrol=''~/Components/Footer/FooterControl.ascx''></uc2:basedreamcontrol></div>', 44, N'mainPage', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (181, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx'' adminsettingcontrol=''~/Components/LessonBank/LessonDashBoard/LessonDashBoard.ascx''></uc2:basedreamcontrol></div>', 44, N'progress', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (182, N'Hello World', 44, N'Physics', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (183, N'Hello World', 44, N'weekone', NULL, 0, 1, 0, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (184, N'Hello World', 44, N'weektwo', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (185, N'Hello World', 44, N'chemistry', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (186, N'Hello World', 44, N'weekonechem', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (187, N'Hello World', 44, N'weektwochem', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (188, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="padding-top:20;"><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/TextBank/TextBankView.ascx'' adminsettingcontrol=''~/Components/TextBank/TextBankView.ascx''></uc2:basedreamcontrol><uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonMultiMedia.ascx''></uc2:basedreamcontrol></div>', 44, N'measurement', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (189, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonVideo.ascx''></uc2:basedreamcontrol></div>', 44, N'basicunits', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (190, N'Hello World', 44, N'motionEquation', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (191, N'Hello World', 44, N'NewtonLaw', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (192, N'Hello World', 44, N'atom', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (193, N'Hello World', 44, N'chemicalEquation', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (194, N'Hello World', 44, N'Carbon', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (195, N'Hello World', 44, N'Mathematics', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (196, N'Hello World', 44, N'englishComprehension', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (197, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style=""><uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol></div>', 35, N'pagemine', NULL, 0, 1, 1, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (198, N'Hello World', 40, N'Mainmenu', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (199, N'Hello World', 40, N'Mainfvgvf', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (200, N'Hello World', 40, N'ffffffffffffv', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (201, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/Account/UserActivation.ascx'' adminsettingcontrol=''~/Components/Account/UserActivation.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/DreamProfile/DreamProfileView.ascx'' adminsettingcontrol=''~/Components/DreamProfile/DreamProfileView.ascx''></uc2:basedreamcontrol></div>', 40, N'fvg', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (202, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/LessonBank/Lesson/LessonQuiz.ascx'' adminsettingcontrol=''~/Components/LessonBank/Lesson/LessonQuiz.ascx''></uc2:basedreamcontrol></div>', 29, N'quizdream,', NULL, 0, 1, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (203, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol></div><div id=''sortable-2'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl2'' runat=''server'' defaultcontrol=''~/Components/Account/InviteShare.ascx'' adminsettingcontrol=''~/Components/Account/InviteShare.ascx''></uc2:basedreamcontrol></div>', 43, N'enroll', NULL, 0, 1, 0, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsUserDefaultPage], [IsPublicDefaultPage]) VALUES (204, N'<%@ Register src=''Components/Core/BaseDreamControl.ascx'' tagname=''BaseDreamControl'' tagprefix=''uc2'' %><div id=''sortable-1'' class="col-md-12" style="">
    
    
<uc2:basedreamcontrol id=''BaseDreamControl1'' runat=''server'' defaultcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx'' adminsettingcontrol=''~/Components/DreamEnrollment/DreamEnroll.ascx''></uc2:basedreamcontrol></div>', 39, N'home', NULL, 0, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[DreamLayouts] OFF
/****** Object:  Table [dbo].[DreamEnrollment]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (1, 29, N'12c7f563-1599-410b-8114-f0543a68de42', CAST(0x0000A59100000000 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (2, 30, N'12c7f563-1599-410b-8114-f0543a68de42', CAST(0x0000A6B400962FA1 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (5, 34, N'12c7f563-1599-410b-8114-f0543a68de42', CAST(0x0000A6B4009C2474 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (6, 29, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', CAST(0x0000A6B700F8CC99 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (7, 40, N'e6e4fae9-21a0-4471-8474-c1a37bef3c2a', CAST(0x0000A6B800A6E931 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (8, 29, N'c45715e9-0c54-4275-8cd2-8903c9939acd', CAST(0x0000A6B900F86205 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (9, 40, N'12c7f563-1599-410b-8114-f0543a68de42', CAST(0x0000A6B900F9010B AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (10, 29, N'e759f2bd-b120-42fe-818e-71c3aa6ab6fc', CAST(0x0000A6BA00B26D7C AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (11, 44, N'12c7f563-1599-410b-8114-f0543a68de42', CAST(0x0000A6BB00A8E1C8 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (12, 43, N'12c7f563-1599-410b-8114-f0543a68de42', CAST(0x0000A6BF00C44423 AS DateTime))
INSERT [dbo].[DreamEnrollment] ([id], [dreamID], [AspNetUserID], [enroll_Date]) VALUES (13, 39, N'12c7f563-1599-410b-8114-f0543a68de42', CAST(0x0000A6C000B57577 AS DateTime))
SET IDENTITY_INSERT [dbo].[DreamEnrollment] OFF
/****** Object:  Table [dbo].[DreamUserLikes]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (269, 35, N'12c7f563-1599-410b-8114-f0543a68de42')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (271, 42, N'12c7f563-1599-410b-8114-f0543a68de42')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (273, 29, N'12c7f563-1599-410b-8114-f0543a68de42')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (274, 37, N'12c7f563-1599-410b-8114-f0543a68de42')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (275, 40, N'12c7f563-1599-410b-8114-f0543a68de42')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (276, 30, N'12c7f563-1599-410b-8114-f0543a68de42')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (277, 34, N'12c7f563-1599-410b-8114-f0543a68de42')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (278, 30, N'ce629f2b-b90c-41e3-8e26-75e563c74519')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (279, 34, N'ce629f2b-b90c-41e3-8e26-75e563c74519')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (280, 38, N'ce629f2b-b90c-41e3-8e26-75e563c74519')
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (283, 28, N'12c7f563-1599-410b-8114-f0543a68de42')
SET IDENTITY_INSERT [dbo].[DreamUserLikes] OFF
/****** Object:  Table [dbo].[ClientPage]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (1, 29, N'Page1', N'<div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><h4 style=''margin:0;''>Top Menu Bar</h4> <a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=29&PID=31&CID=BaseDreamControl1'' target=''_blank'' target="_blank">Go To Admin</a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=29&PID=31&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-4 sortable ui-sortable'' data-size=''col-md-4'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Content Summary''><a href=''http://localhost:64671desx?DID=29&PID=31&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>Dream Content Summary</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (2, 29, N'Page2', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Lesson Menu''><h4 style=''margin:0;''>Lesson Menu</h4> <a href=''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=29&PID=44&CID=1'' style=''position:absolute; bottom:0; left:4px'' target="_blank">Go To Admin</a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (3, 29, N'computerscience', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Progress DashBoard''><a href=''http://localhost:64671/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx?DID=29&PID=136&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Progress DashBoard</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (4, 29, N'selesson', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671xyz?DID=29&PID=146&CID=1'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (5, 29, N'sevideo', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=29&PID=147&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (6, 29, N'csweek1html', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><h4 style=''margin:0;''>Multimedia Control</h4> <a href=''http://localhost:64671xyz?DID=29&PID=148&CID=1'' style=''position:absolute; bottom:0; left:4px'' target=''_blank'' target="_blank">Go To Admin</a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (7, 29, N'wdlesson', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><h4 style=''margin:0;''>Multimedia Control</h4> <a href=''http://localhost:64671xyz?DID=29&PID=149&CID=1'' style=''position:absolute; bottom:0; left:4px'' target="_blank">Go To Admin</a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (8, 29, N'wdvideo', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=29&PID=150&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (9, 29, N'computerscienceweek', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Progress DashBoard''><a href=''http://localhost:64671/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx?DID=29&PID=137&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Progress DashBoard</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (10, 29, N'dbtext', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671xyz?DID=29&PID=151&CID=1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (11, 29, N'dbvideo', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=29&PID=152&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (12, 29, N'wdQuiz1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''quiz''><a href=''http://localhost:64671abc?DID=29&PID=153&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>quiz</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (13, 29, N'computerscienceweek2', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Progress DashBoard''><a href=''http://localhost:64671/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx?DID=29&PID=138&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Progress DashBoard</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (14, 29, N'node', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Text Bank''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=29&PID=81&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (15, 29, N'node', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Text Bank''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=29&PID=81&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (16, 29, N'Menu1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=29&PID=66&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (17, 30, N'Page1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=30&PID=37&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (18, 29, N'tree2', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=29&PID=73&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (19, 34, N'Page1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=34&PID=35&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (20, 29, N'Page3', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=29&PID=50&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (21, 29, N'Menu2', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Shared TextBank''><a href=''http://localhost:64671/Components/TextBank/SharedTextBankPage.aspx?DID=29&PID=67&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Shared TextBank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (22, 29, N'Page7', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Shared TextBank''><a href=''http://localhost:64671/Components/TextBank/SharedTextBankPage.aspx?DID=29&PID=51&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Shared TextBank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Shared TextBank''><a href=''http://localhost:64671/Components/TextBank/SharedTextBankPage.aspx?DID=29&PID=51&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Shared TextBank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (23, 29, N'Label1', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Shared TextBank''><a href=''http://localhost:64671/Components/TextBank/SharedTextBankPage.aspx?DID=29&PID=89&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Shared TextBank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (24, 29, N'child2', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=29&PID=68&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=29&PID=68&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (25, 29, N'NewGatpage', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=29&PID=162&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Shared TextBank''><a href=''http://localhost:64671/Components/TextBank/SharedTextBankPage.aspx?DID=29&PID=162&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Shared TextBank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (26, 30, N'page0', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=30&PID=163&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-9 sortable ui-sortable'' data-size=''col-md-9'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Shared TextBank''><a href=''http://localhost:64671/Components/TextBank/SharedTextBankPage.aspx?DID=30&PID=163&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Shared TextBank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (27, 29, N'child22', N' <div class=''btn btn-success col-md-6 sortable ui-sortable'' data-size=''col-md-6'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Shared TextBank''><a href=''http://localhost:64671/Components/TextBank/SharedTextBankPage.aspx?DID=29&PID=69&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Shared TextBank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (28, 40, N'DefaultPage', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Lesson Menu''><a href=''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=40&PID=164&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Lesson Menu</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (29, 40, N'NewDream_Progress_Menu', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Progress DashBoard''><a href=''http://localhost:64671/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx?DID=40&PID=166&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Progress DashBoard</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (30, 40, N'lablel_one', N' <div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=40&PID=171&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671xyz?DID=40&PID=171&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (31, 40, N'Label_two', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=40&PID=172&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (32, 40, N'firstleveMenu', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Progress DashBoard''><a href=''http://localhost:64671/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx?DID=40&PID=168&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Progress DashBoard</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (33, 40, N'labelfour', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=40&PID=173&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671xyz?DID=40&PID=173&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (34, 40, N'labelfive', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=40&PID=174&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (35, 40, N'levelonechild', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Shared TextBank''><a href=''http://localhost:64671/Components/TextBank/SharedTextBankPage.aspx?DID=40&PID=175&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Shared TextBank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671xyz?DID=40&PID=175&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (36, 40, N'leveltwochild', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=40&PID=176&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (37, 40, N'levelquiz', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''quiz''><a href=''http://localhost:64671abc?DID=40&PID=177&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>quiz</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (38, 40, N'Mainmenu', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Progress DashBoard''><a href=''http://localhost:64671/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx?DID=40&PID=167&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Progress DashBoard</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (39, 40, N'DetailPage', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=40&PID=165&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-2 sortable ui-sortable'' data-size=''col-md-2'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=40&PID=165&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-3 sortable ui-sortable'' data-size=''col-md-3'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Content Summary''><a href=''http://localhost:64671desx?DID=40&PID=165&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>Dream Content Summary</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (40, 29, N'tree', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671xyz?DID=29&PID=78&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (41, 44, N'defaultPage', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''padding-top:20;''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=44&PID=179&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-4 sortable ui-sortable'' data-size=''col-md-4'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''padding-right:100;''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Content Summary''><a href=''http://localhost:64671desx?DID=44&PID=179&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Content Summary</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=44&PID=179&CID=BaseDreamControl3'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=44&PID=179&CID=BaseDreamControl4'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-8 sortable ui-sortable'' data-size=''col-md-8'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''padding-right:30;''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=44&PID=179&CID=BaseDreamControl5'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=44&PID=179&CID=BaseDreamControl6'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-4''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-4'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-4'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''footer''><a href=''http://localhost:64671fdc?DID=44&PID=179&CID=BaseDreamControl7'' target="_blank"><h4 style=''margin:0;''>footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (42, 44, N'mainPage', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Top Menu Bar''><a href=''http://localhost:64671/Components/TextBank/SuperAdminTextBank.aspx?DID=44&PID=180&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Top Menu Bar</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Lesson Menu''><a href=''http://localhost:64671/Components/LessonMenu/LessonMenuAdminPage.aspx?DID=44&PID=180&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Lesson Menu</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-3''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-3'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-3'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''footer''><a href=''http://localhost:64671fdc?DID=44&PID=180&CID=BaseDreamControl3'' target="_blank"><h4 style=''margin:0;''>footer</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (43, 44, N'progress', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=44&PID=181&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-name=''Progress DashBoard''><a href=''http://localhost:64671/Components/LessonBank/LessonDashBoard/LessonDashBoardAdmin.aspx?DID=44&PID=181&CID=BaseDreamControl2'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Progress DashBoard</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (44, 44, N'measurement', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''padding-top:20;''><div class=''col-md-12 btn btn-warning'' data-name=''Custom Text Bank''><a href=''http://localhost:64671/Components/TextBank/CustomAdminPage.aspx?DID=44&PID=188&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Custom Text Bank</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671xyz?DID=44&PID=188&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (45, 44, N'basicunits', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=44&PID=189&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (46, 35, N'pagemine', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=35&PID=197&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (47, 40, N'menuone', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Navigation''><a href=''http://localhost:64671bjb?DID=40&PID=169&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Navigation</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (48, 29, N'abc', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=29&PID=83&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (49, 29, N'Phusics', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''video Control''><a href=''http://localhost:64671/LessonVideoAdminPage.aspx?DID=29&PID=161&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>video Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (50, 29, N'mycontainer', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Multimedia Control''><a href=''http://localhost:64671xyz?DID=29&PID=160&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Multimedia Control</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (51, 29, N'quizdream,', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''quiz''><a href=''http://localhost:64671abc?DID=29&PID=202&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>quiz</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (52, 29, N'trrrrrrrrrrrrrrr', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''useractivation''><a href=''http://localhost:64671abc?DID=29&PID=75&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>useractivation</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (53, 29, N'mytree', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Profile''><a href=''http://localhost:64671dfsc?DID=29&PID=71&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Dream Profile</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (54, 43, N'enroll', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=43&PID=203&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''share''><a href=''http://localhost:64671~/Components/Account/InviteshareAdminpage.ascx?DID=43&PID=203&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>share</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (55, 39, N'home', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Enrollment''><a href=''http://localhost:64671?DID=39&PID=204&CID=BaseDreamControl1'' target="_blank"><h4 style=''margin:0;''>Dream Enrollment</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
INSERT [dbo].[ClientPage] ([id], [DreamLayout_id], [Page], [pageContent]) VALUES (57, 40, N'fvg', N'<div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-1''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-1'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-1'' value=''''><input type=''hidden'' id=''hidden-class-sortable-1'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''useractivation''><a href=''http://localhost:64671abc?DID=40&PID=201&CID=BaseDreamControl1'' target=''_blank'' target="_blank"><h4 style=''margin:0;''>useractivation</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div><div class=''btn btn-success col-md-12 sortable ui-sortable'' data-size=''col-md-12'' style=''display: block; margin: 0px;'' id=''sortable-2''>
    
    <span class=''glyphicon glyphicon-asterisk handle'' aria-hidden=''true'' style=''position: absolute; top: 2px; left: 4px;''></span>
<span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span><span class=''glyphicon glyphicon-plus add'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#controlsList'' style=''position:absolute; top:10px; right:2px; opacity:0;''></span><span class=''glyphicon glyphicon-pencil edit'' aria-hidden=''true'' data-argument=''sortable-2'' data-toggle=''modal'' data-target=''#editCSS'' style=''position:absolute; top:15px; right:2px; opacity:0;''></span><input type=''hidden'' id=''hidden-sortable-2'' value=''''><input type=''hidden'' id=''hidden-class-sortable-2'' value=''col-md-12''><div class=''col-md-12 btn btn-warning'' data-name=''Dream Profile''><a href=''http://localhost:64671dfsc?DID=40&PID=201&CID=BaseDreamControl2'' target="_blank"><h4 style=''margin:0;''>Dream Profile</h4></a><span class=''glyphicon glyphicon-remove remove'' style=''position:absolute; top:2px; right:2px; opacity:0;'' aria-hidden=''true''></span></div></div>')
SET IDENTITY_INSERT [dbo].[ClientPage] OFF
/****** Object:  Table [dbo].[NewsRelatedNews]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[NewsDreamNews]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Table [dbo].[Navigations]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (27, 46, 40, N'nab', N'~/DreamHome/ISSB/Page2', 1, 0)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (30, 39, 40, N'oooooooooo', N'gfrv', 1, 1)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (31, 46, 28, N'vhgh', N'~/DreamHome/ISSB/Page1', 0, 0)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (32, 46, 44, N'gfbvgggg', N'~/DreamHome/GRE/Page5', 0, 0)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (33, 46, 40, N'', N'~/DreamHome/Home/Default', 1, 0)
SET IDENTITY_INSERT [dbo].[Navigations] OFF
/****** Object:  Table [dbo].[LessonVideo]    Script Date: 11/18/2016 16:19:57 ******/
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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LessonVideo] ON
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id]) VALUES (3, 152, N'BaseDreamControl1', 48)
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id]) VALUES (4, 150, N'BaseDreamControl1', 48)
INSERT [dbo].[LessonVideo] ([id], [Layout_id], [BaseControlID], [MediaItem_id]) VALUES (5, 147, N'BaseDreamControl1', 49)
SET IDENTITY_INSERT [dbo].[LessonVideo] OFF
/****** Object:  Table [dbo].[LessonProgressDashBoard]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[LessonProgressDashBoard] ([id], [BaseControlID], [ShowSiblingsProgress], [LayoutID]) VALUES (3, N'BaseDreamControl1', 0, 137)
INSERT [dbo].[LessonProgressDashBoard] ([id], [BaseControlID], [ShowSiblingsProgress], [LayoutID]) VALUES (4, N'BaseDreamControl1', 0, 136)
INSERT [dbo].[LessonProgressDashBoard] ([id], [BaseControlID], [ShowSiblingsProgress], [LayoutID]) VALUES (5, N'BaseDreamControl1', 0, 138)
INSERT [dbo].[LessonProgressDashBoard] ([id], [BaseControlID], [ShowSiblingsProgress], [LayoutID]) VALUES (6, N'BaseDreamControl1', 1, 166)
INSERT [dbo].[LessonProgressDashBoard] ([id], [BaseControlID], [ShowSiblingsProgress], [LayoutID]) VALUES (7, N'BaseDreamControl1', 0, 167)
INSERT [dbo].[LessonProgressDashBoard] ([id], [BaseControlID], [ShowSiblingsProgress], [LayoutID]) VALUES (8, N'BaseDreamControl1', 0, 168)
INSERT [dbo].[LessonProgressDashBoard] ([id], [BaseControlID], [ShowSiblingsProgress], [LayoutID]) VALUES (9, N'BaseDreamControl2', 1, 181)
SET IDENTITY_INSERT [dbo].[LessonProgressDashBoard] OFF
/****** Object:  Table [dbo].[LayoutTextBank]    Script Date: 11/18/2016 16:19:57 ******/
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
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (18, 81, 31, 12, N'BaseDreamControl2                                 ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (19, 81, 32, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (23, 50, 37, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (24, 51, 38, 42, N'BaseDreamControl1                                 ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (25, 89, 39, 36, N'BaseDreamControl1                                 ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (26, 68, 43, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (27, 68, 44, NULL, N'BaseDreamControl2                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (28, 162, 45, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (29, 162, 46, 47, N'BaseDreamControl2                                 ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (30, 163, 48, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (31, 163, 49, 36, N'BaseDreamControl2                                 ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (32, 67, 50, 13, N'BaseDreamControl1                                 ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (33, 69, 51, 42, N'BaseDreamControl1                                 ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (34, 171, 52, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (35, 173, 53, NULL, N'BaseDreamControl1                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (36, 175, 54, 47, N'BaseDreamControl1                                 ', 1)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (37, 179, 55, NULL, N'BaseDreamControl3                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (38, 179, 56, NULL, N'BaseDreamControl5                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (39, 179, 57, NULL, N'BaseDreamControl4                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (40, 179, 58, NULL, N'BaseDreamControl6                                 ', 0)
INSERT [dbo].[LayoutTextBank] ([id], [LayoutID], [TextID], [SharedTextID], [ControlName], [IsShared]) VALUES (41, 188, 59, NULL, N'BaseDreamControl1                                 ', 0)
SET IDENTITY_INSERT [dbo].[LayoutTextBank] OFF
/****** Object:  Table [dbo].[InviteSharePage]    Script Date: 11/18/2016 16:19:57 ******/
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
/****** Object:  Default [DF_TextBank_TextName]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[TextBank] ADD  CONSTRAINT [DF_TextBank_TextName]  DEFAULT ('') FOR [TextName]
GO
/****** Object:  Default [DF_LessonMenu_IsContainer]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_IsContainer]  DEFAULT ((0)) FOR [IsContainer]
GO
/****** Object:  Default [DF_LessonMenu_DisplayName]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_DisplayName]  DEFAULT ('') FOR [DisplayName]
GO
/****** Object:  Default [DF_LessonMenu_menuType]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonMenu] ADD  CONSTRAINT [DF_LessonMenu_menuType]  DEFAULT (N'multimedia') FOR [menuType]
GO
/****** Object:  Default [DF__DreamUser__IsAct__2E1BDC42]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamUserProfile] ADD  CONSTRAINT [DF__DreamUser__IsAct__2E1BDC42]  DEFAULT ((0)) FOR [IsActivated]
GO
/****** Object:  Default [DF_LessonMenuAvailability_TimeLimit]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_TimeLimit]  DEFAULT ((0)) FOR [TimeLimit]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableAvailability]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableAvailability]  DEFAULT ((0)) FOR [EnableAvailability]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableDeadLine]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableDeadLine]  DEFAULT ((0)) FOR [EnableDeadLine]
GO
/****** Object:  Default [DF_LessonMenuAvailability_EnableTimeLimit]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonMenuAvailability] ADD  CONSTRAINT [DF_LessonMenuAvailability_EnableTimeLimit]  DEFAULT ((0)) FOR [EnableTimeLimit]
GO
/****** Object:  Default [DF_UserLessonProgress_progress]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[UserLessonProgress] ADD  CONSTRAINT [DF_UserLessonProgress_progress]  DEFAULT ((0)) FOR [progress]
GO
/****** Object:  Default [DF_Dreams_IsFeatured]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsFeatured]  DEFAULT ((0)) FOR [IsFeatured]
GO
/****** Object:  Default [DF_Dreams_IsDefault]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
/****** Object:  Default [DF_Dreams_IsPublished]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsPublished]  DEFAULT ((0)) FOR [IsPublished]
GO
/****** Object:  Default [DF_DreamLayouts_NavEnable]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_NavEnable]  DEFAULT ((0)) FOR [NavEnable]
GO
/****** Object:  Default [DF_DreamLayouts_IsPublished]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_IsPublished]  DEFAULT ((1)) FOR [IsPublished]
GO
/****** Object:  Default [DF__DreamLayo__IsDef__403A8C7D]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF__DreamLayo__IsDef__403A8C7D]  DEFAULT ((0)) FOR [IsUserDefaultPage]
GO
/****** Object:  Default [DF_DreamLayouts_IsPublicDefaultPage]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_IsPublicDefaultPage]  DEFAULT ((0)) FOR [IsPublicDefaultPage]
GO
/****** Object:  Default [DF_LessonProgressDashBoard_ShowSiblingsProgress]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonProgressDashBoard] ADD  CONSTRAINT [DF_LessonProgressDashBoard_ShowSiblingsProgress]  DEFAULT ((0)) FOR [ShowSiblingsProgress]
GO
/****** Object:  ForeignKey [FK_LessonMenu_LessonMenu]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonMenu]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenu_LessonMenu] FOREIGN KEY([parentMenu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenu] CHECK CONSTRAINT [FK_LessonMenu_LessonMenu]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_Tag]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamTags]  WITH CHECK ADD  CONSTRAINT [FK_Tag] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamTags] CHECK CONSTRAINT [FK_Tag]
GO
/****** Object:  ForeignKey [FK_DreamUserProfile_AspNetUsers]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamUserProfile]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserProfile_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserProfile] CHECK CONSTRAINT [FK_DreamUserProfile_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_LessonMenuAvailability_LessonMenu]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonMenuAvailability]  WITH CHECK ADD  CONSTRAINT [FK_LessonMenuAvailability_LessonMenu] FOREIGN KEY([MenuID])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[LessonMenuAvailability] CHECK CONSTRAINT [FK_LessonMenuAvailability_LessonMenu]
GO
/****** Object:  ForeignKey [FK_UserLessonProgress_AspNetUsers]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_AspNetUsers] FOREIGN KEY([AspNetUser_id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_UserLessonProgress_LessonMenu]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[UserLessonProgress]  WITH CHECK ADD  CONSTRAINT [FK_UserLessonProgress_LessonMenu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[LessonMenu] ([id])
GO
ALTER TABLE [dbo].[UserLessonProgress] CHECK CONSTRAINT [FK_UserLessonProgress_LessonMenu]
GO
/****** Object:  ForeignKey [FK_TextBankTag_Tags]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[TextBankTag]  WITH CHECK ADD  CONSTRAINT [FK_TextBankTag_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[TextBankTag] CHECK CONSTRAINT [FK_TextBankTag_Tags]
GO
/****** Object:  ForeignKey [FK_TextBankTag_TextBank]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[TextBankTag]  WITH CHECK ADD  CONSTRAINT [FK_TextBankTag_TextBank] FOREIGN KEY([TextID])
REFERENCES [dbo].[TextBank] ([id])
GO
ALTER TABLE [dbo].[TextBankTag] CHECK CONSTRAINT [FK_TextBankTag_TextBank]
GO
/****** Object:  ForeignKey [FK_MediaItems_MediaCategories]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[MediaItems]  WITH CHECK ADD  CONSTRAINT [FK_MediaItems_MediaCategories] FOREIGN KEY([MediaCategory_id])
REFERENCES [dbo].[MediaCategories] ([id])
GO
ALTER TABLE [dbo].[MediaItems] CHECK CONSTRAINT [FK_MediaItems_MediaCategories]
GO
/****** Object:  ForeignKey [FK_News_MediaItems]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_MediaItems]
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__6477ECF3]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK_MediaTags_MediaItems]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_MediaItems]
GO
/****** Object:  ForeignKey [FK_MediaTags_Tags]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_Tags] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_Tags]
GO
/****** Object:  ForeignKey [FK__Controls__Contro__4AB81AF0]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([ControlCategory_id])
REFERENCES [dbo].[ControlCategory] ([id])
GO
/****** Object:  ForeignKey [FK__Controls__IconUR__4BAC3F29]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[Controls]  WITH CHECK ADD FOREIGN KEY([IconURL])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK_Dreams_MediaItems]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD  CONSTRAINT [FK_Dreams_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Dreams] CHECK CONSTRAINT [FK_Dreams_MediaItems]
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile] FOREIGN KEY([SenderId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile]
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile1]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile1] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile1]
GO
/****** Object:  ForeignKey [FK_DreamLayouts_Dreams]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamLayouts]  WITH CHECK ADD  CONSTRAINT [FK_DreamLayouts_Dreams] FOREIGN KEY([DreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamLayouts] CHECK CONSTRAINT [FK_DreamLayouts_Dreams]
GO
/****** Object:  ForeignKey [FK_DreamEnrollment_AspNetUsers]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_DreamEnrollment_AspNetUsers] FOREIGN KEY([AspNetUserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamEnrollment] CHECK CONSTRAINT [FK_DreamEnrollment_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_DreamEnrollment_Dreams]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_DreamEnrollment_Dreams] FOREIGN KEY([dreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamEnrollment] CHECK CONSTRAINT [FK_DreamEnrollment_Dreams]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_AspNetUsers]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_Dreams]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_Dreams] FOREIGN KEY([DreamId])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_Dreams]
GO
/****** Object:  ForeignKey [FK__ClientPag__Dream__49C3F6B7]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[ClientPage]  WITH CHECK ADD FOREIGN KEY([DreamLayout_id])
REFERENCES [dbo].[Dreams] ([id])
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News] FOREIGN KEY([related_news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News1]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News1] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News1]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_Dreams]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_Dreams] FOREIGN KEY([dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_Dreams]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_News]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_News] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_News]
GO
/****** Object:  ForeignKey [FK_Navigations_Dreams]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_Dreams] FOREIGN KEY([Dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_Dreams]
GO
/****** Object:  ForeignKey [FK_Navigations_MediaItems]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_MediaItems]
GO
/****** Object:  ForeignKey [FK_LessonVideo_DreamLayouts1]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonVideo]  WITH CHECK ADD  CONSTRAINT [FK_LessonVideo_DreamLayouts1] FOREIGN KEY([Layout_id])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonVideo] CHECK CONSTRAINT [FK_LessonVideo_DreamLayouts1]
GO
/****** Object:  ForeignKey [FK_LessonVideo_MediaItems]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonVideo]  WITH CHECK ADD  CONSTRAINT [FK_LessonVideo_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonVideo] CHECK CONSTRAINT [FK_LessonVideo_MediaItems]
GO
/****** Object:  ForeignKey [FK_LessonProgressDashBoard_DreamLayouts]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LessonProgressDashBoard]  WITH CHECK ADD  CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LessonProgressDashBoard] CHECK CONSTRAINT [FK_LessonProgressDashBoard_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_LayoutTextBank_DreamLayouts]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[LayoutTextBank]  WITH CHECK ADD  CONSTRAINT [FK_LayoutTextBank_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LayoutTextBank] CHECK CONSTRAINT [FK_LayoutTextBank_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_InviteSharePage_DreamLayouts]    Script Date: 11/18/2016 16:19:57 ******/
ALTER TABLE [dbo].[InviteSharePage]  WITH CHECK ADD  CONSTRAINT [FK_InviteSharePage_DreamLayouts] FOREIGN KEY([LayoutID])
REFERENCES [dbo].[DreamLayouts] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InviteSharePage] CHECK CONSTRAINT [FK_InviteSharePage_DreamLayouts]
GO
