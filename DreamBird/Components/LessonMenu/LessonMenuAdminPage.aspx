

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/AdminBlank.master" CodeFile="LessonMenuAdminPage.aspx.cs" Inherits="Components_LessonMenu_LessonMenuAdminPage" %>

<%@ Register Src="~/Components/LessonMenu/LessonMenuAvailability/LessonMenuAdminNew.ascx" TagPrefix="uc1" TagName="LessonMenuAdminNew" %>
<%@ Register Src="~/Components/Dreams/DreamPageBasicInfo.ascx" TagPrefix="uc1" TagName="DreamPageBasicInfo" %>





<%--<%@ Register Src="~/Components/LessonMenu/LessonMenuAdmin.ascx" TagPrefix="uc1" TagName="LessonMenuAdmin" %>

<%@ Register Src="~/Components/LessonMenu/LessonMenuList.ascx" TagPrefix="uc1" TagName="LessonMenuList" %>--%>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
   <%--<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-ui.js"></script>
    <script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>--%>
    <%--<link href="<%# Server.MapPath("~/") %>/Content/css/jquery-ui.css" rel="stylesheet" />
    <script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>--%>
    <uc1:DreamPageBasicInfo runat="server" ID="DreamPageBasicInfo" />
    <div>
        <%--<uc1:LessonMenuAdmin runat="server" ID="LessonMenuAdmin" />--%>
        <uc1:LessonMenuAdminNew runat="server" ID="LessonMenuAdminNew" />
    </div>
      


</asp:Content>
 
