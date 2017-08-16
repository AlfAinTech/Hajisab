<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamMessageView.ascx.cs" Inherits="Components_DreamMessages_DreamMessageView" %>
<asp:Panel ID="messages_panel" runat="server" BorderColor="#333333" BorderWidth="2" Width="259px">
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<asp:DataList ID="messages_list" runat="server" Height="165px" Width="259px">
    <ItemTemplate>
        <asp:Panel ID="msg_panel" runat="server" BorderColor="#333333" BorderWidth="2">
        <asp:Image ID="sender_Img" runat="server" Height="47px" Width="60px" ImageUrl='<%# Eval("DreamUserProfile.ProfilePicture") %>'/>
        &nbsp;
        <asp:TextBox ID="message_txt" runat="server" Height="39px" ReadOnly="True" TextMode="MultiLine" Text='<%# Eval("Message") %>'></asp:TextBox>
        </asp:Panel>
    </ItemTemplate>

</asp:DataList>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Panel>