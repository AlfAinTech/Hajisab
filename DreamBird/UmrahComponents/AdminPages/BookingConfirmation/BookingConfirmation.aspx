<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookingConfirmation.aspx.cs" MasterPageFile="~/UmrahComponents/AdminMasterPages/BookingConfirmation.master" Inherits="UmrahComponents_AdminPages_BookingConfirmation_BookingConfirmation" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Booking/BookingConfirmation.ascx" TagPrefix="uc1" TagName="BookingConfirmation" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:BookingConfirmation runat="server" ID="BookingConfirmation" />
        </div>
</asp:Content>