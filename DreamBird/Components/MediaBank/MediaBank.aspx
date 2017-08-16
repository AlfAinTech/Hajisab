<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="MediaBank.aspx.cs" Inherits="Components_MediaBank_MediaBank" %>

<%@ Register Src="~/Components/MediaBank/MediaBank.ascx" TagPrefix="uc1" TagName="MediaBank" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MediaBank runat="server" ID="MediaBank" />
</asp:Content>

