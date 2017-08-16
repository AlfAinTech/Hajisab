<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="Grid.aspx.cs" Inherits="Components_Grid_Grid" %>

<%@ Register Src="~/Components/Grid/Grid.ascx" TagPrefix="uc1" TagName="Grid" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Grid runat="server" ID="Grid" />
</asp:Content>

