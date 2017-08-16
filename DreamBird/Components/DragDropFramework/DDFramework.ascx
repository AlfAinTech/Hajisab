<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DDFramework.ascx.cs" Inherits="Components_DragDropFramework_DDFramework" %>
<%@ Register Src="~/Components/DragDropFramework/toolbar_control.ascx" TagPrefix="uc1" TagName="toolbar_control" %>
<%@ Register Src="~/Components/DragDropFramework/modals_control.ascx" TagPrefix="uc1" TagName="modals_control" %>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
     <script   src="https://code.jquery.com/jquery-2.2.4.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <link href="<%# Server.MapPath("~/") %>/Components/DragDropFramework/Content/bootstrap-switch.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link href="<%# Server.MapPath("~/") %>/Components/DragDropFramework/Content/Site.css" rel="stylesheet" />
    <script src="<%# Server.MapPath("~/") %>/Components/DragDropFramework/Content/bootstrap-switch.js"></script>
    <script src="<%# Server.MapPath("~/") %>/Components/DragDropFramework/Content/MyCode.js"></script>
<div class="row">
    <uc1:toolbar_control runat="server" ID="toolbar_control" />
    <uc1:modals_control runat="server" id="modals_control" />
        <%--<div class="row">--%>
      
        <div id="PageNavigation"></div>
    
        </div>
        </div>