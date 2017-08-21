<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Flights.ascx.cs" Inherits="UmrahComponents_AdminControls_Flight_Flights" %>



<div class="col-md-6"><h2><asp:Label ID="AirLine_txt" runat="server" Text='<%# Eval("AirLine.Name") %>'></asp:Label></h2></div>
    <div class="col-md-6">
    <div class="col-md-6">
        <h4>From</h4>
        <asp:TextBox ID="fromDate" runat="server"  type="date"  class="form-control" AutoPostBack="True" OnTextChanged="fromDate_TextChanged" ></asp:TextBox>

    </div>
    <div class="col-md-6">
        <h4>To</h4>
         <asp:TextBox ID="toDate" runat="server"  type="date"  class="form-control" OnTextChanged="toDate_TextChanged" AutoPostBack="True"></asp:TextBox>
      <br/><asp:Button runat="server" class="btn btn-primary" Text="Add Flight"  ID="addFlight" OnClick="addNew_Click"></asp:Button>
    </div>
    </div>
 <div class="col-md-12">
     <asp:Repeater ID="Flights_list" runat="server">
         <ItemTemplate>
        <div class="col-md-3" style="max-height: 250px; padding:20px; margin-top: 15px; margin-bottom: 15px;">
        <div class="col-md-12" style="background-color: #e6e6e6; padding:15px;">
            <div class="col-md-6" style="padding:0"><asp:LinkButton runat="server" CommandArgument='<%# Eval("id") %>' OnClick="openEditPanel" ><h3><%# Eval("Name") %></h3></asp:LinkButton></div>
            <div class="col-md-6" style="padding:0; text-align: right;"><H5><%# Eval("getDepartureDate") %> </H5></div>
            <div class="col-md-12" style="padding:0"><h4><%# Eval("fromCity") %> to <%# Eval("destinationCity") %></h4></div>
            <div class="col-md-6" style="padding:0"><h5>Ecomony Class</h5></div>
            <div class="col-md-6" style="padding:0"><h5> <%# "Ticket Price: PKR "+Eval("price").ToString() %></h5></div>
            <div class="col-md-6" style="padding:0"><h5><asp:CheckBox ID="one_way_chk" runat="server" name="" Text="One Way" Checked='<%# Eval("IsOneWay") %>' Enabled="False" /></h5></div>
            <div class="col-md-6" style="padding:0"><h5><asp:CheckBox ID="round_trip_chk" runat="server" name="" Text="Round Trip" Checked='<%# Eval("IsRoundTrip") %>' Enabled="False" /></h5></div>
        </div>
        </div>
        </ItemTemplate>
    </asp:Repeater>
 </div>
