<%@ Control Language="C#" AutoEventWireup="true" CodeFile="GeneralNewsView.ascx.cs" Inherits="Components_News_NewControls_GeneralNewsView" %>
	<%@ Register Src="~/Components/News/NewControls/FeatureNewsView.ascx" TagPrefix="uc1" TagName="FeatureNewsView" %>
<%@ Register Src="~/Components/News/NewsListText.ascx" TagPrefix="uc1" TagName="NewsListText" %>



<div class="news_wrapper">
	<div class="container">
		<h2>Latest News & Announcements</h2>
	
			
			
            <uc1:FeatureNewsView runat="server" id="FeatureNewsView" />
		
        <uc1:NewsListText runat="server" ID="NewsListText" />
	</div>
</div>
