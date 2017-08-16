<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LessonMenuPage.aspx.cs" Inherits="LessonMenuPage" %>

<%@ Register Src="~/Components/LessonMenu/LessonMenuAdmin.ascx" TagPrefix="uc1" TagName="LessonMenuAdmin" %>

<%@ Register Src="~/Components/LessonMenu/LessonMenuList.ascx" TagPrefix="uc1" TagName="LessonMenuList" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <title></title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="../../Content/css/bootstrap.css"/>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
        <script src="../../Content/js/jquery.diyslider.min.js"></script>
    <!-- Optional theme -->
    <link rel="stylesheet" href="../../Content/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="../../Content/css/style.css"/>
	<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="../../Content/js/bootstrap.js"></script>
    <script type="text/javascript" src="../../Content/js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>
    <script type="text/javascript">
    	jQuery(document).ready(function($){
    		$("[data-toggle='toggle']").click(function() {
			    var selector = $(this).data("target");
			    $(selector).toggleClass('in');
			});
			$('#hint').click(function(){
				$('#freq').css('background-color', '#c1b527');
			});
    	});
    </script>
</head>
<%--<head runat="server">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

    <title></title>
</head>--%>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div>
        <uc1:LessonMenuAdmin runat="server" ID="LessonMenuAdmin" />
    </div>
      



    </form>
</body>
</html>
