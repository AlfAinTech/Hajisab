<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="FillInBlanksHandler.aspx.cs" Inherits="Components_QuestionBank_FillInBlanksHandler" %>

<%@ Register Src="~/Components/QuestionBank/FillInBlanksHandler.ascx" TagPrefix="uc1" TagName="FillInBlanksHandler" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:FillInBlanksHandler runat="server" ID="FillInBlanksHandler" />
</asp:Content>

