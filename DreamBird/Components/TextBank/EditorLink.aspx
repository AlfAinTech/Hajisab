<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="EditorLink.aspx.cs" Inherits="Components_TextBank_EditorLink" %>

<%@ Register Src="~/Components/LessonMenu/LessonMenuList.ascx" TagPrefix="uc1" TagName="LessonMenuList" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        //jQuery(document).ready(function ($) {
        //    var openerurl = opener.location.href;
        //    alert(openerurl);
        //});
        function AddLink(txtLink) {
            var dialog = window.opener.CKEDITOR.dialog.getCurrent();
            dialog.setValueOf('info', 'url', txtLink);  // Populates the URL field in the Links dialogue.
            dialog.setValueOf('info', 'protocol', '');  // This sets the Link's Protocol to Other which loads the file from the same folder the link is on
            window.close(); // closes the popup window
        }
    </script>
    <div class="col-md-12">
        <div class="col-md-3">
            <asp:DropDownList ID="ddl_option" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_option_SelectedIndexChanged">
                <asp:ListItem Text="Menu Pages" Value="Menu"></asp:ListItem>
                <asp:ListItem Text="Dream Pages" Value="Dream"></asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
    <div class="col-md-12">
        <div class="col-md-4">
            <asp:DropDownList ID="ddl_dream" CssClass="form-control" OnSelectedIndexChanged="ddl_dream_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
        </div>
        <div class="col-md-4">
            <asp:DropDownList ID="ddl_page" CssClass="form-control" OnSelectedIndexChanged="ddl_page_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>
        </div>
        <div class="col-md-4">
            <uc1:LessonMenuList runat="server" ID="LessonMenuList" OnmenuClicked="LessonMenuList_menuClicked" showCheckboxes="false" />
        </div>
    </div>
</asp:Content>

