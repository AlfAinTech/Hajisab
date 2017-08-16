<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Assignments.aspx.cs" Inherits="Admin_Assignments" %>

<%@ Register Src="~/Components/Assignments/AssignmentsAdmin.ascx" TagPrefix="uc1" TagName="AssignmentsAdmin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AssignmentsAdmin runat="server" ID="AssignmentsAdmin" mode="View" />
</asp:Content>

