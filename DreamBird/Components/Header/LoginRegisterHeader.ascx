<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginRegisterHeader.ascx.cs" Inherits="Components_Header_LoginRegisterHeader" %>
<div class="header-wrapper">
<nav class="navbar navbar-default navbar-fixed-top">
<div class="container">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"><img src="../../Content/img/dreambird-logo.png" width="100px"></a>
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li id="login-l">    <asp:LinkButton ID="signIn_link" runat="server"  OnClick="sign_in_Click" CausesValidation="False">Sign in</asp:LinkButton></li>
        <li id="register-l"><asp:LinkButton ID="register_link" runat="server"  OnClick="register_link_Click" CausesValidation="False"  >Register</asp:LinkButton></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
  </div>
</nav>
</div>
