﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UmrahComponents/AdminMasterPages/VisaPackage.master" CodeFile="VisaPackage.aspx.cs" Inherits="UmrahComponents_AdminPages_VisaPackages_VisaPackage" %>

<%@ Register Src="~/UmrahComponents/AdminControls/VisaPackages/VisaPackage.ascx" TagPrefix="uc1" TagName="VisaPackage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div role="tabpanel" class="tab-pane active" id="home">
        <uc1:VisaPackage runat="server" ID="VisaPackage" />
        </div>
</asp:Content>