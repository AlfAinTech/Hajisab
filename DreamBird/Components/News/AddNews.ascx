<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddNews.ascx.cs" Inherits="Components_News_AddNews" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/News/AddNewsRelatedNews.ascx" TagPrefix="uc1" TagName="AddNewsRelatedNews" %>
<%@ Register Src="~/Components/News/AddNewsDream.ascx" TagPrefix="uc1" TagName="AddNewsDream" %>
<%@ Register Src="~/Components/MediaBank/MediaBank.ascx" TagPrefix="uc1" TagName="MediaBank" %>





<%--<%@ Register Src="~/Components/News/wuc_related_news_for_current_news.ascx" TagPrefix="uc1" TagName="wuc_related_news_for_current_news" %>--%>


<div class="col-md-12">
   
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
              <div id="News_tabs">
                  <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#basicDetail" aria-controls="basicDetail" role="tab" data-toggle="tab">Basic Detail</a></li>
                      <li role="presentation"><a href="#relatedNews" aria-controls="relatedNews" role="tab" data-toggle="tab">Select Related News</a></li>
                    <li role="presentation"><a href="#selectDream" aria-controls="selectDream" role="tab" data-toggle="tab">Select Dreams</a></li>
                    <li role="presentation"><a href="#publishingOptions" aria-controls="publishingOptions" role="tab" data-toggle="tab">Publishing Options</a></li>                                      
                  </ul>

                  <!-- Tab panes -->
                  <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="basicDetail">
            <div class="col-md-12" style="padding:15px;">
                <div class="col-md-7">
                <div class="col-md-12">
                    <asp:TextBox ID="tb_news_title" runat="server" CausesValidation="True" CssClass="form-control" placeholder="News Title" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_tb_news_title" ControlToValidate="tb_news_title" runat="server" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-12">
                    <h4>News Content</h4>
                    <asp:TextBox ID="tb_news_description" runat="server" Height="185px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_tb_news_description" ControlToValidate="tb_news_description" runat="server" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                    
                    </div>
                <div class="col-md-5">
                
                    <div class="col-md-12" style="padding:0;">
                         
                        <asp:Image ID="img_News" runat="server" Style="height:220px;" Width="100%" />
                        <asp:TextBox ID="img_id" runat="server" style="display:none"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="img_validator" runat="server" ControlToValidate="img_id" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:LinkButton ID="lb_SelectImageForNews" runat="server" CssClass="btn btn-default" >Select Media</asp:LinkButton>
                        <ajaxtoolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="lb_SelectImageForNews" PopupControlID="p_MediaBankControl" runat="server" X="10" Y="10"></ajaxtoolkit:ModalPopupExtender>
        <asp:Panel ID="p_MediaBankControl" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width:93vw; height:90vh;">
                  
            <uc1:MediaBank runat="server" ID="MediaBank" />
            <%--<uc1:MediaBankControl runat="server" ID="MediaBankControl" OnMediaSelectedEvent="MediaBankControl1_MediaSelected" OnMyEvents="MediaBankControl1_MyEvents"  ShowImageTypeMedia="true" ShowVideoTypeMedia="false"/>--%>
              
            </asp:Panel>
                    </div>
                    

            </div>
                                           
                <div class="row">
                                               <div class="col-md-12">
                                                   <div class="col-md-6" style="margin-left:auto;margin-right:auto; float:none;">
                                <a href="#" id="next_publishingOptions" class="btn btn-default">Next</a>
                            </div>
                                               </div>
                                           </div>
                            
                
                </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="relatedNews">
                       
                        <uc1:AddNewsRelatedNews runat="server" ID="AddNewsRelatedNews" OnMyEvents_for_related_news="wuc_related_news_for_current_news_MyEvents" OnRelated_news_ids_Added_Event="Related_news_ids_Added_Event_hundler" OnMyEvents_for_cancel="MyEvents_for_cancel_hundler" />
                    </div>
                    <div role="tabpanel" class="tab-pane" id="selectDream">
                        
                         <uc1:AddNewsDream runat="server" ID="AddNewsDream" OnDreamids_Added_Event="Dreamids_Added_Event_hundler"  OnMyEvents="p_popup_add_dream_news_panel_MyEvents" OnCancel_Dream_Event="Cancel_Dream_Event_hundler" />
                      
                    </div>
                       <div role="tabpanel" class="tab-pane" id="publishingOptions">
                           <div class="col-md-12">
                        <h4>Publishing Options</h4>
                        <div class="row">
                            <div class="col-md-12" style="padding:0;">
                                <div class="col-md-6">
                                    <asp:CheckBox ID="cb_is_latest_news" runat="server" Checked="True" Text="Latest" />
                                </div>
                                <div class="col-md-6">
                                    <asp:CheckBox ID="cb_is_featured_news" runat="server" Text="Featured" />
                                </div>
                                <div class="col-md-12">
                                    <h5>From</h5>
                                    <asp:TextBox ID="tb_news_from_date" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox><asp:RequiredFieldValidator ID="rfv_tb_news_from_date" ControlToValidate="tb_news_from_date" runat="server" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-12">
                                    <h5>To</h5>
                                    <asp:TextBox ID="tb_news_to_date" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox><asp:RequiredFieldValidator ID="rfv_tb_news_to_date" ControlToValidate="tb_news_to_date" runat="server" ErrorMessage="(*)" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-12">
                                    <h5>Select Category</h5>
                                    <asp:DropDownList ID="ddl_category" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="national" Text="National"></asp:ListItem>
                                        <asp:ListItem Value="international" Text="Interational"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                
                                               <div class="col-md-12">
                                                   <h5>&nbsp;</h5>
                                                   <div class="col-md-6" style="margin-left:auto;margin-right:auto; float:none;">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Save & Continue" OnClick="cmd_save_news_Click" CausesValidation="false" />
                            </div>
                                               </div>
                                
                            </div>
                        </div>

                    </div>
                           </div>
                  </div>
               
            </ContentTemplate>
        </asp:UpdatePanel>
        </div>
</div>