USE [DreamBird]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 09/07/2016 09:22:56 ******/
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
/****** Object:  Table [dbo].[Controls]    Script Date: 09/07/2016 09:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Controls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NULL,
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
SET IDENTITY_INSERT [dbo].[Controls] ON
INSERT [dbo].[Controls] ([id], [Name], [Category], [IconURL], [NormalMarkup], [OnEditMarkup], [OnSettingChangedMarkup], [AdminControlName], [DefautControlName]) VALUES (8, N'UserActivation', N'DreamControls', N'UserActivation.jpg', N'<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
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
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>', N'<span style=''float:right; margin-right:20px; z-index:1 !important;''><span id=''edit-Nav Bar'' class=''glyphicon glyphicon-pencil controlsedit'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#editModal'' style=''margin-left:5px;margin-right:5px;''></span><span id=''close-Nav Bar'' class=''glyphicon glyphicon-remove-circle controls'' style=''margin-left:5px;margin-right:5px;'' aria-hidden=''true''></span></span><nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
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
      <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>', NULL, N'~/Components/Account/UserActivation.ascx', N'~/Components/Account/UserActivation.ascx')
INSERT [dbo].[Controls] ([id], [Name], [Category], [IconURL], [NormalMarkup], [OnEditMarkup], [OnSettingChangedMarkup], [AdminControlName], [DefautControlName]) VALUES (9, N'DreamProfile', N'DreamControls', N'Profile.jpg', N'<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Panel title</h3>
  </div>
  <div class="panel-body">
    Panel content
  </div>
</div>', N'<span style=''float:right; margin-right:20px; z-index:1 !important;''><span id=''edit-Panel'' class=''glyphicon glyphicon-pencil controlsedit'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#editModal'' style=''margin-left:5px;margin-right:5px;''></span><span id=''close-Panel'' class=''glyphicon glyphicon-remove-circle controls'' style=''margin-left:5px;margin-right:5px;'' aria-hidden=''true''></span></span><div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title">Panel title</h3>
  </div>
  <div class="panel-body">
    Panel content
  </div>
</div>', NULL, N'~/Components/DreamProfile/DreamProfileView.ascx', N'~/Components/DreamProfile/DreamProfileView.ascx')
INSERT [dbo].[Controls] ([id], [Name], [Category], [IconURL], [NormalMarkup], [OnEditMarkup], [OnSettingChangedMarkup], [AdminControlName], [DefautControlName]) VALUES (10, N'Messages', N'DreamControls', N'Messages.jpg', N'<ul class="list-group">
  <li class="list-group-item">Cras justo odio</li>
  <li class="list-group-item">Dapibus ac facilisis in</li>
  <li class="list-group-item">Morbi leo risus</li>
  <li class="list-group-item">Porta ac consectetur ac</li>
  <li class="list-group-item">Vestibulum at eros</li>
</ul>', N'<span style=''float:right; margin-right:20px; z-index:1 !important;''><span id=''edit-List Group'' class=''glyphicon glyphicon-pencil controlsedit'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#editModal'' style=''margin-left:5px;margin-right:5px;''></span><span id=''close-List Group'' class=''glyphicon glyphicon-remove-circle controls'' style=''margin-left:5px;margin-right:5px;'' aria-hidden=''true''></span></span><ul class="list-group">
  <li class="list-group-item">Cras justo odio</li>
  <li class="list-group-item">Dapibus ac facilisis in</li>
  <li class="list-group-item">Morbi leo risus</li>
  <li class="list-group-item">Porta ac consectetur ac</li>
  <li class="list-group-item">Vestibulum at eros</li>
</ul>', NULL, N'~/Components/DreamMessages/DreamMessageView.ascx', N'~/Components/DreamMessages/DreamMessageView.ascx')
INSERT [dbo].[Controls] ([id], [Name], [Category], [IconURL], [NormalMarkup], [OnEditMarkup], [OnSettingChangedMarkup], [AdminControlName], [DefautControlName]) VALUES (11, N'Jumbotron', N'DreamControls', N'DreamView.jpg', N'<div class="jumbotron"> <h1>Hello, world!</h1> <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p> <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p> </div>', N'<span style=''float:right; margin-right:20px; z-index:1 !important;''><span id=''edit-Jumbotron'' class=''glyphicon glyphicon-pencil controlsedit'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#editModal'' style=''margin-left:5px;margin-right:5px;''></span><span id=''close-Jumbotron'' class=''glyphicon glyphicon-remove-circle controls'' style=''margin-left:5px;margin-right:5px;'' aria-hidden=''true''></span></span><div class="jumbotron"> <h1>Hello, world!</h1> <p>This is a simple hero unit, a simple jumbotron-style component for calling extra attention to featured content or information.</p> <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p> </div>', NULL, N'~/Components/Dreams/DreamView.ascx', N'~/Components/Dreams/DreamAdminSetting.ascx')
INSERT [dbo].[Controls] ([id], [Name], [Category], [IconURL], [NormalMarkup], [OnEditMarkup], [OnSettingChangedMarkup], [AdminControlName], [DefautControlName]) VALUES (12, N'TextBank', N'DreamControls', N'TextBank.jpg', N'<div class="row"> <div class="col-sm-6 col-md-4"> <div class="thumbnail"> <img data-src="holder.js/100%x200" alt="100%x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjQyIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDI0MiAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MjAwCkNyZWF0ZWQgd2l0aCBIb2xkZXIuanMgMi42LjAuCkxlYXJuIG1vcmUgYXQgaHR0cDovL2hvbGRlcmpzLmNvbQooYykgMjAxMi0yMDE1IEl2YW4gTWFsb3BpbnNreSAtIGh0dHA6Ly9pbXNreS5jbwotLT48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhW0NEQVRBWyNob2xkZXJfMTU1ZTU4NGJlYjkgdGV4dCB7IGZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMnB0IH0gXV0+PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImhvbGRlcl8xNTVlNTg0YmViOSI+PHJlY3Qgd2lkdGg9IjI0MiIgaGVpZ2h0PSIyMDAiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSI4OS44NTkzNzUiIHk9IjEwNS4xIj4yNDJ4MjAwPC90ZXh0PjwvZz48L2c+PC9zdmc+" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;"> <div class="caption"> <h3>Thumbnail label</h3> <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> </div> </div> </div> <div class="col-sm-6 col-md-4"> <div class="thumbnail"> <img data-src="holder.js/100%x200" alt="100%x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjQyIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDI0MiAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MjAwCkNyZWF0ZWQgd2l0aCBIb2xkZXIuanMgMi42LjAuCkxlYXJuIG1vcmUgYXQgaHR0cDovL2hvbGRlcmpzLmNvbQooYykgMjAxMi0yMDE1IEl2YW4gTWFsb3BpbnNreSAtIGh0dHA6Ly9pbXNreS5jbwotLT48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhW0NEQVRBWyNob2xkZXJfMTU1ZTU4NGEyMTkgdGV4dCB7IGZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMnB0IH0gXV0+PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImhvbGRlcl8xNTVlNTg0YTIxOSI+PHJlY3Qgd2lkdGg9IjI0MiIgaGVpZ2h0PSIyMDAiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSI4OS44NTkzNzUiIHk9IjEwNS4xIj4yNDJ4MjAwPC90ZXh0PjwvZz48L2c+PC9zdmc+" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;"> <div class="caption"> <h3>Thumbnail label</h3> <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> </div> </div> </div> <div class="col-sm-6 col-md-4"> <div class="thumbnail"> <img data-src="holder.js/100%x200" alt="100%x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjQyIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDI0MiAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MjAwCkNyZWF0ZWQgd2l0aCBIb2xkZXIuanMgMi42LjAuCkxlYXJuIG1vcmUgYXQgaHR0cDovL2hvbGRlcmpzLmNvbQooYykgMjAxMi0yMDE1IEl2YW4gTWFsb3BpbnNreSAtIGh0dHA6Ly9pbXNreS5jbwotLT48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhW0NEQVRBWyNob2xkZXJfMTU1ZTU4NDdjNzggdGV4dCB7IGZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMnB0IH0gXV0+PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImhvbGRlcl8xNTVlNTg0N2M3OCI+PHJlY3Qgd2lkdGg9IjI0MiIgaGVpZ2h0PSIyMDAiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSI4OS44NTkzNzUiIHk9IjEwNS4xIj4yNDJ4MjAwPC90ZXh0PjwvZz48L2c+PC9zdmc+" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;"> <div class="caption"> <h3>Thumbnail label</h3> <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> </div> </div> </div> </div>', N'<span style=''float:right; margin-right:20px; z-index:1 !important;''><span id=''edit-Thumbnails'' class=''glyphicon glyphicon-pencil controlsedit'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#editModal'' style=''margin-left:5px;margin-right:5px;''></span><span id=''close-Thumbnails'' class=''glyphicon glyphicon-remove-circle controls'' style=''margin-left:5px;margin-right:5px;'' aria-hidden=''true''></span></span><div class="row"> <div class="col-sm-6 col-md-4"> <div class="thumbnail"> <img data-src="holder.js/100%x200" alt="100%x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjQyIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDI0MiAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MjAwCkNyZWF0ZWQgd2l0aCBIb2xkZXIuanMgMi42LjAuCkxlYXJuIG1vcmUgYXQgaHR0cDovL2hvbGRlcmpzLmNvbQooYykgMjAxMi0yMDE1IEl2YW4gTWFsb3BpbnNreSAtIGh0dHA6Ly9pbXNreS5jbwotLT48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhW0NEQVRBWyNob2xkZXJfMTU1ZTU4NGJlYjkgdGV4dCB7IGZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMnB0IH0gXV0+PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImhvbGRlcl8xNTVlNTg0YmViOSI+PHJlY3Qgd2lkdGg9IjI0MiIgaGVpZ2h0PSIyMDAiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSI4OS44NTkzNzUiIHk9IjEwNS4xIj4yNDJ4MjAwPC90ZXh0PjwvZz48L2c+PC9zdmc+" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;"> <div class="caption"> <h3>Thumbnail label</h3> <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> </div> </div> </div> <div class="col-sm-6 col-md-4"> <div class="thumbnail"> <img data-src="holder.js/100%x200" alt="100%x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjQyIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDI0MiAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MjAwCkNyZWF0ZWQgd2l0aCBIb2xkZXIuanMgMi42LjAuCkxlYXJuIG1vcmUgYXQgaHR0cDovL2hvbGRlcmpzLmNvbQooYykgMjAxMi0yMDE1IEl2YW4gTWFsb3BpbnNreSAtIGh0dHA6Ly9pbXNreS5jbwotLT48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhW0NEQVRBWyNob2xkZXJfMTU1ZTU4NGEyMTkgdGV4dCB7IGZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMnB0IH0gXV0+PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImhvbGRlcl8xNTVlNTg0YTIxOSI+PHJlY3Qgd2lkdGg9IjI0MiIgaGVpZ2h0PSIyMDAiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSI4OS44NTkzNzUiIHk9IjEwNS4xIj4yNDJ4MjAwPC90ZXh0PjwvZz48L2c+PC9zdmc+" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;"> <div class="caption"> <h3>Thumbnail label</h3> <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> </div> </div> </div> <div class="col-sm-6 col-md-4"> <div class="thumbnail"> <img data-src="holder.js/100%x200" alt="100%x200" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMjQyIiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDI0MiAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MjAwCkNyZWF0ZWQgd2l0aCBIb2xkZXIuanMgMi42LjAuCkxlYXJuIG1vcmUgYXQgaHR0cDovL2hvbGRlcmpzLmNvbQooYykgMjAxMi0yMDE1IEl2YW4gTWFsb3BpbnNreSAtIGh0dHA6Ly9pbXNreS5jbwotLT48ZGVmcz48c3R5bGUgdHlwZT0idGV4dC9jc3MiPjwhW0NEQVRBWyNob2xkZXJfMTU1ZTU4NDdjNzggdGV4dCB7IGZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMnB0IH0gXV0+PC9zdHlsZT48L2RlZnM+PGcgaWQ9ImhvbGRlcl8xNTVlNTg0N2M3OCI+PHJlY3Qgd2lkdGg9IjI0MiIgaGVpZ2h0PSIyMDAiIGZpbGw9IiNFRUVFRUUiLz48Zz48dGV4dCB4PSI4OS44NTkzNzUiIHk9IjEwNS4xIj4yNDJ4MjAwPC90ZXh0PjwvZz48L2c+PC9zdmc+" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;"> <div class="caption"> <h3>Thumbnail label</h3> <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p> <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> </div> </div> </div> </div>', NULL, N'~/Components/TextBank/TextBankAdmin.ascx', N'~/Components/TextBank/TextBankView.ascx')
INSERT [dbo].[Controls] ([id], [Name], [Category], [IconURL], [NormalMarkup], [OnEditMarkup], [OnSettingChangedMarkup], [AdminControlName], [DefautControlName]) VALUES (13, N'Slider', N'Dynamic', N'Slider.jpg', N'<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="./Content/Slider-1.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
      <img src="./Content/Slider-2.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    ...
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>', N'<span style=''float:right; margin-right:20px; z-index:1 !important;''><span id=''edit-Slider'' class=''glyphicon glyphicon-pencil controlsedit'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#editModal'' style=''margin-left:5px;margin-right:5px;''></span><span id=''close-Slider'' class=''glyphicon glyphicon-remove-circle controls'' style=''margin-left:5px;margin-right:5px;'' aria-hidden=''true''></span></span><div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="./Content/Slider-1.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    <div class="item">
      <img src="./Content/Slider-2.jpg" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    ...
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>', NULL, N'~/Components/News/FeatureNewsHomeAdmin.ascx', N'~/Components/News/FeatureNewsHome.ascx')
INSERT [dbo].[Controls] ([id], [Name], [Category], [IconURL], [NormalMarkup], [OnEditMarkup], [OnSettingChangedMarkup], [AdminControlName], [DefautControlName]) VALUES (14, N'Button Group', N'DreamControls', N'Button Group.JPG', N'<div class="btn-group" role="group" aria-label="...">
  <button type="button" class="btn btn-default">1</button>
  <button type="button" class="btn btn-default">2</button>

  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Dropdown
      <span class="caret"></span>
    </button>
    <ul class="dropdown-menu">
      <li><a href="#">Dropdown link</a></li>
      <li><a href="#">Dropdown link</a></li>
    </ul>
  </div>
</div>', N'<span style=''float:right; margin-right:20px; z-index:1 !important;''><span id=''edit-Button Group'' class=''glyphicon glyphicon-pencil controlsedit'' aria-hidden=''true'' data-toggle=''modal'' data-target=''#editModal'' style=''margin-left:5px;margin-right:5px;''></span><span id=''close-Button Group'' class=''glyphicon glyphicon-remove-circle controls'' style=''margin-left:5px;margin-right:5px;'' aria-hidden=''true''></span></span><div class="btn-group" role="group" aria-label="...">
  <button type="button" class="btn btn-default">1</button>
  <button type="button" class="btn btn-default">2</button>

  <div class="btn-group" role="group">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Dropdown
      <span class="caret"></span>
    </button>
    <ul class="dropdown-menu">
      <li><a href="#">Dropdown link</a></li>
      <li><a href="#">Dropdown link</a></li>
    </ul>
  </div>
</div>', NULL, N'~/Components/NAV_General/NavigationAdminSetting.ascx', N'~/Components/NAV_General/NavigationView.ascx')
INSERT [dbo].[Controls] ([id], [Name], [Category], [IconURL], [NormalMarkup], [OnEditMarkup], [OnSettingChangedMarkup], [AdminControlName], [DefautControlName]) VALUES (15, N'Pagination', N'Dynamic', N'Pagination.JPG', N'<nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>', N'<nav aria-label="Page navigation">
  <ul class="pagination">
    <li>
      <a href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li>
      <a href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>', N'<nav aria-label="Page navigation">   <ul class="pagination">     <li>       <a href="#" aria-label="Previous">         <span aria-hidden="true">&laquo;</span>       </a>     </li>     <li><a href="#">1</a></li>     <li><a href="#">2</a></li>     <li><a href="#">3</a></li>     <li><a href="#">4</a></li>     <li><a href="#">5</a></li>     <li>       <a href="#" aria-label="Next">         <span aria-hidden="true">&raquo;</span>       </a>     </li>   </ul> </nav>', N'Hi', N'Hi')
SET IDENTITY_INSERT [dbo].[Controls] OFF
/****** Object:  Table [dbo].[ControlCategory]    Script Date: 09/07/2016 09:22:56 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'734b7dd7-5c1e-4d17-a09f-f730a1f2f836', NULL, 0, N'AM3K9aXixepMaUqb+Nv/ZTFHJJ/Yg1dRTFczn9Kbi2Mo3Uk5TysoJoi2GTl8B7Vh3g==', N'2b3965be-c11b-4e53-bc97-f198d9531c2a', NULL, 0, 0, NULL, 0, 0, N'ali')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c15db4c0-af50-45f7-be19-ec57aabf949a', NULL, 0, N'AMlKD2V2tOD85oRMA14cldFAwwvfzEZ+ccopO1mt/FH3zoQ2DzjnbrxvJ294fIJf7g==', N'e9d66652-757c-4819-ba6a-817880c57d9b', NULL, 0, 0, NULL, 0, 0, N'rabia')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd1e30fbd-d40b-4a32-8cd5-1294df51c620', NULL, 0, N'ALhTckEyGHseiC4QWxu4Gsf17GCxGn7A1VW6RuCG+ivpBBmOvhQ4NJalDhsvqdCe4Q==', N'29fa48e3-4e74-41de-96d6-53e590ae3c77', NULL, 0, 0, NULL, 0, 0, N'jojo')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd5ba58f6-addd-4781-9a0f-5595ef5a4413', N'dreambirdapp@gmail.com', 0, N'ADLtsG36pLGHLZ7396RQ/CWlYcktmv2U6EAVcsuEj9B4crGpWc1A5AKm2Zd26D/xQw==', N'0fb5de13-604e-4008-a168-999d81cea5a5', NULL, 0, 0, NULL, 0, 0, N'jojo2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'e42107bf-0c2e-4f48-a720-ce64736cd393', NULL, 0, N'AF2e7WPM3dGvL833MLVTNXtcc5Y6t7lgN4gP92UIDtAwLdMECOtpgIq9cAMOnqN5Ag==', N'93876401-a105-4ae6-8863-5bc939379fb7', NULL, 0, 0, NULL, 0, 0, N'jojo1')
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 09/07/2016 09:22:56 ******/
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
/****** Object:  Table [dbo].[AdminsettingsNewsFeed]    Script Date: 09/07/2016 09:22:56 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 09/07/2016 09:22:56 ******/
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
/****** Object:  Table [dbo].[MediaCategories]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[MediaCategories] ([id], [CategoryName]) VALUES (10, N'GRE')
INSERT [dbo].[MediaCategories] ([id], [CategoryName]) VALUES (11, N'GMAT')
SET IDENTITY_INSERT [dbo].[MediaCategories] OFF
/****** Object:  Table [dbo].[DynamicLayouts]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (5, N'Layout 5', 1, 1, N'3:4:5')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (6, N'page2', 1, 1, N'1:2:3:5:1')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (7, N'New Layout', 1, 1, N'3:4:5/2:3:7')
INSERT [dbo].[DynamicLayouts] ([id], [Name], [Header], [Footer], [ContentRatio]) VALUES (8, N'Layout 9', 1, 1, N'6:6/12/4:4:4')
SET IDENTITY_INSERT [dbo].[DynamicLayouts] OFF
/****** Object:  Table [dbo].[DreamUserProfile]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[DreamUserProfile] ([id], [AspNetUserId], [Name], [Education], [DateOfBirth], [ProfilePicture], [IsActivated]) VALUES (6, N'12c7f563-1599-410b-8114-f0543a68de42', N'admin', N'Bachelors', CAST(0x0000A67900000000 AS DateTime), N'~/Components/DreamProfile/UserProfileImages/admin.jpg', 1)
SET IDENTITY_INSERT [dbo].[DreamUserProfile] OFF
/****** Object:  Table [dbo].[MediaItems]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (20, N'gre.jpg', N'/Components/MediaBank/Content/Images', 10, N'Image', CAST(0x0000A67900AA5DE2 AS DateTime))
INSERT [dbo].[MediaItems] ([id], [name], [path], [MediaCategory_id], [mediaType], [DateAdded]) VALUES (21, N'GMAT.jpg', N'/Components/MediaBank/Content/Images', 11, N'Image', CAST(0x0000A67900CD5DA6 AS DateTime))
SET IDENTITY_INSERT [dbo].[MediaItems] OFF
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 09/07/2016 09:22:56 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[AspNetUserLogins] ([LoginProvider], [ProviderKey], [UserId]) VALUES (N'Google', N'103934235597817229054', N'd5ba58f6-addd-4781-9a0f-5595ef5a4413')
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 09/07/2016 09:22:56 ******/
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
/****** Object:  Table [dbo].[DreamTags]    Script Date: 09/07/2016 09:22:56 ******/
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
/****** Object:  Table [dbo].[MediaTags]    Script Date: 09/07/2016 09:22:56 ******/
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
/****** Object:  Table [dbo].[VideoTranscript]    Script Date: 09/07/2016 09:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoTranscript](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MediaItem_id] [int] NULL,
	[TimeStamp] [decimal](18, 0) NULL,
	[Text] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dreams]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (1, N'Home', NULL, N'n', 1, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (25, N'GRE', 20, N'GRE Description', 1, 0)
INSERT [dbo].[Dreams] ([id], [DreamName], [MediaItem_id], [Description], [IsFeatured], [IsDefault]) VALUES (26, N'GMAT', 21, N'GMAT Description', 0, 0)
SET IDENTITY_INSERT [dbo].[Dreams] OFF
/****** Object:  Table [dbo].[DreamMessages]    Script Date: 09/07/2016 09:22:56 ******/
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
/****** Object:  Table [dbo].[News]    Script Date: 09/07/2016 09:22:56 ******/
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
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id]) VALUES (1, N'GRE News                                          ', N'GRE News Description', CAST(0xD43B0B00 AS Date), CAST(0xD53B0B00 AS Date), 1, 1, CAST(0xD43B0B00 AS Date), 0, 20)
INSERT [dbo].[News] ([id], [news_title], [news_description], [from_date], [to_date], [is_latest_news], [is_feature_news], [created_date], [is_main_news], [MediaItem_id]) VALUES (2, N'GMAT                                              ', N'GMAT news description', CAST(0xDE3B0B00 AS Date), CAST(0xDE3B0B00 AS Date), 1, 1, CAST(0xD43B0B00 AS Date), 1, 21)
SET IDENTITY_INSERT [dbo].[News] OFF
/****** Object:  Table [dbo].[Navigations]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (14, 20, 25, N'GRE Navigation', N'~/DreamHome/GRE/HomePage', 1, 0)
INSERT [dbo].[Navigations] ([id], [MediaItem_id], [Dream_id], [Caption], [Link], [IsPublished], [LinkType]) VALUES (15, 21, 25, N'GMAT Navigation', N'~/DreamHome/GMAT/HomePage', 1, 0)
SET IDENTITY_INSERT [dbo].[Navigations] OFF
/****** Object:  Table [dbo].[DreamUserLikes]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[DreamUserLikes] ([id], [DreamId], [AspNetUserId]) VALUES (28, 25, N'12c7f563-1599-410b-8114-f0543a68de42')
SET IDENTITY_INSERT [dbo].[DreamUserLikes] OFF
/****** Object:  Table [dbo].[DreamLayouts]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (10, N'hello', 1, N'Default', N'this is page1', 0, 0, 0)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (25, N'<%@ Register src = ''Components/Core/BaseDreamControl.ascx'' tagname = ''BaseDreamControl'' tagprefix = ''uc2'' %>    <div><div class="row"><div id="header-wrap" class="col-md-12 mainLayout" style="border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable-header" class="ui-sortable Temp1"><div class="ui-sortable-handle" admindreamcontrol="~/Components/Account/UserActivation.ascx" defaultcontrolname="~/Components/Account/UserActivation.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl1'' runat=''server'' DefaultControl=''~/Components/Account/UserActivation.ascx'' AdminSettingControl=''~/Components/Account/UserActivation.ascx'' /></div><div class="ui-sortable-handle" admindreamcontrol="~/Components/TextBank/TextBankAdmin.ascx" defaultcontrolname="~/Components/TextBank/TextBankView.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl2'' runat=''server'' DefaultControl=''~/Components/TextBank/TextBankView.ascx'' AdminSettingControl=''~/Components/TextBank/TextBankAdmin.ascx'' /></div></div></div></div><div class="row" style="margin:0;"><div class="row"><div class="col-md-3 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable2" class="ui-sortable Temp1"><div class="ui-sortable-handle" admindreamcontrol="~/Components/NAV_General/NavigationAdminSetting.ascx" defaultcontrolname="~/Components/NAV_General/NavigationView.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl3'' runat=''server'' DefaultControl=''~/Components/NAV_General/NavigationView.ascx'' AdminSettingControl=''~/Components/NAV_General/NavigationAdminSetting.ascx'' /></div></div></div><div class="col-md-9 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable3" class="ui-sortable Temp1"><div class="ui-sortable-handle" admindreamcontrol="~/Components/News/FeatureNewsHomeAdmin.ascx" defaultcontrolname="~/Components/News/FeatureNewsHome.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl5'' runat=''server'' DefaultControl=''~/Components/News/FeatureNewsHome.ascx'' AdminSettingControl=''~/Components/News/FeatureNewsHomeAdmin.ascx'' /></div></div></div></div></div><div class="row"><div class="col-md-12 mainLayout" id="footer-wrap" style="border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable-footer" class="ui-sortable Temp1"></div></div></div></div>', 25, N'HomePage', N'HomePage Description', 1, 1, 1)
INSERT [dbo].[DreamLayouts] ([id], [Layout], [DreamID], [Page], [Description], [NavEnable], [IsPublished], [IsDefaultPage]) VALUES (26, N'<%@ Register src = ''Components/Core/BaseDreamControl.ascx'' tagname = ''BaseDreamControl'' tagprefix = ''uc2'' %>  <div><div class="row"><div id="header-wrap" class="col-md-12 mainLayout" style="border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable-header" class="ui-sortable Temp1"><div class="ui-sortable-handle" admindreamcontrol="~/Components/DreamMessages/DreamMessageView.ascx" defaultcontrolname="~/Components/DreamMessages/DreamMessageView.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl1'' runat=''server'' DefaultControl=''~/Components/DreamMessages/DreamMessageView.ascx'' AdminSettingControl=''~/Components/DreamMessages/DreamMessageView.ascx'' /></div><div class="ui-sortable-handle" admindreamcontrol="~/Components/NAV_General/NavigationAdminSetting.ascx" defaultcontrolname="~/Components/NAV_General/NavigationView.ascx" style="display: block;"><uc2:BaseDreamControl ID=''BaseDreamControl2'' runat=''server'' DefaultControl=''~/Components/NAV_General/NavigationView.ascx'' AdminSettingControl=''~/Components/NAV_General/NavigationAdminSetting.ascx'' /></div></div></div></div><div class="row" style="margin:0;"><div class="row"><div class="col-md-3 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable2" class="ui-sortable Temp1"></div></div><div class="col-md-4 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable3" class="ui-sortable Temp1"></div></div><div class="col-md-5 mainLayout" style="padding-right: 0px; padding-left: 0px; border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable4" class="ui-sortable Temp1"></div></div></div></div><div class="row"><div class="col-md-12 mainLayout" id="footer-wrap" style="border: 1px solid rgb(193, 193, 193); background: rgb(246, 246, 246);"><div id="sortable-footer" class="ui-sortable Temp1"></div></div></div></div>', 26, N'HomePage', N'GMAT HomePage', 1, 1, 1)
SET IDENTITY_INSERT [dbo].[DreamLayouts] OFF
/****** Object:  Table [dbo].[NewsRelatedNews]    Script Date: 09/07/2016 09:22:56 ******/
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
SET IDENTITY_INSERT [dbo].[NewsRelatedNews] OFF
/****** Object:  Table [dbo].[NewsDreamNews]    Script Date: 09/07/2016 09:22:56 ******/
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
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (1, 2, 25)
INSERT [dbo].[NewsDreamNews] ([id], [news_id], [dream_id]) VALUES (2, 2, 26)
SET IDENTITY_INSERT [dbo].[NewsDreamNews] OFF
/****** Object:  Table [dbo].[TextBank]    Script Date: 09/07/2016 09:22:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextBank](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DreamID] [int] NULL,
	[PageID] [int] NULL,
	[ControlName] [nvarchar](200) NULL,
	[textdata] [nvarchar](max) NULL,
 CONSTRAINT [PK_TextBank] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TextBank] ON
INSERT [dbo].[TextBank] ([id], [DreamID], [PageID], [ControlName], [textdata]) VALUES (3, 25, 25, N'ctl06_BaseDreamControl1', N'<p>This is my textarea to be replaced Editor.</p>
')
INSERT [dbo].[TextBank] ([id], [DreamID], [PageID], [ControlName], [textdata]) VALUES (4, 25, 25, N'ctl06_BaseDreamControl2', N'<p>This is my textarea to be replaced Editor.</p>
')
SET IDENTITY_INSERT [dbo].[TextBank] OFF
/****** Object:  Default [DF_DreamLayouts_NavEnable]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_NavEnable]  DEFAULT ((0)) FOR [NavEnable]
GO
/****** Object:  Default [DF_DreamLayouts_IsPublished]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  CONSTRAINT [DF_DreamLayouts_IsPublished]  DEFAULT ((0)) FOR [IsPublished]
GO
/****** Object:  Default [DF__DreamLayo__IsDef__6D0D32F4]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamLayouts] ADD  DEFAULT ((0)) FOR [IsDefaultPage]
GO
/****** Object:  Default [DF_Dreams_IsFeatured]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsFeatured]  DEFAULT ((0)) FOR [IsFeatured]
GO
/****** Object:  Default [DF_Dreams_IsDefault]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[Dreams] ADD  CONSTRAINT [DF_Dreams_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
/****** Object:  Default [DF__DreamUser__IsAct__2E1BDC42]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamUserProfile] ADD  DEFAULT ((0)) FOR [IsActivated]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_DreamLayouts_Dreams]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamLayouts]  WITH CHECK ADD  CONSTRAINT [FK_DreamLayouts_Dreams] FOREIGN KEY([DreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamLayouts] CHECK CONSTRAINT [FK_DreamLayouts_Dreams]
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile] FOREIGN KEY([SenderId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile]
GO
/****** Object:  ForeignKey [FK_DreamMessages_DreamUserProfile1]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamMessages]  WITH CHECK ADD  CONSTRAINT [FK_DreamMessages_DreamUserProfile1] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[DreamUserProfile] ([id])
GO
ALTER TABLE [dbo].[DreamMessages] CHECK CONSTRAINT [FK_DreamMessages_DreamUserProfile1]
GO
/****** Object:  ForeignKey [FK_Dreams_MediaItems]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[Dreams]  WITH CHECK ADD  CONSTRAINT [FK_Dreams_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Dreams] CHECK CONSTRAINT [FK_Dreams_MediaItems]
GO
/****** Object:  ForeignKey [FK_Tag]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamTags]  WITH CHECK ADD  CONSTRAINT [FK_Tag] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DreamTags] CHECK CONSTRAINT [FK_Tag]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_AspNetUsers]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_DreamUserLikes_Dreams]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamUserLikes]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserLikes_Dreams] FOREIGN KEY([DreamId])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[DreamUserLikes] CHECK CONSTRAINT [FK_DreamUserLikes_Dreams]
GO
/****** Object:  ForeignKey [FK_DreamUserProfile_AspNetUsers]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[DreamUserProfile]  WITH CHECK ADD  CONSTRAINT [FK_DreamUserProfile_AspNetUsers] FOREIGN KEY([AspNetUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DreamUserProfile] CHECK CONSTRAINT [FK_DreamUserProfile_AspNetUsers]
GO
/****** Object:  ForeignKey [FK_MediaItems_MediaCategories]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[MediaItems]  WITH CHECK ADD  CONSTRAINT [FK_MediaItems_MediaCategories] FOREIGN KEY([MediaCategory_id])
REFERENCES [dbo].[MediaCategories] ([id])
GO
ALTER TABLE [dbo].[MediaItems] CHECK CONSTRAINT [FK_MediaItems_MediaCategories]
GO
/****** Object:  ForeignKey [FK_MediaTags_MediaItems]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_MediaItems]
GO
/****** Object:  ForeignKey [FK_MediaTags_Tags]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[MediaTags]  WITH CHECK ADD  CONSTRAINT [FK_MediaTags_Tags] FOREIGN KEY([Tag_id])
REFERENCES [dbo].[Tags] ([id])
GO
ALTER TABLE [dbo].[MediaTags] CHECK CONSTRAINT [FK_MediaTags_Tags]
GO
/****** Object:  ForeignKey [FK_Navigations_Dreams]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_Dreams] FOREIGN KEY([Dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_Dreams]
GO
/****** Object:  ForeignKey [FK_Navigations_MediaItems]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[Navigations]  WITH CHECK ADD  CONSTRAINT [FK_Navigations_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[Navigations] CHECK CONSTRAINT [FK_Navigations_MediaItems]
GO
/****** Object:  ForeignKey [FK_News_MediaItems]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[News]  WITH CHECK ADD  CONSTRAINT [FK_News_MediaItems] FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
ALTER TABLE [dbo].[News] CHECK CONSTRAINT [FK_News_MediaItems]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_Dreams]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_Dreams] FOREIGN KEY([dream_id])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_Dreams]
GO
/****** Object:  ForeignKey [FK_NewsDreamNews_News1]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[NewsDreamNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsDreamNews_News1] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsDreamNews] CHECK CONSTRAINT [FK_NewsDreamNews_News1]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News] FOREIGN KEY([related_news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News]
GO
/****** Object:  ForeignKey [FK_NewsRelatedNews_News1]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[NewsRelatedNews]  WITH CHECK ADD  CONSTRAINT [FK_NewsRelatedNews_News1] FOREIGN KEY([news_id])
REFERENCES [dbo].[News] ([id])
GO
ALTER TABLE [dbo].[NewsRelatedNews] CHECK CONSTRAINT [FK_NewsRelatedNews_News1]
GO
/****** Object:  ForeignKey [FK_TextBank_DreamLayouts]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[TextBank]  WITH CHECK ADD  CONSTRAINT [FK_TextBank_DreamLayouts] FOREIGN KEY([PageID])
REFERENCES [dbo].[DreamLayouts] ([id])
GO
ALTER TABLE [dbo].[TextBank] CHECK CONSTRAINT [FK_TextBank_DreamLayouts]
GO
/****** Object:  ForeignKey [FK_TextBank_Dreams]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[TextBank]  WITH CHECK ADD  CONSTRAINT [FK_TextBank_Dreams] FOREIGN KEY([DreamID])
REFERENCES [dbo].[Dreams] ([id])
GO
ALTER TABLE [dbo].[TextBank] CHECK CONSTRAINT [FK_TextBank_Dreams]
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__4D94879B]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__5812160E]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__6E01572D]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__6EF57B66]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
/****** Object:  ForeignKey [FK__VideoTran__Media__6FE99F9F]    Script Date: 09/07/2016 09:22:56 ******/
ALTER TABLE [dbo].[VideoTranscript]  WITH CHECK ADD FOREIGN KEY([MediaItem_id])
REFERENCES [dbo].[MediaItems] ([id])
GO
