<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Files.aspx.cs" Inherits="Admin_Files" %>

<%@ Register Src="~/Components/FileBank/FileBank.ascx" TagPrefix="uc1" TagName="FileBank" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:FileBank runat="server" ID="FileBank" />
</asp:Content>

