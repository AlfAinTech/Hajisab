<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamPageAdd.ascx.cs" Inherits="Components_Dreams_DreamPageAdd" %>
<asp:Panel ID="DreamPage_panel" runat="server" style="padding:20px;text-align:center">
    <asp:TextBox ID="PageName" runat="server"></asp:TextBox>
   <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <br/>
    <br/>
    <asp:CheckBox ID="chk_copy" runat="server" AutoPostBack="True" OnCheckedChanged="copy_rb_CheckedChanged" Text="Copy Existing" />
    <br/><br/>
    <asp:Panel ID="copy_panel" runat="server" Visible="False">
         Dream&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlDream" runat="server" Height="16px" Width="127px" OnSelectedIndexChanged="ddlDream_SelectedIndexChanged" DataTextField="DreamName" DataValueField="id" AutoPostBack="True">
    </asp:DropDownList>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Page&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="ddlPage" runat="server" Height="16px" Width="128px" DataTextField="Page" DataValueField="id" AutoPostBack="True" OnSelectedIndexChanged="ddlPage_SelectedIndexChanged"></asp:DropDownList>
    <br />
    <br />
    </asp:Panel>
   
    <asp:Button ID="createPage" runat="server" Text="Create" OnClick="createPage_Click" />
</asp:Panel>

