<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UmrahComponents/AdminMasterPages/Package.master" CodeFile="PackageDiscount.aspx.cs" Inherits="UmrahComponents_AdminPages_Package_PackageDiscount" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Packages/DiscountPackages.ascx" TagPrefix="uc1" TagName="DiscountPackages" %>
<%@ Register Src="~/UmrahComponents/ConfirmationModalUC.ascx" TagPrefix="uc1" TagName="ConfirmationModalUC" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:DiscountPackages runat="server" ID="DiscountPackages" />
        <uc1:ConfirmationModalUC runat="server" ID="ConfirmationModalUC" />
        </div>
</asp:Content>
