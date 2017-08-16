<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UmrahComponents/AdminMasterPages/Package.master" CodeFile="PackageDetail.aspx.cs" Inherits="UmrahComponents_AdminPages_Package_PackageDetail" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Packages/PackageDetail.ascx" TagPrefix="uc1" TagName="PackageDetail" %>





<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:PackageDetail runat="server" ID="PackageDetail" />
        </div>
</asp:Content>

