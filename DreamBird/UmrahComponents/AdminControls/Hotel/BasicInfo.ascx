<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BasicInfo.ascx.cs" Inherits="UmrahComponents_AdminControls_Hotel_BasicInfo" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>--%>
<%--<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc2" TagName="MediaBankControl" %>--%>
<%@ Register Src="~/Components/MediaBank/MediaBank.ascx" TagPrefix="uc2" TagName="MediaBank" %>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<div class="col-md-6">
    	<div class="col-md-12">
    		<asp:TextBox  runat="server" ID="hotelName_txt" class="form-control" placeholder="Hotel Name"></asp:TextBox>
          
    	    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="hotelName_txt" ErrorMessage="*" ForeColor="Red" Font-Size="30pt"></asp:RequiredFieldValidator>
          
    	</div>
    	<div class="col-md-12">
    		<h4>
    			Description
    		</h4>
    		<textarea runat="server" ID="description_txt" class="form-control" style="min-height:100px; max-width:100%;">
    		</textarea>
    	</div>
        <div class="col-md-12" style="margin-top: 10px;"  >
        <h4>Hotel Rating</h4>
         
        <asp:DropDownList ID="star_list" runat="server" class="form-control">
            <asp:ListItem Value="1" Selected="True">Economy</asp:ListItem>
             <asp:ListItem Value="2">Budget</asp:ListItem>
            <asp:ListItem Value="3">3 Star</asp:ListItem>
            <asp:ListItem Value="4">4 Star</asp:ListItem>
            <asp:ListItem Value="5">5 Star</asp:ListItem>
            </asp:DropDownList>
        </div>
     <div class="col-md-12" style="margin-top: 10px;"  >
        <h4>Hotel Type</h4>
         
        <asp:DropDownList ID="hotelTypeList" runat="server" class="form-control">
            <asp:ListItem Value="makkah" Selected="True">Makkah</asp:ListItem>
            <asp:ListItem Value="madina">Madina</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-12" style="margin-top: 20px;">
        <h4>Distance</h4>
            <asp:TextBox  runat="server" ID="distance_txt" class="form-control" placeholder="Hotel Distance (Meter)" type="number" min="0"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="distance_txt" ErrorMessage="*" ForeColor="Red" Font-Size="30pt"></asp:RequiredFieldValidator>
   
        </div>
       
        </div>
        <div class="col-md-6">
                <div class="col-md-12">
                    <asp:UpdatePanel runat="server" ID="updatePanel_Add" ClientIDMode="AutoID" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                              <ContentTemplate> 
                                    <asp:Image ID="hotel_img" runat="server" Width="100%" Style="min-height: 285px;" />
                                    <video id="hotel_video" runat="server" width="100%" style="display:none"></video>
                                    <asp:TextBox ID="hotelImg_id" runat="server" Style="display: none" CausesValidation="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="img_validator" runat="server" ControlToValidate="hotelImg_id" ErrorMessage="Select Image" ForeColor="Red" Font-Bold="False"></asp:RequiredFieldValidator>
                        </ContentTemplate></asp:UpdatePanel>
                                    <div class="col-md-12" style="padding: 0;">
                                        <asp:LinkButton ID="cmdSelectImage" CssClass="btn btn-default" runat="server" CausesValidation="False" OnClick="cmdSelectImage_Click">Select Media</asp:LinkButton>
                                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server"  TargetControlID="cmdSelectImage" PopupControlID="popupPanel" CancelControlID="Button4"></ajaxToolkit:ModalPopupExtender>
                                        <%--<ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="cmdSelectImage" PopupControlID="popupPanel" runat="server"   ></ajaxtoolkit:ModalPopupExtender>--%>
                                        <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width: 95vw; height: 90vh;">
                                            <%--<uc2:MediaBankControl ID="MediaBankControl" runat="server" OnMediaSelectedEvent="MediaBankControl1_MediaSelected" OnSomeThindDone="MediaBankControl_SomeThindDone" OnMyEvents="MediaBankControl1_MyEvents" OncloseMediaBank="CloseMediaBank" ShowImageTypeMedia="true" ShowVideoTypeMedia="true" />--%>
                                            <uc2:MediaBank runat="server" ID="MediaBank" OnMediaSelected="MediaBankControl1_MediaSelected"  />
                                             <asp:Button ID="Button4" CssClass="btn btn-danger" runat="server" CausesValidation="false" Style="border-radius: 0px; position: absolute; top: 0px; right: 0px;" Text="X" />
                                             </asp:Panel>
                                    </div>
                                </div>
        </div>
        <div class="col-md-12">
            <div class="col-md-4" style="float: right; margin-top: 20px;">
                <asp:Button ID="hotel_add" runat="server" Text="Save" CssClass="btn btn-default" OnClick="hotel_add_Click" />
            </div>
        </div>
        </ContentTemplate></asp:UpdatePanel>