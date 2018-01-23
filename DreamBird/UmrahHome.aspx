<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UmrahHome.aspx.cs" Inherits="UmrahHome" EnableEventValidation="false" ValidateRequest="false"  %>

<%@ Register Src="~/UmrahComponents/headerFooter/Packageheader.ascx" TagPrefix="uc1" TagName="Packageheader" %>
<%@ Register Src="~/UmrahComponents/headerFooter/PackageFooter.ascx" TagPrefix="uc1" TagName="PackageFooter" %>
<%@ Register Src="~/UmrahComponents/headerFooter/UmrahChatheader.ascx" TagPrefix="uc1" TagName="UmrahChatheader" %>
<%@ Register Src="~/UmrahComponents/HomePageControls/BestUmrahPackages.ascx" TagPrefix="uc1" TagName="BestUmrahPackages" %>
<%@ Register Src="~/UmrahComponents/HomePageControls/PrimaryUmrahPackages.ascx" TagPrefix="uc1" TagName="PrimaryUmrahPackages" %>
<%@ Register Src="~/UmrahComponents/HomePageControls/OfferedPackages.ascx" TagPrefix="uc1" TagName="OfferedPackages" %>

















<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>--%>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <%--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-109746703-1"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());

      gtag('config', 'UA-109746703-1');
    </script>


    <title>Umrah Home Page</title>
	  <meta charset="utf-8" />
   
     <link rel="stylesheet" href='~/UmrahComponents/Contents/css/bootstrap.css' />
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.0.0/animate.min.css"/>
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/liquid-slider.css"/>
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/style.css"/>
    
    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
    <script src='<% = ResolveUrl("~/UmrahComponents/Contents/js/jquery.cycle.lite.js") %>' ></script>

    <script src='<%= ResolveUrl("~/chat/contents/js/jquery.quicksearch.js") %>'></script>
    <script src='<%= ResolveUrl("~/UmrahComponents/Contents/js/bootstrap.js") %>'></script></asp:PlaceHolder>
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

       function finallizeAmount() {
           alert("here");
       } function callModal(param) {
           debugger;
           $('#myModal').modal('show');
           currentCommand = $(param).attr('href'); console.log($(param));
           return false;
       }

       function executeCurrentCommand() {
           location.href = currentCommand;
       }
       $.fn.stars = function () {
           return $(this).each(function () {

               var rating = $(this).data("rating");

               var numStars = $(this).data("numStars");

               var fullStar = new Array(Math.floor(rating + 1)).join('<i class="fa fa-star" style="color: #ff9900;"></i>');

               var halfStar = ((rating % 1) !== 0) ? '<i class="fa fa-star-half-empty"></i>' : '';

               var noStar = new Array(Math.floor(numStars + 1 - rating)).join('<i class="fa fa-star-o"></i>');

               $(this).html(fullStar + halfStar + noStar);

           });
       }

       $('.stars').stars();
       ActivateListItem = function () {
           $("#PagingList")
       }
    </script>

    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Kanit:400,500,700,900" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Heebo:900" rel="stylesheet" />
    
</head>
<body>
    <form id="form1" runat="server">
   

      <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
       
        <div class="col-md-12">
          
            
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>--%>
    
          
                        <div id="body_content" class="row" runat="server">
                            <uc1:Packageheader runat="server" ID="Packageheader" />
                            <uc1:UmrahChatheader runat="server" ID="UmrahChatheader" />
                            <uc1:BestUmrahPackages runat="server" ID="BestUmrahPackages" />
                            <uc1:PrimaryUmrahPackages runat="server" ID="PrimaryUmrahPackages" />
                            <uc1:OfferedPackages runat="server" ID="OfferedPackages" />
                            <div id="sortable-5" class="col-md-12" style="padding:0;">
                            <uc1:PackageFooter runat="server" ID="PackageFooter" />
                                </div>
                        </div>
    
           <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>

        </div> 
       
     
          

    </form>
</body>
</html>
