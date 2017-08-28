<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonMenuAdminNew.ascx.cs" Inherits="Components_LessonMenu_LessonMenuAvailability_LessonMenuAdminNew" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Components/LessonMenu/MenuOrder.ascx" TagPrefix="uc1" TagName="MenuOrder" %>
<%@ Register Src="~/Components/PageTemplate/ColumnsList.ascx" TagPrefix="uc1" TagName="ColumnsList" %>
<%@ Register Src="~/Components/PageTemplate/LayoutsList.ascx" TagPrefix="uc1" TagName="LayoutsList" %>
<%@ Register Src="~/Components/PageTemplate/PageTemplate.ascx" TagPrefix="uc1" TagName="PageTemplate" %>
<%@ Register Src="~/Components/LessonMenu/LessonMenuList.ascx" TagPrefix="uc1" TagName="LessonMenuList" %>
<%@ Register Src="~/Components/PageTemplate/ControlsList.ascx" TagPrefix="uc1" TagName="ControlsList" %>
<%@ Register Src="~/Components/PageTemplate/CSSStyler.ascx" TagPrefix="uc1" TagName="CSSStyler" %>
<%@ Register Src="~/Components/PageTemplate/DreamsandPages.ascx" TagPrefix="uc1" TagName="DreamsandPages" %>
<%@ Register Src="~/Components/LessonMenu/LessonMenuAvailability/LessonAvailabilityAdmin.ascx" TagPrefix="uc1" TagName="LessonAvailabilityAdmin" %>
<%@ Register Src="~/Components/LessonMenu/EditMenuDetails.ascx" TagPrefix="uc1" TagName="EditMenuDetails" %>






<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-ui.js"></script>
<%--<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>--%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<div class="col-md-12" style="padding: 0">
    <div class="col-md-3" id="side-nav" style="height: 500px;">
        <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
        <asp:Button ID="add_menu" Style="display: none;" runat="server" Text="+" CssClass="btn btn-default" CausesValidation="false" />
        <uc1:MenuOrder runat="server" ID="MenuOrder" OnMenuRefresh="MenuOrder_MenuRefresh" OnMenuEdited="MenuEdited" OnMenuClicked="MenuOrder_MenuClicked" />
        <asp:Button ID="refresh_menu" Style="display: none;" CausesValidation="false" ClientIDMode="Static" OnClick="MenuOrder_MenuRefresh" runat="server" Text="Button" />
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
    <div class="col-md-9">
        <%--<div class="col-md-12" style="padding: 0; background-color: #464646;">
            <div class="col-md-8" style="padding: 0; padding-top: 12px; padding-bottom: 11px; background-color: #464646;">
                <div class="col-md-1">
                    <a class="btn btn-primary" href="#names" aria-controls="names" role="tab" data-toggle="tab">
                        <span class="glyphicon glyphicon-font" aria-hidden="true"></span>
                    </a>
                </div>
                <div class="col-md-1">
                    <a class="btn btn-default" href="#security" aria-controls="security" role="tab" data-toggle="tab">
                        <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                    </a>
                </div>
                <div class="col-md-1">
                    <a class="btn btn-warning" href="#checks" aria-controls="checks" role="tab" data-toggle="tab">
                        <span class="glyphicon glyphicon-check" aria-hidden="true"></span>
                    </a>
                </div>
                <div class="col-md-1">
                    <a class="btn btn-success" href="#layout" aria-controls="layout" role="tab" data-toggle="tab">
                        <span class="glyphicon glyphicon-picture" aria-hidden="true"></span>
                    </a>
                </div>
                <div class="col-md-1">
                    <a class="btn btn-danger" href="#availability" aria-controls="availability" role="tab" data-toggle="tab">
                        <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                    </a>
                </div>
            </div>
            <div class="col-md-1" style="float: right; padding-top: 12px; padding-bottom: 11px;">
                <a href="#" class="btn btn-primary" id="save_menu" runat="server" onserverclick="save_menu_ServerClick" style="float: right;">
                    <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                </a>

            </div>
            <div class="col-md-12" style="padding: 0;">
                <div class="tab-content" style="height: 140px; overflow: visible; overflow-y: visible;">
                    <div role="tabpanel" class="tab-pane" id="checks">
                        
                    </div>
                    <div role="tabpanel" class="tab-pane" id="layout">
                        
                    </div>
                    <div role="tabpanel" class="tab-pane" id="availability" style="overflow: visible;">
                        
                    </div>
                    <%--<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" TargetControlID="checkAvailibility" PopupControlID="popupPanel" CancelControlID="cancel" runat="server"></ajaxToolkit:ModalPopupExtender>--%>
                    <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width: 80vh; height: 45vh">
                        <uc1:LessonAvailabilityAdmin runat="server" ID="LessonAvailabilityAdmin1" OnShowPopup="LessonAvailabilityAdmin1_ShowPopup" />
                        <div class="col-md-12">
                            <asp:Button ID="cancel" runat="server" Text="Cancel" CssClass="btn btn-primary" Style="float: right; width: 100%;" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>--%>
        <div id="Menu_Detail" class="row" runat="server" visible="false">
            <uc1:EditMenuDetails runat="server" OnMenuDetailSaved="MenuDetailSaved" ID="EditMenuDetails" />
        </div>
        <div id="Page_design" class="row" runat="server" visible="false">
            <div class="col-md-9">


                <%--<div class="col-md-12">
                <div class="row">
                    <uc1:LayoutsList runat="server" ID="LayoutsList" />
                </div>
            </div>--%>
                <uc1:PageTemplate runat="server" ID="PageTemplate" />
                <div class="modal" id="import_pages" tabindex="-1" aria-labelledby="import_pagesLabel" data-focus-on="input:first">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">Import Dream Pages</h4>
                            </div>
                            <div class="modal-body" style="display: -webkit-box">
                                <uc1:DreamsandPages runat="server" ID="DreamsandPages" />
                            </div>
                            <div class="modal-footer">

                                <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="editCSS" tabindex="-1" aria-labelledby="controlsListLabel" data-focus-on="input:first">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="editCSSLabel">Edit CSS Properties</h4>
                            </div>
                            <div class="modal-body">
                                <uc1:CSSStyler runat="server" ID="CSSStyler" />
                            </div>
                            <div class="modal-footer">
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-primary" id="save-style">Save Changes</button>
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="controlsList" tabindex="-1" aria-labelledby="controlsListLabel" data-focus-on="input:first">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="controlsListLabel">Controls</h4>
                            </div>
                            <div class="modal-body" style="display: -webkit-box;">
                                <uc1:ControlsList runat="server" ID="ControlsList1" />
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-3" style="padding-left: 0;">
                <div class="col-md-12">
                    <div class="col-md-4" style="float: right">
                        <a class="btn btn-default" id="activate_modal">
                            <span class="glyphicon glyphicon-resize-full" aria-hidden="true"></span>
                        </a>
                    </div>
                </div>
                <div class="col-md-12" id="ipage_frame" style="padding: 0;">
                    <iframe name="page_frame" class="LessonMenu_PageFrame" width="100%" height="350px" frameborder="0" style="overflow: hidden; display: block;" scrolling="yes" allowfullscreen="true" webkitallowfullscreen="true" mozallowfullscreen="true"></iframe>
                </div>
            </div>
        </div>
    </div>
</div>
