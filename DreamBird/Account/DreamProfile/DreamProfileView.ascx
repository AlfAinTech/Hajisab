<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamProfileView.ascx.cs" Inherits="Account_DreamProfile_DreamProfileView" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Account/DreamProfile/DreamProfileAddEdit.ascx" TagPrefix="uc1" TagName="DreamProfileAddEdit" %>

<style type="text/css">
    .fill {
  position: absolute;
  left: 0;
  width: 90px;
  background-color: green;
  overflow:hidden;
        top: 37px;
    }
.mask1 {
  display: block;
  height: 90px;
  left: 0;
  position: absolute;
  top: 0;
  width: 90px;
  overflow:hidden;
}
</style>
<asp:Panel ID="ProfileView_panel" runat="server" BorderStyle="Solid" BorderWidth="2" Height="198px" Width="170px">
<asp:Label ID="Header" runat="server" style="font-weight: 700"  >Improve your Profile</asp:Label>
<div style="position:relative; top: 0px; left: 1px; height: 99px; width: 111px;" >
    <asp:Label ID="Label1" runat="server"  CssClass="fill"></asp:Label>
  
  <asp:Image ID="Img_profile" runat="server" class="mask1" src="/Account/DreamProfile/UserProfileImages/pic_profile_strength_mask_90x90_v2.png" Text="abc" ImageAlign="Middle"/>
   
</div>
<div> <asp:Label ID="percentageLabel" runat="server" ></asp:Label>
    <br />
    <br />
    <asp:LinkButton ID="update_btn" runat="server" ForeColor="#0000CC" OnClick="update_btn_Click">Update Profile</asp:LinkButton>
    </div>
   
   </asp:Panel>



    <style type="text/css">
        .modalBackground
        {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }
        .modalPopup
        {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            width: 500px;
            height: 350px;
        }
    </style> 
   <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="update_btn"
    CancelControlID="btnClose" BackgroundCssClass="modalBackground">
</cc1:ModalPopupExtender>
<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" style = "display:none" Height="350px" Width="500px">
<header style="padding:0px"> <div style="text-align:right; padding:0px"><asp:Button ID="btnClose" runat="server" Text="☓" /></div></header>
    <uc1:DreamProfileAddEdit runat="server" ID="DreamProfileAddEdit" OnMyEvent="MyEvents_clicked"  />
   
</asp:Panel>
<p>
</p>
