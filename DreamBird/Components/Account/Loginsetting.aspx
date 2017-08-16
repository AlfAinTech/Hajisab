<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Loginsetting.aspx.cs" Inherits="Account_Loginsetting" %>

<%@ Register Src="~/Components/Account/Login.ascx" TagPrefix="uc1" TagName="Login" %>
<%@ Register Src="~/Components/Account/Register.ascx" TagPrefix="uc1" TagName="Register" %>
<%@ Register Src="~/Components/Account/RegisterExternalLogin.ascx" TagPrefix="uc1" TagName="RegisterExternalLogin" %>
<%@ Register Src="~/Components/Header/LoginRegisterHeader.ascx" TagPrefix="uc1" TagName="LoginRegisterHeader" %>
<%@ Register Src="~/Components/Footer/FooterControl.ascx" TagPrefix="uc1" TagName="FooterControl" %>
<%@ Register Src="~/Components/Account/ForgetPassword.ascx" TagPrefix="uc1" TagName="ForgetPassword" %>







<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

   
    <link href="../../Content/bootstrap.min.css" rel="stylesheet" />
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
 <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"/>
   
    <link href="../../Content/themes/LoginStyle.css" rel="stylesheet" />
    <title></title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="~/Content/css/bootstrap.css"/>

    <!-- Optional theme -->
    <link rel="stylesheet" href="../../Content/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="../../Content/css/style.css"/>
	<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="../../Content/js/bootstrap.js"></script>
    <script type="text/javascript" src="../../Content/js/myScript.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>

</head>
<body>
  <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

      <uc1:LoginRegisterHeader runat="server" ID="LoginRegisterHeader" />

      <div class="login_wrapper">
            <div class="container" id="content_wrap">
                <div class="col-md-7" style="margin-left:auto; margin-right:auto; float:none;">
	                <div class="login-form">
                        <asp:Panel ID="Login_panel" runat="server" Visible="true"  >
      
     
                            <uc1:Login runat="server" ID="Login"  OnforgetPassword="forgetPassword_clicked"/>
                                 <h3>Not a Memeber Yet? Register now!</h3>
			                    <div class="row" style="margin-top:30px; margin-bottom:40px;">
				                    <div class="col-md-12">
                                        <asp:Button ID="register_link" runat="server"  OnClick="register_link_Click" CausesValidation="False"  class="btn btn-default" Text="Register"/>
				                    </div>
			                    </div>
         
                  </asp:Panel>
                  <asp:Panel ID="Register_panel" runat="server" Visible="false">
                        <uc1:Register runat="server" ID="Register"  />
                       <h3>Already A Member? Login Here!</h3>
                         <div class="row" style="margin-top:30px; margin-bottom:40px;">
				                    <div class="col-md-12">
                                       <asp:Button ID="sign_in" runat="server" OnClick="sign_in_Click" CausesValidation="False" Text="Sign in" class="btn btn-default" />
                                        </div>
                             </div>
                 </asp:Panel>
                    <asp:Panel ID="RegisterExternalLogin_panel" runat="server" visible="False">
                        <br/>
                        <uc1:RegisterExternalLogin runat="server" ID="RegisterExternalLogin"  />
                    </asp:Panel>
                        <asp:Panel ID="ForgetPassword_panel" runat="server" Visible="false">
                            <uc1:ForgetPassword runat="server" ID="ForgetPassword"   />
                        </asp:Panel>
        
                </div>
                    </div>
	        </div>

         </div>
           
         
         
           
     
      <uc1:FooterControl runat="server" ID="FooterControl" />
              
</form>

    
</body>
</html>
