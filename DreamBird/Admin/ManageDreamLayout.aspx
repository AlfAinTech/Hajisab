<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageDreamLayout.aspx.cs" Inherits="Admin_ManageDreamLayout" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="ddlDreams" runat="server" AutoPostBack="True" DataTextField="DreamName" DataValueField="id" Height="27px" OnSelectedIndexChanged="ddlDreams_SelectedIndexChanged" Width="198px">
        </asp:DropDownList>
        <asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPages_SelectedIndexChanged">
        </asp:DropDownList>
&nbsp;<asp:Button ID="cmdSave" runat="server" OnClick="cmdSave_Click" Text="Save" Width="105px" />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Dream Page</asp:LinkButton>
    
    </div>
        <asp:TextBox ID="txtContents" runat="server" Height="451px" TextMode="MultiLine" ValidateRequestMode="Disabled" Width="715px"></asp:TextBox>
    </form>
</body>
</html>
