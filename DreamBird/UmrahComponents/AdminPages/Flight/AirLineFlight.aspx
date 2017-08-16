<%@ Page Language="C#" MasterPageFile="~/UmrahComponents/AdminMasterPages/Flight.master" AutoEventWireup="true" CodeFile="AirLineFlight.aspx.cs" Inherits="UmrahComponents_AdminPages_Flight_AirLineFlight" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Flight/Flights.ascx" TagPrefix="uc1" TagName="Flights" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:Flights runat="server" ID="Flights" />
        </div>
</asp:Content>
