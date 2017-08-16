<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AccommodationsMakkah.ascx.cs" Inherits="UmrahComponents_PackageComponent_AccommodationsMakkah" %>
<asp:Panel ID="package_panel" runat="server">

    <div class="panel panel-warning">
      <div class="panel-heading">
        <h3 class="panel-title">Accommodation in Makkah</h3>
    </div>
    <div class="panel-body">
        <ul class="list-group">
            <asp:Repeater ID="accommodation_list" runat="server">
                <ItemTemplate>

                <li class="list-group-item"><h5 style="color: black; text-align: left;">
                    <asp:Label ID="id_lbl" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                    <asp:RadioButton ID="isselected_btn"    AutoPostBack="true" runat="server" GroupName="package" OnCheckedChanged="accomodation_changed" /><asp:Label ID="packageDiscount_title"  Text='<%# Eval("Name") %>' runat="server"></asp:Label></h5>
                    <h6 style="color: black; text-align: left;">Amount <asp:Label ID="discountpercent_lbl" runat="server" Text='<%# Eval("price") %>'></asp:Label> PKR Per Night</h6></li>
            </ItemTemplate>  
             </asp:Repeater>
        </ul>
  </div>
  <div class="panel-footer">
  </div>
</div>
<%--<div class="col-md-12"><asp:Button runat="server" ID="save" class="btn btn-success" style="width: 100%;" Text="Next" OnClick="save_Click"></asp:Button></div>>--%>
    </asp:Panel>
