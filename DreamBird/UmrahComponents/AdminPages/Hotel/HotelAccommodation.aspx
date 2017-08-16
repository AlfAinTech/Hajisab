<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/UmrahComponents/AdminMasterPages/Hotel.master" CodeFile="HotelAccommodation.aspx.cs" Inherits="UmrahComponents_AdminPages_Hotel_HotelAccommodation" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Hotel/Accommodations.ascx" TagPrefix="uc1" TagName="Accommodations" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:Accommodations runat="server" id="Accommodation" />
        </div>
</asp:Content>
