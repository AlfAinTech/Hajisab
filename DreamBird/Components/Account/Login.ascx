<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="Account_Login" %>
<%@ Register Src="~/Components/Account/OpenAuthProviders.ascx" TagPrefix="uc1" TagName="OpenAuthProviders" %>


               
       


			<h3>Login</h3>
              <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
               </asp:PlaceHolder>
                     
			<div class="row">
			<div class="col-md-12">
                 <asp:TextBox runat="server" ID="UserName" class="form-control" aria-required="true" placeholder="Enter Your Email. Example :username@domain.com"/>
                   <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-danger right" ErrorMessage="*" id="validator1" />
				<%--<input type="text" class="form-control" placeholder="Enter Your Email. Example : (jahanzaib@uet.edu.pk)">--%>
				</div>
			</div>
			<div class="row">
			<div class="col-md-12">
                 <asp:TextBox runat="server" ID="Password" TextMode="Password" name="password"  aria-required="true" type="password" class="form-control" placeholder="Enter Your Password" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger right" ErrorMessage="*" id="validator2"/>
                 <%--<input type="password" class="form-control" placeholder="Enter Your Password">--%>
				  <asp:LinkButton runat="server" ID="forget_link" OnClick="forget_link_Click" >Forgot password?</asp:LinkButton>
				</div>
			</div>
			<div class="row">
				<div class="col-md-1" style="width:45px; float:left;">
                      <%--<asp:CheckBox runat="server" ID="RememberMe" class="form-control"  />--%>
					<input type="checkbox" class="form-control"  runat="server" ID="RememberMe"/>
				</div>
				<div class="col-md-7" style="width:58.3%; float:left; margin-top:45px;">Remember me?
				</div>
				<div class="col-md-4" style="margin-top:40px;">
                         <asp:Button runat="server" OnClick="LogIn" Text="Sign in" CssClass="btn btn-default" id="login_btn"/>
					<%--<button class="btn btn-default">Login</button>--%>
				</div>
			</div>
		 
                        <uc1:OpenAuthProviders runat="server" ID="OpenAuthProviders1" />
                       
			