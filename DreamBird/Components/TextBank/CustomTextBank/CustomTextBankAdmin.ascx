<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomTextBankAdmin.ascx.cs" Inherits="Components_TextBank_CustomTextBankAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/Tags/TagControl.ascx" TagPrefix="uc1" TagName="TagControl" %>
<%@ Register Src="~/Components/TextBank/TextBankAdmin.ascx" TagPrefix="uc1" TagName="TextBankAdmin" %>

<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>


<%--<div class="col-md-12" style="padding: 0;">
    <div class="well">
        <a href="#" target="_blank" style="color: white;" runat="server" id="pageNavigate">
            <h3>
                <asp:Label ID="dream_name" runat="server"></asp:Label>/<asp:Label ID="page_name" runat="server"></asp:Label>
            </h3>
        </a>
    </div>
</div>--%>
<uc1:TextBankAdmin runat="server" ID="TextBankAdmin" TextMode="Custom" />
