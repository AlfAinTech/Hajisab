<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News_Details.aspx.cs" Inherits="News_Details" %>

<%@ Register Src="~/Components/News/NewsDetail.ascx" TagPrefix="uc1" TagName="NewsDetail" %>
<%@ Register Src="~/Components/DragDropFramework/DDFramework.ascx" TagPrefix="uc1" TagName="DDFramework" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:DDFramework runat="server" ID="DDFramework" />
    </div>
    </form>
</body>
</html>
