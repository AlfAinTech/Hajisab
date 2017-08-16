<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NavigationView.ascx.cs" Inherits="Components_NAV_General_NavigationView" %>
<asp:Repeater ID="Nav_data_list" runat="server" OnItemDataBound="set_enableEditing">
    <ItemTemplate>
        <div class="col-md-2">
            <asp:Image ID="nav_img" runat="server" ImageUrl='<%#Eval("MediaItem.path100") %>' Width="100%" BorderWidth=/>
            <br />
            <asp:HyperLink ID="nav_link" runat="server" NavigateUrl='<%# Eval("Link") %>' Text='<%# Eval("Caption") %>' Target="_blank" CssClass="btn btn-default"></asp:HyperLink>
            <asp:LinkButton ID="edit_nav" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="edit_nav_Click" CssClass="btn btn-primary" data-toggle="collapse" data-target="#edit_Nav" aria-expanded="false" aria-controls="edit_Nav" Visible="False">Edit</asp:LinkButton>
        </div>
    </ItemTemplate>
</asp:Repeater>