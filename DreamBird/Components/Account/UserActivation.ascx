<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserActivation.ascx.cs" Inherits="Account_UserActivation" %>

<style type="text/css">
    .auto-style1 {
        color: #006600;
    }
</style>
<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
    <ProgressTemplate>
        <div class="modal" style="display: block">
            <div class="center">
                <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel runat="server" ID="UpdatePanel1">

    <ContentTemplate>
        <asp:Panel ID="activated_panel" runat="server" BackColor="#999999">
            <strong>
                <asp:CheckBox ID="activated_chk" runat="server" CssClass="auto-style1" Enabled="False" />
                <span class="auto-style1">&nbsp;Account Successfully activated.</span></strong>
        </asp:Panel>
        <asp:Label ID="status_lbl" runat="server" Visible="False"></asp:Label>
        <asp:Panel ID="activation_panel" runat="server" Visible="true">
            <div class="col-md-12" style="padding: 0; background-color: #e6e6e6; height: 95px;">
                <div class="col-md-1">
                    <img src="../../Components/DreamProfile/UserProfileImages/warning.png" width="100%" />
                </div>
                <div class="col-md-7" style="margin-top: 10px;">
                    <h2>
                        <asp:Label ID="userName_lbl" runat="server"></asp:Label>!&nbsp;You need to activate your account</h2>
                </div>
                <div class="col-md-4" style="text-align: right;">
                    <h4>Confirm Email Sent to "
        <asp:Label ID="email_lbl" runat="server"></asp:Label>"</h4>
                    <h4><strong>Need Help?</strong> Contact Support</h4>
                    <asp:Button ID="resend_email" runat="server" OnClick="resend_email_Click" Text="Resend Email" />
                </div>
            </div>
        </asp:Panel>
    </ContentTemplate>

</asp:UpdatePanel>

