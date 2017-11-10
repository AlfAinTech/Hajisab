<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UmrahComponents/AdminMasterPages/BookingConfirmation.master" CodeFile="BookingDetail.aspx.cs" Inherits="UmrahComponents_AdminPages_BookingConfirmation_BookingDetail" %>

<%@ Register Src="~/Components/Packages/BookedPackages.ascx" TagPrefix="uc1" TagName="BookedPackages" %>
<%@ Register Src="~/UmrahComponents/AdminControls/Booking/AgentBookingDetail.ascx" TagPrefix="uc1" TagName="AgentBookingDetail" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <%--<uc1:BookedPackages runat="server" ID="BookedPackages" />--%>
        <uc1:AgentBookingDetail runat="server" ID="AgentBookingDetail" ShowCustomPackage="false" />
        </div>
</asp:Content>