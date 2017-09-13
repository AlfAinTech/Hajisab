<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookingConfirmation.ascx.cs" Inherits="UmrahComponents_AdminControls_Booking_BookingConfirmation" %>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<div class="col-md-12">
    	<div class="col-md-6">
    		<asp:TextBox  runat="server" ID="TrackingId" class="form-control" placeholder="Tracking ID"></asp:TextBox>
          
    	    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TrackingId" ErrorMessage="*" ForeColor="Red" Font-Size="30pt"></asp:RequiredFieldValidator>
          
    	</div>
    <div class="col-md-6">
        <asp:Button ID="submit"  CssClass="btn btn-primary" runat="server" Text="Search" OnClick="submit_Click" />
    	</div>
    </div>
      <%-- Booking Package Detail --%> 
    <div class="col-md-12" runat="server" id="Divdetail" style="display:none">
              <h4 style="text-align:center;">Package Detail</h4>
              <div class="col-md-10" style="margin-right:auto; margin-left:auto; float:none; border:2px solid #e6e6e6; padding:15px;">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4 detail_package_name">
                            <h5>Madina Hotel : </h5>
                        </div>
                        <div class="col-md-8 detail_package_detail">
                            <h5><asp:Label ID="hotelName_madina" runat="server" ></asp:Label></h5>
                              <div class="col-md-12" style="padding:0;font-size: .8em;" runat="server" id="Div1"><asp:Label ID="hotelRating_madina" runat="server" class="stars"  ></asp:Label></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4 detail_package_name">
                            <h5>Makkah Hotel : </h5>
                        </div>
                        <div class="col-md-8 detail_package_detail">
                            <h5><asp:Label ID="hotelName_makkah" runat="server" ></asp:Label></h5>
                            <div class="col-md-12" style="padding:0;font-size: .8em;" runat="server" id="star_div"><asp:Label ID="hotelRating_makkah" runat="server" class="stars"  ></asp:Label></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4 detail_package_name">
                            <h5>No. of Nights : </h5>
                        </div>
                        <div class="col-md-8 detail_package_detail">
                            <h5><asp:Label ID="totelNights" runat="server"></asp:Label></h5>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4 detail_package_name">
                            <h5>Stay At Makka : </h5>
                        </div>
                        <div class="col-md-8 detail_package_detail">
                            <h5> <asp:Label ID="nights_inMakkah" runat="server"></asp:Label> Nights</h5>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4 detail_package_name">
                            <h5>Stay at Madina : </h5>
                        </div>
                        <div class="col-md-8 detail_package_detail">
                            <h5><asp:Label ID="nights_inMadina" runat="server" ></asp:Label> Nights</h5>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4 detail_package_name">
                            <h5>Flight : </h5>
                        </div>
                        <div class="col-md-8 detail_package_detail">
                                    <asp:Panel ID="oneWay_panel" runat="server" Visible="false">
                                        <h5><asp:Label ID="departureAirLine_name" runat="server"></asp:Label>-<asp:Label ID="returnAirLine_name" runat="server"></asp:Label></h5>
                                    </asp:Panel>

                                    <asp:Panel ID="roundTrip_panel" runat="server" Visible="false">
                                             <h5> <asp:Label ID="AirLine_name" runat="server"></asp:Label></h5>
                                    </asp:Panel>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12" style="margin-top:20px;">
                      <h5 style="text-align:center;">Grand Total</h5>
                      <h2 style="text-align:center; font-weight:800;"> <asp:Label ID="Computed_amount" runat="server"></asp:Label> PKR</h2>
                    </div>
                </div>
              
        <div class="row">
            
             <h4>Passengers</h4>
          <div class="col-md-12">
          <div class="col-md-4">
          <h5>Adults</h5>
                   <asp:TextBox runat="server" ID="adults_no" class="form-control" name="" ReadOnly="true" Text="0"/>
                 
        </div>
         <div class="col-md-4">
          <h5>Children</h5>
                   <asp:TextBox  runat="server" ID="children_no" class="form-control" ReadOnly="true"  name="" Text="0"/>
                     
        </div>
           <div class="col-md-4">
          <h5>Infants</h5>
                   <asp:TextBox  runat="server" ID="infant_no" class="form-control" name="" ReadOnly="true" Text="0"/>
                     
        </div>
              </div>
        </div>
        <div class="row" style="margin-top:10px">
                   <asp:Button runat="server" ID="saveUser" class="btn btn-primary" style="width:100%" Text="Payment Confirm" OnClick="saveUser_Click"/>
                   <h6 style="color:black;">By clicking above, you agree to our <a href="">Terms and Conditions</a></h6>
               
            </div>     
            </div>
        
       
        </div> 
          <div class="row" runat="server" id="divMessage" style="margin-right:auto; margin-left:auto; float:none; border:2px solid #e6e6e6;display:none" >
                   <h3 style="color:black;">
                       <asp:Label ID="message" runat="server" Text=""></asp:Label></h3>
               
            </div>    
    </ContentTemplate></asp:UpdatePanel>