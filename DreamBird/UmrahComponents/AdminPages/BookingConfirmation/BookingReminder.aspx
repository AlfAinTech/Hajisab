<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookingReminder.aspx.cs" MasterPageFile="~/UmrahComponents/AdminMasterPages/BookingConfirmation.master" Inherits="UmrahComponents_AdminPages_BookingConfirmation_BookingReminder" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Booking/PackageEmailReminder.ascx" TagPrefix="uc1" TagName="PackageEmailReminder" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:PackageEmailReminder runat="server" ID="PackageEmailReminder" />
        </div>
</asp:Content>
