<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Mypage.aspx.cs" Inherits="Mypage" %>

<%@ Register Src="~/Components/Dreams/DreamView.ascx" TagPrefix="uc1" TagName="DreamView" %>
<%@ Register Src="~/Components/Dreams/DreamSearch.ascx" TagPrefix="uc1" TagName="DreamSearch" %>
<%@ Register Src="~/Components/TopNav/TopNavAnonymous.ascx" TagPrefix="uc1" TagName="TopNavAnonymous" %>
<%--<%@ Register Src="~/Components/TopNav/Header.ascx" TagPrefix="uc1" TagName="Header" %>--%>
<%@ Register Src="~/Components/Dreams/FeatureDreams.ascx" TagPrefix="uc1" TagName="FeatureDreams" %>
<%@ Register Src="~/Components/Account/RegisterEmail.ascx" TagPrefix="uc1" TagName="RegisterEmail" %>
<%@ Register Src="~/Components/Footer/FooterControl.ascx" TagPrefix="uc1" TagName="FooterControl" %>
<%@ Register Src="~/Components/News/NewControls/GeneralNewsView.ascx" TagPrefix="uc1" TagName="GeneralNewsView" %>
<%@ Register Src="~/Components/Header/SearchWithHeader.ascx" TagPrefix="uc1" TagName="SearchWithHeader" %>
<%@ Register Src="~/Components/Core/BaseDreamControl.ascx" TagPrefix="uc1" TagName="BaseDreamControl" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/AccommodationsMakkah.ascx" TagPrefix="uc1" TagName="AccommodationsMakkah" %>

<%--<%@ Register Src="~/Components/Dreams/RecentDreams.ascx" TagPrefix="uc1" TagName="RecentDreams" %>


<uc1:AccommodationsMakkah runat="server" id="AccommodationsMakkah" />



<uc1:RecentDreams runat="server" ID="RecentDreams" />--%>




<!DOCTYPE html>
<html>
<head>
    <title></title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="Content/css/bootstrap.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="Content/css/bootstrap-theme.css">
    <%--<link rel="stylesheet" href="css/style.css">--%>
    <link href="Content/css/style.css" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="Content/js/bootstrap.js"></script>
    <script type="text/javascript" src="Content/js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server" style="height:100%">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <%--<uc1:TopNavAnonymous runat="server" ID="TopNavAnonymous" />--%>
        <uc1:BaseDreamControl runat="server" ID="BaseDreamControl2"  DefaultControl="~/Components/TopNav/TopNavAnonymous.ascx" AdminSettingControl="~/Components/TopNav/TopNavAnonymous.ascx"/>
        <%--<uc1:Header runat="server" ID="Header" />--%>
        <%--<uc1:SearchWithHeader runat="server" id="SearchWithHeader" />--%>
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

    </form>
</body>
</html>
 
