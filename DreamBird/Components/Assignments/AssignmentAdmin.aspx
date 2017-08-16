<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="AssignmentAdmin.aspx.cs" Inherits="Components_Assignments_AssignmentAdmin" %>

<%@ Register Src="~/Components/Assignments/AssignmentsAdmin.ascx" TagPrefix="uc1" TagName="AssignmentsAdmin" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AssignmentsAdmin runat="server" ID="AssignmentsAdmin" mode="Selection" />
</asp:Content>

