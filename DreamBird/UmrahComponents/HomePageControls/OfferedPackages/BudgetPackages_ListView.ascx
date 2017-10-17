<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BudgetPackages_ListView.ascx.cs" Inherits="UmrahComponents_PackageComponent_OfferedPackages_BudgetPackages_ListView" %>
  <script src='<%= ResolveUrl("~/chat/contents/js/jquery.quicksearch.js") %>'></script>
<script src='<%= ResolveUrl("~/chat/contents/js/jquery.tmpl.min.js") %>'></script>
<script>
    $.fn.stars = function () {
        //window.alert("here");
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
    setClass = function(value)
    {
        $("#budget").addClass("active");
        $("#budget_tab").addClass("active");
        $("#BudgetPackagesList li").removeClass("active");
        $("#BudgetPackagesList").find("#" + value + "").addClass("active");
        //$("#nightPackagesList li:first-child").addClass("active");
        //$("#hotelPackagesList li:first-child").addClass("active");
        console.log("here come");
    }
</script>  
<asp:HiddenField ID="hiddenBudgetType" runat="server" />
<div id="what_we_offer_tabs_inner">
  
                    <div class="col-md-3" style="padding:0;">
                      <!-- Nav tabs -->
                      <ul class="nav nav-tabs nav-stacked" role="tablist" id="BudgetPackagesList"><%--CommandArgument="bronze" OnClick="PackageType_clicked" --%>
                          <li role="presentation" id="bronze"><asp:LinkButton   runat="server" id="Package_id"   OnClientClick="return LoadScript('bronze')"><h2>Bronze</h2><h6>Starting From</h6><h4>Rs 20,000</h4></asp:LinkButton></li>
                            <li role="presentation" id="silver"><asp:LinkButton   runat="server" id="LinkButton1"  OnClientClick="return LoadScript('silver')" ><h2>Silver</h2><h6>Starting From</h6><h4>Rs 20,000</h4></asp:LinkButton></li>
                            <li role="presentation" id="gold"><asp:LinkButton   runat="server" id="LinkButton2"  OnClientClick="return LoadScript('gold')"  ><h2>Gold</h2><h6>Starting From</h6><h4>Rs 20,000</h4></asp:LinkButton></li>

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
                                            <asp:Button runat="server" id="book_bronze"  OnClientClick="bindMyScript('${id}')" Text="Book Now" class="btn btn-default" OnClick="BookNowClicked"  />
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </script>
                            <div class="Packages_DetailList" id="Packages_DetailList">

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
                                                        <h6 style="font-size: .8em;"><span class="stars" data-rating='<%# Eval(" Hotel1.rating") %>' data-num-stars='<%# Eval(" Hotel1.rating") %>'>abc</span></h6>
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
 
    var hiddenID = "#<%= hiddenBudgetType.ClientID %>";
        
    function LoadScript(type) {
        console.log(hiddenID);
        data = jsondata;
        console.log(data);
        $(hiddenID).val(type);
        var x = $.grep(data, function (n, i) {
            return ( n.packageType == type);
        }).slice(0,3);
        console.log(x);
        $("#Packages_DetailList")[0].innerHTML = "";
        $("#pkgTemplate").tmpl(x).appendTo("#Packages_DetailList");
        setClass(type);
        return false;
        //exp = "n";
        //context_json = {};
       
    }
    function setCommand(id,mythis)
    {
        $(this).attr("CommandArgument", id);
        window.alert(id);
    }
</script>