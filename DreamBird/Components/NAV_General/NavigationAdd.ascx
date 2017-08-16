<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NavigationAdd.ascx.cs" Inherits="Components_NAV_General_NavigationAdd" %>
 
<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc2" TagName="MediaBankControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div class="panel panel-default">
  <div class="panel-heading">Add Navigation</div>
            <div class="panel-body">
        <div class="nag_add_block" style="margin-right:auto; margin-left:auto; float:none; padding:20px; background-color:white; display:inline-block; height:auto;">
            <div class="col-md-12" style="padding:15px;" >
                <asp:TextBox ID="Caption_txt" runat="server" CausesValidation="True" CssClass="form-control" placebolder="Caption" ></asp:TextBox>
            </div>
        <div class="col-md-4">
            <asp:Image ID="navImage" runat="server" Width="100%" ImageUrl="navImage" />
            <asp:LinkButton ID="cmdSelectImage" CssClass="btn btn-default" runat="server" >Select</asp:LinkButton>
            <asp:TextBox ID="navImg_id" runat="server" style="display:none"></asp:TextBox>            
        </div>
        <div class="col-md-8">
            <div class="col-md-12">
                <h4>Internal</h4>
                <asp:RadioButton ID="LinkInternal" runat="server" CausesValidation="True" OnCheckedChanged="Link_CheckedChanged" ValidationGroup="true" AutoPostBack="True" GroupName="Link" />
                <asp:Panel ID="external_panel" runat="server" Visible="False">
                    <div class="row">
                       <div class="col-md-2">Dream</div>
                       <div class="col-md-4">
                        <asp:DropDownList ID="ddlDream" runat="server" DataTextField="DreamName" DataValueField="id" CssClass="form-control" OnSelectedIndexChanged="ddlDream_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                        </div>
                        <div class="col-md-2">Page</div>
                        <div class="col-md-4">
                        <asp:DropDownList ID="ddlPage" runat="server" DataTextField="Page" DataValueField="id" CssClass="form-control" >
                        </asp:DropDownList>
                        </div>
                        </div>
                    </asp:Panel>
            </div>
            <div class="col-md-12">
                <h4>External</h4>
            <asp:RadioButton ID="LinkExternal" runat="server" CausesValidation="True" OnCheckedChanged="Link_CheckedChanged" ValidationGroup="true" AutoPostBack="True" GroupName="Link" />
            <asp:Panel ID="internal_panel" runat="server" Visible="False">
                <div class="col-md-3">Link</div>
                <div class="col-md-9">
                <asp:TextBox ID="ExternalLink_txt" runat="server" CssClass="form-control" AutoPostBack="True"></asp:TextBox>
                </div>
            </asp:Panel>
            </div>
            <div class="col-md-12">
                 <asp:CheckBox ID="published" runat="server" Text="Published" />
            </div>
            <div class="col-md-12">
                <div class="col-md-6">
                    <asp:Button ID="add_navigation" runat="server" CssClass="btn btn-primary"  OnClick="add_navigation_Click" Text="Add Navigation" />
                </div>
                <div class="col-md-6">
                    <asp:Button ID="cancel" runat="server" CausesValidation="False" OnClick="cancel_Click" Text="Cancel" />
                </div>
            </div>
        </div>
            </div>
            </div>
                </div>
                 <ajaxToolkit:ModalPopupExtender BackgroundCssClass="modalBackground"
    CancelControlID="btnClose" runat="server" PopupControlID="popupPanel" ID="ModalPopupExtender1"
    TargetControlID="cmdSelectImage" />
               <asp:Panel ID="popupPanel" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Width="70%" Height="80%">
                   <uc2:MediaBankControl ID="MediaBankControl" runat="server" OnMediaSelectedEvent="MediaBankControl1_MediaSelected" OnSomeThindDone="MediaBankControl_SomeThindDone" OnMyEvents="MediaBankControl1_MyEvents" ShowImageTypeMedia="true" ShowAudioTypeMedia="true"/>
     </asp:Panel>

             
          


      
    </ContentTemplate>
</asp:UpdatePanel>
