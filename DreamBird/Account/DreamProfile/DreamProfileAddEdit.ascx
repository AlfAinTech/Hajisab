<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamProfileAddEdit.ascx.cs" Inherits="Account_DreamProfile_DreamProfileAddEdit" %>
<asp:Panel ID="Profile_panel" runat="server"> 
<table style="height: 320px; width: 543px">
<tr>
<td> <asp:Label ID="name_lbl" runat="server" Text="Name"></asp:Label> </td>
<td colspan="2"><asp:TextBox ID="Name_txt" runat="server" Height="21px" Width="247px"></asp:TextBox> </td>
</tr>

<tr>
<td> <asp:Label ID="ProfilePicture_lbl" runat="server" Text="Profile Picture"></asp:Label> </td>

<td colspan="2">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="conditional">
<ContentTemplate>
<asp:FileUpload ID="FileUpload1" runat="server" Height="16px" Width="196px" />
    &nbsp;<asp:Button ID="upload_pic" runat="server" Text="Upload" OnClick="Upload_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Image ID="profile_img" runat="server" Height="104px" Width="101px" /></ContentTemplate>
<Triggers>
<asp:PostBackTrigger ControlID="upload_pic" />
</Triggers>
</asp:UpdatePanel>


</td></tr>
<tr>

<td> <asp:Label ID="dob_lbl" runat="server" Text="Date Of Birth"></asp:Label> </td>
<td colspan="2"><asp:TextBox ID="dob_txt" runat="server" Height="19px" Width="249px"></asp:TextBox> </td>
</tr>
<tr>
<td> <asp:Label ID="edu_lbl" runat="server" Text="Education"></asp:Label> </td>
<td colspan="2"><asp:TextBox ID="edu_txt" runat="server" Height="16px" Width="246px"></asp:TextBox> </td>
</tr>

<tr><td colspan="3" style="text-align:center">
    <asp:Button ID="update_btn" runat="server" Text="Update" OnClick="update_btn_Click" /> </td></tr>
</table>
</asp:Panel>
