<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="MultimediaSelection.aspx.cs" Inherits="Components_MultimediaBank_MultimediaSelection" %>

<%@ Register Src="~/Components/MultimediaBank/MultimediaSelection.ascx" TagPrefix="uc1" TagName="MultimediaSelection" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MultimediaSelection runat="server" id="MultimediaSelection" />
</asp:Content>

