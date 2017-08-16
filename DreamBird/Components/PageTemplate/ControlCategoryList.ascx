<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ControlCategoryList.ascx.cs" Inherits="Components_PageTemplate_ControlCategoryList" %>
<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>
            <div class="modal" style="display:block">
                <div class="center">
                    <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Repeater ID="rptr_controlCategory" runat="server">
            <HeaderTemplate>
                <div class="list-group">
            </HeaderTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="control_category_item" CssClass="list-group-item" runat="server" Text='<%# Eval("Name") %>' CausesValidation="false" cat_id='<%# Eval("id") %>' OnClick="control_category_item_Click"></asp:LinkButton>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </ContentTemplate>
</asp:UpdatePanel>
