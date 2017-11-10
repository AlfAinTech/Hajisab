<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackageDetail.ascx.cs" Inherits="UmrahComponents_AdminControls_Packages_PackageDetail" %>
<div role="tabpanel" class="tab-pane" id="pricing">
        <div class="col-md-12">
            <div class="col-md-4" style="margin-top: 10px;">
            <div class="col-md-12" style="padding:0">
                <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><span class="badge" style="margin-right: 10px;">1</span>Hotel For Makkah</h3>
  </div>
  <div class="panel-body">
      <asp:DropDownList class="form-control" ID="makkahHotel_list" runat="server" DataTextField="hotelName" DataValueField="id"></asp:DropDownList>
            <h5>
                Nights in makkah
            </h5>
            <asp:TextBox type="number" class="form-control" placeholder="Enter Nights" name="" min="0" runat="server" ID="nightInMakkah_txt"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup ="validateDetail" runat="server" ControlToValidate="nightInMakkah_txt" ErrorMessage="Required" ForeColor="Red" Font-Bold="true"></asp:RequiredFieldValidator>
</div>
            </div>
            </div>
            <div class="col-md-12" style="padding:0">
            <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><span class="badge" style="margin-right: 10px;">2</span>Hotel For Madina</h3>
  </div>
  <div class="panel-body">
      <asp:DropDownList class="form-control" ID="hotelMadina_list" runat="server" DataTextField="hotelName" DataValueField="id"></asp:DropDownList>
            <h5>
                Nights in Madina
            </h5>
            <asp:TextBox runat="server" ID="nightsInMadina_txt" type="number" min="0" class="form-control" placeholder="Enter Nights" name=""></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup ="validateDetail" runat="server" ControlToValidate="nightsInMadina_txt" ErrorMessage="Required" ForeColor="Red"  Font-Bold="True"></asp:RequiredFieldValidator>
   </div>
</div> 
        </div>
         <div class="col-md-12" style="padding:0">
            <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><asp:CheckBox ID="isTranspost_chk" runat="server" style="margin-right: 10px;"/><span class="badge" style="margin-right: 10px;">3</span>Transport</h3>
  </div>
  <div class="panel-body">
      <asp:DropDownList class="form-control" ID="transport_list" runat="server" DataTextField="Name" DataValueField="id"></asp:DropDownList>
  </div>
</div>
            </div>   
        
        </div>
            <div class="col-md-4" style="margin-top: 10px;">
<div class="col-md-12" style="padding:0">
            <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><asp:CheckBox runat="server" ID="isAirLineAvailable" style="margin-right: 10px;"/><span class="badge" style="margin-right: 10px;">4</span>Airline</h3>
  </div>
  <div class="panel-body">
       <asp:UpdatePanel ID="updatePanel_flights" runat="server">
          <ContentTemplate>
                <div class="col-md-6" style="padding:0;margin-top: 10px;">
            <asp:CheckBox runat="server"  ID="oneWay_chk" name="" AutoPostBack="True" OnCheckedChanged="oneWay_chk_CheckedChanged"/>One Way
        </div>
     
        <div class="col-md-6" style="padding:0;margin-top: 10px;">
            <asp:CheckBox runat="server"  ID="roundTrip_chk" name="" AutoPostBack="True" Checked="True" OnCheckedChanged="roundTrip_chk_CheckedChanged"/>Round Trip
        </div>
      <asp:Panel ID="oneWay_panel" runat="server" Visible="false">
            <div class="col-md-12" style="padding-left:0;">
                <h4>Flight to Jeddah</h4>
                <asp:DropDownList class="form-control" ID="flightDeparture_list"  Causesvalidation="true" runat="server"  DataTextField="Name" DataValueField="id"></asp:DropDownList>
            </div>
            <div class="col-md-12" style="padding-left:0;">
                <h4>Flight to Pakistan</h4>
                <asp:DropDownList class="form-control"  ValidationGroup="g2" ID="flightReturn_list" runat="server" DataTextField="Name" DataValueField="id"></asp:DropDownList>
          
            </div>
          </asp:Panel>
      <asp:Panel ID="roundTrip_panel" runat="server">
            <div class="col-md-12" style="padding-left:0;">
                <h4>Flight</h4>
                <asp:DropDownList class="form-control" ID="flight_list" runat="server" DataTextField="Name" DataValueField="id"></asp:DropDownList>
            </div>
          </asp:Panel>
              </ContentTemplate>
          </asp:UpdatePanel>
            </div>

            </div>
