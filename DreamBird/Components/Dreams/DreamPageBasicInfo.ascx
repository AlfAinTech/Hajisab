<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamPageBasicInfo.ascx.cs" Inherits="Components_Dreams_DreamPageBasicInfo" %>
<%@ Register Src="~/Components/PageTemplate/ColumnsList.ascx" TagPrefix="uc1" TagName="ColumnsList" %>
<%@ Register Src="~/Components/PageTemplate/LayoutsList.ascx" TagPrefix="uc1" TagName="LayoutsList" %>

<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-ui.js"></script>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<link href="<%# Server.MapPath("~/") %>/Content/css/jquery-ui.css" rel="stylesheet" />
<div class="col-md-12" style="background-color: #565656; padding-top: 7px; padding-bottom: 7px;">
    <div class="row">
        <div class="col-md-1">
            <a class="btn btn-primary" href="#names" aria-controls="names" role="tab" data-toggle="tab">
                <span class="glyphicon glyphicon-font" aria-hidden="true"></span>
            </a>
            <a class="btn btn-default" href="#security" aria-controls="security" role="tab" data-toggle="tab">
                <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
            </a>
        </div>
        <div class="col-md-1" style="margin-left: -37px;">
            <a class="btn btn-warning" href="#checks" aria-controls="checks" role="tab" data-toggle="tab">
                <span class="glyphicon glyphicon-check" aria-hidden="true"></span>
            </a>
            <a class="btn btn-success" href="#layout" aria-controls="layout" role="tab" data-toggle="tab">
                <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>
            </a>
        </div>
        <div class="col-md-1" style="margin-left: -37px;">
            <asp:HyperLink ID="navigate" CssClass="btn btn-danger" Target="_blank" runat="server">
                <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
            </asp:HyperLink>
        </div>
    </div>
</div>
<div class="col-md-12" style="padding: 0;">
    <div class="tab-content" style="height: auto !important; background-color: #a6a6a6; padding-top: 10px; padding-bottom: 10px;">
        <div role="tabpanel" class="tab-pane" id="names">
            <div class="col-md-3">
                <div class="row">
                    <div class="col-md-4">
                        <h5>Page Name</h5>
                    </div>
                    <div class="col-md-8">
                        <asp:TextBox ID="Page_Name" Enabled="false" data-pageName="Page_Name" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:HiddenField ID="Dream_ID" ClientIDMode="Static" runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-md-1" style="margin-top: 34px;">
                <%-- <a href="#" class="btn btn-primary" id="save_new_page" style="float: right; display: none;">
                        <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                    </a>--%>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="security">
            <asp:Repeater ID="rptr_userRoles" runat="server">
                <ItemTemplate>
                    <div class="col-md-2">
                        <div class="col-md-6" style="padding: 0;">
                            <asp:CheckBox ID="userrole" CssClass="form-control check" runat="server" data-id='<%# Eval("id") %>' />
                        </div>
                        <div class="col-md-6" style="padding: 0;">
                            <h5 style="text-align: center;"><%# Eval("Name") %></h5>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div role="tabpanel" class="tab-pane" id="checks">
            <div class="col-md-3">
                <div class="row">
                    <div class="col-md-4">
                        <h5>Published</h5>
                    </div>
                    <div class="col-md-8">
                        <asp:CheckBox ID="published" ClientIDMode="Static" CssClass="form-control activity" runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="row">
                    <div class="col-md-4">
                        <h5>Page Type</h5>
                    </div>
                    <div class="col-md-8">
                        <asp:DropDownList ID="Page_Type" ClientIDMode="Static" CssClass="form-control activity" runat="server">
                            <asp:ListItem Value="Normal" Text="Normal"></asp:ListItem>
                            <asp:ListItem Value="Activity" Text="Activity"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="layout">
            <div class="col-md-2">
                <ul class="nav nav-tabs nav-stacked" id="template_tabs_nav" role="tablist">
                    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Components</a></li>
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Columns</a></li>
                    <%-- <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Components</a></li>--%>
                </ul>
            </div>
            <div class="col-md-8" style="padding: 0;">
                <div class="tab-content" id="template_tabs" style="background-color: transparent; height: 100px; padding: 0; overflow-y: auto;">
                    <div role="tabpanel" class="tab-pane active" id="home">
                        <div id="columns">
                            <uc1:ColumnsList runat="server" ID="ColumnsList" />
                        </div>
                    </div>
                    <%-- <div role="tabpanel" class="tab-pane" id="profile">
                    <div id="media">
                        <div class="col-md-2 btn btn-success" style="margin-left:20px; margin-right:20px;">
                            <h4 style="margin:0;">Media Bank</h4>
                        </div>
                        <div class="col-md-2 btn btn-success" style="margin-left:20px; margin-right:20px;">
                            <h4 style="margin:0;">Text Bank</h4>
                        </div>
                        <div class="col-md-2 btn btn-success" style="margin-left:20px; margin-right:20px;">
                            <h4 style="margin:0;">Lesson Bank</h4>
                        </div>
                    </div>
                </div>--%>
                    <div role="tabpanel" class="tab-pane" id="messages">
                        <div id="layouts">
                            <uc1:LayoutsList runat="server" ID="LayoutsList" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2" style="padding: 0;">
                <div class="col-md-12" style="padding: 0;">
                    <div class="col-md-6" style="padding-right: 0;">
                        <button class="btn btn-default" id="clear_content" style="font-weight: 400">
                            Clear
                        </button>
                    </div>
                    <div class="col-md-6">
                        <a href="#import_pages" class="btn btn-default" data-toggle="modal" data-target="#import_pages">Import</a>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 15px;">
                    <button class="btn btn-primary" id="save_content">
                        <h4 style="margin: 0;">Save Layout</h4>
                    </button>
                </div>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="availability">...</div>
    </div>
</div>
