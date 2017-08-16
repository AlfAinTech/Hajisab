<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InviteshareAdminPage.aspx.cs" Inherits="Components_Account_InviteshareAdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div>
        Share Text:  <asp:TextBox ID="share_text" runat="server"></asp:TextBox>
        <br/>
        Share URL: <asp:TextBox ID="share_url" runat="server" ></asp:TextBox>
        <br />
        <asp:TextBox ID="Page_id" runat="server" visible="false"></asp:TextBox>
        <asp:Button ID="save" runat="server" Text="Save" OnClick="save_Click" />
   
    
    </div>
    </form>
</body>
</html>
