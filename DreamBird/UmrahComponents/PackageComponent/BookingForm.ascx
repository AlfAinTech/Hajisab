<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookingForm.ascx.cs" Inherits="UmrahComponents_PackageComponent_BookingForm" %>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<script>
    $.fn.stars = function() {
        return $(this).each(function() {

            var rating = $(this).data("rating");

            var numStars = $(this).data("numStars");

            var fullStar = new Array(Math.floor(rating + 1)).join('<i class="fa fa-star" style="color: #ff9900;"></i>');

            var halfStar = ((rating%1) !== 0) ? '<i class="fa fa-star-half-empty"></i>': '';

            var noStar = new Array(Math.floor(numStars + 1 - rating)).join('<i class="fa fa-star-o"></i>');

            $(this).html(fullStar + halfStar + noStar);

        });
    }

    $('.stars').stars();
    openConfirmationForm = function()
    {
        $(".bookingContainer").hide();
        $(".finalContainer").show();
    }
    </script>
<div  class="container " style="background-color:white; box-shadow:2px 2px 2px 2px #464646;min-height:650px">
<div class="bookingContainer" id="bookingContainer" runat="server"  style="background-color:white;">
    <h3 style="text-align:center;">Booking Information</h3>
     <div class="col-md-12" id="booking_form">
      <div class="col-md-6">
         
        <h4>Customer Detail</h4>
        <div class="col-md-12">
          <h5>Name</h5>
                   <asp:TextBox  runat="server" ID="name_txt" class="form-control" name="" type="text"   onkeypress="this.value=this.value.replace(/[\d]/,'')" onkeyup="this.value=this.value.replace(/[\d]/,'')" />
                       <asp:RequiredFieldValidator ID="name_required" ValidationGroup="saveBooking" runat="server" ErrorMessage="*" ControlToValidate="name_txt" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
        <div class="col-md-12">
                        <h5>Mobile Number</h5>
                        <asp:TextBox  runat="server" ID="mobile_txt" class="form-control " name=""  placeholder="0312-123-1234" />
                       <asp:RequiredFieldValidator ValidationGroup="saveBooking" ID="name_required0" runat="server" ErrorMessage="*" ControlToValidate="mobile_txt" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ValidationGroup="saveBooking" ID="RegularExpressionValidator4" runat="server"
                   ControlToValidate="mobile_txt" ValidationExpression="\(?\d{4}\)?-? *\d{3}-? *-?\d{4}"  Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ></asp:RegularExpressionValidator>     
         </div>
          <div class="col-md-12">
               <h5>Email Address</h5>
                   <asp:TextBox  runat="server" ID="email_txt" class="form-control" name=""/>
                       <asp:RequiredFieldValidator ValidationGroup="saveBooking" ID="name_required1" runat="server" ErrorMessage="*" ControlToValidate="email_txt" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ValidationGroup="saveBooking" ID="RegularExpressionValidator5" runat="server"
                   ControlToValidate="email_txt" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"  Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ></asp:RegularExpressionValidator>     
          </div>
          <div class="col-md-12">
               <h5>Contact Address</h5>
                   <textarea class="form-control" runat="server" ID="contect_txt" style="height: 100px;"></textarea>
                       <asp:RequiredFieldValidator ValidationGroup="saveBooking" ID="name_required2" runat="server" ErrorMessage="*" ControlToValidate="contect_txt" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:RequiredFieldValidator>

          </div>
        <%--  <div class="col-md-12">
          <div class="col-md-6">
               <h5>City</h5>
                   <asp:DropDownList ID="city_list" runat="server"  CssClass="form-control">
                       <asp:ListItem Selected="True">Lahore</asp:ListItem>
                       <asp:ListItem>Karachi</asp:ListItem>
                       <asp:ListItem>Islamabad</asp:ListItem>
                   </asp:DropDownList>
          </div>
          <div class="col-md-6">
               <h5>Province</h5>
                   <asp:DropDownList ID="province_list" runat="server" CssClass="form-control">
                       <asp:ListItem Selected="True">Punjab</asp:ListItem>
                       <asp:ListItem>Sindh</asp:ListItem>
                       <asp:ListItem>Balochistan</asp:ListItem>
                   </asp:DropDownList>
               </div></div>--%>
             
                </div>
               
   <%-- Booking Package Detail --%> 
    <div class="col-md-6">
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
              </div>
        <div class="col-md-10" style="margin-right:auto; margin-left:auto; float:none; padding:15px;">
        <div class="row">
            
             <h4>Passengers</h4>
          <div class="col-md-12">
          <div class="col-md-4">
          <h5>Adults</h5>
                   <asp:TextBox type="number" runat="server" ID="adults_no" class="form-control" name="" Text="0"/>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="adults_no" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                   ControlToValidate="adults_no" ValidationExpression="^[0-9]\d*$"  Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ></asp:RegularExpressionValidator>     

        </div>
         <div class="col-md-4">
          <h5>Children</h5>
                   <asp:TextBox type="number" runat="server" ID="children_no" class="form-control" name="" Text="0"/>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="children_no" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:RequiredFieldValidator>
               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                   ControlToValidate="children_no" ValidationExpression="^[0-9]\d*$"  Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ></asp:RegularExpressionValidator>     
        </div>
           <div class="col-md-4">
          <h5>Infants</h5>
                   <asp:TextBox type="number" runat="server" ID="infant_no" class="form-control" name="" Text="0"/>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="infant_no" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                   ControlToValidate="infant_no" ValidationExpression="^[0-9]\d*$"  Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ></asp:RegularExpressionValidator>     
        </div>
              </div>
        </div>
        <div class="row">
                   <asp:Button runat="server" ID="saveUser" class="btn btn-primary" style="width:100%" Text="Complete your booking" OnClick="saveUser_Click" ValidationGroup="saveBooking"/>
                   <h6 style="color:black;">By clicking above, you agree to our <a href="">Terms and Conditions</a></h6>
               
            </div>     
            </div>
        </div> 
                    
               </div>

   

         
</div>
    <div  id="FinalContainer" runat="server"  class="finalContainer" style="background-color:white;margin:10px;display:none">
          <div  style="margin-left:auto; margin-right:auto; float:none;width: 58.33333333%;">
                <div style="border:solid #190940;padding: 20px;padding-left: 40px;padding-right: 40px;">
                    <h2 style="text-align: center;color: #190940;"><asp:Literal ID="txtfullnights" runat="server"></asp:Literal> Days Umrah Package</h2>
                    <div  style="padding-left:20px; padding-right:20px;margin-left: -15px;margin-right: -15px;">
                        <h3 style="font-size: 18px; margin-top: 10px;margin-bottom: 10px;">One Final Step</h3>
                        <p>Thank you for Booking Your Umrah Package at <a href="http://www.hajisab.com">hajisab.com</a>. Confirm your Package by given Tracking ID. </p>
                        <h3><span>Tracking ID : <asp:Literal ID="txttrackingId" runat="server"></asp:Literal></span></h3>
                    </div>
                    </div>
                  
                </div>
</div>
</div>