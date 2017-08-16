<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Template.aspx.cs" Inherits="Components_PageTemplate_Template" %>

<%@ Register Src="~/Components/PageTemplate/ControlsList.ascx" TagPrefix="uc1" TagName="ControlsList" %>
<%@ Register Src="~/Components/PageTemplate/CSSStyler.ascx" TagPrefix="uc1" TagName="CSSStyler" %>
<%@ Register Src="~/Components/PageTemplate/PageTemplate.ascx" TagPrefix="uc1" TagName="PageTemplate" %>
<%@ Register Src="~/Components/PageTemplate/DreamsandPages.ascx" TagPrefix="uc1" TagName="DreamsandPages" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="<%# Server.MapPath("~/") %>/Admin/Content/css/bootstrap.css" rel="stylesheet" />
    <!-- Optional theme -->
    <link href="<%# Server.MapPath("~/") %>/Admin/Content/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="<%# Server.MapPath("~/") %>/Admin/Content/css/style.css" rel="stylesheet" />
    <link href="<%# Server.MapPath("~/") %>/Admin/Content/css/jquery-ui.css" rel="stylesheet" />
	<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="<%# Server.MapPath("~/") %>/Admin/Content/js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="col-md-12">
           <%-- <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank"><h3><asp:Label ID="heading" runat="server"></asp:Label></h3></asp:HyperLink>--%>
                                            <uc1:PageTemplate runat="server" ID="PageTemplate1" />
                                        
                    <div class="modal fade" id="editCSS" tabindex="-1" aria-labelledby="controlsListLabel" data-focus-on="input:first">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="editCSSLabel">Edit CSS Properties</h4>
                                </div>
                                <div class="modal-body" style="display: -webkit-box;">
                                    <uc1:CSSStyler runat="server" ID="CSSStyler" />
                                </div>
                                <div class="modal-footer">
                                    <div class="col-md-3"><button type="button" class="btn btn-primary" id="save-style" >Save Changes</button></div>
                                    <div class="col-md-3"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>
                                    
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
    </div>
    </form>
</body>
</html>
