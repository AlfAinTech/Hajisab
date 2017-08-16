<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="SetQuiz.aspx.cs" Inherits="Components_QuizBank_Admin_SetQuiz" %>

<%@ Register Src="~/Components/QuizBank/Admin/SetQuiz.ascx" TagPrefix="uc1" TagName="SetQuiz" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SetQuiz runat="server" ID="SetQuiz" />
</asp:Content>

