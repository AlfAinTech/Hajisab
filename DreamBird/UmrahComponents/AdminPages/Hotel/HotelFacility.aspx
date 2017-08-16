<%@ Page Language="C#" MasterPageFile="~/UmrahComponents/AdminMasterPages/Hotel.master"    AutoEventWireup="true" CodeFile="HotelFacility.aspx.cs" Inherits="UmrahComponents_AdminPages_HotelFacility" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Hotel/Facilities.ascx" TagPrefix="uc1" TagName="Facilities" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:Facilities runat="server" ID="Facilities"  />
        </div>
</asp:Content>