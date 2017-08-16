<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="ManageAssignment.aspx.cs" Inherits="Components_Assignments_ManageAssignment" %>

<%@ Register Src="~/Components/Assignments/ManageAssignment.ascx" TagPrefix="uc1" TagName="ManageAssignment" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ManageAssignment runat="server" ID="ManageAssignment" />
</asp:Content>

