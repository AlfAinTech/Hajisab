<%@ Page Language="C#" MasterPageFile="~/UmrahComponents/AdminMasterPages/Hotel.master"    AutoEventWireup="true" CodeFile="HotelFacility.aspx.cs" Inherits="UmrahComponents_AdminPages_HotelFacility" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Hotel/Facilities.ascx" TagPrefix="uc1" TagName="Facilities" %>
<%@ Register Src="~/UmrahComponents/ConfirmationModalUC.ascx" TagPrefix="uc1" TagName="ConfirmationModalUC" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:Facilities runat="server" ID="Facilities"  />
        <uc1:ConfirmationModalUC runat="server" ID="ConfirmationModalUC" />
        </div>
</asp:Content>