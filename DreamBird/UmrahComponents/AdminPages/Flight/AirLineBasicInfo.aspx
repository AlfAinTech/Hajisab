<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UmrahComponents/AdminMasterPages/Flight.master" CodeFile="AirLineBasicInfo.aspx.cs" Inherits="UmrahComponents_AdminPages_Flight_AirLineBasicInfo" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Flight/AirLineBasicInfo.ascx" TagPrefix="uc1" TagName="AirLineBasicInfo" %>





<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:AirLineBasicInfo runat="server" id="AirLineBasicInfo"  />
        </div>
</asp:Content>
