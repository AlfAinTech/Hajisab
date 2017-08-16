<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="CustomAdminPage.aspx.cs" Inherits="Components_TextBank_Custome_Text_Bank_CustomAdminPage" %>

<%@ Register Src="~/Components/TextBank/CustomTextBank/CustomTextBankAdmin.ascx" TagPrefix="uc1" TagName="CustomTextBankAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <uc1:CustomTextBankAdmin runat="server" ID="CustomTextBankAdmin" />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
