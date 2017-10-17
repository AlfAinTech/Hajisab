<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UmrahPackageDetail.ascx.cs" Inherits="UmrahComponents_PackageComponent_UmrahPackageDetail" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/PackageItenryDetail.ascx" TagPrefix="uc1" TagName="PackageItenryDetail" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">
    <asp:HiddenField ID="hiddenprice" runat="server" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <script src='<%= ResolveUrl("~/chat/contents/js/jquery.quicksearch.js") %>'></script>
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

        AccommodationScript = function () {
            // alert("here");
            $('#makkahAccommodation_list input').change(function () {
                ManageAccomodation();
            });



            $('#madinaAccommodation_list input').change(function () {
                ManageAccomodation();
            });

        }

        ManageAccomodation = function () {
            //  alert("here")
            var makkahID = $('#makkahAccommodation_list input:checked').val();
                var madinaID = $('#madinaAccommodation_list input:checked').val();
                var makkahAccom = $.grep(MakkahAccommodations, function (n, i) {
                    return (n.id == makkahID);
                });
                var madinaAccom = $.grep(MadinaAccommodations, function (n, i) {
                    return (n.id == madinaID);
                });
                var price = PriceWithoutAccom;
                nightsInMakkah = $("#nights_inMakkah")[0].innerText;
                nightsInMadina = $("#nights_inMadina")[0].innerText;
                price += (nightsInMakkah * makkahAccom[0].price) + (nightsInMadina * madinaAccom[0].price);
            //  alert(price)
                price = Math.round(price);
                $("#Computed_amount")[0].innerText = price.toLocaleString();
                document.getElementById('<%=hiddenprice.ClientID %>').value = price;
                // alert( document.getElementById('<%=hiddenprice.ClientID %>').value)
                //discount calculation
                discountPercent = 0;
                textBoxDiscount = $("#discountValue")[0];
                if (textBoxDiscount != undefined) {
                    discountPercent = textBoxDiscount.innerText;
                    discount = Math.round( price - ((price * discountPercent) / 100));
                    discountText = discount.toLocaleString();
                    $("#DiscountAmount")[0].innerText = discountText;
                    document.getElementById('<%=hiddenprice.ClientID %>').value = discount;
                }
                // alert(discount)
        }


        BindItenryScript = function () {
            //$("#myModal").addClass("in");
            //$("#myModal").css({ 'display': 'block' });
            $('#myModal').modal('show');

        }
    </script>
</asp:PlaceHolder>


