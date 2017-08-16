<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PackageInfo.ascx.cs" Inherits="UmrahComponents_AdminControls_Packages_PackageInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc2" TagName="MediaBankControl" %>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<div class="col-md-6">
    	<div class="col-md-12">
    		<asp:TextBox  runat="server" ID="Name_txt" class="form-control" placeholder="Package Name"></asp:TextBox>
          
    	    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name_txt" ErrorMessage="*" ForeColor="Red" Font-Size="30pt"></asp:RequiredFieldValidator>
          
    	</div>
    	<div class="col-md-12">
    		<h4>
    			Description
    		</h4>
    		<textarea runat="server" ID="description_txt" class="form-control" style="min-height:100px; max-width:100%;">
    		</textarea>
    	</div>
    
        <div class="col-md-12" style="margin-top: 20px;">
            <h4>Start Date</h4>
                <asp:TextBox  runat="server" ID="startDate_txt" type="date" class="form-control"></asp:TextBox>
   
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="startDate_txt" ErrorMessage="*" ForeColor="Red" Font-Size="30pt"></asp:RequiredFieldValidator>
   
         
        <h4>Duration</h4>
            <asp:TextBox  runat="server" ID="duration_txt" type="number" class="form-control" ></asp:TextBox>
   
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="duration_txt" ErrorMessage="*" ForeColor="Red" Font-Size="30pt"></asp:RequiredFieldValidator>
   
        </div>
       
        </div>
        <div class="col-md-6">
                <div class="col-md-12">
                                    <asp:Image ID="package_img" runat="server" Width="100%" Style="min-height: 285px;" />
                                    <video id="package_video" runat="server" width="100%" style="display:none"></video>
                                    <asp:TextBox ID="packageImg_id" runat="server" Style="display: none" CausesValidation="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="img_validator" runat="server" ControlToValidate="packageImg_id" ErrorMessage="Select Image" ForeColor="Red" Font-Bold="False"></asp:RequiredFieldValidator>

                                    <div class="col-md-12" style="padding: 0;">
                                        <asp:LinkButton ID="cmdSelectImage" CssClass="btn btn-default" runat="server" CausesValidation="False" OnClick="cmdSelectImage_Click">Select Media</asp:LinkButton>
                                        <ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="cmdSelectImage" PopupControlID="popupPanel" runat="server"   ></ajaxtoolkit:ModalPopupExtender>
                                        <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width: 95vw; height: 90vh;">
                                            <uc2:MediaBankControl ID="MediaBankControl" runat="server" OnMediaSelectedEvent="MediaBankControl1_MediaSelected" OnSomeThindDone="MediaBankControl_SomeThindDone" OnMyEvents="MediaBankControl1_MyEvents" OncloseMediaBank="CloseMediaBank" ShowImageTypeMedia="true" ShowVideoTypeMedia="true" />
                                        </asp:Panel>
                                    </div>
                                </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-4" style="float: right; margin-top: 20px;">
                <asp:Button ID="package_add" runat="server" Text="Save" CssClass="btn btn-default" OnClick="package_add_Click" />
            </div>
        </div>
        </ContentTemplate></asp:UpdatePanel>