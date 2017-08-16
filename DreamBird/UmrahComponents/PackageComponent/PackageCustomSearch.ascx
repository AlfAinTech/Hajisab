<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackageCustomSearch.ascx.cs" Inherits="UmrahComponents_PackageComponent_PackageCustomSearch" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/CustomTourPlan.ascx" TagPrefix="uc1" TagName="CustomTourPlan" %>

<script src="Contents/js/jquery.quicksearch.js"></script>
<script src="Contents/js/jquery.tmpl.min.js"></script>
<script type="text/javascript">
    var data;
    $(function () {
        data = jsondata;
           var x = $.grep(data, function( n, i ) {
                return (n && i<= 5) ;
           });
           //alert(x);
           console.log(x);
           var customers = x;
          $("#pkgTemplate").tmpl(customers).appendTo("#packages_data");
           //var price = $("input[id$='price_range']");
           //showToolTip(price);
          
    });
    
    
    var packages;
    function Search()
    {
        var table = $("#packages_data");
        table.html("");

        var price = $("input[id$='price_range']");
        var nights = $("input[id$='nights_total']");
        var visaTitle = $("select[id$='visa_list']");
        var hotel_rating = $("select[id$='hotel_rating']");
        var city = $("select[id$='departureCity']  option:selected").val();
        console.log(visaTitle.val());
        //alert(hotel_rating)
       // alert(visaTitle.selected)

        var x = $.grep(data, function (n, i) {
            return n.duration == nights.val() && n.totalAmount == price.val() && n.getVisaID == visaTitle.val() && n.rating == hotel_rating.val() && n.getDepCity == city;

        });

        totalX = x.length;
        if (totalX != 0)
        {
            var table = $("#packages_data");
            table.html("");
            $("#pkgTemplate").tmpl(x.slice(0, 5)).appendTo("#packages_data");
            return;
        }
        else {

            var x = $.grep(data, function (n, i) {
                return n.totalAmount <= price.val() || (n.duration == (nights.val() && n.getVisaID == visaTitle.val() && n.rating == hotel_rating.val() && n.getDepCity == city));

            });

        
        totalX = x.length;
        if (totalX <= 0) {

            var x = $.grep(data, function (n, i) {
                return n.totalAmount <= price.val() || n.duration == nights.val() || (n.getVisaID == visaTitle.val() && n.rating == hotel_rating.val() && n.getDepCity == city);

            });

        }
        totalX = x.length;
        if (totalX <= 0) {

            var x = $.grep(data, function (n, i) {
                return n.totalAmount <= price.val() || n.duration == nights.val() || n.getVisaID == visaTitle.val() || (n.rating == hotel_rating.val() && n.getDepCity == city);

            });

        }
        totalX = x.length;
        if (totalX <= 0) {

            var x = $.grep(data, function (n, i) {
                return n.totalAmount <= price.val() || n.duration == nights.val() || n.getVisaID == visaTitle.val() || n.rating == hotel_rating.val() && n.getDepCity == city;

            });

        }
        packages = x;
        console.log("here the code given")
        console.log(x);
        var table = $("#packages_data");
        table.html("");
        $("#warning_pkgTemplate").tmpl().appendTo("#packages_data");
        $("#related_pkgTemplate").tmpl(packages.slice(0, 3)).appendTo("#packages_data");
    }
    }
        
    function viewMorePackages()
    {
        var table = $("#packages_data");
        table.html("");
        $("#pkgTemplate").tmpl(packages).appendTo("#packages_data");
        return false;
    }
    function OpenBookingForm(current)
    {
        var pkgid = current.id;
        var url = "/UmrahComponents/booking_form.aspx?isCustomPackage=false&packageID=" + pkgid;
        //alert(url)
        window.location.href = url;
        return false;
    }
    function showToolTip(current)
    {
        var valshow = $("input[id$=price_range]").val();
           
            var lbl = $(".sliderLabel").text(valshow);
            var pct = (current.value - current.min) / (current.max - current.min);
            var px = ((current.clientWidth - 11) * pct) - ((lbl.width() - 10) / 2);
            lbl.css({ left: px });
      
        Search();
    }
</script>
 <script id="pkgTemplate" type="text/x-jquery-tmpl">
                               
                                    <div class="col-md-6">
                                    <div class="col-md-12" id="slider_widget_item">
                                        <div class="col-md-8" style="padding:0;">
                                        <h3 style="text-align: left; margin-top: 10px;" class="name">${name }</h3>
                                        <h5 style="text-align: left;" class="duration"> <asp:Label runat="server"  ID="nights"  />${duration} Nights</asp:Label> <asp:Label runat="server" ID="isairline"  /> ${isAirLineText} <asp:Label runat="server"  ID="isvisa"  >${isVisaText}</asp:Label> <asp:Label runat="server"  ID="Label1"  > +${rating}</asp:Label> Star Hotel</h5>
                                        </div>
                                        <div class="col-md-4" style="padding:0; float:right;">
                                            <h5 style="text-align: right;" class="price">PKR ${ totalAmount}</h5>
                                            <button class="btn btn-success"  onclick="return OpenBookingForm(this)" id="${ packageID }">Book Now</button>
                                        </div>
                                    </div>
                                    </div>
                                    </script>
 <script id="warning_pkgTemplate" type="text/x-jquery-tmpl">
     <div class="col-md-12" style="text-align:center"><h4 style="color:red">No item match your search</h4></div>
                                    <div class="col-md-12" style="text-align:center"><div class="col-md-3" style="text-align:center"><h3>Related Packages</h3></div></div>
     </script>
