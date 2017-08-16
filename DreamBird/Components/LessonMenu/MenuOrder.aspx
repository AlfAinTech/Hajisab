<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="MenuOrder.aspx.cs" Inherits="Components_LessonMenu_MenuOrder" %>

<%@ Register Src="~/Components/LessonMenu/MenuOrder.ascx" TagPrefix="uc1" TagName="MenuOrder" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MenuOrder runat="server" ID="MenuOrder" />
</asp:Content>

