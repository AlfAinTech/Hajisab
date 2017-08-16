<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PageTemplate.ascx.cs" Inherits="Components_PageTemplate_PageTemplate" %>
<%@ Register Src="~/Components/PageTemplate/LayoutsList.ascx" TagPrefix="uc1" TagName="LayoutsList" %>
<%@ Register Src="~/Components/PageTemplate/ColumnsList.ascx" TagPrefix="uc1" TagName="ColumnsList" %>

<%--<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-ui.js"></script>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>--%>
<script src="<%# Server.MapPath("~/") %>/Components/PageTemplate/Content/js/myScript.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" Style="width: 100%;">
    <ContentTemplate>
        <div class="col-md-12">
            <div class="col-md-12">
                <%--<a href="#" target="_blank" id="parent_page" style="pointer-events: none;">
                    <h3><span id="page_Name"></span></h3>
                </a>--%>
                <input type="hidden" id="page_Name" />
                <input type="hidden" id="dream_id" />
            </div>
            <div class="col-md-4">
                
            </div>
            <div class="col-md-2" style="padding: 0;">
                
            </div>
            <div class="col-md-2">
                
            </div>
            <div class="col-md-4">
                
            </div>
            <div class="col-md-12" id="controls-pan" style="background-color: #f6f6f6;">
                
            </div>
            <div id="mainNode">
                <div class="col-md-12 sortable" id="working_area" style="padding: 20px; margin-top: 20px; height: 360px; min-height: 150px; background-color: #f6f6f6; overflow-y: auto; display: block;">
                </div>
            </div>
        </div>

    </ContentTemplate>
</asp:UpdatePanel>

