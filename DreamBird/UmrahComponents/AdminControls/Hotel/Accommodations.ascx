<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Accommodations.ascx.cs" Inherits="UmrahComponents_AdminControls_Hotel_Accommodations" %>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<div class="col-md-12">
     <table style="width: 100%">
<asp:Repeater ID="accommodation_list" runat="server"   >
    <HeaderTemplate>
        
        <tr>
                    <th></th>
                    <th><h3>Name</h3></th>
                    <th><h3>Price</h3></th>
                    <th><h3>Availablity</h3></th>
                </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
                    <td>
                        <div class="col-md-6" style="padding:0;">
                            <asp:LinkButton class="btn btn-default" ID="update_btn" CommandArgument='<%# Eval("id") %>' ValidationGroup="EditDataValid" runat="server" OnClick="updatebutton_clicked" Visible="false"><span class="glyphicon glyphicon-pencil" ></span></asp:LinkButton>
                            <asp:LinkButton class="btn btn-default" ID="edit_btn" CommandArgument='<%# Eval("id") %>' runat="server" OnClick="editbutton_clicked" ><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                        </div>
                        <div class="col-md-6" style="padding:0;">
                            <asp:LinkButton runat="server" ID="delete_btn" data-toggle="tooltip" data-placement="top" CommandArgument='<%# Eval("id") %>'  OnClientClick="return callModal(this);" OnClick="deleteButton_clicked" class="btn btn-primary"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                        </div>
                    </td>
                    <td>
                        <h3><asp:TextBox ID="name_txt" CssClass="form-control" runat="server" Text='<%# Eval("Name") %>' Enabled="false" style="background-color: inherit;"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="name_txt"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>

                        </h3>
                        
                    </td>
                    <td>
                        <h3><asp:TextBox ID="price_txt" CssClass="form-control" runat="server" Text='<%# Eval("price") %>' Enabled="false" style="background-color: inherit;"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                   ControlToValidate="price_txt" ValidationExpression="^[1-9]\d*$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="EditDataValid"></asp:RegularExpressionValidator>  
                    <asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" ControlToValidate="price_txt"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                        </h3>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="available_chk"  CssClass="form-control" Enabled="false"  Checked='<%# Eval("availability") %>' style="border-width: 0px;background-color: inherit;"></asp:CheckBox>
                    </td>
                </tr>
    </ItemTemplate>
    <FooterTemplate>
       
         
    </FooterTemplate>
    
</asp:Repeater>
    <tr>
                    <td>
                        <div class="col-md-12" style="padding:0;">
                            <asp:LinkButton runat="server" ValidationGroup="addButtonValidGroup" ID="AddNewAccommodation_btn" OnClick="AddNewAccommodation_Clicked" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="addName_txt" class="form-control" placeholder="Accommodation Name" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="addTitle_txtvalid" Display="Dynamic" SetFocusOnError="true" runat="server" ControlToValidate="addName_txt" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>

                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="addPrice_txt" class="form-control" placeholder="Price" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="addPrice_txt" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                   ControlToValidate="addPrice_txt" ValidationExpression="^[1-9]\d*$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="addButtonValidGroup"></asp:RegularExpressionValidator>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="addAvailable_chk"  class="form-control" ></asp:CheckBox>
                    </td>
                </tr>
         </table>
    </div>
        </ContentTemplate>
        </asp:UpdatePanel>