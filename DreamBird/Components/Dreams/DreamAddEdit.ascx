<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamAddEdit.ascx.cs" Inherits="Components_Dreams_DreamAddEdit" %>

<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc2" TagName="MediaBankControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/Dreams/DreamPageEdit.ascx" TagPrefix="uc2" TagName="DreamPageEdit" %>


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

    <div class="well" style="width: 810px; height: 493px;">
    <div class="row">
    <div class="col-md-12">
        <asp:LinkButton ID="back_link" runat="server" OnClick="back_link_Click" CausesValidation="False">Back</asp:LinkButton>
    </div>
    </div>
    <div class="row">
    <div class="col-md-12">
          <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
        </div>
    </div>
 <div class="row" >
          <div style="width:100% !important;">
       <div class="col-md-7">
             <asp:Panel ID="Detail_panel" runat="server"  BorderWidth="1px" Height="291px" Width="100%">
          <Table  style="width: inherit;padding:20px;">
              <caption>
                  <br/>
                  <tr>
                      <td></td>
                      <td>
                          <asp:RequiredFieldValidator ID="img_validator" runat="server" ControlToValidate="dreamImg_id" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                          <br />
                          <asp:Image ID="Dream_img" runat="server" Height="117px" Width="159px" />
                          <asp:TextBox ID="dreamImg_id" runat="server" style="display:none" CausesValidation="True"></asp:TextBox>
                      </td>
                      <td></td>
                      <td>
                          <asp:Label ID="name_lbl" runat="server" Text="Label"> Dream Name</asp:Label><br/>
                          <asp:TextBox ID="DreamName_txt" runat="server" Height="21px" Width="166px"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="name_validator" runat="server" ControlToValidate="DreamName_txt" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                          <br />
                          <br/>
                          <asp:Label ID="desc_lbl" runat="server" Text="Label"> Dream Description</asp:Label><br/>
                          <asp:TextBox ID="DereamDetail_txt" runat="server" Height="82px" TextMode="MultiLine"></asp:TextBox>
                      </td>
                      <td></td>
                  </tr>
              </caption>
                 <tr>
                 <td></td>
                 <td>
                     <asp:LinkButton ID="cmdSelectImage" runat="server" CausesValidation="False">Select</asp:LinkButton>
                     <br />
                     <br />
                 </td><td></td>

                 <td>
                      <asp:CheckBox ID="default_chk" runat="server" Text="   Default" />
                     <br />
                     <asp:CheckBox ID="feature_chk" runat="server" Text="   Featured" />
                     <br />
                     </td>
                 </tr>
                  <tr>
                 <td></td>
                 <td>
                     <asp:Button ID="dream_add" runat="server" Text="Save" Width="104px" OnClick="dream_add_Click" />
                     <br />
                     <br />
                 </td>
                 <td>
                     <br />
                     <br />
                     </td>
                 </tr>
                 
                  </Table>
                 
                  </asp:Panel>
                   </div>
              <%--    <div class="col-md-1"></div>--%>
                  <div class="col-md-5">
                      <uc2:DreamPageEdit runat="server" ID="DreamPageEdit" visible="false"/>
                   
                      
                  </div>
        
       
       
        
        </div></div>

      </div><br/>
      <div></div>
      <br/>
      <br/>
       <ajaxToolkit:ModalPopupExtender BackgroundCssClass="modalBackground"
    CancelControlID="btnClose" runat="server" PopupControlID="popupPanel" ID="ModalPopupExtender1"
    TargetControlID="cmdSelectImage" />
               <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px">
                   <%--<uc2:MediaBankControl ID="MediaBankControl" runat="server" OnMediaSelectedEvent="MediaBankControl1_MediaSelected" OnMyEvents="MediaBankControl1_MyEvents" ShowImageTypeMedia="true"/>--%>
                   <uc2:MediaBankControl ID="MediaBankControl" runat="server"  OnMediaSelectedEvent="MediaBankControl1_MediaSelected" OnMyEvents="MediaBankControl1_MyEvents" ShowImageTypeMedia="true" ShowVideoTypeMedia="true" />
     </asp:Panel>

             
          
   </ContentTemplate>
</asp:UpdatePanel>
