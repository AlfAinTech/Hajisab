<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="MultimediaBank.aspx.cs" Inherits="Admin_MultimediaBank" %>

<%@ Register Src="~/Components/MultimediaBank/MultimediaBankHome.ascx" TagPrefix="uc1" TagName="MultimediaBankHome" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MultimediaBankHome runat="server" ID="MultimediaBankHome" />
</asp:Content>

