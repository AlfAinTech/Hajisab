<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackagePageDetail.ascx.cs" Inherits="UmrahComponents_PackageComponent_PackagePageDetail" %>

<link href="../../UmrahComponents/Contents/css/style1.css" rel="stylesheet" />
<div class="panel panel-primary" id="package_detail">
              <div class="panel-heading">
                <h3 class="panel-title" style="color: white;text-align: center; margin: 0px;">Package Detail</h3>
            </div>
            <div class="panel-body">
              <div class="col-md-12" style="padding:0;">
                <div class="col-md-7">
                    <div class="col-md-12" style=" margin-top: 5px;">
                        <div class="col-md-2" style="padding:0">
                            <asp:Image ID="hotelMakkah_img" runat="server" width="100%"/>
                        </div>
                        <div class="col-md-10" style="padding-right:0">
                            <h3> <asp:Label ID="hotelName_makkah" runat="server" ></asp:Label></h3>
                            <div class="col-md-4" style="padding:0;"><h4 style="font-size: .8em;"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span></h4></div>
                            <div class="col-md-4" style="padding:0"><h4>
                                <asp:Label ID="nights_inMakkah" runat="server"></asp:Label> Nights</h4></div>
                            <div class="col-md-4" style="padding:0"><h4><asp:Label ID="distance_makkah" runat="server"></asp:Label>km</h4></div>
                            <div class="col-md-3"><img src="../../UmrahComponents/Contents/img/46-200.png" width="100%"></div>
                            <div class="col-md-3"><img src="../../UmrahComponents/Contents/img/46-200.png" width="100%"></div>
                            <div class="col-md-3"><img src="../../UmrahComponents/Contents/img/46-200.png" width="100%"></div>


                        </div>
                    </div>
                    <div class="col-md-12" style=" margin-top: 5px;">
                        <div class="col-md-2" style="padding:0">
                            <asp:Image ID="hotelMadina_img" runat="server"  width="100%"/>
                        </div>
                        
                        <div class="col-md-10" style="padding-right:0">
                            <h3><asp:Label ID="hotelName_madina" runat="server" ></asp:Label></h3>
                            <div class="col-md-4" style="padding:0;"><h3 style="font-size: .8em;"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span></h3></div>
                            <div class="col-md-4" style="padding:0"><h4><asp:Label ID="nights_inMadina" runat="server" ></asp:Label>Nights</h4></div>
                            <div class="col-md-4" style="padding:0"><h4><asp:Label ID="distance_madina" runat="server" ></asp:Label> km</h4></div>
                            <div class="col-md-3"><img src="../../UmrahComponents/Contents/img/46-200.png" width="100%"></div>
                            <div class="col-md-3"><img src="../../UmrahComponents/Contents/img/46-200.png" width="100%"></div>
                            <div class="col-md-3"><img src="../../UmrahComponents/Contents/img/46-200.png" width="100%"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="col-md-2" style="padding:0">
                        <img src="../../UmrahComponents/Contents/img/airline.jpg" width="100%">
                    </div>
                    <asp:Panel ID="oneWay_panel" runat="server" Visible="false">
                        <div class="col-md-10" style="padding-right:0">
                            <h4>
                                <asp:Label ID="departureAirLine_name" runat="server"></asp:Label></h4>
                                <h5>Economy Class</h5>
                            <h5><asp:Label ID="depcities_lbl" runat="server"></asp:Label></h5>
                             <h4>
                                <asp:Label ID="returnAirLine_name" runat="server"></asp:Label></h4>
                            <h5>Economy Class</h5>
                            <h5><asp:Label ID="returncities_lbl" runat="server"></asp:Label></h5>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="roundTrip_panel" runat="server" Visible="false">
                        <div class="col-md-10" style="padding-right:0">
                            <h4>
                                <asp:Label ID="AirLine_name" runat="server"></asp:Label></h4>
                            <h5>Economy Class</h5>
                            <h5><asp:Label ID="cities_lbl" runat="server"></asp:Label></h5>
                        </div>
                    </asp:Panel>
                    <div class="col-md-2" style="padding:0">
                        Budget Range
                    </div>
                    <div class="col-md-10" style="padding-right:0">
                        <h4><asp:Label ID="amount_lbl" runat="server"></asp:Label></h4>
                    </div>
                </div>
            </div>
            <div>

              <!-- Nav tabs -->
              <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab" style="color:black;"><asp:Label ID="hotelNameMakkah" runat="server"></asp:Label></a></li>
                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" style="color:black;"><asp:Label ID="hotelNameMadina" runat="server"></asp:Label></a></li>
                <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab" style="color:black;">Other Details</a></li>
            </ul>

            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home" style="padding:20px;">
                    <asp:Repeater ID="facilitiesMakkah_list" runat="server">
                        <ItemTemplate>
                            
                            <asp:Image  ID="facility_img" ImageUrl='<% # Eval("MediaItem.Path100") %>' runat="server" />
                                
                        </ItemTemplate>
                    </asp:Repeater>
                       

                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                      <!-- Indicators -->
                      <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                 
                         <asp:Repeater ID="hotelMakkahImages_list" runat="server">
                        <ItemTemplate>
                            <div class=' <%# "item"+Eval("ClassActive")  %>'>
                              <asp:Image ID="imagemadinaitem" runat="server"  ImageUrl='<%# Eval("MediaItem.pathOriginal") %>' width="100%" alt="..."/>
                              <div class="carousel-caption">
                                        <%# Eval("Hotel.hotelName") %>
                                </div>
                                </div>
                            </ItemTemplate></asp:Repeater>
        
                   
                Hotel Image Gallery
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
        <h3 style="margin-top: 20px;">Hotel Directions</h3>
        <img src="../../UmrahComponents/Contents/img/map.png" width="100%">
    </div>
    <div role="tabpanel" class="tab-pane" id="profile" style="padding:20px;">
         <asp:Repeater ID="facilitiesMadina_list" runat="server">
                        <ItemTemplate>
                            <asp:Image  ID="facility_img_madina" ImageUrl='<% # Eval("MediaItem.Path100") %>' runat="server" />
                        </ItemTemplate>
                    </asp:Repeater>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <!-- Indicators -->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <asp:Repeater ID="imagesMadina_list" runat="server">
                        <ItemTemplate>
                            <div class=' <%# "item"+Eval("ClassActive")  %>'>
                              <asp:Image ID="imagemadinaitem" runat="server"  ImageUrl='<%# Eval("MediaItem.pathOriginal") %>' width="100%" alt="..."/>
                              <div class="carousel-caption">
                                        <%# Eval("Hotel.hotelName") %>
                                </div>
                                </div>
                            </ItemTemplate></asp:Repeater>
        
    Hotel Image Gallery
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
<h3 style="margin-top: 20px;">Hotel Directions</h3>
<img src="../../UmrahComponents/Contents/img/map.png" width="100%"></div>
<div role="tabpanel" class="tab-pane" id="messages">...</div></div>
</div>

</div>
</div>
