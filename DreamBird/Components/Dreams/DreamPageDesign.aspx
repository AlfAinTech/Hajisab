<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="DreamPageDesign.aspx.cs" Inherits="Components_Dreams_DreamPageDesign" %>

<%@ Register Src="~/Components/Dreams/DreamPageDesign.ascx" TagPrefix="uc1" TagName="DreamPageDesign" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DreamPageDesign runat="server" ID="DreamPageDesign" />
</asp:Content>

