<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SuperAdminTextBank.aspx.cs" Inherits="Components_TextBank_SuperAdminTextBank" ValidateRequest="false" %>

<%@ Register Src="~/Components/TextBank/CustomTextBank/SuperAdminTextBank.ascx" TagPrefix="uc1" TagName="SuperAdminTextBank" %>
<%@ Register Src="~/Components/TextBank/TextBankAdmin.ascx" TagPrefix="uc1" TagName="TextBankAdmin" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
   

</head>
<body>
  
     <!-- Optional theme -->
    <link rel="stylesheet" href="<%# ResolveUrl("~/Content/css/bootstrap-theme.css") %>"/>
      <link rel="stylesheet" href="<%# ResolveUrl("~/Content/css/bootstrap.css")%>"/>
    <link rel="stylesheet" href="<%# ResolveUrl("~/Content/css/style.css") %>"/>
	<%--<script src="https://code.jquery.com/jquery-3.1.0.js"></script>--%>
    <script src="../../Content/js/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="<%# ResolveUrl("~/Content/js/bootstrap.js")%>"></script>
    <script type="text/javascript" src="<%=ResolveUrl("~/Content/js/myScript.js") %>"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>
    <script src="<%# ResolveUrl("~/Content/js/jquery.diyslider.min.js") %>"></script>
      
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
             <ContentTemplate>
                 <uc1:SuperAdminTextBank runat="server" ID="SuperAdminTextBank" />
                 <%--<uc1:TextBankCreate runat="server" ID="TextBankCreate" />--%>
  </ContentTemplate>
        </asp:UpdatePanel>
        
        <%--<uc1:TextBankAdmin runat="server" ID="TextBankAdmin" />--%>
    </div>
    </form>
</body>
</html>
