<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="QuizBankAdmin.aspx.cs" Inherits="Components_QuizBank_QuizBankAdmin" %>

<%@ Register Src="~/Components/QuizBank/QuizBankAdmin.ascx" TagPrefix="uc1" TagName="QuizBankAdmin" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:QuizBankAdmin runat="server" ID="QuizBankAdmin" quizMode="Selection" />
</asp:Content>

