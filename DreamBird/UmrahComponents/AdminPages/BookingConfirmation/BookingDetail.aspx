<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UmrahComponents/AdminMasterPages/BookingConfirmation.master" CodeFile="BookingDetail.aspx.cs" Inherits="UmrahComponents_AdminPages_BookingConfirmation_BookingDetail" %>

<%@ Register Src="~/Components/Dreams/BookedPackages.ascx" TagPrefix="uc1" TagName="BookedPackages" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:BookedPackages runat="server" ID="BookedPackages" />
        </div>
</asp:Content>