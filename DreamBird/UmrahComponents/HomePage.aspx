<%@ Page Language="C#" AutoEventWireup="true"  EnableEventValidation="false" CodeFile="HomePage.aspx.cs" Inherits="UmrahComponents_HomePage" %>

<%@ Register Src="~/UmrahComponents/PackageComponent/PackageListView.ascx" TagPrefix="uc1" TagName="PackageListView" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/PackageCustomSearch.ascx" TagPrefix="uc1" TagName="PackageCustomSearch" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/PackagePageDetail.ascx" TagPrefix="uc1" TagName="PackagePageDetail" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx" TagPrefix="uc1" TagName="PackagediscountDetail" %>








<!DOCTYPE html>
<html>
<head>
    <title></title>
	<meta charset="utf-8" />



     
 <link href="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/css/bootstrap.css" rel="stylesheet" />
    <!-- Optional theme -->
    <link href="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/css/style_packageDetail.css" rel="stylesheet" />
     <link rel="stylesheet" href="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/css/jquery-ui.css"/>
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/js/bootstrap.js"></script>
     <script src="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" /> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    </head>
    <body>
         <form id="form1" runat="server" style="height:100%">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:PackageCustomSearch runat="server" ID="PackageCustomSearch" />
        <div class="featured_package_wrapper">
        <div class="container"> 
             <uc1:PackageListView runat="server" ID="PackageListView" />
            </div>
            </div>
        </div>
             </form></body></html>

