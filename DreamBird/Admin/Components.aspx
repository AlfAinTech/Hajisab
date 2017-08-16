<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Components.aspx.cs" Inherits="Admin_Components" %>

<%@ Register Src="~/Components/PageTemplate/SearchComponents.ascx" TagPrefix="uc1" TagName="SearchComponents" %>
<%@ Register Src="~/Components/PageTemplate/ControlCategoryList.ascx" TagPrefix="uc1" TagName="ControlCategoryList" %>
<%@ Register Src="~/Components/PageTemplate/ComponentsList.ascx" TagPrefix="uc1" TagName="ComponentsList" %>
<%@ Register Src="~/Components/PageTemplate/AddControlCategory.ascx" TagPrefix="uc1" TagName="AddControlCategory" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="col-md-3" id="side-nav">
        <div class="col-md-12" style="padding:0; margin-top:10px;">
            <uc1:SearchComponents runat="server" ID="SearchComponents" OnSearchClicked="SearchComponents_SearchClicked" />
        </div>
        <div class="col-md-12" style="padding:0; margin-top:10px;">
            <uc1:AddControlCategory runat="server" ID="AddControlCategory" OnCategoryAdded="AddControlCategory_CategoryAdded" />
        </div>
        <div class="col-md-12" style="padding:0; margin-top:20px;">
            <uc1:ControlCategoryList runat="server" ID="ControlCategoryList" OnCategoryClicked="ControlCategoryList_CategoryClicked" />
        </div>
    </div>
    <div class="col-md-9" style="background-color:#e6e6e6; height:500px; overflow-y:auto;">
        <uc1:ComponentsList runat="server" ID="ComponentsList"/>
    </div>
</asp:Content>

