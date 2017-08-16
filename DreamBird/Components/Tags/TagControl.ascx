<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TagControl.ascx.cs" Inherits="Components_Tags_TagControl" %>

<link href="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/css/textext.core.css" rel="stylesheet" />
<link href="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/css/textext.plugin.autocomplete.css" rel="stylesheet" />
<link href="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/css/textext.plugin.tags.css" rel="stylesheet" />
<link href="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/css/textext.plugin.prompt.css" rel="stylesheet" />
<link href="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/css/textext.plugin.focus.css" rel="stylesheet" />
<link href="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/css/textext.plugin.clear.css" rel="stylesheet" />
<link href="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/css/textext.plugin.arrow.css" rel="stylesheet" />
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/textext.core.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/textext.plugin.ajax.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/textext.plugin.arrow.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/textext.plugin.autocomplete.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/textext.plugin.clear.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/textext.plugin.filter.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/textext.plugin.focus.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/textext.plugin.prompt.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/textext.plugin.suggestions.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/textext.plugin.tags.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/Tags/myScripts.js"></script>

<asp:TextBox ID="texttag" CssClass="form-control Textext" runat="server" Style="height:30px;"></asp:TextBox>
