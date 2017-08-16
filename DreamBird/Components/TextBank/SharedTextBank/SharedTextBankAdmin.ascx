<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SharedTextBankAdmin.ascx.cs" Inherits="Components_TextBank_SharedTextBankAdmin" %>

<%@ Register Src="~/Components/TextBank/TextBankAdmin.ascx" TagPrefix="uc1" TagName="TextBankAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/TextBank/SharedTextBank/SharedTextBankList.ascx" TagPrefix="uc1" TagName="SharedTextBankList" %>
<%@ Register Src="~/Components/TextBank/SharedTextBank/SharedTextDetail.ascx" TagPrefix="uc1" TagName="SharedTextDetail" %>
<%@ Register Src="~/Components/TextBank/SharedTextBank/AdminTextBank.ascx" TagPrefix="uc1" TagName="AdminTextBank" %>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-ui.js"></script>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<link href="<%# Server.MapPath("~/") %>/Content/css/jquery-ui.css" rel="stylesheet" />

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<div class="col-md-12" style="padding: 0;">
    <div class="col-md-3" id="side-nav">
        <div class="row">
            <uc1:SharedTextBankList runat="server" ID="SharedTextBankList" OnTextClicked="TextClicked_searchText" OnAddClicked="addBtn_clicked" ShowAddBtn="true" />
        </div>
        <asp:Panel ID="Add_TextBank_Panel" runat="server">
            <a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            </a>
            <div class="collapse" id="collapseExample">
                <div class="row">
                    <div class="col-md-9">
                        <asp:TextBox ID="TextBankName" runat="server" CssClass="form-control" placeholder="Enter Text Bank Name"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <div class="row" style="margin-right: 0px;">
                            <asp:Button ID="add_textBank" OnClick="add_textBank_Click" Width="100%" runat="server" CssClass="btn btn-primary" Text="Add" />
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
    <div class="col-md-9" style="background-color: #e6e6e6; padding-top: 15px; height: 500px; overflow-y: auto;">
        <div class="row">
            <uc1:TextBankAdmin runat="server" ID="TextBankAdmin" TextMode="Shared" />
            <uc1:SharedTextDetail runat="server" ID="SharedTextDetail" EditableText="true" />

            <%--<uc1:AdminTextBank runat="server" ID="AdminTextBank" Visible="false" OnTextSaved="NewTextAdded_Textsaved" />--%>
        </div>
    </div>
</div>


