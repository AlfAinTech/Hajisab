<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsSearch.ascx.cs" Inherits="Components_News_NewControls_NewsSearch" %>

	
    <div class="col-md-12">
  <h3 style="color:white;">Filter News</h3></div>
  <div class="col-md-12">
    <h5 style="color:white;">Title</h5>
      <asp:TextBox ID="news_title" runat="server" CssClass="form-control" placeholder="Search News"></asp:TextBox>
    </div>
		<div class="col-md-12" >
    <h5 style="color:white;">Category</h5>
        <select class="form-control" disabled="disabled">
            <option value="">National</option>
            <option value="">International</option>
            <option value="">Featured</option>
        </select>
    </div>
    <div class="col-md-12">
    <h5 style="color:white;">From</h5>
        <asp:TextBox ID="from_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
    </div>
    <div class="col-md-12">
    <h5 style="color:white;">To</h5>
        <asp:TextBox ID="to_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
    </div>
    <div class="col-md-12" style="margin-top:25px;">
        <asp:Button ID="search_news" OnClick="search_news_Click" runat="server" Text="Search" CssClass="btn btn-default" CausesValidation="false" />
    </div>
</div>