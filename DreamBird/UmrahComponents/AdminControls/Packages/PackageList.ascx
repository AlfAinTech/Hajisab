<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackageList.ascx.cs" Inherits="UmrahComponents_AdminControls_Packages_PackageList" %>
<%@ Register Src="~/UmrahComponents/AdminControls/Packages/PackageSearch.ascx" TagPrefix="uc1" TagName="PackageSearch" %>


<asp:Panel ID="search_panel" runat="server">
    <uc1:PackageSearch runat="server" ID="PackageSearch" OnpackageSearch="packageSearch_packageSearchrd"  />
    <div class="col-md-2" style="padding:15px 15px 15px 0; background-color:#404040; display:inline-block;"><asp:Button ID="add_btn" CssClass="btn btn-default" runat="server" CausesValidation="false" OnClick="add_btn_Click" Text="+" />
    </div>
</asp:Panel>
<div class="col-md-12">
<asp:Repeater ID="package_data_list" runat="server">
    <HeaderTemplate>
        <div class="list-group">
    </HeaderTemplate>
    <ItemTemplate>
        <asp:LinkButton ID="packageName" Text='<%# Eval("name") %>' CssClass="list-group-item" CommandArgument='<%# Eval("id")%>' OnClick="package_btn_Click" CausesValidation="false" runat="server"></asp:LinkButton>
    </ItemTemplate>
    <FooterTemplate>
       </div>

    </FooterTemplate>
</asp:Repeater>
    </div>