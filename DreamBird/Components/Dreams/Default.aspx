<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Components_Dreams_Default" %>

<%@ Register Src="~/Components/Dreams/DreamView_New.ascx" TagPrefix="uc1" TagName="DreamView_New" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DreamView_New runat="server" ID="DreamView_New" />
</asp:Content>

