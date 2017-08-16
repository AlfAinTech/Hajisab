<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NavigationAdminSetting.ascx.cs" Inherits="Components_NAV_General_NavigationAdminSetting" %>

 <%@ Register src="NavigationView.ascx" tagname="NavigationView" tagprefix="uc1" %>



<%@ Register src="NavigationAdd.ascx" tagname="NavigationAdd" tagprefix="uc2" %>
<%@ Register Src="~/Components/NAV_General/NavigationEdit.ascx" TagPrefix="uc1" TagName="NavigationEdit" %>











<asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <p>
        <div class="row" style="text-align:right">
    <asp:Button ID="addNavigation" runat="server" OnClick="addNavigation_Click" Text="Add Navigation" CssClass="btn btn-primary" />
    </div>
    <br />
        <asp:Panel ID="ViewPanel" runat="server">
            <uc1:NavigationView ID="NavigationView" runat="server" EnableEditing="true" OnnavigationEdit="NavigationEdit_NavigationEdit" />
        </asp:Panel>
        <asp:Panel ID="AddPanel" runat="server">
            <uc2:NavigationAdd ID="NavigationAdd1" runat="server" OnnavigationAdded="NavigationAdd1_NavigationAdded" />
        </asp:Panel>
        <asp:Panel ID="EditPanel" runat="server">
            <%--<uc1:NavigationEdit ID="NavigationEdit" runat="server" OnnavigationEdited="NavigationEdit1_NavigationEdited" Visible="False" />--%>
            <uc1:NavigationEdit runat="server" ID="NavigationEdit" OnnavigationEdited="NavigationEdit1_NavigationEdited" Visible="False"/>
        </asp:Panel>
            <p>
            </p>
            <p>
            </p>
            <p>
            </p>
</p>
   
   

</ContentTemplate>

 </asp:UpdatePanel>
        