<div class="col-md-12 search_result" style="margin-top: 35px; margin-bottom: 35px; box-shadow: 3px 3px 12px 0px #666666; padding: 0;">
    <div id="search_result_hotel" class="big_detail col-md-5 row">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#makkahImg" aria-controls="home" role="tab" data-toggle="tab">Makkah Hotel</a></li>
            <li role="presentation"><a href="#madinaImg" aria-controls="profile" role="tab" data-toggle="tab">Madina Hotel</a></li>
        </ul>

        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="makkahImg">
                <div class="col-md-12">
                    <asp:Image ID="hotelMakkah_img" runat="server" Width="100%" />
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="madinaImg">
                <div class="col-md-12">
                    <asp:Image ID="hotelMadina_img" runat="server" Width="100%" />
                </div>
            </div>
        </div>
        <%-- <div class="" style="margin:20px; margin-top:-10px">
                                <div class="row">
                                    <asp:Button runat="server"  ID="OpenCustomPackage" OnClick="OpenCustomPackage_Click"  CssClass="btn btn-primary" style="width:auto; float:right;" Text="Customize Package"/>
                                </div>
                            </div>--%>
    </div>

    <div class="col-md-7" style="border-left: 1px solid #e6e6e6;">
        <div class="col-md-12">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-xs-10" style="border-bottom: 2px solid #e6e6e6; margin-bottom: 15px;">
                        <div class="row">
                            <div class="col-xs-9">
                                <div class="row">
                                    <h3 style="text-align: left; font-weight:800;">
                                        <asp:Literal ID="totelNights" runat="server"></asp:Literal>
                                        Night(s) Package</h3>
                                    <h5 style="text-align: left;">
                                        <asp:Label ID="package_name" runat="server"></asp:Label></h5>
                                </div>
                            </div>
                            <div class="col-xs-3" style="position:absolute; right:0px; bottom:20px;">
                                <div class="row">
                                    <asp:Button runat="server" ID="bookPackage" class="btn btn-primary" Text="Book now for 25% off" Style="width:auto; float:right;" OnClick="bookPackage_Click" ValidationGroup="bookInput" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-10" style="border: 1px solid #e6e6e6;">
                <div class="col-xs-6">
                    <div class="row">
                        <h5 style="text-align: left; float: left;">Original Price : </h5>
                        <h3 style="float: left; margin-top: 5px; margin-left: 10px; font-size: 22px; color: #871ec3;">
                            <strong>
                                <asp:Label ID="Computed_amount" runat="server" ClientIDMode="Static">--</asp:Label>
                                PKR</strong></h3>
                    </div>
                </div>
                <div class="col-xs-6">
                    <div class="row">
                        <asp:Panel runat="server" ID="Paneldiscount" Visible="false">
                            <h5 style="text-align: right; float: left;">Discount Price : </h5>
                            <h3 style="float: left; margin-top: 5px; font-size: 22px; margin-left: 10px; color: #871ec3;"><strong>
                                <asp:Label ID="DiscountAmount" runat="server" ClientIDMode="Static"></asp:Label>
                                PKR </strong>
                            </h3>
                        </asp:Panel>
                    </div>
                </div>
            </div>
            <div class="col-md-10" style="margin-top: 15px; display:none;">
                <div class="row">
                    <div class="col-md-9">
                        <asp:Panel ID="discountPanel" runat="server" Visible="false">
                            <div class="banner">

                                <h4 style="text-align: center">Book Now for 
                                    <asp:Label ID="discountValue" runat="server" ClientIDMode="Static">0</asp:Label>% OFF</h4>
                                <div class="banner_top"></div>
                                <div class="banner_bottom"></div>
                            </div>
                        </asp:Panel>
                    </div>

                </div>
            </div>
            <div class="col-md-10" style="border: 1px solid #e6e6e6; margin-top: 15px;">

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-3">
                                <h4 style="text-align: left; white-space: nowrap; font-weight: 600;">Madina : </h4>
                            </div>
                            <div class="col-md-8 detail_package_detail">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="row">
                                            <h5 style="margin-top: 14px;">
                                                <asp:Label ID="nights_inMadina" ClientIDMode="Static" runat="server"></asp:Label>
                                                Nights at</h5>
                                        </div>
                                    </div>
                                    <div class="col-xs-9 detail_package_detail">
                                        <div class="row">
                                            <h4 style="margin-bottom: 0px; color: #871ec3; font-weight: 600;">
                                                <asp:Literal ID="hotelName_madina" runat="server"></asp:Literal></h4>
                                        </div>
                                        <div class="row">
                                            <span style="font-size: .8em;">
                                                <asp:Label runat="server" ID="hotelRating_madina" CssClass="stars"></asp:Label></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="row">
                                <h5 style="text-align: left;">Room Type : </h5>
                            </div>
                        </div>
                        <div class="col-md-9 detail_package_detail" style="padding-top: 5px;">
                            <asp:RadioButtonList ID="madinaAccommodation_list" CssClass="RadioButtonList" ClientIDMode="Static" runat="server" DataTextField="Name" DataValueField="id" RepeatDirection="Horizontal"></asp:RadioButtonList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-10" style="border: 1px solid #e6e6e6; margin-top: 15px;">

                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-3">
                                <h4 style="text-align: left; white-space: nowrap; font-weight: 600;">Makkah : </h4>
                            </div>
                            <div class="col-md-8 detail_package_detail">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <div class="row">
                                            <h5 style="margin-top: 14px;">
                                                <asp:Label ID="nights_inMakkah" ClientIDMode="Static" runat="server"></asp:Label>
                                                Nights at</h5>
                                        </div>
                                    </div>
                                    <div class="col-xs-9 detail_package_detail">
                                        <div class="row">
                                            <h4 style="margin-bottom: 0px; color: #871ec3; font-weight: 600;">
                                                <asp:Literal ID="hotelName_makkah" runat="server"></asp:Literal></h4>
                                        </div>
                                        <div class="row">
                                            <span style="font-size: .8em;">
                                                <asp:Label runat="server" ID="hotelRating_makkah" CssClass="stars" data-rating='<%# Eval(" Hotel.rating") %>' data-num-stars='<%# Eval(" Hotel.rating") %>'></asp:Label></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="row">
                                <h5 style="text-align: left;">Room Type : </h5>
                            </div>
                        </div>
                        <div class="col-md-9 detail_package_detail" style="padding-top: 5px;">
                            <asp:RadioButtonList ID="makkahAccommodation_list" ClientIDMode="Static" runat="server" DataTextField="Name" DataValueField="id" RepeatDirection="Horizontal" CssClass="RadioButtonList"></asp:RadioButtonList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-10" style="border: 1px solid #e6e6e6; margin-top: 15px; margin-bottom: 15px;">
                <div class="row">
                    <div class="col-md-3">
                        <h5 style="text-align: left;">Flight : </h5>
                    </div>
                    <div class="col-md-8 detail_package_detail">
                        <div class="row">
                            <asp:Panel ID="oneWay_panel" runat="server" Visible="false">
                                <h4>Departure</h4>
                                <h5>
                                    <asp:Literal ID="departureAirLine_name" runat="server"></asp:Literal></h5>
                                <h6>
                                    <asp:Literal ID="depCities_lbl" runat="server"></asp:Literal>
                                </h6>
                                <h4>Arrival</h4>
                                <h5>
                                    <asp:Literal ID="returnAirLine_name" runat="server"></asp:Literal></h5>
                                <h6>
                                    <asp:Literal ID="retCities_lbl" runat="server"></asp:Literal>
                                </h6>
                            </asp:Panel>
                            <asp:Panel ID="roundTrip_panel" runat="server" Visible="false">
                                <h5>
                                    <asp:Literal ID="AirLine_name" runat="server"></asp:Literal></h5>
                                <h6>
                                    <asp:Literal ID="cities_lbl" runat="server"></asp:Literal>
                                </h6>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>

            <%-- <div class="row">
                <div class="col-md-12">
                    <div class="col-md-3">
                        <h5 style="text-align: left;">Original Price : </h5>
                    </div>
                    <div class="col-md-8 detail_package_detail">
                        <h3 style="font-weight: 800; margin-top: 5px;"></h3>
                    </div>
                </div>
            </div>--%>



            <div class="row" style="margin-top: 15px; border-top: 2px solid #e6e6e6; margin-bottom: 15px; display: none;">
                <div class="col-md-9">
                    <h5 style="text-align: left;">Want to Customize your trip?</h5>
                    <div class="col-md-4" style="padding-left: 0;">

                        <asp:LinkButton ID="cmdtripSelect" CssClass="btn btn-primary" runat="server" CausesValidation="False">Edit Trip Details</asp:LinkButton>
                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="Button4" TargetControlID="cmdtripSelect" PopupControlID="popupPanel"></ajaxToolkit:ModalPopupExtender>
                        <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width: 1200px; height: 70vh">



                            <asp:UpdatePanel runat="server" ID="updatePanel_main" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                <ContentTemplate>

                                    <uc1:PackageItenryDetail runat="server" ID="PackageItenryDetail" OnMyEvents="myEvent_Raised" />
                                    <asp:Button ID="Button4" CssClass="btn btn-danger" runat="server" CausesValidation="false" Style="border-radius: 0px; position: absolute; top: 0px; right: 0px;" Text="X" OnClick="closeItenrtDetail" />
                                </ContentTemplate>

                            </asp:UpdatePanel>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <style>
        input[type=checkbox]:not(old),
        input[type=radio ]:not(old) {
            width: 2em;
            margin: 0;
            padding: 0;
            font-size: 1em;
            opacity: 0;
            display: none;
        }

            input[type=checkbox]:not(old) + label,
            input[type=radio ]:not(old) + label {
                display: inline-block;
                margin-left: -2em;
                line-height: 1.5em;
            }

            input[type=checkbox]:not(old) + label,
            input[type=radio ]:not(old) + label {
                display: block;
                width: auto;
                padding: 3px 9px;
                height: auto;
                margin: 0.125em;
                border: 0.1em solid #666666;
                border-radius: 0.125em;
                background: rgb(255, 255, 255);
                margin-bottom: 10px;
                font-size: 0.75em;
            }

            input[type=checkbox]:not(old):checked + label,
            input[type=radio ]:not(old):checked + label {
                background-image: -moz-linear-gradient(rgb(224,224,224),rgb(240,240,240));
                background-image: -ms-linear-gradient(rgb(224,224,224),rgb(240,240,240));
                background-image: -o-linear-gradient(rgb(224,224,224),rgb(240,240,240));
                background-image: -webkit-linear-gradient(rgb(224,224,224),rgb(240,240,240));
                background-image: linear-gradient(rgb(224,224,224),rgb(240,240,240));
            }

                input[type=checkbox]:not(old):checked + label:before {
                    content: '✓';
                    display: block;
                    width: 1em;
                    color: rgb(153,204,102);
                    font-size: 0.875em;
                    line-height: 1em;
                    text-align: center;
                    text-shadow: 0 0 0.0714em rgb(115,153,77);
                    font-weight: bold;
                }

            input[type=radio]:not(old):checked + label {
                display: block;
                width: auto;
                padding: 3px 20px;
                height: auto;
                margin: 0.125em;
                border: 0.10em solid rgb(135, 30, 195);
                border-radius: 0.125em;
                background: rgb(239, 239, 239);
                margin-bottom: 10px;
                font-size: 0.75em;
            }
    </style>
