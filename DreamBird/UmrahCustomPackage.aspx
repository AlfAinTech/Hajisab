<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/User.master" CodeFile="UmrahCustomPackage.aspx.cs" Inherits="UmrahCustomPackage" %>

<%@ Register Src="~/UmrahComponents/headerFooter/Packageheader.ascx" TagPrefix="uc1" TagName="Packageheader" %>
<%@ Register Src="~/UmrahComponents/headerFooter/PackageFooter.ascx" TagPrefix="uc1" TagName="PackageFooter" %>
<%@ Register Src="~/UmrahComponents/headerFooter/DetailHeader.ascx" TagPrefix="uc1" TagName="DetailHeader" %>
<%@ Register Src="~/UmrahComponents/PackageComponent/CustomPackageAdd.ascx" TagPrefix="uc1" TagName="CustomPackageAdd" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">















    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>


    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>--%>


    <div id="body_content" runat="server">
        <div runat="server">
            <uc1:Packageheader runat="server" ID="Packageheader" />
            <uc1:DetailHeader runat="server" ID="DetailHeader" />


        </div>
        <div class="content_wrap" runat="server">
            <div class="container" runat="server">
                <uc1:CustomPackageAdd runat="server" ID="CustomPackageAdd" />
            </div>
        </div>
        <div runat="server">
            <uc1:PackageFooter runat="server" ID="PackageFooter" />
        </div>

    </div>
    <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
</asp:Content>
