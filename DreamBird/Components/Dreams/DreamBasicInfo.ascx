<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamBasicInfo.ascx.cs" Inherits="Components_Dreams_DreamBasicInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/PageTemplate/PageTemplate.ascx" TagPrefix="uc1" TagName="PageTemplate" %>
<%@ Register Src="~/Components/PageTemplate/ControlsList.ascx" TagPrefix="uc1" TagName="ControlsList" %>
<%@ Register Src="~/Components/PageTemplate/CSSStyler.ascx" TagPrefix="uc1" TagName="CSSStyler" %>
<%@ Register Src="~/Components/Tags/TagControl.ascx" TagPrefix="uc1" TagName="TagControl" %>
<%@ Register Src="~/Components/PageTemplate/DreamsandPages.ascx" TagPrefix="uc1" TagName="DreamsandPages" %>
<%@ Register Src="~/Components/MediaBank/MediaSelection.ascx" TagPrefix="uc1" TagName="MediaSelection" %>
<%@ Register Src="~/Components/Dreams/DreamDetail.ascx" TagPrefix="uc1" TagName="DreamDetail" %>
<%@ Register Src="~/Components/MediaBank/MediaBank.ascx" TagPrefix="uc1" TagName="MediaBank" %>









<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
<%--        <script type="text/javascript">
            jQuery(document).ready(function () {
                var value = document.getElementById('<%= TabName.ClientID%>').value;
                //alert(value);
                $('a[role="tab"]').each(function () {
                    $(this).attr("data-toggle", "tab");
                });
                $('a[href="' + value + '"]').parent().addClass("active");
                $(value).addClass("active");
            });
