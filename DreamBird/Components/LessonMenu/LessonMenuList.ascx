<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonMenuList.ascx.cs" Inherits="Components_LessonMenu_LessonMenuList" %>
<style>
    th td {
        border-bottom: 1px solid #ddd;
    }
</style>
<script type="text/javascript">

    //function postBackByObject() {
    //    var o = window.event.srcElement;
    //    if (o.tagName == "INPUT" && o.type == "checkbox") {
    //        __doPostBack("", "");
    //    }
    }
</script>
<asp:Panel ID="Menu_panel" runat="server" BorderStyle="None" Width="100%" Style="background-color: #e6e6e6;">
    <asp:TreeView ID="TreeView1" runat="server" CssClass="nav nav-pills nav-stacked" OnTreeNodeCheckChanged="TreeView1_TreeNodeCheckChanged" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowExpandCollapse="true" ExpandDepth="0">
    </asp:TreeView>
</asp:Panel>
