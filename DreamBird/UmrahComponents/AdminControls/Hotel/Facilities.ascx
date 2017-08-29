<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Facilities.ascx.cs" Inherits="UmrahComponents_AdminControls_Hotel_Facilities" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>--%>

<%@ Register Src="~/Components/MediaBank/MediaBank.ascx" TagPrefix="uc2" TagName="MediaBank" %>



<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        
<div class="col-md-12">
<asp:Repeater ID="facility_list" runat="server" >
    <ItemTemplate>
        <div class="col-md-3">
            <div class="col-md-12">
             <asp:Image ID="facility_img" runat="server" Width="100%"  ImageUrl='<%# Eval("MediaItem.Path100") %>' Visible='<%# Bind("MediaItem.IsMediaItemImage") %>'  />
                                    <video id="facility_video" runat="server" width="100%" onclick="playvideo(this)"  Visible='<%# Bind("MediaItem.IsMediaItemVideo") %>'>
                                         <source type="video/mp4" src='<%# Eval("MediaItem.Path480") %>'>
                                    </video>
                                   
                </div>
            <div class="col-md-12" >
                <div class="btn btn-primary" style="background:#333333">
            <div class="col-md-8"> <asp:Label ID="name_txt" Text='<%# Eval("Name") %>' runat="server" Enabled="false" style="color:white"></asp:Label></div>
            <div class="col-md-2"  ><asp:CheckBox ID="available_chk"   Checked='<%# Eval("availability") %>' runat="server"  Enabled="false" /></div>
            </div>
                </div>
             <div class="col-md-12">
                 <div class="col-md-6" style="padding:0;">
                <asp:LinkButton ID="edit_btn" class="btn btn-default" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="edit_click"  CausesValidation="False"><span class="glyphicon glyphicon-pencil" ></span></asp:LinkButton>
           </div>
             <div class="col-md-6" style="padding:0;">
                  <asp:LinkButton ID="delete_btn" class="btn btn-primary" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="delete_click"   CausesValidation="False"><span class="glyphicon glyphicon-remove"></asp:LinkButton>
            </div>
             </div>
            </div>
    </ItemTemplate>
    <FooterTemplate>
       
    </FooterTemplate>
</asp:Repeater>
    
    </div>
        <div class="col-md-12">
             <table width="100%">
                 <tr>
                     <td></td> <td></td> <td></td>
                      <td style="width:50%">
                           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate><asp:Image ID="facility_imgAdd" runat="server" Width="100%" Style="min-height: 285px;" />
                                    <video id="facility_videoAdd" runat="server" width="100%" style="display:none"></video>
                            </ContentTemplate></asp:UpdatePanel>
                      </td>
                 </tr>
        <tr>
                    <td>
                        <div class="col-md-12" style="padding:0;">
                            <asp:LinkButton runat="server" ID="add_btn" class="btn btn-default" OnClick="add_btn_Clicked"><span class="glyphicon glyphicon-plus"></span></asp:LinkButton>
                        </div>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="addName_txt" type="text" class="form-control" placeholder="Facility Name" name=""></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="addName_txt" Font-Size="X-Large" ForeColor="Red"  Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:CheckBox runat="server" ID="Addavailable_chk" AutoPostBack="false" class="form-control" placeholder="Price" name=""></asp:CheckBox>
                    </td>
                    <td>
                                    
                                    <asp:TextBox ID="facilityImg_id" runat="server" Style="display: none" CausesValidation="True"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="img_validator" runat="server" ControlToValidate="facilityImg_id" ErrorMessage="Select Image" ForeColor="Red" Font-Bold="False"></asp:RequiredFieldValidator>

                                    <div class="col-md-12" style="padding: 0;">
                                        <asp:LinkButton ID="cmdSelectImage" CssClass="btn btn-default" runat="server" CausesValidation="False" >Select Media</asp:LinkButton>
                                        <%--<ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="cmdSelectImage" PopupControlID="popupPanel" runat="server"   ></ajaxtoolkit:ModalPopupExtender>--%>
                                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="cmdSelectImage" PopupControlID="popupPanel"></ajaxToolkit:ModalPopupExtender>
                                        <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width: 95vw; height: 90vh;">
                                            <%--<uc2:MediaBankControl ID="MediaBankControl" runat="server" OnMediaSelectedEvent="MediaBankControl1_MediaSelected" OnSomeThindDone="MediaBankControl_SomeThindDone" OnMyEvents="MediaBankControl1_MyEvents" OncloseMediaBank="CloseMediaBank" ShowImageTypeMedia="true" ShowVideoTypeMedia="true" />--%>
                                            <uc2:MediaBank runat="server" ID="MediaBank" OnMediaSelected="MediaBankControl1_MediaSelected"  />
                                             <asp:Button ID="Button4" CssClass="btn btn-danger" runat="server" CausesValidation="false" Style="border-radius: 0px; position: absolute; top: 0px; right: 0px;" Text="X" />
                                             </asp:Panel>
                                    </div>
                    </td>
                </tr>
            </table>
        </div>
        </ContentTemplate></asp:UpdatePanel>