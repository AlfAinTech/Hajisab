<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageSelector.aspx.cs" Inherits="ImageSelector" %>

<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc1" TagName="MediaBankControl" %>


<!DOCTYPE html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
     <script   src="https://code.jquery.com/jquery-2.2.4.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="<%# Server.MapPath("~/") %>/Components/DragDropFramework/Content/bootstrap-switch.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="Scripts/jquery_color.js"></script>
    
   
</head>
<body>
    
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                 <uc1:MediaBankControl runat="server" ID="MediaBankControl" ShowImageTypeMedia="true" OnMediaSelectedEvent="OnMediaSelected"/>

            </ContentTemplate>

        </asp:UpdatePanel>
       
    </div>
    </form>
</body>
</html>
