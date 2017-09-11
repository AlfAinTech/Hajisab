<%@ Control Language="C#" AutoEventWireup="true"  CodeFile="PackageItenryDetail.ascx.cs" Inherits="UmrahComponents_PackageComponent_PackageItenryDetail" %>
<script src="/UmrahComponents/Contents/js/jquery.quicksearch.js"></script> 
 <asp:HiddenField ID="hiddenHotel" runat="server" />
<asp:HiddenField ID="hiddentotaNights" runat="server" />
<script type="text/javascript">
    bindData = function (id)
    {
       
        var hotels = $.grep(jsondataHotel, function (n, i) {
            return (n.hotelType == id);
        });
        var hotelList = $('#hotelListAdd');
        console.log(hotels);
        hotelList[0].innerHTML = '';
        $.each(hotels, function () {
            var newOption = $('<option>');
            newOption.attr('value', this.id).text(this.hotelName);
            hotelList.append(newOption);

        });
        $('#hotelListAdd option:first-child').attr("selected", "selected");
        strUser = $('#hotelListAdd').find(":selected").val();
        document.getElementById('<%=hiddenHotel.ClientID %>').value = strUser;
    }

     myfnction = function (current) {
          strUser = current.options[current.selectedIndex].value;
          var hotels = $.grep(jsondataHotel, function (n, i) {
              return (n.hotelType == strUser);
          });
          var hotelList = $('#hotelListAdd');
          console.log(hotels);
          hotelList[0].innerHTML = '';
          $.each(hotels, function () {
              var newOption = $('<option>');
              newOption.attr('value', this.id).text(this.hotelName);
              hotelList.append(newOption);})
          $('#hotelListAdd option:first-child').attr("selected", "selected");

              yourFunction();
         

     }
     yourFunction = function()
     {
        
         strUser =  $('#hotelListAdd').find(":selected").val();
         document.getElementById('<%=hiddenHotel.ClientID %>').value = strUser;
         document.getElementById('hotelList_Value').value = strUser;
     }
    CalculateNights= function()
    {
        var totalNights = document.getElementById('<%=hiddentotaNights.ClientID %>').value
        var nights=0;
        $('.nights').each(function (x) {
            nights = nights +   parseFloat( $('.nights')[x].innerHTML);
        });
         var inputNights = document.getElementById('UmrahPackageDetail_PackageItenryDetail_itenry_list_nights_add').value
        console.log(nights);
        if (nights + parseFloat(inputNights) > parseFloat(totalNights)) {
            window.alert("No of Nights should not Exceed Total Nights");
            return false;
        }
        return true;
}
</script>
 <div class="col-md-12">

                                  <div class="row">
                                    <div class="col-md-8">
                                      <div class="row">
                                      <div class="col-md-12" style="background-color:#871e62; height:70px">
                                        <div class="col-md-7"><h3 style="color:white; margin-bottom:10px;">Edit your trip</h3></div>
                                        <div class="col-md-5"><h5 style="color:white; text-align:right; margin-top:15px;"><asp:Literal runat="server" ID="totalnights" ></asp:Literal> Nights</h5><h6 style="color:white; text-align:right;"> <asp:Literal ID="duration" runat="server"></asp:Literal></h6></div>
                                      </div></div>

                                      <div class="row" style="overflow:scroll;height:60vh;overflow-x:hidden;">
                                        <div class="well" style="height:inherit">
                                          <h4>Select Your Transport Type</h4>
                                           <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>--%>
                                              <asp:DropDownList ID="transportList" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="id"></asp:DropDownList> 
                                          <asp:Repeater runat="server" ID="itenry_list" OnItemCommand="itenry_list_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound"   >

                                         <HeaderTemplate>   <table class="table">
                                              <tr>
                                                <th>City</th>
                                                <th>Nights</th>
                                                <th>Hotel</th>
                                                <th></th>
                                              </tr>
                                             </HeaderTemplate>
                                              <ItemTemplate>
                                              <tr>
                                                <td>
                                                    <asp:Literal ID="cityList" Text='<% # Eval("cityName") %>' runat="server"></asp:Literal></td>
                                                <td class="nights"><asp:Literal ID="night" Text='<%# Eval("nights") %>' runat="server"></asp:Literal></td>
                                                <td><asp:Literal ID="hotelName" Text='<%# Eval("Hotel.hotelName") %>' runat="server"></asp:Literal></td>
                                                <td>

                                                   <asp:LinkButton runat="server" ID="deleteItem" CommandName="delete" CommandArgument='<%# Eval("id") %>' class="btn btn-danger">
                                                  <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                </asp:LinkButton>
                                                </td>
                                              </tr>
                                                </ItemTemplate>
                                              <FooterTemplate>
                                              <tr>

                                                <td>
                                                    <asp:DropDownList  runat="server" ID="cityList_add" type="text" class="form-control"  AutoPostBack="false"
 >
                                                  <asp:ListItem Value="makkah"  >Makkah</asp:ListItem>
                                                  <asp:ListItem Value="madina">Madina</asp:ListItem>
                                                  </asp:DropDownList></td>
                                                <td><asp:TextBox  ID="nights_add" min="1" type="number" class="form-control"  runat="server" Text="1" ValidationGroup="addValidation"/>
                                              <%--  <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="nights_add"  OnInit="myInit_Range" ErrorMessage="Invalid" Display="Dynamic" SetFocusOnError="true" ValidationGroup="addDataValid" Font-Bold="True"  ForeColor="Red" Type="Integer"></asp:RangeValidator>    
                                                               <asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" ControlToValidate="nights_add"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="addDataValid" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                                                 --%> </td>
                                                <td>
                                                    <%--<asp:TextBox ID="hotelList_Value" runat="server" style="display:none" ClientIDMode="Static" ></asp:TextBox>--%>

                                                    <select ID="hotelListAdd" class="form-control" DataTextField="hotelName" onchange="return yourFunction();" DataValueField="id"></select>
                                                </td>
                                                <td>
                                                   <asp:LinkButton  runat="server" ClientIDMode="Static" OnClientClick="return CalculateNights()" CssClass="btn btn-success" ID="save"  CausesValidation="true" CommandName="add">
                                                  <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                                                </asp:LinkButton>
                                                </td>
                                              </tr>
                                           
                                          </table>
                                                  </FooterTemplate></asp:Repeater>
                                                <%--</ContentTemplate></asp:UpdatePanel>--%>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="col-md-4" style="overflow:scroll;height:70vh;overflow-x:hidden;">
                                        
                                     
                                              <asp:Repeater ID="tripDetailList" runat="server">
                                                  <HeaderTemplate> <div class="row" style="height:inherit">
                                          <div class="col-md-12" style="background-color:#cebcd4;min-height:70vh">
                                            <h4 style="text-align:center;">Your Trip</h4></HeaderTemplate>
                                            <ItemTemplate>
                                            <div class="row">
                                              <div class="col-md-1">
                                                <img src="/UmrahComponents/Contents/img/border1.png" style="height:50px; padding:0;" />
                                              </div>
                                              <div class="col-md-10" style="max-height:50px; padding:12px;">
                                                  <button class="btn btn-default" style="padding:2px 10px; border-radius:15px; background-color:#838383; color:white; background-image:none;"><asp:Literal runat="server" ID="datadisplay" Text='<%# Eval("getDateLimit") %>'></asp:Literal></button>
                                              </div>
                                            </div>
                                            <div class="row">
                                              <div class="col-md-1">
                                                <img src="/UmrahComponents/Contents/img/border.png" style="height:50px; padding:0;" />
                                              </div>
                                              <div class="col-md-10" style="max-height:50px; padding:5px;">
                                              <h5 style="text-align:left; color:white; margin-bottom:0px; padding-left:10px;"><asp:Literal runat="server" ID="hotel" Text='<%# Eval("Hotel.hotelName") %>'></asp:Literal></h5>
                                            <h6 style="padding-left:10px;"><asp:Literal runat="server"  ID="nights" Text='<%# Eval("nights") %>'></asp:Literal> Nights</h6></div>
                                            </div>

                                            </ItemTemplate><FooterTemplate>
                                                 </div>
                                    </div>

                                  </div>
                                                           </FooterTemplate>
                                        </asp:Repeater>
                                          </div>
                                     
     </div></div>