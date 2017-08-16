<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonMenuAdmin.ascx.cs" Inherits="Components_LessonMenu_LessonMenuAdmin" %>
<%@ Register Src="~/Components/LessonMenu/LessonMenuList.ascx" TagPrefix="uc1" TagName="LessonMenuList" %>
<%@ Register Src="~/Components/LessonMenu/MenuPageMarkup.ascx" TagPrefix="uc1" TagName="MenuPageMarkup" %>
<%@ Register Src="~/Components/LessonMenu/MenuPageDesign.ascx" TagPrefix="uc1" TagName="MenuPageDesign" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/LessonMenu/LessonMenuAvailability/LessonAvailabilityAdmin.ascx" TagPrefix="uc1" TagName="LessonAvailabilityAdmin" %>
<%@ Register Src="~/Components/LessonMenu/MenuOrder.ascx" TagPrefix="uc1" TagName="MenuOrder" %>

<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<script>
    function OpenContainerTab()
    {
        $('#lesson_menu_tabs').children('ul').children('.active').removeClass('active');
        $('#lesson_menu_tabs').children().children('.active').removeClass('active');
        $('#lesson_menu_tabs').children('ul').children().children('a[href="#sub_menus"]').parent().addClass('active');
        $('#lesson_menu_tabs').children().children('#sub_menus').addClass('active');
    }
</script>

