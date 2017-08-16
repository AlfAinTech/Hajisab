<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MultimediaSearch.ascx.cs" Inherits="Components_MultimediaBank_MultimediaSearch" %>
<div class="col-md-12" style="padding:0; margin-top:15px;">
    <div class="col-md-10" style="padding-left:0;">
        <div class="col-md-10" style="padding-left:0;">
            <asp:TextBox ID="mm_name" CssClass="form-control" placeholder="Search" runat="server"></asp:TextBox>
        </div>
        <div class="col-md-2" style="padding: 0;">
            <button class="btn btn-default" id="search_multimedia" onserverclick="search_multimedia_ServerClick" runat="server" aria-label="Add Multimedia">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            </button>
        </div>
    </div>
    <div class="col-md-2" style="padding: 0;">
        <button class="btn btn-default" id="add_multimedia" onserverclick="add_multimedia_ServerClick" runat="server" aria-label="Add Multimedia">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
        </button>
    </div>
</div>
