<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<%@ Register Src="~/Components/Dreams/DreamListView.ascx" TagPrefix="uc1" TagName="DreamListView" %>
<%@ Register Src="~/Components/Dreams/DreamBasicInfo.ascx" TagPrefix="uc1" TagName="DreamBasicInfo" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content_wrapper">
        <div class="row" style="margin: 0;">
            <div class="col-md-3" style="padding: 0;">
                <div class="col-md-12" id="welcome_nav">
                    <asp:LoginView ID="LoginView1" runat="server" ViewStateMode="Disabled">
                        <LoggedInTemplate>
                            <h3><a runat="server" href="~/Account/Manage" title="Manage your account">Good Day, <%: Context.User.Identity.GetUserName()  %>!</a></h3>
                        </LoggedInTemplate>
                    </asp:LoginView>
                </div>

                <div class="col-md-12" id="side-nav">
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                    <uc1:DreamListView runat="server" ID="DreamListView" OnAddClicked="dreamAdd_clicked" OnsearchClicked="SearchClicked" OnActivatePanels="DreamListView_ActivatePanels" OndreamCllicked="dream_clicked" />
                    <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
                </div>
            </div>
            <div class="col-md-9" style="background-color: #fcfcfc; padding: 30px; height: 565px;">
                <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>--%>
                <uc1:DreamBasicInfo runat="server" ID="DreamBasicInfo" OnDreamAdded="DreamBasicInfo_DreamAdded" Allowdelete="true" />

                <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
            </div>
        </div>
    </div>
</asp:Content>

