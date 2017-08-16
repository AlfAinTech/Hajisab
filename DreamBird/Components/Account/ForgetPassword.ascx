<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.ascx.cs" Inherits="Components_Account_ForgetPassword" %>

    

<h3>Password Reset</h3>
 <asp:PlaceHolder runat="server" ID="status" Visible="false">
                        <p class="text-danger">
                            <asp:Label runat="server" ID="status_text" />
                        </p>
               </asp:PlaceHolder>
<asp:Panel ID="forget_panel" runat="server">
			<div class="row" style="padding-left:20px; padding-right:20px;">
			<p>Enter your email address that you used for registration. We shall send you a password reset link to help you login</p>
			</div>
			<div class="row">
			<div class="col-md-12">
				 <asp:TextBox runat="server" ID="Email"  CssClass="form-control" placeholder="Enter Your Emai"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The Email field is required." id="validator_Email"/>
				</div>
			</div>
			<div class="row" style="margin-top:30px; margin-bottom:40px;">
				<div class="col-md-12">
                     <asp:Button runat="server" OnClick="send_Click" Text="Reset Password Now" CssClass="btn btn-default" id="send_btn"/>
					<%--<button class="btn btn-default">Reset Password Now</button>--%>
				</div>
			</div>
</asp:Panel>