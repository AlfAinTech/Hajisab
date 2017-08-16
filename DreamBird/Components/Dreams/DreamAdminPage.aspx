<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DreamAdminPage.aspx.cs" Inherits="Components_Dreams_DreamAdminPage" %>
<%@ Register Src="~/Components/Dreams/DreamListView.ascx" TagPrefix="uc1" TagName="DreamListView" %>

<%@ Register Src="~/Components/Dreams/DreamBasicInfo.ascx" TagPrefix="uc1" TagName="DreamBasicInfo" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width:20%;float:left;display:inline">
        <uc1:DreamListView runat="server" id="DreamListView"  OnAddClicked="dreamAdd_clicked" OndreamClicked="dream_clicked" />
    </div>
        <div   style="width:80%;float:right;display:inline">
                <uc1:DreamBasicInfo runat="server" ID="DreamBasicInfo" />
    </div>
        
    </form>
</body>
</html>
