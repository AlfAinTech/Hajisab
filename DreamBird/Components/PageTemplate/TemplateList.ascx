<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TemplateList.ascx.cs" Inherits="Components_PageTemplate_TemplateList" %>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Repeater ID="rptr_layoutList" runat="server">
            <HeaderTemplate>
                <div class="list-group">
            </HeaderTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="control_category_item" CssClass="list-group-item" runat="server" Text='<%# Eval("layoutName") %>' CausesValidation="false" cat_id='<%# Eval("id") %>' OnClick="control_category_item_Click"></asp:LinkButton>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>

    </ContentTemplate>
</asp:UpdatePanel>