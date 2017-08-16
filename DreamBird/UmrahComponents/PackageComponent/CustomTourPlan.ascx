<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomTourPlan.ascx.cs" Inherits="UmrahComponents_PackageComponent_CustomTourPlan" %>
<script src="Contents/js/jquery.quicksearch.js"></script>
<script src="Contents/js/jquery.tmpl.min.js"></script>
<script type="text/javascript">
 
   
  </script>
<div class="col-md-12">
    <div class="tab-content">
     <div role="tabpanel" class="tab-pane active" id="month">
                            <div class="col-md-4" style="margin-right: auto; margin-left: auto; float: none; height: 350px; margin-top: 50px;" id="slider_widget_item">
                                <div class="col-md-3" style="margin-right: auto; margin-left: auto; float: none; margin-top: 50px;">
                                <img src="Contents/img/404-200.png" width="100%" />
                                </div>

                                <div class="col-md-10" style="margin-right: auto; margin-left: auto;  float: none; margin-top: 50px; margin-bottom: 15px; display: -webkit-box;">
                                <div class="col-md-12" style="background-color: rgba(0, 0, 0, .5);">
                                    <h4>Select the visit month</h4>
                                </div>
                                </div>
                                <div class="col-md-10" style="margin-right: auto; margin-left: auto; float: none; margin-top: 15px; margin-bottom: 15px; display: -webkit-box;">
                                <%--<input type="text" id="date" data-format="MM-YYYY" data-template="MMM YYYY" name="date" value="09-01-2013">--%>

                                    <asp:TextBox runat="server" ID="month_txt" type="month" class="form-control" name=""></asp:TextBox>
                                </div>
                                <div class="col-md-4" style="float:right; margin-top: 35px;">
                                    <asp:button class="btn btn-success" runat="server" ID="monthSelected" href="#makkahStay" aria-controls="budget" role="tab" data-toggle="tab" Text="Get Started" ></asp:button>
                                </div>
                            </div>
         </div>
    
         <div role="tabpanel" class="tab-pane" id="makkahStay">
                    <div class="col-md-12" style="margin-top: 40px; margin-bottom: 30px; padding-right: 100px; padding-left: 100px; display: -webkit-box;">
                                <div class="col-md-12" style="background-color: rgba(0, 0, 0, .5);">
                                    <h4>Stay in Makkah</h4>
                                </div>
                                </div>
                        <div class="col-md-12" style="padding-right: 30px; padding-left: 30px; ">
                            <div class="col-md-3">
                            <h5>Select Hotel Rating</h5>
                                 <asp:DropDownList  ID="starMakkah_list" CssClass="form-control" runat="server" onchange="selectHotelMakkah(this)" >
                                     <asp:ListItem Value="1">1 Star</asp:ListItem>
                                     <asp:ListItem Value="2">2 Star</asp:ListItem>
                                     <asp:ListItem Value="3">3 Stat</asp:ListItem>
                                     <asp:ListItem Value="4">4 Star</asp:ListItem>
                                     <asp:ListItem Value="5">5 Star</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                            <h5>Select Hotel</h5>
                                <asp:DropDownList  ID="hotelMakkah_list" CssClass="form-control" runat="server" onchange="selectRoomsMakkah(this)" DataTextField="hotelName" DataValueField="id" ></asp:DropDownList>
                                <input type='hidden' runat="server"  ID="hotelMakkahID" />
                                 </div>
                            <div class="col-md-3">
                            <h5>Select Room Type</h5>
                                <asp:DropDownList  ID="roomMakkah_list" CssClass="form-control" runat="server" onchange="showInfoMakkah(this)" DataTextField="Name" DataValueField="price" ></asp:DropDownList>
                                <input type='hidden' runat="server"  ID="roomMakkahID" />
                            </div>
                            <div class="col-md-3">
                            <h5>Number of Nights</h5>
                            <asp:TextBox runat="server" ID="nightsMakkah" type="number" class="form-control" name="" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-4" style="margin-top: 30px;">
                                <img src="Contents/img/hilton suites makkah-crop-u4775.jpg" width="100%">
                            </div>
                            <div class="col-md-4" style="margin-top: 30px;">
                                <img src="Contents/img/hotel pullman zamzam makkah-crop-u4681.jpg" width="100%">
                            </div>
                            <div class="col-md-4" style="margin-top: 30px; height: 157px; background-color: rgba(0, 0, 0, .5);">
                                <h3>
                                    <asp:Label ID="hotelMakkah_Name" runat="server" ></asp:Label></h3>
                                <h5>Rating: <asp:Label ID="starMakkah" runat="server"></asp:Label> Star</h5>
                                <h5>Minimum Rate: PKR <asp:Label ID="priceMakkah" runat="server" >0</asp:Label> Per Night</h5>
                                <h4><a href="#" >View More Detail</a></h4>
                            </div>
                            <div class="col-md-3" style="float:right; margin-top: 25px; padding:0;">
                                    <asp:button class="btn btn-success" runat="server" ID="hotelmakkahSelected" href="#madinaStay" aria-controls="budget" role="tab" data-toggle="tab" Text="Go Ahead" ></asp:button>
                            </div>
                        </div>
                    </div>

         <div role="tabpanel" class="tab-pane" id="madinaStay">
                    <div class="col-md-12" style="margin-top: 40px; margin-bottom: 30px; padding-right: 100px; padding-left: 100px; display: -webkit-box;">
                                <div class="col-md-12" style="background-color: rgba(0, 0, 0, .5);">
                                    <h4>Stay in Madina</h4>
                                </div>
                                </div>
                        <div class="col-md-12" style="padding-right: 30px; padding-left: 30px; ">
                            <div class="col-md-3">
                            <h5>Select Hotel Rating</h5>
                                 <asp:DropDownList ClientIDMode="Static" ID="starMadina_list" CssClass="form-control" runat="server" onchange="selectHotelMadina(this)" >
                                     <asp:ListItem Value="1">1 Star</asp:ListItem>
                                     <asp:ListItem Value="2">2 Star</asp:ListItem>
                                     <asp:ListItem Value="3">3 Stat</asp:ListItem>
                                     <asp:ListItem Value="4">4 Star</asp:ListItem>
                                     <asp:ListItem Value="5">5 Star</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-3">
                            <h5>Select Hotel</h5>
                                <asp:DropDownList ID="hotelMadina_list" CssClass="form-control" runat="server" onchange="selectRoomsMadina(this)" DataTextField="hotelName" DataValueField="id" ></asp:DropDownList>
                                <input type='hidden' runat="server"  ID="hotelMadinaID" />
                            </div>
                           
                            <div class="col-md-3">
                            <h5>Select Room Type</h5>
                                <asp:DropDownList ID="roomMadina_list" CssClass="form-control" runat="server" onchange="showInfoMadina(this)" DataTextField="Name" DataValueField="price" ></asp:DropDownList>
                                <input type='hidden' runat="server"  ID="roomMadinaID" />
                            </div>
                            <div class="col-md-3">
                            <h5>Number of Nights</h5>
                            <asp:TextBox runat="server" ID="nights_madina" type="number" class="form-control" name="" Text="0"></asp:TextBox>
                            </div>
                            <div class="col-md-4" style="margin-top: 30px;">
                                <img src="Contents/img/hilton suites makkah-crop-u4775.jpg" width="100%">
                            </div>
                            <div class="col-md-4" style="margin-top: 30px;">
                                <img src="Contents/img/hotel pullman zamzam makkah-crop-u4681.jpg" width="100%">
                            </div>
                            <div class="col-md-4" style="margin-top: 30px; height: 157px; background-color: rgba(0, 0, 0, .5);">
                                <h3>
                                    <asp:Label ID="hotelMadina_Name" runat="server" ></asp:Label></h3>
                                <h5>Rating: <asp:Label ID="starMadina" runat="server"></asp:Label> Star</h5>
                                <h5>Minimum Rate: PKR <asp:Label ID="priceMadina" runat="server" >0</asp:Label> Per Night</h5>
                                <h4><a href="#" >View More Detail</a></h4>
                            </div>
                            <div class="col-md-3" style="float:right; margin-top: 25px; padding:0;">
                                    <asp:button class="btn btn-success" runat="server" ID="selectMadina" href="#airLine_select" aria-controls="budget" role="tab" data-toggle="tab" Text="Go Ahead" ></asp:button>
                            </div>
                        </div>
                  </div>
        <div role="tabpanel" class="tab-pane" id="airLine_select">
                    <div class="col-md-12" style="margin-top: 40px; margin-bottom: 30px; padding-right: 100px; padding-left: 100px; display: -webkit-box;">
                                <div class="col-md-12" style="background-color: rgba(0, 0, 0, .5);">
                                    <h4>Select Airline to Travel</h4>
                                </div>
                                </div>
                        <div class="col-md-12" style="padding-right: 30px; padding-left: 30px; ">
                            <div class="col-md-4">
                                <div class="col-md-6">
                                <h3><input type="checkbox" runat="server" ID="oneWay_chk" onchange="oneWayChanged(this)" checked="checked"  />One Way </h3>
                                </div>
                                <div class="col-md-6">
                                <h3><input type="checkbox" runat="server" ID="roundTrip_chk" onchange="roundTripChanged(this)" />Round trip <input type='hidden' runat="server"  value="false" ID="isRoundTrip" /></h3>
                                
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="padding-right: 30px; padding-left: 30px; ">
                              <asp:Panel ID="roundTrip_panel" runat="server" style="display:none">
                                <div class="col-md-6">
                                <h5>Select Airline</h5>
                                    <asp:DropDownList ID="airLine_list" CssClass="form-control" runat="server"  DataTextField="Name" DataValueField="id" onchange="AirLineChange(this)" ></asp:DropDownList>
                                    <input type='hidden' runat="server"  ID="airLineID" >
                                </div>
                                  <div class="row">
                                      <div class="col-md-6">
                                        <h5>Select Flight</h5>
                                        <asp:DropDownList ID="flight_list" CssClass="form-control" runat="server"  DataTextField="Name" DataValueField="id" onchange="FlightChange(this)" ></asp:DropDownList>
                                        <input type='hidden' runat="server"  ID="flight_id" >
                                </div>
                                  </div>
                                  </asp:Panel>
                            <asp:Panel ID="oneWay_panel" runat="server">
                                <div class="col-md-6">
                                <h5>Select Departure Airline</h5>
                                     <asp:DropDownList ID="departureAirLine_list" CssClass="form-control" runat="server"  DataTextField="Name" DataValueField="id" onchange="depAirLineChange(this)" ></asp:DropDownList>
                                       <input type='hidden' runat="server"  ID="depAirLinID" >
                                </div>
                                <div class="col-md-6">
                                <h5>Select Return Airline</h5>
                                    <asp:DropDownList ID="returnAirLine_list" CssClass="form-control" runat="server"  DataTextField="Name" DataValueField="id" onchange="retAirLineChange(this) "></asp:DropDownList>
                                    <input type='hidden' runat="server"  ID="retAirLineID" >
                                </div>
                         <div class="row">
                             <div class="col-md-6">
                            <h5>Select Departure Flight</h5>
                                 <asp:DropDownList ID="depFlight_list" CssClass="form-control" runat="server"  DataTextField="Name" DataValueField="id" onchange="depFlightChange(this)" ></asp:DropDownList>
                                        <input type='hidden' runat="server"  ID="depFlight_id" >
                            </div>
                            <div class="col-md-6">
                            <h5>Select Return Flight</h5>
                                <asp:DropDownList ID="retFlight_list" CssClass="form-control" runat="server"  DataTextField="Name" DataValueField="id" onchange="retFlightChange(this)" ></asp:DropDownList>
                                        <input type='hidden' runat="server"  ID="retFlight_id" >
                            </div>
                             </div>
                             </asp:Panel>
                            </div>
                            <div class="col-md-12">
                            <div class="col-md-3" style="float:right; margin-top: 50px; padding:0;">
                                <asp:button class="btn btn-success" runat="server" ID="airline_btn" href="#totalbudget"   aria-controls="budget" role="tab" data-toggle="tab" Text="Finalize Your Order" ></asp:button>   
                            </div></div>
                        </div>
        <div role="tabpanel" class="tab-pane" id="totalbudget">
                    <div class="col-md-12" style="margin-top: 40px; margin-bottom: 30px; padding-right: 100px; padding-left: 100px; display: -webkit-box;">
                                <div class="col-md-12" style="background-color: rgba(0, 0, 0, .5);">
                                    <h4>Finalize your Order</h4>
                                </div>
                                </div>
                        <div class="col-md-12" style="padding-right: 30px; padding-left: 30px; ">
                           <h1 style="text-align: center; color: white;">Total Amount
                               <asp:Label ID="totalamount" runat="server" >0</asp:Label></h1>
                           <h3 style="text-align: center; color: white;">View Order Summary and Provide additional info</h3>
                        </div>
                            <div class="col-md-12">
                            <div class="col-md-3" style="float:none; margin-right: auto; margin-left: auto; margin-top: 50px; padding:0;">
                                <asp:Button runat="server" ID="saveCustometour" class="btn btn-success" Text="Finalize Your Order" OnClick="saveCustomTour_Click"/>
                            </div></div>
                        </div>
     </div> </div>

                       