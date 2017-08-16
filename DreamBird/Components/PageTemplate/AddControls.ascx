<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddControls.ascx.cs" Inherits="Components_PageTemplate_AddControls" ValidateRequestMode="Disabled" %>

<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc1" TagName="MediaBankControl" %>
<%@ Register Src="~/Components/MediaBank/MediaBank.ascx" TagPrefix="uc1" TagName="MediaBank" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <div class="col-md-6">
            <div class="col-md-12" style="margin-bottom: 15px;">
                <asp:TextBox ID="controlName" CssClass="form-control" placeholder="Control Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfq_controlName" ValidationGroup="addControls" ControlToValidate="controlName" runat="server" ErrorMessage="Field Required"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-12" style="margin-bottom: 15px;">
                <h5>Control Markup</h5>
                <asp:TextBox ID="NormalMarkup" CssClass="form-control" TextMode="MultiLine" Style="height: 100px;" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfq_NormalMarkup" ValidationGroup="addControls" ControlToValidate="NormalMarkup" runat="server" ErrorMessage="Field Required"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-12" style="margin-bottom: 15px;">
                <h5>Select Control Category</h5>
                <asp:DropDownList ID="ddl_controlCat" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-md-12" style="margin-bottom: 15px;">
                <asp:TextBox ID="DefaultControlName" CssClass="form-control" placeholder="Default Control Path" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfq_DefaultControlName" ValidationGroup="addControls" ControlToValidate="DefaultControlName" runat="server" ErrorMessage="Field Required"></asp:RequiredFieldValidator>                                            
            </div>
            <div class="col-md-12" style="margin-top: 15px;">
                <asp:TextBox ID="AdminPagePath" CssClass="form-control" placeholder="Admin Page Path" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfq_AdminPagePath" ValidationGroup="addControls" ControlToValidate="AdminPagePath" runat="server" ErrorMessage="Field Required"></asp:RequiredFieldValidator>                            
            </div>
            <div class="col-md-12" style="margin-top: 15px;">
                <asp:TextBox ID="DeletePagePath" CssClass="form-control" placeholder="Delete Page Path" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="addControls" ControlToValidate="DeletePagePath" runat="server" ErrorMessage="Field Required"></asp:RequiredFieldValidator>                            
            </div>
            <div class="col-md-12" style="margin-bottom: 15px;">
                <h4><asp:CheckBox ID="ch_seperate" runat="server" />Show Admin Page in Popup Window?</h4>
            </div>
            <div class="col-md-12" style="margin-bottom: 15px;">
                <h4><asp:CheckBox ID="isProgress" runat="server" />Make this Control a Progress Control</h4>
            </div>
        </div>
        <div class="col-md-6">
            <asp:Image ID="img_control" runat="server" Width="100%" Style="min-height: 285px;" />
            <asp:TextBox ID="Img_id" runat="server" Style="display: none" CausesValidation="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="addControls" ControlToValidate="Img_id" runat="server" ErrorMessage="Image Required"></asp:RequiredFieldValidator>
            <div class="col-md-12" style="padding: 0;">
                <asp:LinkButton ID="cmdSelectImage" CssClass="btn btn-default" runat="server" CausesValidation="False">Select Media</asp:LinkButton>
                <ajaxToolkit:ModalPopupExtender ID="popup_mediaBank" TargetControlID="cmdSelectImage" PopupControlID="popupPanel" runat="server" X="0" Y="10"></ajaxToolkit:ModalPopupExtender>
                <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width: 75vw; height: 90vh;">
                    <uc1:MediaBank runat="server" OnMediaSelected="MediaBankControl_MediaSelectedEvent" ID="MediaBank" />
                    <%--<uc1:MediaBankControl runat="server" ID="MediaBankControl" OnMediaSelectedEvent="MediaBankControl_MediaSelectedEvent" OnMyEvents="MediaBankControl_MyEvents" OnSomeThindDone="MediaBankControl_SomeThindDone" ShowImageTypeMedia="true" />--%>
                </asp:Panel>
            </div>
        </div>
        <div class="col-md-12">
            <asp:Button ID="save_Changes" runat="server" ValidationGroup="addControls" Text="Save Changes" CssClass="btn btn-primary" OnClick="save_Changes_Click"/>
        </div>
        </div>
                       
    </ContentTemplate>
</asp:UpdatePanel>

