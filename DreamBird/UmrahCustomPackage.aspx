﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UmrahCustomPackage.aspx.cs" Inherits="UmrahCustomPackage" %>

<%@ Register Src="~/UmrahComponents/headerFooter/Packageheader.ascx" TagPrefix="uc1" TagName="Packageheader" %>
<%@ Register Src="~/UmrahComponents/headerFooter/PackageFooter.ascx" TagPrefix="uc1" TagName="PackageFooter" %>
<%@ Register Src="~/UmrahComponents/headerFooter/DetailHeader.ascx" TagPrefix="uc1" TagName="DetailHeader" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/CustomPackageAdd.ascx" TagPrefix="uc1" TagName="CustomPackageAdd" %>















<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
	  <meta charset="utf-8" />
   
     <link rel="stylesheet" href='~/UmrahComponents/Contents/css/bootstrap.css' />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.0.0/animate.min.css"/>
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/liquid-slider.css"/>
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/style.css"/>
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
    <script src='<% = ResolveUrl("~/UmrahComponents/Contents/js/jquery.cycle.lite.js") %>' ></script>
    <script type="text/javascript">
       Initialize = function(){
            $('.right').cycle({
                fx:      'scrollRight',
                next:   '#chat_now',
                timeout:  0,
                easing:  'easeInOutBack'
            });
            $('#learn_more').click(function(e){
                e.preventDefault();
                window.location.href = "http://www.google.com";
            });
       }

       $(document).on('click', '.bot', function () {
           $('#chat_now').click();
       });

    </script>
     <script src='<%= ResolveUrl("~/chat/contents/js/jquery.quicksearch.js") %>'></script>
    <script src='<%= ResolveUrl("~/UmrahComponents/Contents/js/bootstrap.js") %>'></script></asp:PlaceHolder>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Kanit:400,500,700,900" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
     <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
   

      <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
       
        <div class="row">
          
            
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>--%>
    
          
                        <div id="body_content" class="col-md-12" runat="server">
                            <div  class="col-md-12" runat="server">
                                <uc1:Packageheader runat="server" ID="Packageheader" />
                                <uc1:DetailHeader runat="server" ID="DetailHeader" />

                               
                        </div>
                        <div  class="content_wrap" runat="server">
                             <div  class="container" runat="server">
                                 <uc1:CustomPackageAdd runat="server" ID="CustomPackageAdd" />
                            </div>
                            </div>
                            <div  class="col-md-12" runat="server">
                                 <uc1:PackageFooter runat="server" ID="PackageFooter" />
                            </div>
                        
    </div>
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>

        </div> 
       
     
          

    </form>
</body>
</html>
