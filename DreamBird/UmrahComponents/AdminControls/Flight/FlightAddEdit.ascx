<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FlightAddEdit.ascx.cs" Inherits="UmrahComponents_AdminControls_Flight_FlightAddEdit" %>

        <h2 class="modal-title" id="myModalLabel"><asp:Label ID="airLine_lbl" runat="server"></asp:Label></h2>
 
      <div class="modal-body" style="display:inline-block;">
        <div class="col-md-12">
        <h4>Flight Number</h4>
            <asp:TextBox ID="name_txt" class="form-control" placeholder="Flight Name" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name_txt" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="col-md-6">
            <h4><asp:RadioButton  GroupName="trip" runat="server" ID="one_way_chk" style="margin-right: 15px;"/>One Way</h4>
        </div>
        <div class="col-md-6">
            <h4><asp:RadioButton  GroupName="trip" runat="server" ID="roundTrip_chk" style="margin-right: 15px;"/>Round Trip</h4>
        </div>
        <div class="col-md-12">
        <h4>Departure Date</h4>
             <asp:TextBox ID="fromDate" runat="server"  type="date"  class="form-control" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fromDate" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
         <div class="col-md-12">
        <h4>Return Date</h4>
            <asp:TextBox ID="returnDate" runat="server"  type="date"  class="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="returnDate" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="col-md-6">
        <h4>From</h4>
            <asp:DropDownList ID="fromcity_ddl" runat="server" CssClass="form-control">
                  <asp:ListItem>Lahore</asp:ListItem>
                <asp:ListItem>Karachi</asp:ListItem>
                <asp:ListItem>Islamabad</asp:ListItem>
            </asp:DropDownList>
            <%--<asp:TextBox ID="fromCity_txt" runat="server"  placeholder="From"  class="form-control" ></asp:TextBox>--%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="fromcity_ddl" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="col-md-6">
        <h4>Destination</h4>
            <asp:DropDownList ID="destCity_ddl" runat="server" CssClass="form-control">
                <asp:ListItem>Jaddah</asp:ListItem>
              
            </asp:DropDownList>
             <%--<asp:TextBox ID="destCity_txt" runat="server"  placeholder="Destination"  class="form-control" ></asp:TextBox>--%>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="destCity_ddl" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        <div class="col-md-12">
        <h4>Ticket Price</h4>
            
             <asp:TextBox ID="price_txt" runat="server" Type="number" min="0"  placeholder="Price"  class="form-control" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="price_txt" ErrorMessage="*" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
        </div>
      <div class="modal-footer">
        <asp:Button  runat="server" class="btn btn-primary" style="margin:0px" Text="Save changes" ID="save" OnClick="save_Click"></asp:Button>
        <asp:Button runat="server" class="btn btn-default" Text="Close"  ID="close" OnClick="close_Click"></asp:Button>
           </div>
    