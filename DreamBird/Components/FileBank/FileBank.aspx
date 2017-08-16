<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="FileBank.aspx.cs" Inherits="Components_FileBank_FileBank" %>

<%@ Register Src="~/Components/FileBank/FileBank.ascx" TagPrefix="uc1" TagName="FileBank" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:FileBank runat="server" ID="FileBank" />
</asp:Content>

