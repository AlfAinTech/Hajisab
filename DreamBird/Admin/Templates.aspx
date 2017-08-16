<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Templates.aspx.cs" Inherits="Admin_Templates" %>

<%@ Register Src="~/Components/PageTemplate/TemplateList.ascx" TagPrefix="uc1" TagName="TemplateList" %>
<%@ Register Src="~/Components/PageTemplate/LayoutBuilder.ascx" TagPrefix="uc1" TagName="LayoutBuilder" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-md-3" id="side-nav">
        <uc1:TemplateList runat="server" ID="TemplateList" OnTemplateClicked="TemplateList_TemplateClicked" />
    </div>
    <div class="col-md-9" style="background-color:#e6e6e6; height:500px; overflow-y:auto;">
        <uc1:LayoutBuilder runat="server" ID="LayoutBuilder" />
    </div>
</asp:Content>

