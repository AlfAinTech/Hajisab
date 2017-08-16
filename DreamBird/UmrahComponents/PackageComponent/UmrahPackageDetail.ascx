<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UmrahPackageDetail.ascx.cs" Inherits="UmrahComponents_PackageComponent_UmrahPackageDetail" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/PackageItenryDetail.ascx" TagPrefix="uc1" TagName="PackageItenryDetail" %>
<asp:PlaceHolder ID="PlaceHolder1" runat="server">
      <asp:HiddenField ID="hiddenprice" runat="server" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
 <script src='<%= ResolveUrl("~/chat/contents/js/jquery.quicksearch.js") %>'></script>
<script  type="text/javascript" >
    $.fn.stars = function() {
        return $(this).each(function() {

            var rating = $(this).data("rating");

            var numStars = $(this).data("numStars");

            var fullStar = new Array(Math.floor(rating + 1)).join('<i class="fa fa-star" style="color: #ff9900;"></i>');

            var halfStar = ((rating%1) !== 0) ? '<i class="fa fa-star-half-empty"></i>': '';

            var noStar = new Array(Math.floor(numStars + 1 - rating)).join('<i class="fa fa-star-o"></i>');

            $(this).html(fullStar + halfStar + noStar);

        });
    }

    $('.stars').stars();

    AccommodationScript = function () {
       // alert("here");
        $('#makkahAccommodation_list input').change(function () {
            //  alert("here")
            var makkahID = $(this).val();
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
            $("#Computed_amount")[0].innerText = price;
            document.getElementById('<%=hiddenprice.ClientID %>').value = price;
           // alert( document.getElementById('<%=hiddenprice.ClientID %>').value)
            //discount calculation
            discountPercent=0;
            textBoxDiscount = $("#discountValue")[0];
            if (textBoxDiscount != undefined)
            { discountPercent = textBoxDiscount.innerText; 
            discount = price - ((price * discountPercent) / 100);
            $("#DiscountAmount")[0].innerText = discount;
            document.getElementById('<%=hiddenprice.ClientID %>').value = discount;
        }
           // alert(discount)
        });

   

        $('#madinaAccommodation_list input').change(function () {
          //  alert("here");
            var madinaID = $(this).val();
           // alert(madinaID)
            var makkahID = $('#makkahAccommodation_list input:checked').val();
            var makkahAccom = $.grep(MakkahAccommodations, function (n, i) {
                return (n.id == makkahID);
            });
            var madinaAccom = $.grep(MadinaAccommodations, function (n, i) {
                return (n.id == madinaID);
            });
             price = PriceWithoutAccom;
           // alert(price);
            nightsInMakkah = $("#nights_inMakkah")[0].innerText;
            nightsInMadina = $("#nights_inMadina")[0].innerText;
            price = price+ (nightsInMakkah * makkahAccom[0].price) + (nightsInMadina * madinaAccom[0].price);
            $("#Computed_amount")[0].innerText = price;
            document.getElementById('<%=hiddenprice.ClientID %>').value = price;
           // alert(makkahAccom[0].price);
            //discount calculation
            discountPercent=0;
            textBoxDiscount = $("#discountValue")[0];
            if (textBoxDiscount != undefined)
            { discountPercent = textBoxDiscount.innerText; 
            discount = price - ((price * discountPercent) / 100);
            $("#DiscountAmount")[0].innerText = discount;
             document.getElementById('<%=hiddenprice.ClientID %>').value = discount;
        }
            // alert(discount)
        });

    }
    BindItenryScript = function()
    {
        //$("#myModal").addClass("in");
        //$("#myModal").css({ 'display': 'block' });
        $('#myModal').modal('show');

    }
    </script></asp:PlaceHolder>


