<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NightBasedPackages.ascx.cs" Inherits="UmrahComponents_PackageComponent_OfferedPackages_NightBasedPackages" %>
<script>
    setNightClass = function (value)
    {
        $("#nights").addClass("active");
        $("#night_tab").addClass("active");
        $("#nightPackagesList li").removeClass("active");
        $("#nightPackagesList").find("#" + value + "").addClass("active");
        //$("#BudgetPackagesList li:first-child").addClass("active");
        //$("#hotelPackagesList li:first-child").addClass("active");
        //console.log("here come");
    }
    setFirstElementNight = function () {
        $("#nightPackagesList li:first-child").addClass("active");
    }
   
</script>  
<asp:HiddenField ID="hiddenNights" runat="server" />
<div id="what_we_offer_tabs_inner">
                    <div class="col-md-3" style="padding:0;">
                      <!-- Nav tabs -->
                     
                      <ul class="nav nav-tabs nav-stacked" role="tablist" id="nightPackagesList">
                                   <li role="presentation" id="10"><asp:LinkButton   runat="server" id="Package_id"  OnClientClick="return setNightPackage('10')" ><h2>10 Nights</h2></asp:LinkButton></li>
                           <li role="presentation" id="20"><asp:LinkButton   runat="server" id="LinkButton1" OnClientClick="return setNightPackage('20')"  ><h2>20 Nights</h2></asp:LinkButton></li>
                          <li role="presentation" id="30"><asp:LinkButton   runat="server" id="LinkButton2" OnClientClick="return setNightPackage('30')"  ><h2>30 Nights</h2></asp:LinkButton></li>
                              </ul>
                      
                     
                   
                </div>
                <div class="col-md-9" style="padding:0;">
                  <!-- Tab panes -->
                  <div class="tab-content">
                      
                          
                    <div role="tabpanel" class="tab-pane active" id='tabs'>
                        <div class="col-md-11" style="margin-right: auto; margin-left: auto; float: none;">
                        
                            <div class="Nights_DetailList" id="Nights_DetailList">
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
                                            <h3><%# Eval("minRange")+" PKR" %></h3>
                                        </div>
                                        <div class="col-md-12" style="margin-top: 5px;">
                                            <asp:Button runat="server" id="book_bronze"  OnClientClick="bindMyScript('${id}')" Text="Book Now" class="btn btn-default" OnClick="BookNowClicked"  />
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </script>
                            </div>
                          
                            <div class="col-md-12">
                                <div class="col-md-4" style="padding-top: 20px; margin-right: auto; margin-left: auto; float: none;">
                                    <asp:Button Text="Browse Packages" runat="server" ID="Explore"  OnClick="Explore_ButtonClicked" class="btn btn-primary" />
                                </div>
                            </div>

                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
<script type="text/javascript">
 

    function LoadNightScript(night) {
       // alert("here i m start");
        data = jsondata;
        var NoOfnights = parseInt(night)
        var x = $.grep(data, function (n, i) {
            return (n.duration <= NoOfnights && n.duration > (NoOfnights - 10));
        }).slice(0, 3);
        //console.log(x);
        $("#Nights_DetailList")[0].innerHTML = "";
        $("#pkgTemplate").tmpl(x).appendTo("#Nights_DetailList");
       
    }
    function setNightPackage(type)
    {
        LoadNightScript(type);
        setNightClass(type);
        return false;
    }
</script>
