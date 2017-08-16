<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UmrahComponents/AdminMasterPages/Hotel.master"  CodeFile="HotelBasicInfo.aspx.cs" Inherits="UmrahComponents_Admin_Hotels" %>

<%@ Register Src="~/UmrahComponents/AdminControls/Hotel/BasicInfo.ascx" TagPrefix="uc1" TagName="BasicInfo" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:BasicInfo runat="server" ID="BasicInfo"  OnhotelAdded="hotelAdd_clicked"/>
        </div>
</asp:Content>
