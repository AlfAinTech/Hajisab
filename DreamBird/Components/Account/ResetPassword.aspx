<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPassword.aspx.cs" Inherits="Components_Account_ResetPassword" %>

<%@ Register Src="~/Components/Header/LoginRegisterHeader.ascx" TagPrefix="uc1" TagName="LoginRegisterHeader" %>
<%@ Register Src="~/Components/Footer/FooterControl.ascx" TagPrefix="uc1" TagName="FooterControl" %>



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
        <uc1:LoginRegisterHeader runat="server" ID="LoginRegisterHeader" />
    <div class="login_wrapper">
	<div class="container" id="content_wrap">
		<div class="col-md-7" style="margin-left:auto; margin-right:auto; float:none;">
		<div class="login-form">
        
        <h3>Change password</h3>
        <div class="row" style="padding-left:20px; padding-right:20px;">
            <p>Enter your new password</p>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:TextBox ID="new_password" runat="server" CssClass="form-control" placeholder="Enter Your Password" />
                <asp:RequiredFieldValidator ID="validator_Email" runat="server" ControlToValidate="new_password" CssClass="text-danger" ErrorMessage="The Password field is required." />
            </div>
        </div>
        <div class="row" style="margin-top:30px; margin-bottom:40px;">
            <div class="col-md-12">
                <asp:Button ID="reset_btn" runat="server" CssClass="btn btn-default"  Text="Reset" OnClick="reset_btn_Click"  />
                <%--<button class="btn btn-default">Reset Password Now</button>--%>
            </div>
        </div>
    </div>
            </div>
        </div>
        </div>
        <uc1:FooterControl runat="server" ID="FooterControl" />
    </form>
</body>
</html>
