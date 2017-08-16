<%@ Page Language="C#" MasterPageFile="~/UmrahComponents/AdminMasterPages/Hotel.master"  AutoEventWireup="true" CodeFile="HotelDirections.aspx.cs" Inherits="UmrahComponents_AdminPages_Hotel_HotelDirections" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Hotel/Directions.ascx" TagPrefix="uc1" TagName="Directions" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:Directions runat="server" id="Directions" />
        </div>
</asp:Content>
