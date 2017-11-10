<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="PackageAdminPages.aspx.cs" Inherits="Components_Package_PackageAdminPages" %>

<%@ Register Src="~/Components/Packages/PackageBasicInfo.ascx" TagPrefix="uc1" TagName="PackageBasicInfo" %>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:PackageBasicInfo runat="server" ID="PackageBasicInfo" />
</asp:Content>