<script id="related_pkgTemplate" type="text/x-jquery-tmpl">
                                      
                                    <div class="col-md-6">
                                    <div class="col-md-12" id="slider_widget_item">
                                        <div class="col-md-8" style="padding:0;">
                                        <h3 style="text-align: left; margin-top: 10px;" class="name">${name }</h3>
                                        <h5 style="text-align: left;" class="duration"> <asp:Label runat="server"  ID="Label2"  />${duration} Nights</asp:Label> <asp:Label runat="server" ID="Label3"  /> ${isAirLineText} <asp:Label runat="server"  ID="Label4"  >${isVisaText}</asp:Label> <asp:Label runat="server"  ID="Label5"  > +${rating}</asp:Label> Star Hotel</h5>
                                        </div>
                                        <div class="col-md-4" style="padding:0; float:right;">
                                            <h5 style="text-align: right;" class="price">PKR ${ totalAmount}</h5>
                                            <button class="btn btn-warning"  onclick="return OpenBookingForm(this)" id="${ packageID }">Book Now</button>
                                        </div>
                                    </div>
                                    </div>
                                    </script>


<div class="slider_wrapper">
    <div class="container-fluid container">
        <div class="col-md-12" id="slider_widget">
            <div id="slider_tabs">

              <!-- Nav tabs -->
                <ul class="nav nav-tabs nav-jahanzaib" role="tablist" style="border:none;">
                    <li role="presentation" class="active"><a href="#budget" aria-controls="budget" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-usd" style="background-color: white; padding:3px; color:black; margin-right: 10px; border-radius: 50%;" aria-hidden="true"></span>Search From Your Budget</a></li>
                    <li role="presentation"><a href="#plantour" aria-controls="plantour" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-list-alt" style="margin-right: 10px;" aria-hidden="true"></span>Plan Your Own Tour</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="budget">
                    <div class="col-md-12" style="margin-top: 10px;">
                        <div class="col-md-3">
                        <h5>Select Starting Price</h5>
                            <div class="activityLevel">
                                 <span class="sliderLabel"></span>
                            <asp:TextBox type="range" runat="server" ID="price_range" class="form-control" name="price_range"    onchange="showToolTip(this)" ></asp:TextBox>
                        </div>
                            </div>
                        <div class="col-md-2">
                        <h5>Select Visit Month</h5>
                            <asp:DropDownList ID="visa_list" CssClass="form-control" runat="server" DataTextField="visaTitle" DataValueField="id" onchange="Search()"></asp:DropDownList>
                        </div>
                             
                        <div class="col-md-2">
                        <h5>Select City</h5>
                            <asp:DropDownList ID="departureCity" CssClass="form-control" runat="server"  onchange="Search()">
                                 <asp:ListItem Value="Lahore"  Selected="True">Lahore</asp:ListItem>
                                <asp:ListItem Value="Karachi">Karachi</asp:ListItem>
                                <asp:ListItem Value="Islamabad">Islamabad</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-2">
                        <h5>Number of Nights</h5>
                            <asp:TextBox ID="nights_total"  runat="server" type="number" class="form-control" name="" onchange="Search()">0</asp:TextBox>
                        </div>
                        <div class="col-md-2">
                        <h5>Select Hotel Rating</h5>
                            <asp:DropDownList ID="hotel_rating" runat="server" CssClass="form-control" onchange="Search()">
                                <asp:ListItem Value="1">Economy</asp:ListItem>
                                <asp:ListItem Value="3" Selected="True">3 Star</asp:ListItem>
                                <asp:ListItem Value="4">4 Star</asp:ListItem>
                                <asp:ListItem Value="5">5 Star</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div class="col-md-12" id="packages_data">
                     
                       
                          
                        
                    </div>
                   <div class="col-md-12">
                        <div class="col-md-3" style=" float:right; margin-top: 20px;">
                        <button class="btn btn-default" onclick="return viewMorePackages()"  >View More</button>
                        </div>
                    </div>
               </div>
                     <div role="tabpanel" class="tab-pane" id="plantour">
                         <%--<uc1:CustomTourPlan runat="server" id="CustomTourPlan" />--%>
                         <uc1:CustomTourPlan runat="server" ID="CustomTourPlan" />
                    </div>
                        </div>
                   
            </div>
        </div>
    </div>

</div>