﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="QuestionAdmin.aspx.cs" Inherits="Components_QuestionBank_Admin_QuestionAdmin" %>
<%@ Register Src="~/Components/QuestionBank/Admin/QuizAdmin.ascx" TagPrefix="uc1" TagName="QuizAdmin" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <uc1:QuizAdmin runat="server" ID="QuizAdmin" AllowMulti="false" />
</asp:Content>

