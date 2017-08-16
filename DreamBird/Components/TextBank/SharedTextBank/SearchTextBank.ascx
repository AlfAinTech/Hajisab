<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SearchTextBank.ascx.cs" Inherits="Components_TextBank_SearchTextBank" %>


<div class="col-md-10" style="padding:15px; background-color:#404040; display:inline-block;">
		<div class="col-md-8" style="padding:0;">
            <asp:TextBox ID="search_text" runat="server" class="form-control" PlaceHolder="Search Dream"></asp:TextBox>
			<%--<input type="text" class="form-control" />--%>
		</div>
		<div class="col-md-4" style="padding:0;">
            <asp:Button ID="search_dream" runat="server" OnClick="search_text_Click" Text="Search" style="width:100%" class="btn btn-default"/>
			 <%--<button type="button" style="width:100%" class="btn btn-default">Search Everything</button>--%>
		</div>
	</div>
  