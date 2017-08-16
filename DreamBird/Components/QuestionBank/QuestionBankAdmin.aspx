<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="QuestionBankAdmin.aspx.cs" Inherits="Components_QuestionBank_QuestionBankAdmin" %>

<%@ Register Src="~/Components/QuestionBank/QuestionBankAdmin.ascx" TagPrefix="uc1" TagName="QuestionBankAdmin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:QuestionBankAdmin runat="server" ID="QuestionBankAdmin" />
</asp:Content>

