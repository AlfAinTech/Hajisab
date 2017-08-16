<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonAvailabilityAdmin.ascx.cs" Inherits="Components_LessonMenu_LessonMenuAvailability_LessonAvailabilityAdmin" %>
<div class="col-md-12" style="padding:15px;">
    <div class="row">
    <div class="col-md-4" style="text-align:right">
        Available From
        </div>
        <div class="col-md-6">
            <asp:TextBox ID="availableDate" runat="server" type="date" CssClass="form-control"></asp:TextBox>
            <asp:TextBox ID="id_lbl" runat="server" Visible="false"></asp:TextBox>
             <asp:TextBox ID="menuID_lbl" runat="server" Visible="false"></asp:TextBox>
            <asp:RequiredFieldValidator ID="availableTxt_validator" runat="server" ControlToValidate="availableDate" Enabled="False" ErrorMessage="*" ForeColor="#FF3300" Font-Bold="true" style="font-size: large"></asp:RequiredFieldValidator>
        </div>
        </div>
     <div class="row">
    <div class="col-md-4" style="text-align:right">
        Dealine
        </div>
        <div class="col-md-6">
             <asp:TextBox ID="deadLineDate" runat="server" type="date" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator ID="deadLineTxt_validator" runat="server" ControlToValidate="deadLineDate" Enabled="False" ErrorMessage="*" ForeColor="#FF3300" style="font-weight: 700; font-size: large"></asp:RequiredFieldValidator>
        </div>
        </div>
     <div class="row">
    <div class="col-md-4" style="text-align:right">
         Expected time Limit
        </div>
        <div class="col-md-6">
             <asp:TextBox ID="timeLimit" runat="server"  Width="62px">0</asp:TextBox>
             <asp:DropDownList ID="limitType" runat="server">
                 <asp:ListItem Value="0">Days</asp:ListItem>
                 <asp:ListItem Value="1">Week</asp:ListItem>
             </asp:DropDownList>
            <asp:RegularExpressionValidator ID="timeLimit_validator" runat="server" Display="None" ErrorMessage="Accepts only numbers." ControlToValidate="timeLimit" ValidationExpression="^[0-9]*$" Text="*"></asp:RegularExpressionValidator>
        </div>
        </div>
    <div class="col-md-12" style="padding:0; margin-top:15px;">
        <asp:Button ID="save" runat="server" Text="Save"  CssClass="btn btn-default" Width="100%" OnClick="save_Click"/>
        </div>
    </div>