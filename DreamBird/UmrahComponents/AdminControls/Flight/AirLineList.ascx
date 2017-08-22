<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AirLineList.ascx.cs" Inherits="UmrahComponents_AdminControls_Flight_AirLineList" %>
<%@ Register Src="~/UmrahComponents/AdminControls/Flight/AirLineSearch.ascx" TagPrefix="uc1" TagName="AirLineSearch" %>


<asp:Panel ID="search_panel" runat="server">
    <uc1:AirLineSearch runat="server" ID="AirLineSearch"   OnAirLineSearch="airLineSearch"/>
    <div class="col-md-2" style="padding:15px 15px 15px 0; background-color:#404040; display:inline-block;"><asp:Button ID="add_btn" CssClass="btn btn-default" runat="server" CausesValidation="false" OnClick="add_btn_Click" Text="+" />
    </div>
</asp:Panel>
<div class="col-md-12">
<asp:Repeater ID="AirLine_data_list" runat="server">
    <HeaderTemplate>
        <div class="list-group">
    </HeaderTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="airlineName" Text='<%# Eval("Name") %>'  name='<%# "AirLineButton_"+Eval("id").ToString() %>' CssClass="list-group-item" CommandArgument='<%# Eval("id")%>' OnClick="airLine_btn_Click" CausesValidation="false" runat="server"></asp:LinkButton>
    </ItemTemplate>
    <FooterTemplate>
       </div>

    </FooterTemplate>
</asp:Repeater>
    </div>