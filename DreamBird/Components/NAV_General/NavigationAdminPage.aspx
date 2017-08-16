<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NavigationAdminPage.aspx.cs" Inherits="Components_NAV_General_NavigationAdminPage"  MasterPageFile="~/DragDropControlsAdmin.master" %>

<%@ Register Src="~/Components/NAV_General/NavigationAdminSetting.ascx" TagPrefix="uc1" TagName="NavigationAdminSetting" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   

    <div>
        <uc1:NavigationAdminSetting runat="server" ID="NavigationAdminSetting" />
    </div>
     </asp:Content>