<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" %>

<%@ Register Src="~/Components/UserDashBoard/RegisteredDreamsList.ascx" TagPrefix="uc1" TagName="RegisteredDreamsList" %>
<%@ Register Src="~/Components/UserDashBoard/WhatToDoNext_list.ascx" TagPrefix="uc1" TagName="WhatToDoNext_list" %>
<%@ Register Src="~/Components/TopNav/TopNavAnonymous.ascx" TagPrefix="uc1" TagName="TopNavAnonymous" %>
<%@ Register Src="~/Components/Footer/FooterControl.ascx" TagPrefix="uc1" TagName="FooterControl" %>
<%@ Register Src="~/Components/UserDashBoard/OverDueTask.ascx" TagPrefix="uc1" TagName="OverDueTask" %>
<%@ Register Src="~/Components/DreamProfile/DreamProfileView.ascx" TagPrefix="uc1" TagName="DreamProfileView" %>
<%@ Register Src="~/Components/Account/UserActivation.ascx" TagPrefix="uc1" TagName="UserActivation" %>
<%@ Register Src="~/Components/Dreams/RelatedDreams.ascx" TagPrefix="uc1" TagName="RelatedDreams" %>














<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Optional theme -->
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/css/bootstrap-theme.css") %>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/css/bootstrap.css")%>" />
    <link rel="stylesheet" href="<%=ResolveUrl("~/Content/css/style.css") %>" />
    <%--<script src="https://code.jquery.com/jquery-3.1.0.js"></script>--%>
    <script src="../../Content/js/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="<%=ResolveUrl("~/Content/js/bootstrap.js")%>"></script>
    <script type="text/javascript" src="<%=ResolveUrl("~/Content/js/myScript.js") %>"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <script src="<%= ResolveUrl("~/Content/js/jquery.diyslider.min.js") %>"></script>
    <link href="<%= ResolveUrl("~/Content/themes/sidenav.css") %>" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Content/css/circle.css")%>" rel="stylesheet" />
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

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <uc1:TopNavAnonymous runat="server" ID="TopNavAnonymous" />
        <div class="row">
            <div class="col-md-12">
                <uc1:UserActivation runat="server" ID="UserActivation" />
            </div>
        </div>
        <div class="content_wrapper">


            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-3" style="padding:0;">
                        <div class="col-md-12" style="margin-top: 15px; padding:0;">
                            <uc1:WhatToDoNext_list runat="server" ID="WhatToDoNext_list" />
                        </div>

                        <div class="col-md-12" style="padding:0;">
                            <uc1:OverDueTask runat="server" ID="OverDueTask" />
                        </div>

                    </div>
                    <div class="col-md-7">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="home">
                                <div class="row">
                                    
                                        <uc1:RegisteredDreamsList runat="server" ID="RegisteredDreamsList" />
                                        <div class="col-md-12">
                                            <uc1:RelatedDreams runat="server" ID="RelatedDreams" />
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2" style="padding:0;">
                        <div class="col-md-12" style="padding:0; margin-top:15px;">
                            <uc1:DreamProfileView runat="server" ID="DreamProfileView" />
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <footer>
            <uc1:FooterControl runat="server" ID="FooterControl" />
        </footer>
    </form>
</body>
</html>
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