</script>--%>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:HiddenField ID="TabName" runat="server" />
<div id="myTabs">
    <%--<ul class="nav nav-tabs" role="tablist" runat="server" id="TabNave">
        <li role="presentation" class="active">
            <asp:LinkButton ID="basicInfo_link" href="#basicInfo" aria-controls="basicInfo" role="tab" runat="server" CausesValidation="False" data-toggle="tab">BasicInfo</asp:LinkButton></li>
        <li role="presentation">
            <asp:LinkButton ClientIDMode="Static" ID="Pages_link" runat="server" href="#pages" aria-controls="pages" role="tab" CausesValidation="False" data-toggle="tab">Pages</asp:LinkButton></li>
        <li role="presentation">
            <asp:LinkButton ClientIDMode="Static" ID="Detail_Link" runat="server" href="#dreamDetail" aria-controls="DreamDetail" role="tab" CausesValidation="False" data-toggle="tab"></asp:LinkButton></li>
    
    </ul>--%>
    <%-- <div class="tab-content" style="height: 467px;">
        <div role="tabpanel" class="tab-pane active" id="basicInfo">--%>

    <div class="col-md-12" style="background-color: #e6e6e6; padding-top: 25px;">
        <div class="col-md-8">
            <div class="col-md-12" style="padding: 0">
                <div class="col-md-6">
                    <h5>Package Name</h5>
                    <asp:TextBox ID="DreamName_txt" runat="server" CssClass="form-control" placeholder="Dream Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="namevalidator" runat="server" ControlToValidate="DreamName_txt" ErrorMessage="Add Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-6">
                    <h5>Package Tags</h5>
                    <uc1:TagControl runat="server" ID="TagControl" />
                </div>
                
            </div>
            <div class="col-md-12" style="padding: 0">
                <%--<div class="col-md-4">
                    <h5>Public Default Page</h5>
                    <asp:DropDownList ID="ddl_public_default" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <h5>User Default Page</h5>
                    <asp:DropDownList ID="ddl_user_default" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>--%>
                <div class="col-md-6">
                    <h5>Seed Likes</h5>
                    <asp:TextBox ID="LikeSeed" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="LikeSeed" runat="server" ErrorMessage="Add Seeds"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Value must between 1-1000" Type="Integer" MinimumValue="1" MaximumValue="1000" ForeColor="Red" ControlToValidate="LikeSeed"></asp:RangeValidator>
                </div>
                <div class="col-md-6">
                    <h5>Package Type</h5>
                    <asp:DropDownList ID="dreamType_list" runat="server" CssClass="form-control" DataTextField="Name" DataValueField="id"></asp:DropDownList>
                </div>
            </div>
            <div class="col-md-12">
                <h4>Description
                </h4>
                <asp:TextBox ID="DereamDetail_txt" runat="server" CssClass="form-control" Style="height: 213px; max-width: 100%;" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="col-md-12" style="padding: 0; margin-top: 10px;">
                <div class="col-md-2">
                    <asp:CheckBox ID="feature_chk" class="form-control" runat="server" />
                </div>
                <div class="col-md-2" style="padding: 0;">
                    <h4>Featured</h4>
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="default_chk" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-2" style="padding: 0;">
                    <h4>Default Package</h4>
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="isPublished_chk" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-2" style="padding: 0;">
                    <h4>Publish</h4>
                </div>
            </div>

        </div>
        <div class="col-md-4">
            <div class="col-md-12" style="padding: 0">
                <div class="col-md-12">
                    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
                        <ProgressTemplate>
                            <div class="modal" style="display: block">
                                <div class="center">
                                    <img alt="" src="../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
                                </div>
                            </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Image ID="Dream_img" runat="server" Width="100%" Style="min-height: 285px;" />
                            <video id="dream_video" runat="server" width="100%"></video>
                            <asp:TextBox ID="dreamImg_id" runat="server" Style="display: none" CausesValidation="True"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="img_validator" runat="server" ControlToValidate="dreamImg_id" ErrorMessage="Select Image" ForeColor="Red" Font-Bold="False"></asp:RequiredFieldValidator>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                    <div class="col-md-12" style="padding: 0;">
                        <asp:LinkButton ID="cmdSelectImage" CssClass="btn btn-default" runat="server" CausesValidation="False">Select Media</asp:LinkButton>
                        <ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender1" CancelControlID="Button4" TargetControlID="cmdSelectImage" PopupControlID="popupPanel" runat="server"></ajaxtoolkit:ModalPopupExtender>
                        <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width:1200px; height: 90vh;">
                            <uc1:MediaBank runat="server" OnMediaSelected="MediaSelectedEvent" ID="MediaBank" />
                            <%--<uc1:MediaSelection runat="server" ID="MediaSelection" OncloseMediaBank="MediaSelection_closeMediaBank" OnMyEvents="MediaSelection_MyEvents" ShowImageTypeMedia="true" ShowVideoTypeMedia="true" OnMediaSelectedEvent="MediaSelectedEvent" />--%>
                            <asp:Button ID="Button4" CssClass="btn btn-danger" runat="server" CausesValidation="false" Style="border-radius: 0px; position: absolute; top: 0px; right: 0px;" Text="X" />
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12" style="margin-top: 15px;">
            <asp:Button ID="dream_add" runat="server" Text="Save" CssClass="btn btn-default" OnClick="dream_add_Click" />
        </div>
    </div>


    <%--        </div>
        <div role="tabpanel" class="tab-pane" id="pages">
            <div class="col-md-12">
                <asp:UpdateProgress ID="UpdateProgress2" AssociatedUpdatePanelID="UpdatePanel2" runat="server">
                    <ProgressTemplate>
                        <div class="modal" style="display: block">
                            <div class="center">
                                <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:Repeater ID="Dream_pages_list" runat="server" OnItemDataBound="Dream_pages_list_ItemDataBound">
                            <HeaderTemplate>
                                <table style="width: 100%">
                                    <tr>
                                        <th>Page Name</th>
                                        <th>User Default</th>
                                        <th>Public Default</th>
                                        <th>Published</th>
                                        <th>Authorization</th>
                                        <th></th>
                                    </tr>
                            </HeaderTemplate>

                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="PageName" runat="server" Text='<%# Eval("Page") %>' data-toggle="modal" data-pageName='<%# Eval("Page") %>' data-dreamID='<%# Eval("DreamID") %>' data-DreamName='<%# Eval("Dream.DreamName") %>' data-target="#pageTemplate"></asp:LinkButton><asp:Label ID="id" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label></td>
                                    <td>
                                        <asp:CheckBox ID="user_default_chk" runat="server" Checked='<%# Eval("IsUserDefaultPage") %>' OnCheckedChanged="default_chk_CheckedChanged" AutoPostBack="true" /></td>
                                    <td>
                                        <asp:CheckBox ID="public_default_chk" runat="server" Checked='<%# Eval("IsPublicDefaultPage") %>' OnCheckedChanged="default_chk_CheckedChanged" AutoPostBack="true" /></td>
                                    <td>
                                        <asp:CheckBox ID="publish_chk" runat="server" Checked='<%# Eval("IsPublished") %>' OnCheckedChanged="Generalchk_CheckedChanged" AutoPostBack="true" /></td>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                Page Roles
    <span class="caret"></span>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                <asp:CheckBoxList ID="userRoles" AutoPostBack="true" OnSelectedIndexChanged="default_chk_CheckedChanged" runat="server"></asp:CheckBoxList>

                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Button ID="delete_page" runat="server" Text="X" CssClass="btn btn-danger" CausesValidation="false" data-pageName='<%# Eval("Page") %>' OnClick="delete_page_Click" />
                                    </td>


                                </tr>

                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                        <div class="col-md-2" style="padding: 0; position: fixed; top: 100px; right: 55px; z-index: 1000;">
                            <asp:Button ID="addNewPage_btn" runat="server" Text="Add New Page" OnClick="addNewPage_btn_Click" CausesValidation="false" CssClass="btn btn-default" />
                        </div>
                        <asp:Panel ID="addPage_panel" runat="server" Visible="false">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:TextBox ID="PageName_add" runat="server"></asp:TextBox></td>
                                    <td>User Default<asp:CheckBox ID="userDefault_chk_add" runat="server" /></td>
                                    <td>Public Default<asp:CheckBox ID="publicDefault_chk_add" runat="server" /></td>
                                    <td>Published<asp:CheckBox ID="publish_chk_add" runat="server" /></td>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                Page Roles
    <span class="caret"></span>
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                <asp:CheckBoxList ID="userRoles" runat="server"></asp:CheckBoxList>

                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Button ID="add_Page" runat="server" Text="Add" OnClick="add_Page_Click" CssClass="btn btn-primary" CausesValidation="false" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <asp:UpdateProgress ID="UpdateProgress3" AssociatedUpdatePanelID="UpdatePanel4" runat="server">
                <ProgressTemplate>
                    <div class="modal" style="display: block">
                        <div class="center">
                            <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
                        </div>
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <div class="modal fade" id="pageTemplate" tabindex="-1" aria-labelledby="pageTemplateLabel" data-focus-on="input:first">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="pageTemplateLabel">Page Design</h4>
                                </div>
                                <div class="modal-body" style="display: -webkit-box">
                                    <uc1:PageTemplate runat="server" ID="PageTemplate" />
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <!-- Modal -->
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
        <div role="tabpanel" class="tab-pane" id="dreamDetail">
            <div class="col-md-12">
                <uc1:DreamDetail runat="server" ID="DreamDetail1" />
                </div>

        </div>
    </div>
</div>--%>
    <div class="col-md-12" style="padding: 0">
        <div class="col-md-12">
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
        </div>
    </div>

    <%--        <br />
        <br />
        <br />
        <br />
        <br />
        <br />




    </ContentTemplate>
</asp:UpdatePanel>--%>
