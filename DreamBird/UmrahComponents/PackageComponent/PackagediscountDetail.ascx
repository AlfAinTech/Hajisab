<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackagediscountDetail.ascx.cs" Inherits="UmrahComponents_PackageComponent_PackagediscountDetail" %>

    <script>
    var radios = $("input:radio");
    radios.click(function () {
        radios.removeAttr('checked');
        $(this).prop("checked", true);
        $(this).attr('checked', 'checked'); // jQuery < 1.6
        console.log("tttttttttt");
        return true;
    });
</script>
<asp:Panel ID="package_panel" runat="server">

    <div class="panel panel-warning">
      <div class="panel-heading">
        <h3 class="panel-title">Package Summary</h3>
    </div>
    <div class="panel-body">
        <ul class="list-group">
            <asp:Repeater ID="discount_list" runat="server">
                <ItemTemplate>

                <li class="list-group-item"><h5 style="color: black; text-align: left;">
                    <asp:Label ID="id_lbl" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                    <asp:RadioButton ID="isselected_btn"    AutoPostBack="true" runat="server" GroupName="package" OnCheckedChanged="discount_changed" /><asp:Label ID="packageDiscount_title"  Text='<%# Eval("name") %>' runat="server"></asp:Label>
                    </h5><h6 style="color: black; text-align: left;">Additional <asp:Label ID="discountpercent_lbl" runat="server" Text='<%# Eval("discountPercent") %>'></asp:Label> % Discount</h6></li>
            </ItemTemplate>  
             </asp:Repeater>
        </ul>
  </div>
  <div class="panel-footer">
      <h4 style="color:black">Total Amount: PKR <asp:Label ID="totalAmount_txt" runat="server"></asp:Label></h4>
  </div>
</div>
<div class="col-md-12"><asp:Button runat="server" ID="save" class="btn btn-success" style="width: 100%;" Text="Book Package Now" OnClick="save_Click"></asp:Button></div></asp:Panel>

<asp:Panel ID="customPackge_panel" runat="server" Visible="false">
     <div class="panel panel-warning">
      <div class="panel-heading">
        <h3 class="panel-title">Package Summary</h3>
    </div>
    <div class="panel-body">
        <h4 style="color:black;">Economy Umra Package</h4>
        <h6 style="color:black"></h6>
        <ul style="padding-left: 15px; font-size: 12px;">
            <li><asp:Label ID="makkahHotel_detail"  runat="server"></asp:Label></li>
            <li><asp:Label ID="madinaHotel_detail"  runat="server"></asp:Label></li>
            <li><asp:Label ID="airLine_detail"  runat="server"></asp:Label></li>
        </ul>
  </div>
  <div class="panel-footer">
    <h5 style="color:black">Amount</h5>
      <h4 style="color:black"><asp:Label ID="totelPrice" runat="server"></asp:Label> / PKR</h4>
  </div>
</div>
</asp:Panel>