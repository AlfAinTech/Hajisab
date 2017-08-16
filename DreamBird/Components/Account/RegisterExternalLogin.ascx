<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RegisterExternalLogin.ascx.cs" Inherits="Account_RegisterExternalLogin" %>

       
            <h3>Association Form</h3>
            <asp:ValidationSummary runat="server" ShowModelStateErrors="true" CssClass="text-danger" id="summary_validator"/>
          
        <%--    <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="userName" CssClass="col-md-2 control-label" ID="user_lbl">User name</asp:Label>
                <%--<div class="col-md-10">
                    <asp:TextBox runat="server" ID="userName" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="userName"
                        Display="Dynamic" CssClass="text-danger" ErrorMessage="User name is required" />
                    <asp:ModelErrorMessage runat="server" ModelStateKey="UserName" CssClass="text-danger" id="validator_userName"/>
                    <br />
                    <br />
                    <asp:Label runat="server" AssociatedControlID="userName" CssClass="col-md-2 control-label" ID="email_lbl">Email</asp:Label><br/>
                    <asp:TextBox ID="Email_txt" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email_txt"
                        Display="Dynamic" CssClass="text-danger" ErrorMessage="Email is required" id="validator_pswrd"/>
                        <asp:ModelErrorMessage runat="server" ModelStateKey="Email_txt" CssClass="text-danger" id="validator_email"/>
                    <br />
                </div>
               

            </div>--%>

            
             <div class="row">
			<div class="col-md-12">
                   <asp:TextBox runat="server" ID="userName"  CssClass="form-control" placeholder="Enter Your User-ID Example : (Example123)"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="userName"
                    CssClass="text-danger" ErrorMessage="The UserName field is required." id="validator_userName"/>
				<%--<input type="password" class="form-control" placeholder="Enter Your Password">--%>
				</div>
			</div>
             <div class="row">
			<div class="col-md-12">
                   <asp:TextBox runat="server" ID="Email_txt" TextMode="Email" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email_txt"
                    CssClass="text-danger" ErrorMessage="The Email field is required." id="validator_email"/>
				<%--<input type="password" class="form-control" placeholder="Enter Your Password">--%>
				</div>
			</div>
            <div class="row">
                <div class="col-md-4" style="margin-top:40px;">
                     <asp:Button runat="server" Text="Log in" CssClass="btn btn-default" OnClick="LogIn_Click" />
				</div>

</div>
       
  