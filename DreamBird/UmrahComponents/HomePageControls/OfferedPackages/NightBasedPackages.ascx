<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NightBasedPackages.ascx.cs" Inherits="UmrahComponents_PackageComponent_OfferedPackages_NightBasedPackages" %>
<script>
    setNightClass = function (value)
    {
        $("#nights").addClass("active");
        $("#night_tab").addClass("active");
        $("#nightPackagesList").find("#" + value + "").addClass("active");
        $("#BudgetPackagesList li:first-child").addClass("active");
        $("#hotelPackagesList li:first-child").addClass("active");
        console.log("here come");
    }
   
</script>  
<div id="what_we_offer_tabs_inner">
                    <div class="col-md-3" style="padding:0;">
                      <!-- Nav tabs -->
                     
                      <ul class="nav nav-tabs nav-stacked" role="tablist" id="nightPackagesList">
                                   <li role="presentation" id="10"><asp:LinkButton   runat="server" id="Package_id" CommandArgument="10"  OnClick="PackageType_clicked" ><h2>10 Nights</h2></asp:LinkButton></li>
                           <li role="presentation" id="20"><asp:LinkButton   runat="server" id="LinkButton1" CommandArgument="20"  OnClick="PackageType_clicked" ><h2>20 Nights</h2></asp:LinkButton></li>
                          <li role="presentation" id="30"><asp:LinkButton   runat="server" id="LinkButton2" CommandArgument="30"  OnClick="PackageType_clicked" ><h2>30 Nights</h2></asp:LinkButton></li>
                              </ul>
                      
                     
                   
                </div>
                <div class="col-md-9" style="padding:0;">
                  <!-- Tab panes -->
                  <div class="tab-content">
                      
                          
                    <div role="tabpanel" class="tab-pane active" id='tabs'>
                        <div class="col-md-11" style="margin-right: auto; margin-left: auto; float: none;">
                            <asp:Repeater ID='Packages_DetailList' runat="server"><ItemTemplate>

                                                                         
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
                                            <div class="col-md-10" style="padding:0;"><h6><%# Eval("Hotel1.distance").ToString() + "Meters" %></h6></div>
                                        </div>
                                        <div class="col-md-12" style="padding:0; margin-bottom: 5px;">
                                            <div class="col-md-2" style="padding:0;">
                                                <img src="/UmrahComponents/Contents/img/madina-hotel-icon.png" width="100%" />
                                            </div>
                                            <div class="col-md-10" style="padding:0;"><h6><%# Eval("Hotel.hotelName").ToString() + "Meters" %></h6></div>
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
                                </ItemTemplate></asp:Repeater>
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