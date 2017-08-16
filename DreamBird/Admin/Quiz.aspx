<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Quiz.aspx.cs" Inherits="Admin_Quiz" %>

<%@ Register Src="~/Components/QuizBank/QuizBankAdmin.ascx" TagPrefix="uc1" TagName="QuizBankAdmin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:QuizBankAdmin runat="server" ID="QuizBankAdmin" quizMode="View" />
</asp:Content>

