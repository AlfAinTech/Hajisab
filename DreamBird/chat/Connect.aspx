<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Connect.aspx.cs" Inherits="Connect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
             Token :<asp:TextBox ID="txtToken" runat="server" Height="18px" Width="288px">TF3NCSYJ63UXZBNRCEQJB4SWUSNT2FCM</asp:TextBox>
                    <br />
                    Python Server URL<asp:TextBox ID="txtPythonServer" runat="server" Width="369px">http://localhost:8002/server/</asp:TextBox>
&nbsp;<asp:Button ID="cmdConnect" runat="server" Text="Connect" OnClick="cmdConnect_Click"  />

           
                    
               
    </div>
    </form>
</body>
</html>
