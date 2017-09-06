<%@ Page Language="C#"  MasterPageFile="~/UmrahComponents/AdminMasterPages/Hotel.master" AutoEventWireup="true" CodeFile="HotelImages.aspx.cs" Inherits="UmrahComponents_AdminPages_Hotel_HotelImages" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Hotel/Images.ascx" TagPrefix="uc1" TagName="Images" %>
<%@ Register Src="~/UmrahComponents/ConfirmationModalUC.ascx" TagPrefix="uc1" TagName="ConfirmationModalUC" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div role="tabpanel" class="tab-pane active" id="home">
      <uc1:Images runat="server" id="Images" />
        <uc1:ConfirmationModalUC runat="server" ID="ConfirmationModalUC" />
        </div>
</asp:Content>
