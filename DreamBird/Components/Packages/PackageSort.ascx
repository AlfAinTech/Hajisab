<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackageSort.ascx.cs" Inherits="Components_Dreams_DreamSort" %>
Sort Dream:&nbsp;&nbsp;&nbsp;&nbsp;
<asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="ddlSort_SelectedIndexChanged" Width="187px">
    <asp:ListItem Value="DreamName">Name</asp:ListItem>
    <asp:ListItem Value="DreamTag">Tag</asp:ListItem>
</asp:DropDownList>

