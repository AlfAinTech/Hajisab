<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AirLineBasicInfo.ascx.cs" Inherits="UmrahComponents_AdminControls_Flight_AirLineBasicInfo" %>
<div class="col-ms-12"> 
<h4>AirLine Name</h4>
            <asp:TextBox ID="name_txt" class="form-control" placeholder="AirLine Name" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1_name" runat="server" ErrorMessage="*" ControlToValidate="name_txt" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Button  runat="server" class="btn btn-primary" style="margin:0px" Text="Save changes" ID="save" OnClick="save_Click"></asp:Button>
      </div>
