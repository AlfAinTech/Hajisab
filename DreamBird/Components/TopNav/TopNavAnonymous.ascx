<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TopNavAnonymous.ascx.cs" Inherits="Components_TopNav_TopNavAnonymous" %>
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
        <asp:LinkButton ID="lb_dream_home" PostBackUrl="~/DreamHome.aspx" runat="server"><img src="../../Content/img/dreambird-logo.png" style="width:70px;"></asp:LinkButton>
    </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
       <asp:LoginView runat="server" ViewStateMode="Disabled">
                        <AnonymousTemplate>
                             <ul class="nav navbar-nav navbar-right">
                                         <li id="login"><a href="<%= ResolveUrl("~/Components/Account/Loginsetting.aspx")%>">Login</a></li>
                                         <li class="active" id="register"><a href="<%=ResolveUrl("~/Components/Account/Loginsetting.aspx?Page=register")%>">Register</a></li>
                        </ul>
                        </AnonymousTemplate>
                        <LoggedInTemplate>
                            <ul class="nav navbar-nav navbar-right">
                                <li id="login" ><a runat="server" title="Manage your account">Hello, <%: Context.User.Identity.GetUserName()  %>!</a></li>
                                <li class="active" id="register">
                                    <asp:LoginStatus runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/DreamHome.aspx" OnLoggingOut="Unnamed_LoggingOut" />
                                </li>
                                 
                            </ul>
                        </LoggedInTemplate>
                    </asp:LoginView>
      <ul class="nav navbar-nav navbar-right" id="main-menu">
         <li >
                                    <a href="<%=ResolveUrl("~/DreamUsers/Default")%>">DashBoard</a>
                                    
          </li>
          <li>
              <a href="<%=ResolveUrl("~/News/Default")%>">News</a>
          </li>
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
  </div>
</nav>
</div>

