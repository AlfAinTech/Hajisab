<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="UmrahDetails.aspx.cs" Inherits="Components_Dreams_UmrahDetails" %>

<%@ Register Src="~/Components/Packages/PackageDetail.ascx" TagPrefix="uc1" TagName="PackageDetail" %>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <uc1:PackageDetail runat="server" ID="PackageDetail" />
</asp:Content>

