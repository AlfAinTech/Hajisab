<%@ Register Src="~/Components/LessonMenu/LessonMenuAvailability/LessonAvailabilityAdmin.ascx" TagPrefix="uc1" TagName="LessonAvailabilityAdmin" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditMenuDetails.ascx.cs" Inherits="Components_LessonMenu_EditMenuDetails" %>


<%@ Register Src="~/Components/LessonMenu/LessonMenuList.ascx" TagPrefix="uc1" TagName="LessonMenuList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<div class="col-md-12" style="margin-bottom:10px">
    <div class="row">
        <div class="col-md-3">
            <h5>Name</h5>
            <asp:TextBox ID="menuName" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="menuName_validator" runat="server" ErrorMessage="enter Menu Name" ForeColor="Red" ControlToValidate="menuName"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ControlToValidate="menuName" ValidationExpression="([a-z]|[A-Z]|[0-9])*" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Special characters not allowed"></asp:RegularExpressionValidator>
        </div>
        <div class="col-md-3">
            <h5>Display Name</h5>
            <asp:TextBox ID="displayName" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="displayName_validator" runat="server" ErrorMessage="enter Display Name" ForeColor="Red" ControlToValidate="displayName"></asp:RequiredFieldValidator>
        </div>
        <div class="col-md-3">
            <h5>Menu Rights</h5>
            <asp:DropDownList ID="menuRight" runat="server" AutoPostBack="True" CssClass="form-control">
                <asp:ListItem>user</asp:ListItem>
                <asp:ListItem>public</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-3">
            <h5>Menu Type</h5>
            <asp:DropDownList ID="menuType_list" runat="server" CssClass="form-control">
                <asp:ListItem>none</asp:ListItem>
                <asp:ListItem>video</asp:ListItem>
                <asp:ListItem>multimedia_site</asp:ListItem>
                <asp:ListItem>quiz</asp:ListItem>
                <asp:ListItem>reading</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>
</div>
<div class="col-md-12" style="margin-top:15px; margin-bottom:10px">
    <div class="row">
        <div class="col-md-3">
            <h5>Menu Page Authorization</h5>
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
        <div class="col-md-3">
            <h5>Is Default</h5>
            <asp:CheckBox ID="isDefault" CssClass="form-control" runat="server" />
        </div>
        <div class="col-md-3">
            <h5>Show N/P Buttons</h5>
            <asp:CheckBox ID="isShowNP" CssClass="form-control" runat="server" />
        </div>
        <div class="col-md-3">
            <h5>Lock the Menu</h5>
            <asp:CheckBox ID="lockness" CssClass="form-control" runat="server" />
        </div>
        <div class="col-md-3" style="display:none;">
            <h5>Container</h5>
            <asp:CheckBox ID="container_chk" Enabled="false" runat="server" CssClass="form-control" />
        </div>
    </div>
</div>
<div class="col-md-12" style="margin-top:15px; margin-bottom:10px">
    <div class="row">
        <div class="col-md-3">
            <h5>Pre-Requisite Pages</h5>
            <a class="btn btn-primary" role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Select Pre-Requisite
            </a>
            <div class="collapse" id="collapseExample" style="width: 430px; float: left;">
                <div class="well">
                    <uc1:LessonMenuList runat="server" ID="LessonMenuList1" showCheckboxes="true" />
                </div>
            </div>
        </div>
        <div class="col-md-3" style="margin-bottom: 15px;">

            <asp:TextBox ID="previous_page" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            <a class="btn btn-primary" role="button" data-toggle="collapse" href="#previous_page_collapse" aria-expanded="false" aria-controls="previous_page_collapse">Select Previous Page
            </a>
            <div class="collapse" id="previous_page_collapse">
                <div class="well" style="overflow-y: auto;">
                    <uc1:LessonMenuList runat="server" ID="LessonMenuList2" OnmenuClicked="LessonMenuList2_menuClicked" />
                    <%--<uc1:lessonmenulist runat="server" onmenuclicked="LessonMenuList2_menuClicked" id="LessonMenuList2" />--%>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <asp:TextBox ID="next_page" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            <a class="btn btn-primary" role="button" data-toggle="collapse" href="#next_page_collapse" aria-expanded="false" aria-controls="next_page_collapse">Select Next Page
            </a>
            <div class="collapse" id="next_page_collapse">
                <div class="well" style="overflow-y: auto;">
                    <uc1:LessonMenuList runat="server" ID="LessonMenuList3" OnmenuClicked="LessonMenuList3_menuClicked" />
                    <%--<uc1:lessonmenulist runat="server" onmenuclicked="LessonMenuList3_menuClicked" id="LessonMenuList3" />--%>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <h4>Check Availability</h4>
            <asp:Button ID="checkAvailibility" runat="server" Text="Set Menu Availibility" CssClass="btn btn-primary" />
        </div>
    </div>
</div>
<div class="col-md-12">
    <div class="row">
        <div class="col-md-3" style="float:right">
            <asp:Button ID="save_menu" CssClass="btn btn-success" Width="100%" runat="server" Text="Save Changes" OnClick="save_menu_Click" />
        </div>
    </div>
</div>
<ajaxToolkit:ModalPopupExtender ID="popup_modal_availibility" TargetControlID="checkAvailibility" PopupControlID="Panel_availability" CancelControlID="cancel_availibility" runat="server"></ajaxToolkit:ModalPopupExtender>
<asp:Panel ID="Panel_availability" runat="server" BackColor="#e6e6e6">
    <uc1:LessonAvailabilityAdmin runat="server" OnShowPopup="LessonAvailabilityAdmin_ShowPopup" ID="LessonAvailabilityAdmin" />
    <asp:Button ID="cancel_availibility" runat="server" Text="Close" />
</asp:Panel>
