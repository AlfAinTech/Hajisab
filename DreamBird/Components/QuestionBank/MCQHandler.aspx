<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="MCQHandler.aspx.cs" Inherits="Components_QuestionBank_MCQHandler" %>

<%@ Register Src="~/Components/QuestionBank/MCQHandler.ascx" TagPrefix="uc1" TagName="MCQHandler" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MCQHandler runat="server" ID="MCQHandler" />
</asp:Content>

