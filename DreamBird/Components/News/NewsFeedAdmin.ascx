<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsFeedAdmin.ascx.cs" Inherits="Components_News_NewsFeedAdmin" %>
<%@ Register src="NewsFeed.ascx" tagname="NewsFeed" tagprefix="uc1" %>

<p>
    This is news feed admin.</p>
<p>
    <uc1:NewsFeed ID="NewsFeed1" runat="server" IsShowAdminControls="true"  />
</p>

