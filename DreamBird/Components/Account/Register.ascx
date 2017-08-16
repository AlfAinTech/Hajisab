<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Register.ascx.cs" Inherits="Account_Register" %>
<%@ Register Src="~/Components/Account/OpenAuthProviders.ascx" TagPrefix="uc1" TagName="OpenAuthProviders" %>

 <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

<h3>Register</h3>
			<div class="row">
			<div class="col-md-12">
                 <asp:TextBox runat="server" ID="UserName" class="form-control" placeholder="Enter Your User-ID Example : (Example123)"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="The user name field is required." id="validator_userName"/>
				<%--<input type="text" class="form-control" placeholder="Enter Your User-ID Example : (jahanzaib996)">--%>
				</div>
			</div>
			<div class="row">
			<div class="col-md-12">
                 <asp:TextBox runat="server" ID="Email" class="form-control" placeholder="Enter Your Email Address. Example : (example@domain.com)"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The Email name field is required." id="emailvalidator"/>
				<%--<input type="text" class="form-control" placeholder="Enter Your Email Address. Example : (jahanzaib@uet.edu.pk)">--%>
				</div>
			</div>
            <div class="row">
			<div class="col-md-12">
                   <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." id="validator_pswrd"/>
				<%--<input type="password" class="form-control" placeholder="Enter Your Password">--%>
				</div>
			</div>
            <div class="row">
				<div class="col-md-1" style="width:45px; float:left;">
					<input type="checkbox" class="form-control">
				</div>
				<div class="col-md-7" style="width:58.3%; float:left; margin-top:45px;">
					I accept the privacy statement of DreamBird.
				</div>
				<div class="col-md-4" style="margin-top:40px;">
                     <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" id="register_btn"/>
					<%--<button class="btn btn-default">Register</button>--%>
				</div>
			</div>
            <uc1:OpenAuthProviders ID="OpenAuthProviders1" runat="server" />