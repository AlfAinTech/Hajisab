<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lessontest.aspx.cs" Inherits="Components_LessonMenu_lessontest" %>

<%@ Register Src="~/Components/LessonMenu/LessonMenuManager.ascx" TagPrefix="uc1" TagName="LessonMenuManager" %>
<%@ Register Src="~/Components/LessonMenu/LessonMenuMarkup.ascx" TagPrefix="uc1" TagName="LessonMenuMarkup" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <uc1:LessonMenuManager runat="server" id="LessonMenuManager" />
       <%-- <uc1:LessonMenuMarkup runat="server" ID="LessonMenuMarkup" />--%>
    </div>
    </form>
</body>
</html>
