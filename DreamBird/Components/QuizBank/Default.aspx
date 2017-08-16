<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Components_QuizBank_Default" %>

<%@ Register Src="~/Components/QuizBank/User/QuizResultSummary.ascx" TagPrefix="uc1" TagName="QuizResultSummary" %>





<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:QuizResultSummary runat="server" ID="QuizResultSummary" />
</asp:Content>

