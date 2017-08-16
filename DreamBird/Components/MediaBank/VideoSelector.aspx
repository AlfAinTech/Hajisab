<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="VideoSelector.aspx.cs" Inherits="Components_MediaBank_VideoSelector" %>

<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc1" TagName="MediaBankControl" %>
<%@ Register Src="~/Components/MediaBank/MediaBank.ascx" TagPrefix="uc1" TagName="MediaBank" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

     <script>
        //jQuery(document).ready(function ($) {
        //    var openerurl = opener.location.href;
        //    alert(openerurl);
        //});
        function AddLink(txtLink) {
            var dialog = window.opener.CKEDITOR.dialog.getCurrent();
            dialog.setValueOf('tab-basic', 'url', txtLink);  // Populates the URL field in the Links dialogue.
            //dialog.setValueOf('info', 'protocol', '');  // This sets the Link's Protocol to Other which loads the file from the same folder the link is on
            window.close(); // closes the popup window
        }
    </script>
    <uc1:MediaBank runat="server" ID="MediaBank" OnMediaSelected="MediaBankControl_MediaSelectedEvent" />
    <%--<uc1:MediaBankControl runat="server" ID="MediaBankControl" ShowVideoTypeMedia="true" OnMediaSelectedEvent="MediaBankControl_MediaSelectedEvent" />--%>
</asp:Content>

