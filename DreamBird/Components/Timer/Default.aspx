<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Components_Timer_Default" %>
<%@ Register Src="~/Components/Timer/Timer.ascx" TagPrefix="uc1" TagName="Timer" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Timer runat="server" ID="Timer" />
</asp:Content>

