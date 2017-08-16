<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditNewsForAdmin.ascx.cs" Inherits="Components_News_NewControls_EditNewsForAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register Src="~/Components/News/AddNewsRelatedNews.ascx" TagPrefix="uc1" TagName="AddNewsRelatedNews" %>
<%@ Register Src="~/Components/News/AddNewsDream.ascx" TagPrefix="uc1" TagName="AddNewsDream" %>
<%@ Register Src="~/Components/MediaBank/MediaBankControl.ascx" TagPrefix="uc1" TagName="MediaBankControl" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" Style="width:100%;">
    <ContentTemplate>
        <div class="col-md-12">

            <div id="editNews">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#basicDetail_edit" aria-controls="basicDetail_edit" role="tab" data-toggle="tab">Basic Detail</a></li>
                    <li role="presentation"><a href="#relatedNews_edit" aria-controls="relatedNews_edit" role="tab" data-toggle="tab">Related News</a></li>
                    <li role="presentation"><a href="#selectDream_edit" aria-controls="selectDream_edit" role="tab" data-toggle="tab">Select Dreams</a></li>
                    <li role="presentation"><a href="#publishingOptions_edit" aria-controls="publishingOptions_edit" role="tab" data-toggle="tab">Publishing Options</a></li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="basicDetail_edit">
                        <div class="col-md-12" style="padding: 15px;">
                            <div class="col-md-7">
                                <div class="col-md-12">
                                    <asp:HiddenField ID="HF1" runat="server" />
                                    <asp:TextBox ID="tb_news_title" runat="server" CausesValidation="True" CssClass="form-control" placeholder="News Title"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_tb_news_title" ControlToValidate="tb_news_title" runat="server" ErrorMessage="This Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-12">
                                    <h4>News Content</h4>
                                    <asp:TextBox ID="tb_news_description" runat="server" Height="185px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_tb_news_description" ControlToValidate="tb_news_description" runat="server" ErrorMessage="This Field is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <div class="col-md-12" style="padding: 0;">
                                    <asp:Image ID="img_News" runat="server" Style="height: 220px;" Width="100%" />
                                    <asp:TextBox ID="img_id" runat="server" Style="display: none"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="img_validator" runat="server" ControlToValidate="img_id" ErrorMessage="Image is Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:LinkButton ID="lb_SelectImageForNews" runat="server" CssClass="btn btn-default">Select Media</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-6" style="margin-left: auto; margin-right: auto; float: none;">
                                <a href="#" id="next_relatedNews" class="btn btn-default">Next</a>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="relatedNews_edit">
                        <uc1:AddNewsRelatedNews runat="server" ID="AddNewsRelatedNews" OnAddPreSelectedNews="AddNewsRelatedNews_AddPreSelectedNews" EditMode="true" />
                    </div>
                    <div role="tabpanel" class="tab-pane" id="selectDream_edit">
                        <uc1:AddNewsDream runat="server" ID="AddNewsDream" EditMode="true" />
                    </div>
                    <div role="tabpanel" class="tab-pane" id="publishingOptions_edit">
                        <div class="col-md-12">
                            <h4>Publishing Options</h4>
                            <div class="row">
                                <div class="col-md-12" style="padding: 0;">
                                    <div class="col-md-6">
                                        <asp:CheckBox ID="cb_is_latest_news" runat="server" Checked="True" Text="Latest" />
                                    </div>
                                    <div class="col-md-6">
                                        <asp:CheckBox ID="cb_is_featured_news" runat="server" Text="Featured" />
                                    </div>
                                    <div class="col-md-12">
                                        <h5>From</h5>
                                        <asp:TextBox ID="tb_news_from_date" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv_tb_news_from_date" ControlToValidate="tb_news_from_date" runat="server" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-12">
                                        <h5>To</h5>
                                        <asp:TextBox ID="tb_news_to_date" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfv_tb_news_to_date" ControlToValidate="tb_news_to_date" runat="server" ErrorMessage="This field is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-12">
                                        <h5>Select Category</h5>
                                        <asp:DropDownList ID="ddl_category" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="national" Text="National"></asp:ListItem>
                                            <asp:ListItem Value="international" Text="Interational"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <h5>&nbsp;</h5>
                                <div class="col-md-12">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-default" Text="Save" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
        <ajaxtoolkit:ModalPopupExtender BackgroundCssClass="modalBackground"
            runat="server" PopupControlID="p_MediaBankControl" ID="ModalPopupExtender_for_MediaBankControl"
            TargetControlID="lb_SelectImageForNews" X="10" Y="10" />

        <asp:Panel ID="p_MediaBankControl" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width: 93vw; height: 90vh; position: fixed;">


            <uc1:MediaBankControl runat="server" ID="MediaBankControl" ShowImageTypeMedia="true" ShowVideoTypeMedia="false" OnMediaSelectedEvent="MediaBankControl_MediaSelectedEvent" OnMyEvents="MediaBankControl_MyEvents" />
            <%--<uc2:MediaBankControl ID="MediaBankControl" runat="server"  OnMediaSelectedEvent="MediaBankControl1_MediaSelected" OnMyEvents="MediaBankControl1_MyEvents" ShowImageTypeMedia="true" ShowVideoTypeMedia="true" />OnMyEventsForClose="MyEventsForClose_hundler"--%>
        </asp:Panel>
    </ContentTemplate>
</asp:UpdatePanel>
