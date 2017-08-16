<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsDetail.aspx.cs" Inherits="Components_News_NewsDetail" %>

<%@ Register Src="~/Components/News/NewsFeed.ascx" TagPrefix="uc1" TagName="NewsFeed" %>
<%@ Register Src="~/Components/News/FeatureNewsHome.ascx" TagPrefix="uc1" TagName="FeatureNewsHome" %>
<%@ Register Src="~/Components/News/FeatureNewsHomeAdmin.ascx" TagPrefix="uc1" TagName="FeatureNewsHomeAdmin" %>
<%@ Register Src="~/Components/News/AddNewsRelatedNews.ascx" TagPrefix="uc1" TagName="AddNewsRelatedNews" %>
<%@ Register Src="~/Components/News/AddNews.ascx" TagPrefix="uc1" TagName="AddNews" %>
<%@ Register Src="~/Components/News/AddNewsDream.ascx" TagPrefix="uc1" TagName="AddNewsDream" %>
<%@ Register Src="~/Components/News/NewsDetail.ascx" TagPrefix="uc1" TagName="NewsDetail" %>
<%@ Register Src="~/Components/News/MainNews.ascx" TagPrefix="uc1" TagName="MainNews" %>
<%@ Register Src="~/Components/News/NewsListText.ascx" TagPrefix="uc1" TagName="NewsListText" %>
<%@ Register Src="~/Components/News/MainNewsAdmin.ascx" TagPrefix="uc1" TagName="MainNewsAdmin" %>











<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <uc1:MainNewsAdmin runat="server" ID="MainNewsAdmin" />
    </div>
    </form>
</body>
</html>
