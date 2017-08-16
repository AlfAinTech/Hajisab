<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LessonVideoAdminPage.aspx.cs" Inherits="LessonVideoAdminPage" %>

<%@ Register Src="~/Components/LessonBank/Lesson/LessonVideoAdmin.ascx" TagPrefix="uc1" TagName="LessonVideoAdmin" %>
<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc1" TagName="MediaBankControl" %>



<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Admin/Content/css/bootstrap.css" rel="stylesheet" />
    <!-- Optional theme -->
    <link href="Admin/Content/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="Admin/Content/css/style.css" rel="stylesheet" />
	<script src="../Admin/Content/js/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="../Admin/Content/js/bootstrap.min.js"></script>
    <script src="../Admin/Content/js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
</head>
<body>
     <form id="form2" runat="server">
        
            
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        
        <uc1:LessonVideoAdmin runat="server" ID="LessonVideoAdmin" />
        <%--<uc1:MediaBankControl runat="server" ID="MediaBankControl" />--%>
        <%--<uc1:LessonVideoAdmin runat="server" ID="LessonVideoAdmin" />--%>
                  


    
    </form>
</body>
</html>
