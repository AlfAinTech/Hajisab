<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BestUmrahPackages.ascx.cs" Inherits="UmrahComponents_PackageComponent_BestUmrahPackages" %>


<div id="special_package_wrapper">
    <h3 style="margin-top:10px; margin-bottom:20px;">Our Best Packages</h3>
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
      <!-- Indicators -->
    <%--  <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>--%>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

       
                  <asp:Repeater ID="BetsPackages_list" runat="server" >
                       
                      <ItemTemplate>
                           <%#  Container.ItemIndex == 0 ?  "<div class='item active'>  <div class='container'> <div class='col-md-12' id='carousal_body'>" :" " %>
                        
                              <%#  Container.ItemIndex % 3 == 0 &&  Container.ItemIndex != 0 ?  "</div>  </div> </div><div class='item'>  <div class='container'> <div class='col-md-12'>":""
                              
                             %>
                       <div class="col-md-4">
                      <div class="col-md-12 slider_item">
                        <div class="row">
                            <div class="col-md-12" style="padding:0;">
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/UmrahComponents/Contents/img/two-passports.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding:0">
                                        <h6><asp:Label   runat="server" ID="totalNights" Text='<% # Eval("getTotelNights")+" Nights" %>'></asp:Label></h6>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/UmrahComponents/Contents/img/kaba-icon.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding:0">
                                        <h6><asp:Label   runat="server" ID="nightsInMakkah" Text='<%# Eval("nightsInMakkah")+" Nights" %>'></asp:Label></h6>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/UmrahComponents/Contents/img/madina-icon.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding:0">
                                        <h6><asp:Label   runat="server" ID="nightsInMadina" Text='<%# Eval("nightsInMadina")+" Nights" %>'></asp:Label></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12" style="padding:0;">
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/UmrahComponents/Contents/img/jahaz.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding:0">
                                        <h6><asp:Label   runat="server" ID="airLine" Text='<%# Eval("getairLine").ToString().Length > 10 ? Eval("getairLine").ToString().Substring(0,10)+"..." : Eval("getairLine") %>'></asp:Label></h6>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/UmrahComponents/Contents/img/kaba-hotel-icon.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding:0">
                                        <h6>
                                            <asp:Label   runat="server" ID="hotel_rating" Text='<% # int.Parse(Eval("Hotel1.rating").ToString())>2? Eval("Hotel1.rating").ToString()+" Star":"Economy" %>'></asp:Label>
                                       <asp:Label   runat="server" ID="hotelMakkah" Text='<% # Eval("Hotel1.distance").ToString()+ " m" %>'></asp:Label>
                                             </h6>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="col-md-3" style="padding:0">
                                        <img src="/UmrahComponents/Contents/img/madina-hotel-icon.png" width="100%">
                                    </div>
                                    <div class="col-md-9" style="padding:0">
                                        <h6><asp:Label   runat="server" ID="madinaRating" Text='<% # int.Parse(Eval("Hotel.rating").ToString())>2? Eval("Hotel.rating").ToString()+" Star":"Economy" %>'></asp:Label>

                                        <asp:Label   runat="server" ID="hotelMadina" Text='<%# Eval("Hotel.distance").ToString()+" m" %>'></asp:Label></h6>
                                    </div>
                                </div>
                            </div></div>
                            <div class="row">
                                <div class="col-md-12" style="padding:0; margin-top: 10px;">
                                    <div class="col-md-7">
                                        <h3><asp:Label   runat="server" ID="startPrice" Text='<%# Convert.ToDecimal( Eval("minAmount")).ToString("#,##0")+" PKR" %>'></asp:Label></h3>
                                    </div>
                                    <div class="col-md-5">
                                        <asp:Button runat="server" ID="bookNow"  CommandArgument='<%# Eval("id") %>'  class="btn btn-primary" Text="Book Now" OnClick="bookNowClick" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                         
                      </ItemTemplate>
                  </asp:Repeater>
                  </div>  </div> </div>
               </div>
            

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
</div>
