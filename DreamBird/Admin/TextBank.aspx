<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextBank.aspx.cs" ValidateRequest="false" MasterPageFile="~/Admin.master" Inherits="Admin_TextBank" %>

<%@ Register Src="~/Components/TextBank/SharedTextBank/SharedTextBankAdmin.ascx" TagPrefix="uc1" TagName="SharedTextBankAdmin" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:SharedTextBankAdmin runat="server" id="SharedTextBankAdmin" />
    </asp:Content>