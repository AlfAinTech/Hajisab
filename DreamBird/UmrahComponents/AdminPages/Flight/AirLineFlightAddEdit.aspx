<%@ Page Language="C#" MasterPageFile="~/UmrahComponents/AdminMasterPages/Flight.master" AutoEventWireup="true" CodeFile="AirLineFlightAddEdit.aspx.cs" Inherits="UmrahComponents_AdminPages_Flight_AirLineFlightAddEdit" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Flight/FlightAddEdit.ascx" TagPrefix="uc1" TagName="FlightAddEdit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:FlightAddEdit runat="server" ID="FlightAddEdit"  OncloseClicked="closeButton_Clicked" OnSaveClicked="flightsave_Clicked"/>
        </div>
</asp:Content>
