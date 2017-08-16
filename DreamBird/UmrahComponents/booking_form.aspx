<%@ Page Language="C#" AutoEventWireup="true" CodeFile="booking_form.aspx.cs" Inherits="UmrahComponents_booking_form" %>
<%@ Register Src="~/UmrahComponents/headerFooter/Packageheader.ascx" TagPrefix="uc1" TagName="Packageheader" %>
<%@ Register Src="~/UmrahComponents/headerFooter/PackageFooter.ascx" TagPrefix="uc1" TagName="PackageFooter" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/BookingForm.ascx" TagPrefix="uc1" TagName="BookingForm" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/PackagediscountDetail.ascx" TagPrefix="uc1" TagName="PackagediscountDetail" %>






<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
	<meta charset="utf-8" />

 <link href="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/css/bootstrap.css" rel="stylesheet" />
    <!-- Optional theme -->
    <link href="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/css/style_packageDetail.css" rel="stylesheet" />
     <link rel="stylesheet" href="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/css/jquery-ui.css"/>
        <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
	<%--<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-3.1.0.js"></script>--%>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/js/bootstrap.js"></script>
    <%--<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/myScript.js"></script>--%>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />

     <script src="<%# Server.MapPath("~/") %>/UmrahComponents/Contents/js/jquery.carouFredSel-6.1.0-packed.js" type="text/javascript"></script>
   
     
  
  
    </head>
    <body>
         <form id="form1" runat="server" style="height:100%">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <uc1:Packageheader runat="server" ID="Packageheader" />
        <div class="slider_wrapper_search">
                <div class="package_title_detail">
                    <h2>
                        <asp:Label ID="package_name" runat="server">Economy Umra Package</asp:Label></h2>
                </div>
            </div>
       <div class="content_wrapper">
    <div class="container"><div class="col-md-9">
        <uc1:BookingForm runat="server" ID="BookingForm" />
    </div>
        <div class="col-md-3">
            <uc1:PackagediscountDetail runat="server" ID="PackagediscountDetail" />
        </div>
        </div></div>
             <uc1:PackageFooter runat="server" ID="PackageFooter" />
             </form></body></html>

