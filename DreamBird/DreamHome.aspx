<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DreamHome.aspx.cs" Inherits="DreamHome" ValidateRequest="false" %>

<%@ Register Src="~/Components/DreamProfile/DreamProfileView.ascx" TagPrefix="uc1" TagName="DreamProfileView" %>
<%@ Register Src="~/Components/DreamMessages/DreamMessageView.ascx" TagPrefix="uc1" TagName="DreamMessageView" %>
<%@ Register Src="~/Components/Account/UserActivation.ascx" TagPrefix="uc1" TagName="UserActivation" %>

<%@ Register Src="Components/Core/BaseDreamControl.ascx" TagName="BaseDreamControl" TagPrefix="uc2" %>
<%@ Register Src="~/Components/TopNav/TopNavigationBar.ascx" TagPrefix="uc1" TagName="TopNavigationBar" %>
<%@ Register Src="~/Components/Core/BaseDreamControl.ascx" TagPrefix="uc1" TagName="BaseDreamControl" %>
<%@ Register Src="~/Components/Core/HomeControl.ascx" TagPrefix="uc1" TagName="HomeControl" %>



<%--<%@ Register Src="~/Components/LessonMenu/LessonMenuManager.ascx" TagPrefix="uc1" TagName="LessonMenuManager" %>--%>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Old Header files-->
    <%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
   
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
     <script   src="https://code.jquery.com/jquery-2.2.4.js"></script>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="<%# Server.MapPath("~/") %>/Components/DragDropFramework/Content/bootstrap-switch.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="Scripts/jquery_color.js"></script>--%>
    <!-- Old Header files end-->


    <title></title>
    <meta charset="utf-8" />

    <!-- Optional theme -->
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/css/bootstrap-theme.css") %>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/css/bootstrap.css")%>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/css/style.css") %>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/css/circle.css") %>" />
    <%--<script src="https://code.jquery.com/jquery-3.1.0.js"></script>--%>
    <script src="../../Content/js/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="<%=ResolveUrl("~/Content/js/bootstrap.js")%>"></script>
    <script src="<%# Server.MapPath("~/") %>/Content/js/OpenAjaxUnmanagedHub.js"></script>
<script src="<%# Server.MapPath("~/") %>/Content/js/jquery.hub.js"></script>
    <script type="text/javascript" src="<%=ResolveUrl("~/Content/js/myScript.js") %>"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <script src="<%= ResolveUrl("~/Content/js/jquery.diyslider.min.js") %>"></script>
    <link href="<%= ResolveUrl("~/Content/themes/sidenav.css") %>" rel="stylesheet" />
    <link href="Content/css/circle.css" rel="stylesheet" />
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $("[data-toggle='toggle']").click(function () {
                var selector = $(this).data("target");
                $(selector).toggleClass('in');
            });
            $('#hint').click(function () {
                $('#freq').css('background-color', '#c1b527');
            });
        });
    </script>
    <script src="<%=ResolveUrl("~/Content/js/googleAnalyticsScript.js")%>"></script>
</head>
<body>
    <form id="form1" runat="server">


        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <%--<div class="row"><uc1:TopNavigationBar runat="server" id="TopNavigationBar" /></div>--%>

        <%--  <div class="row"><asp:PlaceHolder ID="placeHolderDragDrop" runat="server"></asp:PlaceHolder>  </div>--%>



       

                <div class="col-md-12">
                    <div id="body_content" class="row" runat="server">
                        <uc1:HomeControl runat="server" ID="HomeControl" />
                    </div>
                </div>

                <%--<uc1:UserActivation runat="server" id="UserActivation" /> --%>
                <%--<uc1:DreamProfileView runat="server" ID="DreamProfileView" />--%>
                <%--<uc1:DreamMessageView runat="server" ID="DreamMessageView" />--%>
                <%--<uc2:BaseDreamControl ID="BaseDreamControl1" runat="server" DefaultControl="~/Components/Dreams/DreamView.ascx" AdminSettingControl="~/Components/dreams/DreamAdminSetting.ascx" />--%>

                <%--<uc1:LessonMenuManager runat="server" ID="LessonMenuManager" />--%>
       





    </form>
</body>
</html>
