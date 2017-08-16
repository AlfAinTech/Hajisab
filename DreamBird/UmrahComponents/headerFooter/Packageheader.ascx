<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Packageheader.ascx.cs" Inherits="UmrahComponents_headerFooter_Packageheader" %>
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
              <asp:Linkbutton  runat="server" ID="home" class="navbar-brand" OnClick="Home_Click"  >Haji sb</asp:Linkbutton>
     
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
            <li><asp:Linkbutton  runat="server" ID="search" OnClick="search_Click"  >Packages</asp:Linkbutton></li>
            <li><a href="#">About Us</a></li>
        </ul>
    </div><!-- /.navbar-collapse -->
</div><!-- /.container-fluid -->
</nav>