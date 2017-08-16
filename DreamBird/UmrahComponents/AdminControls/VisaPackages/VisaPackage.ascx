<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VisaPackage.ascx.cs" Inherits="UmrahComponents_AdminControls_VisaPackages_VisaPackage" %>

<div class="col-md-6"><h2>Gregorian Calender</h2></div> 
 <div class="col-md-6">
  <%--  <div class="col-md-6">
        <h4>From</h4>
        <asp:TextBox ID="fromDate" runat="server"   Text='<%# Eval("issueDateText") %>' type="date"  class="form-control"   style="background-color: inherit;" OnTextChanged="fromDate_TextChanged" AutoPostBack="True"></asp:TextBox>
        
    </div>
    <div class="col-md-6">
        <h4>To</h4>
          <asp:TextBox ID="toDate" runat="server" Text='<%# Eval("expireDateText") %>'  type="date"  class="form-control"   style="background-color: inherit;" OnTextChanged="toDate_TextChanged" AutoPostBack="True"></asp:TextBox>
    </div>--%>
    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<div class="col-md-12" style="margin-top: 20px;">
     <table style="width: 100%">
<asp:Repeater ID="visa_list" runat="server"   >
    <HeaderTemplate>
        
        <tr>
                    <th></th>
                    <th><h3>Visa Title</h3></th>
                    <th><h3>Amount</h3></th>
                    <th><h3>Available From</h3></th>
                    <th><h3>Available Till</h3></th>
                </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
                    <td>
                        <div class="col-md-6" style="padding:0;">
                            <asp:LinkButton class="btn btn-default" ID="update_btn" CommandArgument='<%# Eval("id") %>' CausesValidation="true" ValidationGroup="EditDataValid" runat="server" OnClick="updatebutton_clicked" Visible="false"><span class="glyphicon glyphicon-pencil" ></span></asp:LinkButton>
                            <asp:LinkButton class="btn btn-default" ID="edit_btn" CommandArgument='<%# Eval("id") %>'  runat="server" OnClick="editbutton_clicked"><span class="glyphicon glyphicon-pencil"></span></asp:LinkButton>
                        </div>
                        <div class="col-md-6" style="padding:0;">
                            <asp:LinkButton runat="server" ID="delete_btn" CommandArgument='<%# Eval("id") %>' OnClick="deleteButton_clicked" class="btn btn-primary"><span class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox ID="visaTitle_txt" CssClass="form-control" runat="server" Text='<%# Eval("visaTitle") %>'  Enabled="false" style="background-color: inherit;"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="visaTitle_txt"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                   </td>
                    <td>
                        <asp:TextBox ID="amount_txt" runat="server" CssClass="form-control" Text='<%# Eval("amount") %>' Enabled="false"  ValidationGroup="EditDataValid" style="background-color: inherit;" type="number" min="0"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                   ControlToValidate="amount_txt" ValidationExpression="^[1-9]\d*$"  Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="EditDataValid"></asp:RegularExpressionValidator>     
                    <asp:RequiredFieldValidator  ID="RequiredFieldValidator1" runat="server" ControlToValidate="amount_txt"  Display="Dynamic" SetFocusOnError="true" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="availableFrom_txt" runat="server"  Text='<%# Eval("issueDateText") %>' type="date"  CssClass="form-control"  Enabled="false" style="background-color: inherit;" ValidationGroup="EditDataValid"></asp:TextBox>
                   
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="availableFrom_txt" ValidationGroup="EditDataValid" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator44" runat="server"
                   ControlToValidate="availableFrom_txt" ValidationExpression="^\d{4}\-\d{2}\-\d{2}$" Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="EditDataValid"></asp:RegularExpressionValidator>
                            </td>
                    <td>
                        <asp:TextBox ID="availableTill_txt" runat="server"  Text='<%# Eval("expireDateText") %>'  type="date"  CssClass="form-control"  Enabled="false" style="background-color: inherit;" ValidationGroup="EditDataValid"></asp:TextBox>
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
                            <asp:LinkButton runat="server" ID="AddNewVisaPackages_btn" OnClick="AddNewVisaPackages_Clicked" ValidationGroup="addButtonValidGroup" class="btn btn-default"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="addTitle_txt" class="form-control" placeholder="Visa Title" ></asp:TextBox>
                   
                        <asp:RequiredFieldValidator ID="addTitle_txtvalid" Display="Dynamic" SetFocusOnError="true" runat="server" ControlToValidate="addTitle_txt" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red"></asp:RequiredFieldValidator>
                    
                          </td>
                    <td>
                        <asp:TextBox runat="server" ID="addAmount_txt" class="form-control" placeholder="amount" type="number" min="0" ></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                   ControlToValidate="addAmount_txt" ValidationExpression="^[1-9]\d*$"  Display="Dynamic" SetFocusOnError="true" ErrorMessage="invalid" Font-Bold="True"  ForeColor="Red" ValidationGroup="addButtonValidGroup"></asp:RegularExpressionValidator>     
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="addAmount_txt" ValidationGroup="addButtonValidGroup" ErrorMessage="Field Required" Font-Bold="True"  ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
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
   