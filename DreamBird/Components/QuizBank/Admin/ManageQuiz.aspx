<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="ManageQuiz.aspx.cs" Inherits="Components_QuizBank_Admin_ManageQuiz" %>

<%@ Register Src="~/Components/QuizBank/Admin/ManageQuiz.ascx" TagPrefix="uc1" TagName="ManageQuiz" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ManageQuiz runat="server" ID="ManageQuiz" />
</asp:Content>

