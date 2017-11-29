<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DiscountPackages.ascx.cs" Inherits="UmrahComponents_AdminControls_Packages_DiscountPackages" %>
<div class="col-md-6"><h2>Discount Packages</h2></div> 

    
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<div class="col-md-12" style="margin-top: 20px;">
     <table style="width: 100%">
<asp:Repeater ID="packages_list" runat="server"   >
    <HeaderTemplate>
        
        <tr>
                    <th></th>
                    <th><h3>Package Name</h3></th>
                    <th><h3>Discount Percentage</h3></th>
                    <th><h3>Available From</h3></th>
                    <th><h3>Available Till</h3></th>
                </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
                    <td>
                        <asp:LinkButton class="btn btn-default" ID="update_btn"  ValidationGroup="EditDataValid" CommandArgument='<%# Eval("id") %>' runat="server" OnClick="updatebutton_clicked" Visible="false"><span class="glyphicon glyphicon-pencil" ></span></asp:LinkButton>
                        <div class="col-md-6" style="padding:0;">
                            
                            <asp:LinkButton type="submit"  class="btn btn-default" ID="edit_btn" CommandArgument='<%# Eval("id") %>' runat="server" OnClick="editbutton_clicked"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                        </div>
                        <div class="col-md-6" style="padding:0;">
                            <asp:LinkButton runat="server" ID="delete_btn" data-toggle="tooltip" data-placement="top"  OnClientClick="return callModal(this);" CommandArgument='<%# Eval("id") %>' OnClick="deleteButton_clicked" class="btn btn-primary"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox ID="name_txt" runat="server" Text='<%# Eval("name") %>' Enabled="false" CssClass="form-control" style="background-color: inherit;"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="name_txt"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>

                         </td>
                    <td>
                        <asp:TextBox ID="percent_txt" runat="server" Text='<%# Eval("discountPercent") %>' Enabled="false" style="background-color: inherit;" CssClass="form-control" type="number" min="1" max="100"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalud" ControlToValidate="percent_txt"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid"  Font-Bold="True" Type="double" MaximumValue="100" MinimumValue="1"  ForeColor="Red"></asp:RangeValidator>
                    <asp:RequiredFieldValidator   ID="RequiredFieldValidator1" runat="server" ControlToValidate="percent_txt"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="availableFrom_txt" runat="server"   Text='<%# Eval("availableFromText") %>' type="date"  class="form-control"  Enabled="false" style="background-color: inherit;" CssClass="form-control"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="availableFrom_txt" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator44" runat="server"
                   ControlToValidate="availableFrom_txt" ValidationExpression="^\d{4}\-\d{2}\-\d{2}$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="EditDataValid"></asp:RegularExpressionValidator>
                            </td>
                    <td>
                        <asp:TextBox ID="availableTill_txt" runat="server" Text='<%# Eval("availableTillText") %>'  type="date"  CssClass="form-control" Enabled="false" style="background-color: inherit;"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="availableTill_txt" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                   ControlToValidate="availableTill_txt" ValidationExpression="^\d{4}\-\d{2}\-\d{2}$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="EditDataValid"></asp:RegularExpressionValidator>
                         </td>
                </tr>
    </ItemTemplate>
    <FooterTemplate>
       
         
    </FooterTemplate>
    
</asp:Repeater>
    <tr>
                    <td>
                        <div class="col-md-12" style="padding:0;">
                            <asp:LinkButton runat="server" ID="AddNewVisaPackages_btn" type="submit"   ValidationGroup="addButtonValidGroup" OnClick="AddNewDiscountPackages_Clicked" CommandArgument="add" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="addTitle_txt" class="form-control" placeholder="Package Name" ></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="addTitle_txtvalid" Display="Dynamic" SetFocusOnError="true" runat="server" ControlToValidate="addTitle_txt" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:TextBox runat="server" type= "number" min="1" max="100" ID="addpercent_txt" class="form-control" placeholder="Discount Percentage" >1</asp:TextBox>
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalud" ControlToValidate="addpercent_txt"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid"  Font-Bold="True" Type="Integer" MaximumValue="100" MinimumValue="1"  ForeColor="Red"></asp:RangeValidator>
                  
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="addpercent_txt" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
   

                    </td>
                    <td>
                         <asp:TextBox ID="AddavailableFrom_txt" runat="server"  type="date"  class="form-control" AutoPostBack="True" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="AddavailableFrom_txt" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                   ControlToValidate="AddavailableFrom_txt" ValidationExpression="^\d{4}\-\d{2}\-\d{2}$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="addButtonValidGroup"></asp:RegularExpressionValidator>
                    </td>
                     <td>
                         <asp:TextBox ID="AddavailableTill_txt" runat="server"  type="date"  class="form-control" AutoPostBack="True" ></asp:TextBox>
  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="AddavailableTill_txt" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                   ControlToValidate="AddavailableTill_txt" ValidationExpression="^\d{4}\-\d{2}\-\d{2}$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="addButtonValidGroup"></asp:RegularExpressionValidator>
                    </td>
                </tr>
         </table>
    </div>
        
        </ContentTemplate>
        </asp:UpdatePanel>
   