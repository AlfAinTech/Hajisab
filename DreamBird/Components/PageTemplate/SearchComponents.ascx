<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchComponents.ascx.cs" Inherits="Components_PageTemplate_SearchComponents" %>

<div class="col-md-7" style="padding-right:0;">
    <asp:TextBox ID="search_components" runat="server" placeholder="Search Components" CssClass="form-control"></asp:TextBox>
</div>
<div class="col-md-3" style="padding-left:0; padding-right:5px;">
    <asp:Button ID="btn_search" runat="server" CssClass="btn btn-default" Text="Search" OnClick="btn_search_Click" />
</div>
<div class="col-md-2" style="padding:0;">
    <button class="btn btn-default" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
</button>
</div>
