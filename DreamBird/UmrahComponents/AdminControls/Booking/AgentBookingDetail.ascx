<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AgentBookingDetail.ascx.cs" Inherits="UmrahComponents_AdminControls_Booking_AgentBookingDetail" %>
<div class="Booking-List"   runat="server" id="Booking_List">
<table class="table table-condensed table-hover">
    <thead>
        <tr>
             <th>Package</th>
            <th>Name</th>
            <th>Contact</th>
            <th></th>
            
            <th></th>
        </tr>
    </thead>
    <asp:repeater id="rptAlharmainBooking" runat="server" onitemcommand="rptAlharmainBooking_ItemCommand">
        <itemtemplate>
            <tr>
                <td><%# Eval("PackageDetail.Dream.DreamName")%></td>
                <td><%# Eval("AlharmainUser.Name") %></td>
                <td><%# Eval("AlharmainUser.mobileNo") %></td>
                
                <td>
                    <div class="btn-group" role="group" aria-label="...">
                        <asp:linkbutton id="btnOpen" clientidmode="Static" runat="server" cssclass="btn btn-info" data-toggle="tooltip" data-placement="left" tooltip="Open Detail" commandargument='<%# Eval("id") %>' commandname="Edit"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span></asp:linkbutton>
                    </div>
                </td>
            </tr>
        </itemtemplate>
    </asp:repeater>
</table>
</div>
<div class="Booking-detail"  visible="false" runat="server" id="booking_detail">

    <div  class="row" style="background-color:white; box-shadow:2px 2px 2px 2px #464646;">
<div class="bookingContainer" id="bookingContainer" runat="server"  style="background-color:white;">
    <h3 style="text-align:center;">Booking Information</h3>
     <div class="col-md-12" id="booking_form">
      <div class="col-md-6">
         
        <h4>Customer Detail</h4>
        <div class="col-md-12">
          <h5>Name</h5>
                   <asp:Label  runat="server" ID="name_txt" class="form-control" name="" type="text"   onkeypress="this.value=this.value.replace(/[\d]/,'')" onkeyup="this.value=this.value.replace(/[\d]/,'')" />

        </div>
        <div class="col-md-12">
                        <h5>Mobile Number</h5>
                        <asp:Label  runat="server" ID="mobile_txt" class="form-control " name=""  placeholder="0312-123-1234" />
                        </div>
          <div class="col-md-12">
               <h5>Email Address</h5>
                   <asp:Label  runat="server" ID="email_txt" class="form-control" name=""/>
                     </div>
          <div class="col-md-12">
               <h5>Contact Address</h5>
                   <Label class="form-control" runat="server" ID="contect_txt" style="height: 100px;"></Label>

          </div>
     
             
                </div>
               
   <%-- Package Tracking Detail --%> 
         <div class="col-md-6">
             <h4>Booking Detail</h4>
              <div class="col-md-12">
                   <h5>Tracking ID</h5>
                         <asp:Label  runat="server" ID="txtTrackingID" class="form-control" name="" Text="0"/>
                        
                  </div>
                  <div class="row">
            
             <h4>Passengers</h4>
          <div class="col-md-12">
          <div class="col-md-4">
          <h5>Adults</h5>
                   <asp:Label type="number" runat="server" ID="adults_no" class="form-control" name="" Text="0"/>
                      
        </div>
         <div class="col-md-4">
          <h5>Children</h5>
                   <asp:Label type="number" runat="server" ID="children_no" class="form-control" name="" Text="0"/>
                    </div>
           <div class="col-md-4">
          <h5>Infants</h5>
                   <asp:Label type="number" runat="server" ID="infant_no" class="form-control" name="" Text="0"/>
                     </div>
              </div>
        </div>  
               </div>

   

         
</div>

</div>
</div>
    </div>