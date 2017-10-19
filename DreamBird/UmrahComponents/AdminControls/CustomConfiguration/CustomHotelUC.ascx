<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomHotelUC.ascx.cs" Inherits="UmrahComponents_AdminControls_CustomConfiguration_CustomHotelUC" %>


<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<div class="col-md-12">
     <table class="col-md-12" >
<asp:Repeater ID="CustomHotel_List" runat="server"  OnItemDataBound="CustomHotel_List_ItemDataBound" >
    <HeaderTemplate>
        
        <tr>
                    <th></th>
                    <th><h4>Accommodation</h4></th>
                    <th><h4>Rating</h4></th>
                    <th><h4>Distance</h4></th>
                    <th><h4>Month</h4></th>
                    <th><h4>City</h4></th>
                     <th><h4>Estimated Price</h></th>
                </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
                    <td  class="col-md-2">
                        <div class="col-md-6" style="padding:0;">
                            <asp:LinkButton class="btn btn-default" ID="update_btn" CommandArgument='<%# Eval("id") %>' ValidationGroup="EditDataValid" runat="server" OnClick="updatebutton_clicked" Visible="false"><span class="glyphicon glyphicon-pencil" ></span></asp:LinkButton>
                            <asp:LinkButton class="btn btn-default" ID="edit_btn" CommandArgument='<%# Eval("id") %>' runat="server" OnClick="editbutton_clicked" ><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                        </div>
                        <div class="col-md-6" style="padding:0;">
                            <asp:LinkButton runat="server" ID="delete_btn" data-toggle="tooltip" data-placement="top" CommandArgument='<%# Eval("id") %>'  OnClientClick="return callModal(this);" OnClick="deleteButton_clicked" class="btn btn-primary"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                        </div>
                    </td>
                    <td  class="col-md-1">
                        <h4><asp:TextBox ID="Accomname_txt" CssClass="form-control" runat="server" Text='<%# Eval("AccommodationType") %>' Enabled="false" style="background-color: inherit;"></asp:TextBox>
                                             </h4>   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Accomname_txt"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>

                        
                        
                    </td>
            <td  class="col-md-1">
                        <h4>
                              <asp:DropDownList ID="star_list" runat="server" class="form-control" Enabled="false">
                                <asp:ListItem Value="1">Economy</asp:ListItem>
                                 <asp:ListItem Value="2">Budget</asp:ListItem>
                                <asp:ListItem Value="3">3 Star</asp:ListItem>
                                <asp:ListItem Value="4">4 Star</asp:ListItem>
                                <asp:ListItem Value="5">5 Star</asp:ListItem>
                                </asp:DropDownList>
                        </h4>
                        
                    </td>
                    <td  class="col-md-1">
                        <h4><asp:TextBox ID="txtDistance" CssClass="form-control" runat="server" Text='<%# Eval("Distance") %>' Enabled="false" style="background-color: inherit;"></asp:TextBox>
                            </h4>   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                   ControlToValidate="txtDistance" ValidationExpression="^[1-9]\d*$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="EditDataValid"></asp:RegularExpressionValidator>  
                    <asp:RequiredFieldValidator  ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDistance"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                      
                    </td>
                     <td  class="col-md-1">
                        <h4><asp:TextBox ID="txtMonth" CssClass="form-control" runat="server"  Text='<%# DateTime.Parse(Eval("Month").ToString()).ToString("yyyy-MM-dd") %>' type="date" Enabled="false" style="background-color: inherit;"></asp:TextBox>
                    </h4>  <asp:RequiredFieldValidator  ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMonth"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                      
                    </td>

                    <td  class="col-md-2">
                       
                         <h4>   <asp:DropDownList ID="ddlCity" runat="server" class="form-control" Enabled="false">
                                <asp:ListItem Value="makkah">Makkah</asp:ListItem>
                                 <asp:ListItem Value="madina">Madina</asp:ListItem>
                                
                                </asp:DropDownList></h4>
                        
                    </td>
                    <td  class="col-md-1">
                        <h4><asp:TextBox ID="price_txt" CssClass="form-control" runat="server" Text='<%# Eval("EstimatedPrice") %>' Enabled="false" style="background-color: inherit;"></asp:TextBox>
                            </h4>  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                   ControlToValidate="price_txt" ValidationExpression="^[1-9]\d*$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="EditDataValid"></asp:RegularExpressionValidator>  
                    <asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" ControlToValidate="price_txt"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                       
                    </td>
                  
                </tr>
    </ItemTemplate>
    <FooterTemplate>
       
         
    </FooterTemplate>
    
</asp:Repeater>
    <tr>
                    <td>
                        <div class="col-md-12" style="padding:0;">
                            <asp:LinkButton runat="server" ValidationGroup="addButtonValidGroup" ID="AddNewCustomHotel" OnClick="AddNewCustomHotel_Clicked" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                        </div>
                    </td>
                  <td>
                        <h4><asp:TextBox ID="Accomname_txtAdd" CssClass="form-control" runat="server"  style="background-color: inherit;"></asp:TextBox>
                                           </h4>     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Accomname_txtAdd"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>

                        
                        
                    </td>
            <td>
                             <h4> <asp:DropDownList ID="star_listAdd" runat="server" class="form-control" >
                                <asp:ListItem Value="1" Selected="True">Economy</asp:ListItem>
                                 <asp:ListItem Value="2">Budget</asp:ListItem>
                                <asp:ListItem Value="3">3 Star</asp:ListItem>
                                <asp:ListItem Value="4">4 Star</asp:ListItem>
                                <asp:ListItem Value="5">5 Star</asp:ListItem>
                                </asp:DropDownList></h4>
                      
                        
                    </td>
                    <td>
                        <h4><asp:TextBox ID="txtDistanceAdd" CssClass="form-control" runat="server"  style="background-color: inherit;"></asp:TextBox>
                             </h4>  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                   ControlToValidate="txtDistanceAdd" ValidationExpression="^[1-9]\d*$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="addButtonValidGroup"></asp:RegularExpressionValidator>  
                    <asp:RequiredFieldValidator  ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDistanceAdd"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                      
                    </td>
                     <td>
                        <h4><asp:TextBox ID="txtMonthAdd" CssClass="form-control" runat="server"   type="date" style="background-color: inherit;"></asp:TextBox>
                    </h4> <asp:RequiredFieldValidator  ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMonthAdd"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                       
                    </td>

                    <td>
                          <h4>  <asp:DropDownList ID="ddlCityAdd" runat="server" class="form-control" >
                                <asp:ListItem Value="makkah">Makkah</asp:ListItem>
                                 <asp:ListItem Value="madina">Madina</asp:ListItem>
                                
                                </asp:DropDownList></h4>
                    </td>
                    <td>
                        <h4><asp:TextBox ID="price_txtAdd" CssClass="form-control" runat="server" style="background-color: inherit;"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                   ControlToValidate="price_txtAdd" ValidationExpression="^[1-9]\d*$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="addButtonValidGroup"></asp:RegularExpressionValidator>  
                    <asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" ControlToValidate="price_txtAdd"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                        </h4>
                    </td>
                  
                
                </tr>
         </table>
    </div>
        </ContentTemplate>
        </asp:UpdatePanel>