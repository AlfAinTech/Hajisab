<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HotelBasedPackages.ascx.cs" Inherits="UmrahComponents_PackageComponent_OfferedPackages_HotelBasedPackages" %>
<script>
    hiddenRating = "#<%= hiddentRatingType.ClientID%>";
    setClassHotel = function(value)
    {
        $("#hotel").addClass("active");
        $("#hotel_tab").addClass("active");
        $("#hotelPackagesList li").removeClass("active");
        $("#hotelPackagesList").find("#" + value + "").addClass("active");
        //$("#nightPackagesList li:first-child").addClass("active");
        //$("#BudgetPackagesList li:first-child").addClass("active");
        $(hiddenRating).val(value);
    }
    setFirstElementHotel = function () {
        $("#hotelPackagesList li:first-child").addClass("active");
        console.log($("#hotelPackagesList li:first-child"));
    }
   
</script>  
<asp:HiddenField ID="hiddentRatingType" runat="server" />
<div id="what_we_offer_tabs_inner">
                    <div class="col-md-3" style="padding:0;">
                      <!-- Nav tabs -->
                     
                        <ul class="nav nav-tabs nav-stacked" role="tablist" id="hotelPackagesList">
                           
                                   <li role="presentation" id="1"><asp:LinkButton   runat="server" id="Package_id"  OnClientClick="return HotelTypeSelected('1')" ><h2>Economy</h2><h6>Starting From</h6><h4>Rs <asp:Literal ID="EconomyPrice" runat="server"></asp:Literal></h4></asp:LinkButton></li>
                                 <li role="presentation" id="2"><asp:LinkButton   runat="server" id="LinkButton1"  OnClientClick="return HotelTypeSelected('2')"  ><h2>Budget</h2><h6>Starting From</h6><h4>Rs <asp:Literal ID="budgetPrcie" runat="server"></asp:Literal></h4></asp:LinkButton></li>
                               <li role="presentation" id="3"><asp:LinkButton   runat="server" id="LinkButton2"  OnClientClick="return HotelTypeSelected('3')" ><h2>Star</h2><h6>Starting From</h6><h4>Rs <asp:Literal ID="starPrcie" runat="server"></asp:Literal></h4></asp:LinkButton></li>
                                  
                        </ul>
                      
                     
                   
                </div>
                <div class="col-md-9" style="padding:0;">
                  <!-- Tab panes -->
                  <div class="tab-content">
                      
                          
                    <div role="tabpanel" class="tab-pane active" id='tabs'>
                        <div class="col-md-11" style="margin-right: auto; margin-left: auto; float: none;">
                            <script id="pkgTemplate" type="text/x-jquery-tmpl">

                                                                         
                            <div class="col-md-4">
                                <div class="col-md-12 what_we_offer_item">
                                    <div class="item_overlay">
                                        <div class="col-md-12" style="padding:0; margin-bottom: 5px;">
                                            <div class="col-md-6" style="padding:0">
                                                <div class="col-md-3" style="padding:0">
                                                    <img src="/UmrahComponents/Contents/img/two-passports.png" width="100%" />
                                                </div>
                                                <div class="col-md-9" style="padding:0;"><h6>${nightsInMakkah + nightsInMadina} Nights</h6></div>
                                            </div>
                                            <div class="col-md-6" style="padding:0">
                                                <div class="col-md-3" style="padding:0;">
                                                    <img src="/UmrahComponents/Contents/img/jahaz.png" width="100%" />
                                                </div>
                                                <div class="col-md-9" style="padding:0;"><h6>${airLineName}</h6></div>
                                            </div>
                                        </div>
                                        <div class="col-md-12" style="padding:0; margin-bottom: 5px;">
                                            <div class="col-md-6" style="padding:0">
                                                <div class="col-md-3" style="padding:0;">
                                                    <img src="/UmrahComponents/Contents/img/kaba-icon.png" width="100%" />
                                                </div>
                                                <div class="col-md-9" style="padding:0;"><h6>${nightsInMakkah} Nights</h6></div>
                                            </div>
                                            <div class="col-md-6" style="padding:0">
                                                <div class="col-md-3" style="padding:0;">
                                                    <img src="/UmrahComponents/Contents/img/madina-icon.png" width="100%" />
                                                </div>
                                                <div class="col-md-9" style="padding:0;"><h6>${nightsInMadina} Nights</h6></div>
                                            </div>
                                        </div>
                                        <div class="col-md-12" style="padding:0; margin-bottom: 5px;">
                                            <div class="col-md-2" style="padding:0;">
                                                <img src="/UmrahComponents/Contents/img/kaba-hotel-icon.png" width="100%" />
                                            </div>
                                            <div class="col-md-10" style="padding:0;"><h6>${makkahDistance} m</h6>
                                                <div class="col-md-12" style="padding: 0;min-height:11px" runat="server" id="star_div">
                                                        <h6 style="font-size: .8em;"><span class="stars" data-rating='${makkahRating}' data-num-stars='${madinaRating}'></span></h6>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12" style="padding:0; margin-bottom: 5px;">
                                            <div class="col-md-2" style="padding:0;">
                                                <img src="/UmrahComponents/Contents/img/madina-hotel-icon.png" width="100%" />
                                            </div>
                                            <div class="col-md-10" style="padding:0;"><h6>${madinaDistance} m</h6></div>
                                        </div>
                                        <div class="col-md-12" style="padding:0; margin-top: 5px;">
                                            <h3>${minRange}PKR</h3>
                                        </div>
                                        <div class="col-md-12" style="margin-top: 5px;">
                                           
                                            <asp:Button runat="server" id="book_bronze" CommandArgument="0"  Text="Book Now" class="btn btn-default"  OnClick="BookNowClicked" OnClientClick="return bindMyScript('${id}')" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </script>
                            <div class="Hotel_DetailList" id="Hotel_DetailList">

                            </div>

                           <%-- <asp:Repeater ID='Packages_DetailList' runat="server"><ItemTemplate>

                                                                         
                            <div class="col-md-4">
                                <div class="col-md-12 what_we_offer_item">
                                    <div class="item_overlay">
                                        <div class="col-md-12" style="padding:0; margin-bottom: 5px;">
                                            <div class="col-md-6" style="padding:0">
                                                <div class="col-md-3" style="padding:0">
                                                    <img src="/UmrahComponents/Contents/img/two-passports.png" width="100%" />
                                                </div>
                                                <div class="col-md-9" style="padding:0;"><h6><%# Eval("getTotelNights")+" Nights" %></h6></div>
                                            </div>
                                            <div class="col-md-6" style="padding:0">
                                                <div class="col-md-3" style="padding:0;">
                                                    <img src="/UmrahComponents/Contents/img/jahaz.png" width="100%" />
                                                </div>
                                                <div class="col-md-9" style="padding:0;"><h6><%# Eval("getairLine").ToString().Length > 10 ? Eval("getairLine").ToString().Substring(0,10)+"..." : Eval("getairLine") %></h6></div>
                                            </div>
                                        </div>
                                        <div class="col-md-12" style="padding:0; margin-bottom: 5px;">
                                            <div class="col-md-6" style="padding:0">
                                                <div class="col-md-3" style="padding:0;">
                                                    <img src="/UmrahComponents/Contents/img/kaba-icon.png" width="100%" />
                                                </div>
                                                <div class="col-md-9" style="padding:0;"><h6><%# Eval("nightsInMakkah")+" Nights" %></h6></div>
                                            </div>
                                            <div class="col-md-6" style="padding:0">
                                                <div class="col-md-3" style="padding:0;">
                                                    <img src="/UmrahComponents/Contents/img/madina-icon.png" width="100%" />
                                                </div>
                                                <div class="col-md-9" style="padding:0;"><h6><%# Eval("nightsInMadina")+" Nights" %></h6></div>
                                            </div>
                                        </div>
                                        <div class="col-md-12" style="padding:0; margin-bottom: 5px;">
                                            <div class="col-md-2" style="padding:0;">
                                                <img src="/UmrahComponents/Contents/img/kaba-hotel-icon.png" width="100%" />
                                            </div>
                                            <div class="col-md-10" style="padding:0;"><h6><%# Eval("Hotel1.distance").ToString() + " m" %></h6>
                                                <div class="col-md-12" style="padding: 0;min-height:11px" runat="server" id="star_div">
                                                        <h6 style="font-size: .8em;"><span class="stars" data-rating='<%# Eval(" Hotel1.rating") %>' data-num-stars='<%# Eval(" Hotel1.rating") %>'></span></h6>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12" style="padding:0; margin-bottom: 5px;">
                                            <div class="col-md-2" style="padding:0;">
                                                <img src="/UmrahComponents/Contents/img/madina-hotel-icon.png" width="100%" />
                                            </div>
                                            <div class="col-md-10" style="padding:0;"><h6><%# Eval("Hotel.distance").ToString()+ " m"%></h6></div>
                                        </div>
                                        <div class="col-md-12" style="padding:0; margin-top: 5px;">
                                            <h3><%# Eval("minRange")+" PKR" %></h3>
                                        </div>
                                        <div class="col-md-12" style="margin-top: 5px;">
                                            <asp:Button runat="server" id="book_bronze" CommandArgument='<%# Eval("id") %>' Text="Book Now" class="btn btn-default" OnClick="BookNowClicked"  />
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </ItemTemplate></asp:Repeater>--%>
                            <div class="col-md-12">
                                <div class="col-md-4" style="padding-top: 20px; margin-right: auto; margin-top:25px; margin-left: auto; float: none;">
                                    <asp:Button Text="Browse Packages" runat="server" ID="Explore"  OnClick="Explore_ButtonClicked" class="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>

<script type="text/javascript">
 

    function LoadHotelScript(type) {
       // alert("here i m start");
        data = jsondata;
        console.log(data);
        var x = $.grep(data, function (n, i) {
            return (n.makkahRating == type || n.madinaRating == type);
        }).slice(0, 3);
        console.log(x);
        $("#Hotel_DetailList")[0].innerHTML = "";
        $("#pkgTemplate").tmpl(x).appendTo("#Hotel_DetailList");
       
    }
    function HotelTypeSelected(type)
    {
        LoadHotelScript(type);
        setClassHotel(type);
        return false;
    }
</script>