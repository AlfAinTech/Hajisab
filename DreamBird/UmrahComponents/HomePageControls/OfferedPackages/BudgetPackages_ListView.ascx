<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BudgetPackages_ListView.ascx.cs" Inherits="UmrahComponents_PackageComponent_OfferedPackages_BudgetPackages_ListView" %>

<script>

    setClass = function(value)
    {
        $("#budget").addClass("active");
        $("#budget_tab").addClass("active");
        $("#BudgetPackagesList").find("#" + value + "").addClass("active");
        $("#nightPackagesList li:first-child").addClass("active");
        $("#hotelPackagesList li:first-child").addClass("active");
        console.log("here come");
    }
</script>  
<div id="what_we_offer_tabs_inner">
  
                    <div class="col-md-3" style="padding:0;">
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs nav-stacked" role="tablist" id="BudgetPackagesList">
                          <li role="presentation" id="bronze"><asp:LinkButton   runat="server" id="Package_id" CommandArgument="bronze" OnClick="PackageType_clicked" ><h2>Bronze</h2></asp:LinkButton></li>
                            <li role="presentation" id="silver"><asp:LinkButton   runat="server" id="LinkButton1" CommandArgument="silver" OnClick="PackageType_clicked" ><h2>Silver</h2></asp:LinkButton></li>
                            <li role="presentation" id="gold"><asp:LinkButton   runat="server" id="LinkButton2" CommandArgument="gold" OnClick="PackageType_clicked" ><h2>Gold</h2></asp:LinkButton></li>

                          </ul>
                        <%--  <asp:Repeater  runat="server" ID="budgetTypes_list">
                              <HeaderTemplate> <ul class="nav nav-tabs nav-stacked" role="tablist" id="BudgetPackagesList"></HeaderTemplate>
                              <ItemTemplate>
                                   <li role="presentation" id='<%# Eval("Key") %>'><asp:LinkButton   runat="server" id="Package_id" CommandArgument='<%# Eval("Key") %>'  OnClick="PackageType_clicked" Text='<%# "<h2 >"+Eval("Key")+"</h2>" %>'></asp:LinkButton></li>
                              </ItemTemplate>
                              <FooterTemplate> </ul></FooterTemplate>

                          </asp:Repeater>
                       --%>
                     
                   
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
                                            <div class="col-md-10" style="padding:0;"><h6><%# Eval("Hotel1.hotelName").ToString().Length > 10 ? Eval("Hotel1.hotelName").ToString().Substring(0,10)+"..." : Eval("Hotel1.hotelName") %></h6></div>
                                        </div>
                                        <div class="col-md-12" style="padding:0; margin-bottom: 5px;">
                                            <div class="col-md-2" style="padding:0;">
                                                <img src="/UmrahComponents/Contents/img/madina-hotel-icon.png" width="100%" />
                                            </div>
                                            <div class="col-md-10" style="padding:0;"><h6><%# Eval("Hotel.hotelName").ToString().Length > 10 ? Eval("Hotel.hotelName").ToString().Substring(0,10)+"..." : Eval("Hotel.hotelName") %></h6></div>
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
                                    <asp:Button Text="Learn More" runat="server" ID="Explore"  OnClick="Explore_ButtonClicked" class="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
            </div>
        
        </div>