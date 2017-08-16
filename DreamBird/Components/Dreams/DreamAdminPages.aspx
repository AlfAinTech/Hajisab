<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="DreamAdminPages.aspx.cs" Inherits="Components_Dreams_DreamAdminPages" %>

<%@ Register Src="~/Components/Dreams/DreamBasicInfo.ascx" TagPrefix="uc1" TagName="DreamBasicInfo" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DreamBasicInfo runat="server" ID="DreamBasicInfo" />
</asp:Content>

