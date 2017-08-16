<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="NormalPageLayout.aspx.cs" Inherits="Components_Dreams_NormalPageLayout" %>

<%@ Register Src="~/Components/PageTemplate/ControlsList.ascx" TagPrefix="uc1" TagName="ControlsList" %>
<%@ Register Src="~/Components/PageTemplate/CSSStyler.ascx" TagPrefix="uc1" TagName="CSSStyler" %>
<%@ Register Src="~/Components/PageTemplate/PageTemplate.ascx" TagPrefix="uc1" TagName="PageTemplate" %>
<%@ Register Src="~/Components/Dreams/DreamPageBasicInfo.ascx" TagPrefix="uc1" TagName="DreamPageBasicInfo" %>
<%@ Register Src="~/Components/PageTemplate/DreamsandPages.ascx" TagPrefix="uc1" TagName="DreamsandPages" %>






<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-ui.js"></script>
    <%--<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>--%>
    <link href="<%# Server.MapPath("~/") %>/Content/css/jquery-ui.css" rel="stylesheet" />
    <%--<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>--%>
    <uc1:DreamPageBasicInfo runat="server" ID="DreamPageBasicInfo" />
    <div class="col-md-9" style="background-color: #e6e6e6; height: 430px;">
        <uc1:PageTemplate runat="server" ID="PageTemplate1" />
    </div>

    <div class="col-md-3" style="padding: 0;">
        <div class="col-md-12">
            <div class="col-md-4" style="float: right">
                <a class="btn btn-default" id="activate_modal">
                    <span class="glyphicon glyphicon-resize-full" aria-hidden="true"></span>
                </a>
            </div>
        </div>
        <div class="col-md-12" id="ipage_frame" style="padding: 0;">
            <iframe name="page_frame" class="LessonMenu_PageFrame" width="100%" height="400px" frameborder="0" style="overflow: hidden; display: block;" scrolling="yes" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
        </div>
    </div>
    <%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
    <iframe name="modal_frame" class="LessonMenu_PageFrame"  width="100%"   frameborder="0" style="overflow:hidden; display:block; " scrolling="yes" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
       <%--<div id="modal_div"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>--%>
    <div class="modal" id="import_pages" tabindex="-1" aria-labelledby="import_pagesLabel" data-focus-on="input:first">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Import Dream Pages</h4>
                </div>
                <div class="modal-body" style="display: -webkit-box">
                    <uc1:DreamsandPages runat="server" ID="DreamsandPages" />
                </div>
                <div class="modal-footer">

                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="editCSS" tabindex="-1" aria-labelledby="controlsListLabel" data-focus-on="input:first">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="editCSSLabel">Edit CSS Properties</h4>
                </div>
                <div class="modal-body">
                    <uc1:CSSStyler runat="server" ID="CSSStyler" />
                </div>
                <div class="modal-footer">
                    <div class="col-md-3">
                        <button type="button" class="btn btn-primary" id="save-style">Save Changes</button>
                    </div>
                    <div class="col-md-3">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="controlsList" tabindex="-1" aria-labelledby="controlsListLabel" data-focus-on="input:first">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="controlsListLabel">Controls</h4>
                </div>
                <div class="modal-body" style="display: -webkit-box;">
                    <uc1:ControlsList runat="server" ID="ControlsList1" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

