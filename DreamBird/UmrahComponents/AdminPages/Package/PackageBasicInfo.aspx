<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UmrahComponents/AdminMasterPages/Package.master" CodeFile="PackageBasicInfo.aspx.cs" Inherits="UmrahComponents_AdminPages_Package_PackageBasicInfo" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Packages/PackageInfo.ascx" TagPrefix="uc1" TagName="PackageInfo" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:PackageInfo runat="server" ID="PackageInfo" OnpackageAdded="package_Added" />
        </div>
</asp:Content>
