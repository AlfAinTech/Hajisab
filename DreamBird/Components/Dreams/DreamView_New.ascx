<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamView_New.ascx.cs" Inherits="Components_Dreams_DreamView_New" %>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-ui.js"></script>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Dreams/Content/js/myScripts.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<div class="container">
    <asp:HiddenField ID="current_conter" ClientIDMode="Static" runat="server" Value="1" />
    <div class="row">
        <div class="col-md-12">
            <h3 style="text-align:center;">Most Popular Dreams</h3>
        </div>
        <div class="col-md-12" id="render_dream_list">
            
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-3" style="float:right; margin-top:15px; margin-bottom:15px;">
                <button class="btn btn-primary" id="load_more" style="width:100%">Load More</button>
            </div>
        </div>
    </div>
</div>