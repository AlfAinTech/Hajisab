<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MultimediaSelection.ascx.cs" Inherits="Components_MultimediaBank_MultimediaSelection" %>
<%@ Register Src="~/Components/MultimediaBank/MultimediaList.ascx" TagPrefix="uc1" TagName="MultimediaList" %>

<uc1:MultimediaList runat="server" ID="MultimediaList" OnItemClicked="MultimediaList_ItemClicked" />
