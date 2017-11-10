<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustomBookingDetail.aspx.cs" MasterPageFile="~/UmrahComponents/AdminMasterPages/BookingConfirmation.master" Inherits="UmrahComponents_AdminPages_CustomBookingDetail" %>

<%@ Register Src="~/Components/Packages/BookedPackages.ascx" TagPrefix="uc1" TagName="BookedPackages" %>
<%@ Register Src="~/UmrahComponents/AdminControls/Booking/AgentBookingDetail.ascx" TagPrefix="uc1" TagName="AgentBookingDetail" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <%--<uc1:BookedPackages runat="server" ID="BookedPackages" />--%>
        <uc1:AgentBookingDetail runat="server" ID="AgentBookingDetail" ShowCustomPackage="true" />
        </div>
</asp:Content>