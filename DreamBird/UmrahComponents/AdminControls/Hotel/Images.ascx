<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Images.ascx.cs" Inherits="UmrahComponents_AdminControls_Hotel_Images" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/MediaBank/MediaBank.ascx" TagPrefix="uc2" TagName="MediaBank" %>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
<asp:Repeater ID="hotelImages_list" runat="server">
    <ItemTemplate>
         <div class="col-md-3" style="padding:20px; ">
        <asp:Image runat="server" ID="hotelimage"  ImageUrl='<%# Eval("MediaItem.Path100") %>'  width="100%"/>
       <asp:LinkButton ID="delete_btn" class="btn btn-primary" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="delete_click"   CausesValidation="False"><span class="glyphicon glyphicon-remove"></asp:LinkButton>
        
    </div>
    </ItemTemplate>
    <FooterTemplate>
          
    </FooterTemplate>
</asp:Repeater>
         <div class="col-md-3" style="padding:20px;  ">
              
                                    <asp:TextBox ID="hotelImg_id" runat="server" Style="display: none" CausesValidation="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="img_validator" runat="server" ControlToValidate="hotelImg_id" ErrorMessage="Select Image" ForeColor="Red" Font-Bold="False"></asp:RequiredFieldValidator>

                                    <div class="col-md-12" style="padding: 0;">
                                       <asp:ImageButton ID="cmdSelectImage" runat="server" ImageUrl="~/UmrahComponents/Contents/img/plus.png"   width="100%" height="145px"/>
                                        <ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="cmdSelectImage" PopupControlID="popupPanel" runat="server"   ></ajaxtoolkit:ModalPopupExtender>
                                         <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width: 95vw; height: 90vh;">
                                            <%--<uc2:MediaBankControl ID="MediaBankControl" runat="server" OnMediaSelectedEvent="MediaBankControl1_MediaSelected" OnSomeThindDone="MediaBankControl_SomeThindDone" OnMyEvents="MediaBankControl1_MyEvents" OncloseMediaBank="CloseMediaBank" ShowImageTypeMedia="true" ShowVideoTypeMedia="true" />--%>
                                            <uc2:MediaBank runat="server" ID="MediaBank" OnMediaSelected="MediaBankControl1_MediaSelected"  />
                                             <asp:Button ID="Button4" CssClass="btn btn-danger" runat="server" CausesValidation="false" Style="border-radius: 0px; position: absolute; top: 0px; right: 0px;" Text="X" />
                                             </asp:Panel>
                                    </div>
        
    </div>
        </ContentTemplate>
     </asp:UpdatePanel>
