<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LayoutBuilder.ascx.cs" Inherits="Components_PageTemplate_LayoutBuilder" %>
<%@ Register Src="~/Components/PageTemplate/ControlsList.ascx" TagPrefix="uc1" TagName="ControlsList" %>
<%@ Register Src="~/Components/PageTemplate/CSSStyler.ascx" TagPrefix="uc1" TagName="CSSStyler" %>
<%@ Register Src="~/Components/PageTemplate/ColumnsList.ascx" TagPrefix="uc1" TagName="ColumnsList" %>


<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-ui.js"></script>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/PageTemplate/Content/js/myScript.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="col-md-12">
            <h3>Layout Builder</h3>
            <div class="col-md-12" id="controls-pan" style="background-color:#f6f6f6;">
                
                    <div id="columns">
                        <h4>Drag Columns in the Content Area</h4>
                        <uc1:ColumnsList runat="server" ID="ColumnsList" />
                    </div>
                 
            </div>
            <div class="col-md-2" style="margin-top:20px;">
                <button class="btn btn-default" id="clear_content"><h4 style="margin:0;">Clear</h4></button>
            </div>
            
            <div class="col-md-2" style="margin-top:20px; float:right;">
                <button class="btn btn-primary" style="float:right;" id="save_layout"><h4 style="margin:0;">Save</h4></button>
            </div>
            <div class="col-md-3" style="float:right; margin-top:20px;">
                <input type="text" class="form-control" id="layout_name" runat="server" ClientIDMode="static" placeholder="Layout Name" onkeydown = "return (event.keyCode!=13);" />
            </div>
    		<div class="col-md-12 sortable" id="working_area" runat="server" ClientIDMode="static" style="padding:20px; margin-top: 20px; max-height:200px; min-height:150px; background-color:#f6f6f6; overflow-y:auto; display:block;">

    		</div>
    	</div>
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
    </ContentTemplate>
</asp:UpdatePanel>  