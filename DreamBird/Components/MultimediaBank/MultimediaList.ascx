<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MultimediaList.ascx.cs" Inherits="Components_MultimediaBank_MultimediaList" %>
<%@ Register Src="~/Components/MultimediaBank/MultimediaSearch.ascx" TagPrefix="uc1" TagName="MultimediaSearch" %>

<div class="col-md-12">
    <uc1:MultimediaSearch runat="server" ID="MultimediaSearch" />
</div>
<div class="col-md-12">
    <asp:Repeater ID="rptr_multimedia_list" runat="server">
        <HeaderTemplate>
            <div class="list-group">
        </HeaderTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="item_multimedia" CssClass="list-group-item" data-mmid='<%# Eval("id") %>' OnClick="item_multimedia_Click" runat="server"><%# Eval("Name") %></asp:LinkButton>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>
</div>