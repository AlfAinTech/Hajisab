<%@ Page Title="" Language="C#" MasterPageFile="~/News/News.master" AutoEventWireup="true" CodeFile="NewsDetail.aspx.cs" Inherits="News_NewsDetail" %>

<%@ Register Src="~/Components/News/NewControls/NewsDetail.ascx" TagPrefix="uc1" TagName="NewsDetail" %>
<%@ Register Src="~/Components/News/NewControls/NewsSearchHome.ascx" TagPrefix="uc1" TagName="NewsSearchHome" %>
<%@ Register Src="~/Components/News/NewControls/RelatedNews.ascx" TagPrefix="uc1" TagName="RelatedNews" %>
<%@ Register Src="~/Components/News/NewControls/National_InternationalNews.ascx" TagPrefix="uc1" TagName="National_InternationalNews" %>





<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content_wrapper">
    <uc1:NewsSearchHome runat="server" ID="NewsSearchHome" />
    <uc1:NewsDetail runat="server" ID="NewsDetail" />
    <uc1:RelatedNews runat="server" ID="RelatedNews" />
    <div class="container">
        <h2>Featured News</h2>
    <uc1:National_InternationalNews runat="server" ID="National_InternationalNews" News_category="Featured" />
        </div>
        </div>
</asp:Content>