<div class="col-md-12" style="padding:0; ">
                <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><asp:CheckBox runat="server" ID="isVisa_chk" style="margin-right: 10px;"/><span class="badge" style="margin-right: 10px;">5</span>Visa Month</h3>
  </div>
  <div class="panel-body">
      <asp:DropDownList class="form-control" ID="visa_list" runat="server" DataTextField="visaTitle" DataValueField="id"></asp:DropDownList>
  </div>
</div>
            </div> 
            <div class="col-md-12" style="padding:0">
            <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><asp:CheckBox runat="server" ID="isZiarat_chk" style="margin-right: 10px;"/><span class="badge" style="margin-right: 10px;">6</span>Ziarat</h3>
  </div>
  <div class="panel-body">
      <asp:DropDownList class="form-control" ID="ziarat_list" runat="server" DataTextField="text" DataValueField="id"></asp:DropDownList>
  </div>
</div>
            </div> 

    <div class="col-md-12" style="padding:0;">
                        <div class="panel panel-default">
                          <div class="panel-heading">
                            <h3 class="panel-title"> Start Date</h3>
                          </div>
                          <div class="panel-body">
                               <asp:TextBox runat="server" type="date" ID="startDate" class="form-control" name=""></asp:TextBox>
                              <asp:RequiredFieldValidator ID="Requiredstartdate" runat="server" ValidationGroup="validateDetail" ControlToValidate="startDate"
                ErrorMessage="Required" Display="Dynamic" SetFocusOnError="true"  ForeColor="Red"  Font-Bold="True"></asp:RequiredFieldValidator>
                               </div>

                        </div>

              </div>

            </div>
            

            </div>
             <div class="col-md-4" style="margin-top: 10px;">
                  
              <div class="col-md-12" style="padding:0;">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title"> Package Type</h3>
              </div>
              <div class="panel-body">
                  <asp:DropDownList ID="packageType" runat="server" CssClass="form-control">
                      <asp:ListItem Value="-1" Selected="True">--Select--</asp:ListItem>
                        <asp:ListItem Value="bronze">Bronze</asp:ListItem>
                      <asp:ListItem Value="silver">Silver</asp:ListItem>
                       <asp:ListItem Value="gold" >Gold</asp:ListItem>
                  </asp:DropDownList>
                                           <asp:CompareValidator ID="cmpElevel" runat="server" ControlToValidate="packageType"
                                                Display="Dynamic" ErrorMessage="Required" Operator="NotEqual" Style="position: static" ValidationGroup="validateDetail"
                                                ValueToCompare="-1"  Font-Bold="True"  ForeColor="Red" ></asp:CompareValidator>
                    </div>

            </div>

              </div>
            <div class="col-md-12" style="padding:0;">
            <div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"> Additional Expenses</h3>
  </div>
  <div class="panel-body">
  <%-- <div class="col-md-12" style="padding:0;">
   <h4>
               Budget Range
            </h4>
                <asp:TextBox runat="server"  ID="totalAmount_txt" class="form-control" name="" placeholder="Total Amount">0</asp:TextBox>
            
                    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="totalAmount_txt" ErrorMessage="Required" ForeColor="Red" Font-Size="Medium"></asp:RequiredFieldValidator>
            
                      <asp:Label ID="minAmount" runat="server" Text="0"></asp:Label>
              <asp:Label ID="maxAmount" runat="server" Text="0"></asp:Label>
                
                </div>--%>
            
                 <div class="col-md-12" style="padding:0;">
                <h4>
               Additional Price
            </h4>
            <asp:TextBox runat="server"  ID="additionalExp_txt" class="form-control numeric" name="" placeholder="Additional Amount">0</asp:TextBox>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                   ControlToValidate="additionalExp_txt" ValidationExpression="^[0-9]\d*$" ValidationGroup ="validateDetail"  Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ></asp:RegularExpressionValidator>     
                </div>
                 <div class="col-md-12" style="padding:0;">
                <h5>Detail of Additional Expenses</h5>
                    <asp:TextBox runat="server"  TextMode="MultiLine" ID="additionalDetail_txt" class="form-control" name=""></asp:TextBox>
                    
                </div>
  </div>
</div>
                
            </div>      
                  <div class="col-md-12" style="margin-top: 20px; padding: 0;">
                <div class="col-md-4" style="float: right;">
                    <asp:Button runat="server" ID="save" class="btn btn-primary" Text="Save" OnClick="save_Click" ValidationGroup ="validateDetail"></asp:Button>
                </div>
            </div>  
            </div>
            
           
        </div>
    </div>