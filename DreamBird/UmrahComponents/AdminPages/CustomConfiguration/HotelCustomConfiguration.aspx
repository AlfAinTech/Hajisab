<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HotelCustomConfiguration.aspx.cs" MasterPageFile="~/UmrahComponents/AdminMasterPages/CustomConfiguration.master" Inherits="UmrahComponents_AdminPages_CustomConfiguration_HotelCustomConfiguration" %>

<%@ Register Src="~/UmrahComponents/AdminControls/CustomConfiguration/CustomHotelUC.ascx" TagPrefix="uc1" TagName="CustomHotelUC" %>






<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <%--<uc1:CustomHotel runat="server" ID="CustomHotel" />--%><uc1:CustomHotelUC runat="server" ID="CustomHotelUC" />
        </div>
</asp:Content>