<%@ Page Title="" Language="C#" MasterPageFile="~/AdminBlank.master" AutoEventWireup="true" CodeFile="Style.aspx.cs" Inherits="Components_PageTemplate_Style" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-12" style="padding: 0">
        <asp:TextBox ID="styler" runat="server" TextMode="MultiLine" Width="100%" Style="height:90vh; font-size:1.2em;" Enabled="false"></asp:TextBox>
    </div>
    <div class="col-md-3" style="float: right">

        <asp:Button ID="Button1" runat="server" Text="Save Style" Width="100%" CssClass="btn btn-primary" OnClick="Button1_Click" Enabled="false"/>

    </div>
</asp:Content>

