<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonVideoAdmin.ascx.cs" Inherits="Components_LessonBank_Lesson_LessonVideoAdmin" %>
<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc1" TagName="MediaBankControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<video controls  runat="server" id="video_tag" >
   <source src='' type="video/mp4" />  
   <p>Fallback code if video isn't supported</p>/
 </video>
<asp:TextBox ID="video_id" runat="server" Visible="False"></asp:TextBox>
	<div class="col-md-12" style="padding:0;">
                    <asp:LinkButton ID="cmdSelectImage" CssClass="btn btn-default" runat="server" CausesValidation="False" OnClick="cmdSelectImage_Click">Select Media</asp:LinkButton>
                        <ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="cmdSelectImage" PopupControlID="popupPanel" runat="server"></ajaxtoolkit:ModalPopupExtender>
		    		<br />
                    <br />
                    <asp:CheckBox ID="showTranscript_chk" runat="server" Text="Show Transcript" />
		    		<br />
                    <asp:Button ID="save_video" runat="server" OnClick="save_video_Click" Text="Save" />
		    		<asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width:95vw; height:90vh;">
                   <uc1:MediaBankControl ID="MediaBankControl1" runat="server"  OnMediaSelectedEvent="MediaBankControl1_MediaSelected" OnSomeThindDone="MediaBankControl_SomeThindDone" OnMyEvents="MediaBankControl1_MyEvents" ShowImageTypeMedia="true" ShowVideoTypeMedia="true" />
     </asp:Panel>
                    </div>
    </ContentTemplate>
</asp:UpdatePanel>
