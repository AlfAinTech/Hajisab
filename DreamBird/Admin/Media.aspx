<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Media.aspx.cs" Inherits="Admin_Media" %>

<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc1" TagName="MediaBankControl" %>
<%@ Register Src="~/Components/MediaBank/MediaBank.ascx" TagPrefix="uc1" TagName="MediaBank" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <uc1:MediaBank runat="server" ID="MediaBank" />
    <%--<uc1:MediaBankControl runat="server" ID="MediaBankControl" ShowAudioTypeMedia="true" ShowImageTypeMedia="true" ShowVideoTypeMedia="true" ShowAdditionControls="false" ShowTranscriptOptions="true" />--%>
</asp:Content>

