<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsSearchHome.ascx.cs" Inherits="Components_News_NewControls_NewsSearchHome" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<div class="addNews_wrapper">
    <div class="container">
        
        <div class="col-md-3" style="float:right; padding:0;">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:ComboBox ID="ComboBox1" runat="server" AutoPostBack="true" Width="100%" AutoCompleteMode="SuggestAppend" Style="float:right;" OnSelectedIndexChanged="ComboBox1_SelectedIndexChanged"></asp:ComboBox>
            </div>
        <div class="col-md-3" style="float:right;">
            <h3 style="margin-top:5px; margin-bottom:0; float:right; margin-right:-75px;">Search News</h3>
        </div>
        </div>
    </div>