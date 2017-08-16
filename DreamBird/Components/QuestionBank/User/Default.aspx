<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Components_QuestionBank_User_Default" %>

<%@ Register Src="~/Components/QuestionBank/User/QuestionView.ascx" TagPrefix="uc1" TagName="QuestionView" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:QuestionView runat="server" ID="QuestionView" />
</asp:Content>

