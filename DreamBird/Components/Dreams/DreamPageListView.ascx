<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamPageListView.ascx.cs" Inherits="Components_Dreams_DreamPageListView" %>
<div class="col-md-12" style="padding:0">
    <asp:Repeater ID="rptr_dreamPageList" runat="server">
        <HeaderTemplate>
            <ul class="list-group">
        </HeaderTemplate>
        <ItemTemplate>
            <li class="list-group-item" style="padding:0;">
                <asp:LinkButton ID="lb_dreamPageList" data-pageid='<%# Eval("id") %>' CssClass="btn btn-default" CommandName='<%# Eval("id") %>' OnClick="lb_dreamPageList_Click" Text='<%# Eval("Page") %>' runat="server"></asp:LinkButton>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</div>