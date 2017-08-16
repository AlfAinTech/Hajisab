<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NavigationControl.ascx.cs" Inherits="Components_Navigation_NavigationControl" %>

<asp:DataList ID="Nav_data_list" runat="server" RepeatDirection="Horizontal" Width="547px" RepeatColumns="3" Height="293px">
    <ItemTemplate>
        <asp:Image ID="nav_img" runat="server" Width="103px" Height="80px"  ImageUrl='<%#Eval("MediaItem.path") %>' />
        <br />
        <asp:HyperLink ID="nav_link" runat="server" NavigateUrl='<%# Eval("Link") %>' Text='<%# Eval("Caption") %>' Target="_blank" CssClass="col-md-3"></asp:HyperLink>
         <asp:HyperLink ID="edit_nav" runat="server"   NavigateUrl='#' Target="_blank" CssClass="col-md-3">Edit</asp:HyperLink>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </ItemTemplate>
</asp:DataList>

<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


