<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RegisterEmail.ascx.cs" Inherits="Components_Account_RegisterEmail" %>
<div class="registration_wrapper">
<div class="container">
	<div class="col-md-7">
		<p style="text-align:justify;">Let us inform you about new dreams, programs and courses. Register your Email Address here to become upto dated.</p>
	</div>
	<div class="col-md-5">
		<div class="row">
		<div class="col-md-12">
            <asp:TextBox ID="email" runat="server" TextMode="Email"  class="form-control" > </asp:TextBox>
			
		</div>
		</div>
		<div class="row">
		<div class="col-md-6" style="float:right;">
			<%--<button class="btn btn-default">Register</button>--%>
            <asp:Button ID="register_linkBtn" runat="server" Text="Register"  class="btn btn-default" OnClick="register_linkBtn_Click"/>
		</div>
		</div>
	</div>
</div>
</div>
