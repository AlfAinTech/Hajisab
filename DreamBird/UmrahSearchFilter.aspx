<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UmrahSearchFilter.aspx.cs" EnableEventValidation="false" Inherits="UmrahSearchFilter" %>

<%@ Register Src="~/UmrahComponents/headerFooter/Packageheader.ascx" TagPrefix="uc1" TagName="Packageheader" %>
<%@ Register Src="~/UmrahComponents/headerFooter/PackageFooter.ascx" TagPrefix="uc1" TagName="PackageFooter" %>
<%@ Register Src="~/UmrahComponents/FilterPageControls/DetailSearchFilter.ascx" TagPrefix="uc1" TagName="DetailSearchFilter" %>
<%@ Register Src="~/UmrahComponents/FilterPageControls/UmrahDetail_ListView.ascx" TagPrefix="uc1" TagName="UmrahDetail_ListView" %>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-109746703-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-109746703-1');
    </script>

    <title>Umrah Filter Page</title>
    <meta charset="utf-8" />

    <link rel="stylesheet" href='~/UmrahComponents/Contents/css/bootstrap.css' />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.0.0/animate.min.css" />
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/liquid-slider.css" />
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/bootstrap-theme.css" />
    <link rel="stylesheet" href="~/UmrahComponents/Contents/css/style.css" />
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
        <script src='<% = ResolveUrl("~/UmrahComponents/Contents/js/jquery.cycle.lite.js") %>'></script>
        <script type="text/javascript">
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

            Initialize = function () {
                $('.right').cycle({
                    fx: 'scrollRight',
                    next: '#chat_now',
                    timeout: 0,
                    easing: 'easeInOutBack'
                });
                $('#learn_more').click(function (e) {
                    e.preventDefault();
                    window.location.href = "http://www.google.com";
                });
            }

            $(document).on('click', '.bot', function () {
                $('#chat_now').click();
            });

        </script>
        <script src='<%= ResolveUrl("~/chat/contents/js/jquery.quicksearch.js") %>'></script>
        <script src='<%= ResolveUrl("~/UmrahComponents/Contents/js/bootstrap.js") %>'></script>
    </asp:PlaceHolder>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Kanit:400,500,700,900" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">


        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>


            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>--%>


            <div id="body_content" runat="server">
                <div runat="server">
                    <uc1:Packageheader runat="server" ID="Packageheader" />



                </div>
                <div class="content_wrap" runat="server">
                    <div runat="server">
                        <uc1:DetailSearchFilter runat="server" ID="DetailSearchFilter" />
                        <uc1:UmrahDetail_ListView runat="server" ID="UmrahDetail_ListView" />
                    </div>
                </div>
                <div runat="server">
                    <uc1:PackageFooter runat="server" ID="PackageFooter" />
                </div>

            </div>
            <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
        



    </form>
</body>
</html>
