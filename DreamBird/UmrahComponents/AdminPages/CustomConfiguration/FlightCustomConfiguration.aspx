<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FlightCustomConfiguration.aspx.cs" MasterPageFile="~/UmrahComponents/AdminMasterPages/CustomConfiguration.master" Inherits="UmrahComponents_AdminPages_CustomConfiguration_FlightCustomConfiguration" %>

<%@ Register Src="~/UmrahComponents/AdminControls/CustomConfiguration/CustomFlight.ascx" TagPrefix="uc1" TagName="CustomFlight" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:CustomFlight runat="server" ID="CustomFlight" />
        </div>
</asp:Content>