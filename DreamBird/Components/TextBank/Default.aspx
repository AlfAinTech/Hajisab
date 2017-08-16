<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Components_TextBank_Default" %>

<%@ Register Src="~/Components/TextBank/TextBankView.ascx" TagPrefix="uc1" TagName="TextBankView" %>
<%@ Register Src="~/Components/TextBank/TextBankAdmin.ascx" TagPrefix="uc1" TagName="TextBankAdmin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:TextBankAdmin runat="server" ID="TextBankAdmin" />
</asp:Content>