<div class="col-md-12 search_result" style="margin-top: 15px; margin-bottom: 10px; padding:0;">
      <div id="search_result_hotel" class="big_detail">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
          <li role="presentation" class="active"><a href="#makkahImg" aria-controls="home" role="tab" data-toggle="tab">Makkah Hotel</a></li>
          <li role="presentation"><a href="#madinaImg" aria-controls="profile" role="tab" data-toggle="tab">Madina Hotel</a></li>
        </ul>

       <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="makkahImg">
            <div class="col-md-4" style="padding:0;">
                <asp:Image ID="hotelMakkah_img" runat="server" width="100%"  style="border-right:3px solid #e6e6e6;"/>
            </div>
          </div>
          <div role="tabpanel" class="tab-pane" id="madinaImg">
            <div class="col-md-4" style="padding:0;">
                <asp:Image ID="hotelMadina_img" runat="server" width="100%" style="border-right:3px solid #e6e6e6;"/>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-8">
           <h2 style="text-align:left;"><asp:Label ID="package_name" runat="server" ></asp:Label></h2>
        <div class="row">
          <div class="col-md-3">
              <h5 style="text-align:left;">Total Nights : </h5>
          </div>
          <div class="col-md-9 detail_package_detail">
             <h5> <asp:Literal ID="totelNights" runat="server"></asp:Literal> </h5>
          </div>
        </div>
        <div class="col-md-7" style="border:2px solid #e6e6e6;">

          <div class="row">
              <div class="col-md-12">
                  <div class="col-md-3">
                      <h5 style="text-align:left;">Stay At Madina : </h5>
                  </div>
                  <div class="col-md-8 detail_package_detail">
                       <h5><asp:Label ID="nights_inMadina" ClientIDMode="Static" runat="server" ></asp:Label> Nights</h5>
                  </div>
              </div>
          </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-3">
              <h5 style="text-align:left;">Madina Hotel : </h5>
            </div>
            <div class="col-md-9 detail_package_detail">
              <h5><asp:Literal ID="hotelName_madina" runat="server" ></asp:Literal></h5>
              <div class="col-md-4" style="padding:0;font-size: .8em;"><h3 style="font-size: .8em;"><asp:Label runat="server" id="hotelRating_madina" CssClass="stars"></asp:Label></h3></div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <h4><a style="font-weight:800; color:#871ec3;">Select Hotel</a></h4>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-3">
              <h5 style="text-align:left;">Room Type : </h5>
            </div>
            <div class="col-md-9 detail_package_detail">
                              <asp:RadioButtonList ID="madinaAccommodation_list"  CssClass="RadioButtonList"  ClientIDMode="Static" runat="server" DataTextField="Name" DataValueField="id" RepeatDirection="Horizontal"> </asp:RadioButtonList>
            </div>
          </div>
        </div>
        
      </div>
      <div class="col-md-7" style="border:2px solid #e6e6e6; margin-top:15px;">
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">
                    <h5 style="text-align:left;">Stay at Makkah : </h5>
                </div>
                <div class="col-md-8 detail_package_detail">
                       <h5> <asp:Label ID="nights_inMakkah" ClientIDMode="Static" runat="server"></asp:Label>  Nights</h5>
                </div>
            </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-3">
              <h5 style="text-align:left;">Makkah Hotel : </h5>
            </div>
            <div class="col-md-9 detail_package_detail">
              <h5><asp:Literal ID="hotelName_makkah" runat="server" ></asp:Literal></h5>
              <div  style="padding:0;font-size: .8em;" runat="server" id="star_div"><h6 style="font-size: .8em;"><asp:Label runat="server" ID="hotelRating_makkah"  CssClass="stars" data-rating='<%# Eval(" Hotel.rating") %>' data-num-stars='<%# Eval(" Hotel.rating") %>' ></asp:Label></h6></div>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <h4><a style="font-weight:800; color:#871ec3;">Select Hotel</a></h4>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="col-md-3">
              <h5 style="text-align:left;">Room Type : </h5>
            </div>
            <div class="col-md-9 detail_package_detail">
                            <asp:RadioButtonList ID="makkahAccommodation_list" ClientIDMode="Static" runat="server" DataTextField="Name" DataValueField="id" RepeatDirection="Horizontal"  CssClass="RadioButtonList"> </asp:RadioButtonList>
            </div>
          </div>
        </div>
       
      </div>




        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">
                    <h5 style="text-align:left;">Flight : </h5>
                </div>
                <div class="col-md-8 detail_package_detail">
                    <asp:Panel ID="oneWay_panel" runat="server" Visible="false">
                       <h4>Departure</h4>
                            <h5><asp:Literal ID="departureAirLine_name" runat="server"></asp:Literal></h5>
                            <h6><asp:Literal ID="depCities_lbl" runat="server"></asp:Literal> </h6>
                       <h4>Arrival</h4>
                            <h5><asp:Literal ID="returnAirLine_name" runat="server"></asp:Literal></h5>
                            <h6><asp:Literal ID="retCities_lbl" runat="server"></asp:Literal> </h6>
                    </asp:Panel>
                     <asp:Panel ID="roundTrip_panel" runat="server" Visible="false">
                            <h5> <asp:Literal ID="AirLine_name" runat="server"></asp:Literal></h5>
                            <h6><asp:Literal ID="cities_lbl" runat="server"></asp:Literal> </h6>
                    </asp:Panel>
                </div>
            </div>
        </div>
       
        <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">
                    <h5 style="text-align:left;">Original Price : </h5>
                </div>
                <div class="col-md-8 detail_package_detail">
                    <h4 >
                      <asp:Label ID="Computed_amount" runat="server" ClientIDMode="Static">--</asp:Label>  PKR
                    </h4>
                </div>
            </div>
        </div>
      
          <asp:Panel runat="server" ID ="Paneldiscount" Visible="false">
           <div class="row">
            <div class="col-md-12">
                <div class="col-md-3">
                    <h5 style="text-align:left;">Discount Price : </h5>
                </div>
                <div class="col-md-8 detail_package_detail">
                    <h3 style="font-weight:800; margin-top:5px;" >
                     <asp:Label ID="DiscountAmount" runat="server" ClientIDMode="Static"></asp:Label> PKR
                    </h3>
                    
                </div>
            </div>
        </div>
              </asp:Panel>
        <div class="row">
            <div class="col-md-3">
                           <asp:Button runat="server" ID="bookPackage" class="btn btn-primary" Text="Book Now" OnClick="bookPackage_Click"   ValidationGroup="bookInput"/>
            </div>
        </div>
        <div class="row" style="margin-top:15px; border-top:2px solid #e6e6e6; margin-bottom:15px;">
            <div class="col-md-9">
                <h5 style="text-align:left;">Want to Customize your trip?</h5>
                <div class="col-md-4" style="padding-left:0;">
                
                 <asp:LinkButton ID="cmdtripSelect" CssClass="btn btn-primary" runat="server" CausesValidation="False">Edit Trip Details</asp:LinkButton>
                                      <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="Button4" TargetControlID="cmdtripSelect" PopupControlID="popupPanel"></ajaxToolkit:ModalPopupExtender>
                                      <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width:1200px;height:70vh ">
                                         
                                             
                                           
                                          <asp:UpdatePanel runat="server" ID="updatePanel_main"  UpdateMode="Conditional" ChildrenAsTriggers="false" ><ContentTemplate>  
                                                 
                                                 <uc1:PackageItenryDetail runat="server" ID="PackageItenryDetail" OnMyEvents="myEvent_Raised" />
                                         <asp:Button ID="Button4" CssClass="btn btn-danger" runat="server" CausesValidation="false" Style="border-radius: 0px; position:absolute; top: 0px; right: 0px; " Text="X" OnClick="closeItenrtDetail" />
                                        </ContentTemplate>
                                                
                                             </asp:UpdatePanel> </asp:Panel>
                    </div>
            </div>
        </div>
      

       <asp:Panel ID="discountPanel" runat="server" Visible="false">
        
      <div class="banner">
        <h5>Book now for</h5>
        <div class="col-md-8" style="padding:0;">

          <h2><asp:Label ID="discountValue" runat="server" ClientIDMode="Static">0</asp:Label>%</h2>

        </div>
        <div class="col-md-3" style="padding:0;">

          <h5>OFF</h5>

        </div>

      </div>
      <div class="banner_bottom"></div>
        </asp:Panel>
    </div>