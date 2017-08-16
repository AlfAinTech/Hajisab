<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MultimediaBankHome.ascx.cs" Inherits="Components_MultimediaBank_MultimediaBankHome" %>
<%@ Register Src="~/Components/MultimediaBank/MultimediaBasicInfo.ascx" TagPrefix="uc1" TagName="MultimediaBasicInfo" %>
<%@ Register Src="~/Components/MultimediaBank/MultimediaList.ascx" TagPrefix="uc1" TagName="MultimediaList" %>


<div class="col-md-12" style="padding:0;">
    <div class="col-md-3" id="side-nav">
        <uc1:MultimediaList runat="server" ID="MultimediaList" OnItemClicked="MultimediaList_ItemClicked" />
    </div>
    <div class="col-md-9" style="background-color: #e6e6e6; height: 500px; overflow-y:auto;">
        <uc1:MultimediaBasicInfo runat="server" ID="MultimediaBasicInfo" OnBankSaved="MultimediaBasicInfo_BankSaved" />
    </div>
</div>
