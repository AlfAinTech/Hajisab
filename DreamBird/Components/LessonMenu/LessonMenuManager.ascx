<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonMenuManager.ascx.cs" Inherits="Components_LessonMenu_LessonMenuManager" %>
<%@ Register Src="~/Components/LessonMenu/LessonMenuMarkup.ascx" TagPrefix="uc1" TagName="LessonMenuMarkup" %>
<%@ Register Src="~/Components/LessonMenu/Next_Previous.ascx" TagPrefix="uc1" TagName="Next_Previous" %>
<script src="<%# Server.MapPath("~/") %>/Components/LessonMenu/Content/js/myScripts.js"></script>

<script>
    $(document).on('click', '#toggle', function (e) {
        calcHeight();
        e.preventDefault();
        $(this).toggleClass("on");
        $("#wrapper").toggleClass("toggled");
        calcHeight();
        //$('#page_frame').iframeAutoHeight();
    });
</script>
<meta charset="utf-8" />
<div class="col-md-12">
    <div class="row">
        <div class="breadcrumb" id="notification_panel">

        </div>
    </div>
</div>
<div class="col-md-12">
    <div class="row">
        <div class="col-md-10">
            <div class="row">
                <a href="#menu-toggle" id="toggle"><span></span></a>
                 <div id="wrapper">
                    <div id="sidebar-wrapper">
                        <input id="hiddenAccordin" type="hidden" value="not set" />
                        <div class="sidebar-nav navbar-fixed-side" style="padding-left: 0px; z-index: 100000; overflow-y: auto; max-height: 450px;">
                            <%--     nav nav-list accordion--%>
                            <ul class="nav" id="sidenav_accordian" role="navlist">
                                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                            </ul>
                        </div>
                    </div>
                    <div id="page-content-wrapper">
                        <div class="container-fluid">
                           <div id="Frame" class="iframe" runat="server" style="width: 100%">
                                <div class="loading" align="center">
                                    Loading. Please wait.<br />
                                    <br />
                                    <img src="../../Content/img/loader.gif" alt="" />
                                </div>
                                   <iframe  id="page_frame" class="LessonMenu_PageFrame"  width="100%"   frameborder="0" style="overflow:hidden; display:block; " scrolling="no" " onLoad="calcHeight();" height="1px" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true">
                                    </iframe>
                                    <uc1:Next_Previous runat="server" ID="Next_Previous" />
                            </div>
                        </div>
                    </div>
                    <!-- /#page-content-wrapper -->
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="row" id="bot_area">

            </div>
        </div>
    </div>
</div>

