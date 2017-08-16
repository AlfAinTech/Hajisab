<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="SharedTextBankPage.aspx.cs" Inherits="Components_TextBank_SharedTextBank_SharedTextBankPage" %>

<%@ Register Src="~/Components/TextBank/SharedTextBank/SharedTextBankSelection.ascx" TagPrefix="uc1" TagName="SharedTextBankSelection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <uc1:SharedTextBankSelection runat="server" ID="SharedTextBankSelection" />

</asp:Content>
