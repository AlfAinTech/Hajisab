<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HotelList.ascx.cs" Inherits="UmrahComponents_AdminControls_Hotel_HotelList" %>
<%@ Register Src="~/UmrahComponents/AdminControls/Hotel/HotelSearch.ascx" TagPrefix="uc1" TagName="HotelSearch" %>


<%--<script>
    selectedItem = function(data)
    {
        $(data).addClass("active");
    }
</script>--%>
<asp:Panel ID="search_panel" runat="server">
    <uc1:HotelSearch runat="server" ID="HotelSearch"  OnhotelSearch="hotelSearch_hotelSearchrd"  />
    <div class="col-md-2" style="padding:15px 15px 15px 0; background-color:#404040; display:inline-block;"><asp:Button ID="add_btn" CssClass="btn btn-default" runat="server" CausesValidation="false" OnClick="add_btn_Click" Text="+" />
    </div>
</asp:Panel>
<div class="col-md-12">
<asp:Repeater ID="Hotel_data_list" runat="server">
    <HeaderTemplate>
        <div class="list-group" id="hotelList">
    </HeaderTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="dreamName"   name='<%# "dreamButton_"+Eval("id") %>'  Text='<%# Eval("hotelName") %>' CssClass="list-group-item" CommandArgument='<%# Eval("id")%>' OnClick="hotel_btn_Click" CausesValidation="false" runat="server"></asp:LinkButton>
    </ItemTemplate>
    <FooterTemplate>
       </div>

    </FooterTemplate>
</asp:Repeater>
    </div>