<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
    <ProgressTemplate>
        <div class="modal" style="display: block">
            <div class="center">
                <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="col-md-12" style="padding: 0">
            <div class="col-md-3" id="side-nav" style="height: 638px;">
                <asp:Button ID="add_menu" runat="server" Text="+" CssClass="btn btn-default" float="right" CausesValidation="false" OnClick="add_menu_Click" />
                <%--<button id="change_menu_order" class="btn btn-danger" onclick='window.open("../../Components/LessonMenu/MenuOrder.aspx?PID=<%= Request.QueryString["PID"].ToString() %>", "mywindow","menubar=1,resizable=1,width=500,height=450");' style="border-radius:0px; width:100%;">Change Menu Order</button>--%>
                <uc1:MenuOrder runat="server" ID="MenuOrder" OnMenuClicked="MenuOrder_MenuClicked" />
                <%--<asp:Button ID="change_menu_order" runat="server" Text="Change Menu Order" OnClientClick="window.open()" CssClass="btn btn-danger" Width="100%" Style="border-radius:0px;" float="right"/>--%>
                <%--<uc1:LessonMenuList runat="server" ID="LessonMenuList" OnmenuClicked="menuClick_clicked" />--%>
            </div>
            <div class="col-md-9" style="padding: 0;">
                <div id="lesson_menu_tabs">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#menu_settings" aria-controls="menu_settings" role="tab" data-toggle="tab">Menu Settings</a></li>
                        <li role="presentation"><a href="#page_preview" aria-controls="page_preview" role="tab" data-toggle="tab">Page Preview</a></li>
                        <%--<li role="presentation"><a href="#page_design" aria-controls="page_design" role="tab" data-toggle="tab">Page Design</a></li>--%>
                        <li role="presentation"><a href="#sub_menus" aria-controls="sub_menus" role="tab" data-toggle="tab">Sub Menus</a></li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content" style="overflow-y: auto; min-height: 595px;">
                        <div role="tabpanel" class="tab-pane active" id="menu_settings">
                            <div class="col-md-12" style="padding: 0;">
                                <div class="col-md-6">
                                    <div class="col-md-2">
                                        <h5>Name</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="menuName" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="menuName_validator" runat="server" ErrorMessage="enter Menu Name" ForeColor="Red" ControlToValidate="menuName"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ControlToValidate="menuName" ValidationExpression="([a-z]|[A-Z]|[0-9])*" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Special characters not allowed"></asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-md-2" style="padding-right: 0;">
                                        <h5>Display Name</h5>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:TextBox ID="displayName" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="displayName_validator" runat="server" ErrorMessage="enter Display Name" ForeColor="Red" ControlToValidate="displayName"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-2" style="padding-right: 0;">
                                        <h5>Is Default</h5>
                                    </div>
                                    <div class="col-md-4" style="margin-bottom: 20px;">
                                        <asp:CheckBox ID="isDefault" OnCheckedChanged="isDefault_CheckedChanged" AutoPostBack="true" CssClass="form-control" runat="server" />
                                    </div>
                                    <div class="col-md-3" style="padding-right: 0;">
                                        <h5>Show Next / Previous Buttons</h5>
                                    </div>
                                    <div class="col-md-3" style="margin-bottom: 20px;">
                                        <asp:CheckBox ID="isShowNP" CssClass="form-control" runat="server" />
                                    </div>
                                    <div class="col-md-6" style="padding: 0">
                                        <div class="col-md-4" style="padding-right: 0; margin-bottom: 10px;">
                                            <h5>Container</h5>
                                        </div>
                                        <div class="col-md-8" style="margin-bottom: 10px;">
                                            <asp:CheckBox ID="container_chk" runat="server" OnCheckedChanged="container_chk_CheckedChanged" AutoPostBack="True" CssClass="form-control" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:LinkButton ID="link_Availability" runat="server" CssClass="btn btn-primary" OnClick="link_Availability_Click" CausesValidation="False" Visible="false">Check Availability</asp:LinkButton>
                                    </div>



                                    <div class="col-md-12">
                                        <h3>Page Deisgn</h3>
                                    </div>
                                    
                                </div>
                                <div class="col-md-6" style="padding: 0; width: 49%;">
                                    <div class="col-md-12" style="padding: 0">
                                        <div class="col-md-2" style="padding-right: 0; margin-bottom: 20px;">
                                            <h5>Menu Rights</h5>
                                        </div>
                                        <div class="col-md-4" style="margin-bottom: 20px;">
                                            <asp:DropDownList ID="menuRight" runat="server" AutoPostBack="True" CssClass="form-control">
                                                <asp:ListItem>user</asp:ListItem>
                                                <asp:ListItem>public</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-2" style="padding-right: 0; margin-bottom: 20px;">
                                            <h5>Menu Type</h5>
                                        </div>
                                        <div class="col-md-4" style="margin-bottom: 20px;">
                                            <asp:DropDownList ID="menuType_list" runat="server" CssClass="form-control">
                                                <asp:ListItem>none</asp:ListItem>
                                                <asp:ListItem>video</asp:ListItem>
                                                <asp:ListItem>multimedia_site</asp:ListItem>
                                                <asp:ListItem>quiz</asp:ListItem>
                                                <asp:ListItem>reading</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-12" style="padding: 0;">
                                        <div class="col-md-6" style="padding: 0">
                                            <div class="col-md-4" style="padding-right: 0; margin-bottom: 20px;">
                                                <h5>Page Authorization</h5>
                                            </div>
                                            <div class="col-md-8" style="margin-bottom: 20px;">
                                                <div class="dropdown">
                                                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                        Select User Roles
    <span class="caret"></span>
                                                    </button>
                                                    <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                        <asp:CheckBoxList ID="userRoles" runat="server"></asp:CheckBoxList>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6" style="padding: 0;">
                                            <div class="col-md-4">
                                                <h5>Pre-Requisite Pages</h5>
                                            </div>
                                            <div class="col-md-8">
                                                <a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Select Pre-Requisite
                                                </a>
                                                <div class="collapse" id="collapseExample" style="width:430px; float:right;">
                                                    <div class="well">
                                                        <%--<asp:Button ID="getPreReqList" CssClass="btn btn-default" runat="server" Text="Save Pre-Req Menu" OnClick="getPreReqList_Click" CausesValidation="false" />--%>

                                                        <uc1:LessonMenuList showCheckboxes="true" runat="server" ID="LessonMenuList1" OncheckChanged="LessonMenuList1_checkChanged" />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12" style="padding: 0;">
                                        <div class="col-md-6" style="margin-bottom: 15px;">

                                            <asp:TextBox ID="previous_page" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                            <a class="btn btn-primary" role="button" data-toggle="collapse" href="#previous_page_collapse" aria-expanded="false" aria-controls="previous_page_collapse">Select Previous Page
                                            </a>
                                            <div class="collapse" id="previous_page_collapse">
                                                <div class="well" style="overflow-y: auto;">
                                                    <uc1:LessonMenuList runat="server" ID="LessonMenuList2" OnmenuClicked="LessonMenuList2_menuClicked" />
                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="next_page" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                            <a class="btn btn-primary" role="button" data-toggle="collapse" href="#next_page_collapse" aria-expanded="false" aria-controls="next_page_collapse">Select Next Page
                                            </a>
                                            <div class="collapse" id="next_page_collapse">
                                                <div class="well" style="overflow-y: auto;">
                                                    <uc1:LessonMenuList runat="server" ID="LessonMenuList3" OnmenuClicked="LessonMenuList3_menuClicked" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" style="padding: 0;">
                                <uc1:MenuPageMarkup runat="server" ID="MenuPageMarkup" />
                            </div>

                        </div>
                        <div role="tabpanel" class="tab-pane" id="page_preview">
                            <uc1:MenuPageDesign runat="server" ID="MenuPageDesign" />
                        </div>
                        <%--<div role="tabpanel" class="tab-pane" id="page_design">
                           
                        </div>--%>
                        <div role="tabpanel" class="tab-pane" id="sub_menus" style="padding: 15px;">
                            <asp:Panel ID="container_panel" runat="server">
                                <asp:Repeater ID="Lesson_menu_list" runat="server">
                                    <HeaderTemplate>
                                        <table style="width: 100%;">
                                            <tr>
                                                <th>Name</th>
                                                <th>Display Name</th>
                                                <th>container</th>
                                                <th>Remove</th>
                                            </tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="menuName" CssClass="form-control" runat="server" Text='<%# Eval("menuName") %>' Enabled="false"></asp:TextBox></td>
                                            <td>
                                                <asp:TextBox ID="displayName" CssClass="form-control" runat="server" Text='<%# Eval("displayName") %>'></asp:TextBox>
                                                <asp:Label ID="id" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:CheckBox ID="is_container" runat="server" Checked='<%# Eval("IsContainer") %>' AutoPostBack="True" />
                                            </td>
                                            <td>
                                                <asp:LinkButton ID="delete_menu" runat="server" CommandArgument='<%#Eval("id") %>' OnClick="delete_menu_Click">Delete</asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="menuName_add" runat="server" ValidationGroup="add" wordwrap="false"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="menuName_add_validator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="menuName_add" Display="Static" ValidationGroup="add_validation"></asp:RequiredFieldValidator>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="displayName_add" runat="server" ValidationGroup="add" wordwrap="false"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="displayName_add_validator" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="displayName_add" Display="Static" ValidationGroup="add_validation"></asp:RequiredFieldValidator>
                                            </td>

                                            <td>
                                                <asp:CheckBox ID="isContainer_chk_add" runat="server" /></td>
                                            <td>
                                                <asp:Button ID="add_Childmenu_add" runat="server" Text="Add" OnClick="add_Childmenu_Click" ValidationGroup="add_validation" CausesValidation="true" />
                                                <br />
                                            </td>
                                        </tr>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </asp:Panel>
                        </div>

                        <div class="col-md-12">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="ErrorMessage" />
                            </p>
                        </div>

                    </div>

                </div>
                <div class="col-md-4" style="position: absolute; top: 00px; right: 00px;">
                    <asp:Button ID="save_menu_btn" runat="server" OnClick="save_menu_btn_Click" Text="Save Menu" Style="width: 300px; margin-top: 4px; float: right;" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>


        <asp:Button ID="showPopup" runat="server" Text="Button" Style="display: none" />
        <ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="showPopup" PopupControlID="popupPanel" runat="server" CancelControlID="cancel"></ajaxtoolkit:ModalPopupExtender>
        <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width: 80vh; height: 45vh">
            <uc1:LessonAvailabilityAdmin runat="server" ID="LessonAvailabilityAdmin1" OnShowPopup="show_popup_popup" />
            <div class="col-md-12">
                <asp:Button ID="cancel" runat="server" Text="Cancel" CssClass="btn btn-primary" Style="float: right; width: 100%;" />
            </div>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
