
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackageListView.ascx.cs" Inherits="UmrahComponents_PackageComponent_PackageListView" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<script>
    $.fn.stars = function() {
        return $(this).each(function() {

            var rating = $(this).data("rating");

            var numStars = $(this).data("numStars");

            var fullStar = new Array(Math.floor(rating + 1)).join('<i class="fa fa-star"></i>');

            var halfStar = ((rating%1) !== 0) ? '<i class="fa fa-star-half-empty"></i>': '';

            var noStar = new Array(Math.floor(numStars + 1 - rating)).join('<i class="fa fa-star-o"></i>');

            $(this).html(fullStar + halfStar + noStar);

        });
    }

    $('.stars').stars();
    </script>

  <div class="col-md-12">
        <div class="col-md-6" style="padding-top:10px">
            <h4 style="color:black"><asp:Label ID="package_found" runat="server"></asp:Label><asp:Label ID="packageDisplay" runat="server" ></asp:Label></h4>
        </div>
         <div class="col-md-6" style="padding-top:10px">
            <div class="col-md-6"  >
                <h4 style="float: right;color:black">Sort By</h4>
            </div>
              <div class="col-md-6">
             <asp:DropDownList ID="sortingList" runat="server" CssClass="form-control" OnSelectedIndexChanged="sortingList_SelectedIndexChanged" AutoPostBack="True">
                 <asp:ListItem Value="minAmount" Selected="True" >Budget</asp:ListItem>
                 <asp:ListItem Value="duration" >Duration</asp:ListItem>
                 <asp:ListItem Value="getVisaMonth">Visa Month</asp:ListItem>
             </asp:DropDownList>
                 </div>
         </div>
            </div>
     <asp:Repeater ID="package_list" runat="server">
         <ItemTemplate>
<div class="col-md-3 featured_package tint"   style='background-image: url(<%# Eval("Dream.mediaItem.pathOriginal") %> );'>
<div class="col-md-12">
<div class="package_title">
    <h4><%# Eval("Dream.DreamName") %></h4></div>
    <h4><%# "PKR "+Eval("minAmount")+"-"+Eval("maxAmount")  %></h4>
    <div class="package_title" style="margin-top: 7px; height:150px;">
        <div class="col-md-12" style=" margin-top: 5px;">
            <div class="col-md-2" style="padding:0">
                <img src='<%# Eval(" Hotel1.mediaItem.pathOriginal") %>' width="100%">
            </div>
            <div class="col-md-10" style="padding-right:0">
            <h5><%# Eval(" Hotel1.hotelName") %></h5>
            <div class="col-md-4" style="padding:0;"><h6 style="font-size: .8em;"><span class="stars" data-rating='<%# Eval(" Hotel1.rating") %>' data-num-stars='<%# Eval(" Hotel1.rating") %>' ></span></6></div>
            <div class="col-md-4" style="padding:0"><h6><%# Eval(" nightsInMakkah")+" Nights" %></h6></div>
            <div class="col-md-4" style="padding:0"><h6><%# Eval(" Hotel1.distance")+" Km" %></h6></div>
            
            </div>
            </div>
            <div class="col-md-12" style=" margin-top: 5px;">
            <div class="col-md-2" style="padding:0">
                <img src='<%# Eval("Hotel.mediaItem.pathOriginal") %>' width="100%">
            </div>
            <div class="col-md-10" style="padding-right:0">
            <h5><%# Eval(" Hotel.hotelName") %></h5>
            <div class="col-md-4" style="padding:0;" runat="server" id="star_div"><h6 style="font-size: .8em;"><span class="stars" data-rating='<%# Eval(" Hotel.rating") %>' data-num-stars='<%# Eval(" Hotel.rating") %>' ></span></h6></div>
            <div class="col-md-4" style="padding:0"><h6><%# Eval(" nightsInMadina")+" Nights" %></h6></div>
            <div class="col-md-4" style="padding:0"><h6><%# Eval(" Hotel.distance")+" Km" %></h6></div>
            </div>
        </div>
        <div class="col-md-12" style="padding:0; margin-top: 5px;">
                <div class="col-md-3">
                    <asp:Image runat="server" Visible='<%# Eval(" isAirLineAvailable") %>' ID="airline_chk"  src='/UmrahComponents/Contents/img/airline.png' width="100%"/>
                </div>
                <div class="col-md-3">
                    <asp:Image runat="server" Visible='<%# Eval(" isTransportAvailable") %>' ID="transport_chk" src='/UmrahComponents/Contents/img/transport.png' width="100%"/>
                </div>
                <div class="col-md-3">
                    <asp:Image runat="server" Visible='<%# Eval(" isVisaAvailable") %>' ID="visa_chk" src='/UmrahComponents/Contents/img/vissa.png' width="100%"/>
                </div>
                <div class="col-md-3">
                    <asp:Image runat="server" Visible='<%# Eval(" isZiaratAvailable") %>' ID="ziarat_chk" src='/UmrahComponents/Contents/img/mosque.png' width="100%"/>
                </div>
            
            </div>
            <div class="col-md-12" style="margin-top: 20px;">
            <asp:Button  ID="bookNow_btn" runat="server" OnClick="PackageBookNow" CommandArgument='<%# Eval("id") %>' class="btn btn-success" style="width:100%;" Text="Book Now" />
            </div>
    </div>
</div>
</div>
             </ItemTemplate>
         
         <FooterTemplate>
             <div class="col-md-12" style="text-align: center;">
                                <h2>
             <asp:LinkButton ID="LoadMOre" runat="server" Text="Load More"  OnClick="LoadMore_clicked"/></h2></div>
         </FooterTemplate>
     </asp:Repeater>