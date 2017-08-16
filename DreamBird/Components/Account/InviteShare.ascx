<%@ Control Language="C#" AutoEventWireup="true" CodeFile="InviteShare.ascx.cs" Inherits="Components_Account_InviteShare" %>
  <%-- js social links --%>
    <%--<link href="<%=ResolveUrl("~/Content/jssocials-1.4.0/jssocials-theme-classic.css") %>" rel="stylesheet" />--%>
    <link href="<%=ResolveUrl("~/Content/jssocials-1.4.0/jssocials-theme-flat.css") %>" rel="stylesheet" />
    <%--<link href="<%=ResolveUrl("~/Content/jssocials-1.4.0/jssocials-theme-minima.css") %>" rel="stylesheet" />--%>
    <%--<link href="<%=ResolveUrl("~/Content/jssocials-1.4.0/jssocials-theme-plain.css") %>" rel="stylesheet" />--%>
    <link href="<%=ResolveUrl("~/Content/jssocials-1.4.0/jssocials.css") %>" rel="stylesheet" />
    <script src="<%=ResolveUrl("~/Content/jssocials-1.4.0/jssocials.js") %>"></script>
    <script src="<%=ResolveUrl("~/Content/jssocials-1.4.0/jssocials.min.js") %>"></script>
<asp:Panel ID="data_panel" runat="server" Height="100px" Width="279px" style="display: none;">
<asp:TextBox ID="share_text" runat="server" class="share_text"  ></asp:TextBox>
    <br />
    <br />
<asp:TextBox ID="share_url" runat="server" class="share_url"  ></asp:TextBox>
    </asp:Panel> 
<div id="share"></div>

<script>
    
    var share_text = document.getElementsByClassName("share_text")[0].innerText;
    $("#share").jsSocials({
        url: $(location).attr('href'),
        text: share_text,
        showLabel: true,
        showCount: false,
        shares: [{ share: "twitter", label: "Twitter", css: "flat", logo: "fa fa-twitter" },
            { share: "facebook", label: "facebook", logo: "fa fa-facebook", },
            { share: "googleplus", label: "googleplus", logo: "fa fa-googleplus", },
            { share: "linkedin", label: "linkedin", logo: "fa fa-linkedin", }],
     
        });
    </script>