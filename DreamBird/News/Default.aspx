<%@ Page Title="" Language="C#" MasterPageFile="~/News/News.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="News_Default" %>

<%@ Register Src="~/Components/News/NewControls/NewsSearchHome.ascx" TagPrefix="uc1" TagName="NewsSearchHome" %>
<%@ Register Src="~/Components/News/NewControls/LatestNews.ascx" TagPrefix="uc1" TagName="LatestNews" %>
<%@ Register Src="~/Components/News/NewControls/FeatureNewsView.ascx" TagPrefix="uc1" TagName="FeatureNewsView" %>
<%@ Register Src="~/Components/News/NewsListText.ascx" TagPrefix="uc1" TagName="NewsListText" %>
<%@ Register Src="~/Components/News/NewControls/National_InternationalNews.ascx" TagPrefix="uc1" TagName="National_InternationalNews" %>






<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc1:NewsSearchHome runat="server" ID="NewsSearchHome" />
    <div class="content_wrapper" id="Latest">
        <uc1:LatestNews runat="server" ID="LatestNews" />

        <div class="addNews_wrapper" style="margin-top: 20px;" id="Featured">
            <div class="container">
                <div class="col-md-12" style="padding: 0;">

                    <uc1:FeatureNewsView runat="server" ID="FeatureNewsView" />

                    <uc1:NewsListText runat="server" ID="NewsListText" />
                </div>
            </div>
        </div>
        <div class="container">
            <div id="National">
                <h2>National</h2>
                <div class="col-md-12" style="padding: 0; margin-bottom: 20px;" id="latest_news_header">
                    <uc1:National_InternationalNews runat="server" ID="National_InternationalNews" News_category="National" />
                </div>
            </div>
            <div id="International">
                <h2>International</h2>
                <div class="col-md-12" style="padding: 0;" id="latest_news_header">
                    <uc1:National_InternationalNews runat="server" ID="National_InternationalNews1" News_category="International" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

