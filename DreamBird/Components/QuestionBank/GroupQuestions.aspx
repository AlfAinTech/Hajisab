<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="GroupQuestions.aspx.cs" Inherits="Components_QuestionBank_GroupQuestions" %>

<%@ Register Src="~/Components/QuestionBank/GroupQuestionsHandler.ascx" TagPrefix="uc1" TagName="GroupQuestionsHandler" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:GroupQuestionsHandler runat="server" ID="GroupQuestionsHandler" />
</asp:Content>

