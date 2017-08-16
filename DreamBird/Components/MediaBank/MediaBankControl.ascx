<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MediaBankControl.ascx.cs" Inherits="Components_MediaBank_MediaBankControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Components/Tags/TagControl.ascx" TagPrefix="uc1" TagName="TagControl" %>
<%@ Register Src="~/Components/Video_Transcript/VideoTranscript.ascx" TagPrefix="uc1" TagName="VideoTranscript" %>
<%--<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/MediaCode.js"></script>--%>




<asp:Panel ID="Panel1" runat="server" Style="width: 100%; min-height: 400px;">
    <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel5" runat="server">
        <ProgressTemplate>
            <div class="modal" style="display:block">
                <div class="center">
                    <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
            <div class="col-md-12" style="padding: 0;">
                <div style="float: right; z-index: 1000;" class="col-md-2" id="close-media">
                    <%--<button class="btn btn-danger" style="position:fixed; top:0px; right:0px;" runat="server" onserverclick="Button4_Click"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>--%>
                </div>
                <div class="col-md-3" style="padding: 0; overflow-y: auto;" id="side-nav">
                    <div class="col-md-12" id="search-dream" style="padding: 15px; display: inline-block;">
                        <div style="width: 15%; float: left;" id="add-dream">
                            <button type="button" class="btn btn-default" data-toggle="collapse" data-target="#AddMedia" aria-expanded="false" aria-controls="AddMedia" aria-label="Left Align">
                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                            </button>
                        </div>

                    </div>
                    <div class="col-md-12">
                        <div class="collapse" id="AddMedia">
                            <div class="well" style="height: 245px;">
                                <div class="col-md-12" style="background-color: #e6e6e6;">
                                    <h4>Upload Images, Audio or JS files</h4>
                                    <input type="file" />
                                    <input class="Button_Upload" type="button" value="Upload" />
                                </div>
                                <hr>
                                <div class="col-md-12" style="background-color: #e6e6e6;">
                                    <h4>Upload Videos</h4>
                                    <input type="file" />
                                    <input class="Button_Upload1" type="button" value="Upload" />
                                    Select Video Quality
                                    <asp:DropDownList ID="ddl_videoChoice" runat="server">
                                        <asp:ListItem Text="480p" Value="480p"></asp:ListItem>
                                        <asp:ListItem Text="720p" Value="720p"></asp:ListItem>
                                        <asp:ListItem Text="1080p" Value="1080p"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="list-group">
                            <a href="" class="list-group-item col-md-4">
                                <label class="checkbox-inline">
                                    <asp:CheckBox ID="ch_audio" Enabled="false" runat="server" AutoPostBack="true" OnCheckedChanged="ch_audio_CheckedChanged" />Audio</label></a>
                            <a href="" class="list-group-item col-md-4">
                                <label class="checkbox-inline">
                                    <asp:CheckBox ID="ch_video" Enabled="false" runat="server" AutoPostBack="true" OnCheckedChanged="ch_audio_CheckedChanged" />Video</label></a>
                            <a href="" class="list-group-item col-md-4">
                                <label class="checkbox-inline">
                                    <asp:CheckBox ID="ch_image" Enabled="false" runat="server" AutoPostBack="true" OnCheckedChanged="ch_audio_CheckedChanged" />Image</label></a>
                        </div>
                        <div class="col-md-12">
                            <h4 style="color: white;">Title</h4>
                            <input type="text" class="form-control" placeholder="Media Title" />
                        </div>
                        <div class="col-md-12">
                            <h4 style="color: white;">Category</h4>
                            <asp:DropDownList ID="ddl_cat" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>

                        <div class="col-md-12">
                            <h4 style="color: white;">Selection</h4>
                            <asp:DropDownList ID="ddl_choice" CssClass="form-control" runat="server">
                                <asp:ListItem Text="AND" Value="AND"></asp:ListItem>
                                <asp:ListItem Text="OR" Value="OR"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-12">
                            <h4 style="color: white;">Tags</h4>
                            <uc1:TagControl runat="server" ID="TagControl" />
                            <%--<asp:TextBox ID="Text1" CssClass="form-control" runat="server" Style="height: 30px; width: 100%;"></asp:TextBox>--%>
                        </div>
                        <div class="col-md-12">
                            <h4 style="color: white;">Sort</h4>
                            <asp:Button ID="btn_filter" CssClass="btn btn-default" runat="server" OnClick="btn_filter_Click" CausesValidation="false" Text="Filter Media" />
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="col-md-12" style="background: white; padding: 20px;">
                        <%-- <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
                            <li role="presentation"><a href="#upload" aria-controls="upload" role="tab" data-toggle="tab">Upload Media</a></li>
                            <li role="presentation"><a href="#videoTranscript" aria-controls="videoTranscript" role="tab" data-toggle="tab">Video Transcript</a></li>
                          </ul>--%>
                        <%-- <div class="tab-content" style="min-height:480px; overflow-y:unset;">
                            <div role="tabpanel" class="tab-pane active" id="home">--%>
                        <asp:UpdatePanel ID="UpdatePanel_Gallery" runat="server">
                            <ContentTemplate>
                                <div class="col-md-12" style="margin-top: 5px; margin-bottom: 5px;">
                                    <div class="col-md-1">
                                        Sort
                                    </div>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="ddl_sort" AutoPostBack="true" OnSelectedIndexChanged="ddl_paging_SelectedIndexChanged" runat="server">
                                            <asp:ListItem Text="Name" Value="name"></asp:ListItem>
                                            <asp:ListItem Text="Date" Value="DateAdded"></asp:ListItem>
                                            <asp:ListItem Text="Type" Value="mediaType"></asp:ListItem>
                                            <asp:ListItem Text="Category" Value="MediaCategory_id"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddl_paging" AutoPostBack="true" OnSelectedIndexChanged="ddl_paging_SelectedIndexChanged" runat="server" Width="100%">
                                            <asp:ListItem Text="All" Value="all"></asp:ListItem>
                                            <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="100" Value="100"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-md-12" style="overflow-y: scroll; height: 430px;">
                                    <asp:Button ID="btn_refresh" CssClass="refresh" Style="display: none;" runat="server" CausesValidation="false" Text="Refresh" OnClick="Button2_Click1" />
                                    <div class="row">
                                       
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <div class="col-md-2" style="padding: 5px;">
                                                    <asp:ImageButton ID="ImageButton1" Height="70px" CausesValidation="false" OnClick="ImageButton1_Click" CommandName='<%# Eval("name") %>' ImageUrl='<%# Eval("path") %>' Width="70px" runat="server" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="Medium" Style="display: none;"></asp:Label>
                                    </div>
                                    <div class="row">
                                        <asp:Repeater ID="Repeater2" runat="server" Visible="false">
                                            <HeaderTemplate>
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination">
                                                        <li>
                                                            <a href="#" aria-label="Previous">
                                                                <span aria-hidden="true">&laquo;</span>
                                                            </a>
                                                        </li>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <li class='<%# Convert.ToBoolean(Eval("Enabled"))? "enabled" : "disabled" %>'>
                                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName='<%# Eval("Value") %>' Text='<%# Eval("Value") %>' OnClick="LinkButton2_Click" CausesValidation="false"></asp:LinkButton>
                                                </li>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <li>
                                                    <a href="#" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                                </ul>
                                                    </nav>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <%-- </div>--%>
                        <%--                            <div role="tabpanel" class="tab-pane" id="videoTranscript" style="display:none;">
                                <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                    <ContentTemplate>
                                        <asp:Repeater ID="rptr_videoTranscript" runat="server">
                                    <HeaderTemplate>
                                        <h4>Select Video for Transcription</h4>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="col-md-2" style="padding:5px;">
                                           <asp:ImageButton ID="thumb_videoTranscript" Height="70px" CausesValidation="false" OnClick="thumb_videoTranscript_Click" CommandName='<%# Eval("name") %>' ImageUrl='<%# Eval("path") %>' Width="70px" runat="server" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>--%>
                    </div>
                </div>
                <asp:HiddenField ID="LinkButton1" runat="server" />
                <asp:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="LinkButton1" PopupControlID="Panel2" CancelControlID="Button1" runat="server"></asp:ModalPopupExtender>
                <asp:Panel ID="Panel2" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Style="width: 93vw; height: 90vh;">
                    <div class="col-md-12" style="padding: 5px; background-color: #404040;">
                        <h3 style="margin: 0; text-align: center; color: white;">Media Preview</h3>
                        <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" Style="border-radius: 0px; position: absolute; top: 0; right: 0; z-index: 1000;" Text="X" />
                    </div>

                    <div class="col-md-7 previews" id="preview" style="padding: 20px; background-color: white;" runat="server">
                        <asp:Button ID="btn_addvt" CssClass="btn btn-success" OnClick="btn_addvt_Click" CausesValidation="false" Width="100%" runat="server" Text="Add Transcript" Visible="false" />

                    </div>
                    <div class="col-md-5" id="detail" runat="server" style="padding: 20px;">
                        <div id="t_details" runat="server" style="background-color: white;">
                            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gw_transcript" runat="server" AllowPaging="true" PageSize="3" OnRowUpdating="gw_transcript_RowUpdating" Width="100%" OnRowDeleting="gw_transcript_RowDeleting" OnRowCancelingEdit="gw_transcript_RowCancelingEdit" OnRowEditing="gw_transcript_RowEditing" AutoGenerateColumns="false" ShowHeaderWhenEmpty="true" ShowFooter="true" CssClass="mGrid">
                                        <Columns>
                                            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" CausesValidation="false" />
                                            <asp:TemplateField HeaderText="ID" InsertVisible="False" SortExpression="id">
                                                <FooterTemplate>
                                                    <asp:Button ID="Add_row" runat="server" OnClick="Add_row_Click2" CausesValidation="false" Text="Add Row" />
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Label ID="Lbl_id" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Time Stamp (Seconds)" SortExpression="TimeStamp">
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txt_timeStamp" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txt_etimestamp" runat="server" Text='<%# Bind("TimeStamp") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TimeStamp") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Transcript Text" SortExpression="Text">
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txt_text" runat="server"></asp:TextBox>
                                                </FooterTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Text") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txt_etext" runat="server" Text='<%# Bind("Text") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <asp:Label ID="Label4" runat="server" Text="Add Transcript Data with Time"></asp:Label>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <asp:Button ID="btn_saveTranscript" OnClick="btn_saveTranscript_Click1" CausesValidation="false" runat="server" Text="Save Transcript" />
                        </div>
                        <div id="details" runat="server">
                            <div class="col-md-12">
                                <div class="row">
                                    File Name :
                                <asp:Label ID="Name" runat="server" Font-Size="Large"></asp:Label>
                                </div>
                                <div class="row">
                                    File Details :
                                <asp:Label ID="Resolution" runat="server"></asp:Label>
                                </div>
                                <div class="row">
                                    File Size :
                                <asp:Label ID="Size" runat="server"></asp:Label>
                                </div>
                                <div class="row">
                                    <div class="col-md-12" style="text-align: left; padding: 0;">
                                        Category
                                                <div class="input-group">
                                                    <asp:DropDownList ID="ddl_cat1" CssClass="form-control" runat="server"></asp:DropDownList>
                                                    <span class="input-group-addon">
                                                        <asp:Button ID="btn_catadd" CssClass="btn btn-danger" runat="server" CausesValidation="false" Text="Add" Style="padding-top: 0px; height: 20px;" />
                                                    </span>
                                                </div>
                                        <asp:ModalPopupExtender ID="ModalPopupExtender2" CancelControlID="btn_cancel_cat" PopupControlID="Panel3" TargetControlID="btn_catadd" runat="server"></asp:ModalPopupExtender>
                                        <asp:Panel ID="Panel3" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Width="35%">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                <ContentTemplate>
                                                    <div class="row" style="margin: 0;">
                                                        <div class="col-md-12">
                                                            <asp:GridView ID="grid_categories" OnRowDeleting="grid_categories_RowDeleting" DataKeyNames="id" OnRowEditing="grid_categories_RowEditing" OnRowUpdating="grid_categories_RowUpdating" OnRowCancelingEdit="grid_categories_RowCancelingEdit" CssClass="mGrid" runat="server" ShowFooter="true" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" />
                                                                    <asp:TemplateField HeaderText="" ShowHeader="false" InsertVisible="False" SortExpression="id">
                                                                        <FooterTemplate>
                                                                            <asp:Button ID="Add_row" runat="server" OnClick="Add_row_Click" CausesValidation="false" Text="Add" />
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>' Style="display: none"></asp:Label>
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label_id" runat="server" Text='<%# Bind("id") %>' Style="display: none"></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Category Name" SortExpression="CategoryName">
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txt_categoryname" runat="server"></asp:TextBox>
                                                                        </FooterTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                                                                        </EditItemTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label_cat" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin: 0;">
                                                        <div class="col-md-12">
                                                            <asp:Button ID="btn_cancel_cat" CssClass="btn btn-default" runat="server" Text="Close" Width="100%" />
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>
                                    </div>
                                    <div class="col-md-12" style="text-align: left; padding: 0;">
                                        Tags
                                                <div class="input-group">
                                                    <uc1:TagControl runat="server" ID="TagControl1" />
                                                    <%--<asp:TextBox ID="Text2" CssClass="form-control TextText" runat="server" Width="100%"></asp:TextBox>--%>
                                                    <span class="input-group-addon">
                                                        <asp:Button ID="btn_addtag" CssClass="btn btn-danger" runat="server" CausesValidation="false" OnClick="btn_addtag_Click" Text="Add" Style="padding-top: 0px; height: 20px;" />
                                                    </span>
                                                </div>
                                        <asp:ModalPopupExtender ID="ModalPopupExtender3" runat="server" TargetControlID="btn_addtag" CancelControlID="btn_close_tags" PopupControlID="Panel4"></asp:ModalPopupExtender>
                                        <asp:Panel ID="Panel4" runat="server" BackColor="#CCCCCC" BorderWidth="2px" Width="35%">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                <ContentTemplate>
                                                    <div class="row" style="margin: 0;">
                                                        <div class="col-md-12">
                                                            <asp:GridView ID="grid_tags" OnRowCancelingEdit="grid_tags_RowCancelingEdit" OnRowDeleting="grid_tags_RowDeleting" OnRowEditing="grid_tags_RowEditing" OnRowUpdating="grid_tags_RowUpdating" CssClass="mGrid" runat="server" ShowFooter="true" AutoGenerateColumns="false">
                                                                <Columns>
                                                                    <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" CausesValidation="false" />
                                                                    <asp:TemplateField HeaderText="" InsertVisible="False" SortExpression="id">
                                                                        <FooterTemplate>
                                                                            <asp:Button ID="Add_row" runat="server" OnClick="Add_row_Click1" CausesValidation="false" Text="Add" />
                                                                        </FooterTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label_tags" runat="server" Text='<%# Bind("id") %>' Style="display: none;"></asp:Label>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:Label ID="label_tagid" runat="server" Text='<%# Bind("id") %>' Style="display: none;"></asp:Label>
                                                                        </EditItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:TemplateField HeaderText="Tag Name" SortExpression="Name">
                                                                        <FooterTemplate>
                                                                            <asp:TextBox ID="txt_Name" runat="server"></asp:TextBox>
                                                                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txt_Name" runat="server" ErrorMessage="*Required"></asp:RequiredFieldValidator>--%>
                                                                        </FooterTemplate>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="Label_tag" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <EditItemTemplate>
                                                                            <asp:TextBox ID="txt_tagName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                                                        </EditItemTemplate>
                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin: 0;">
                                                        <div class="col-md-12">
                                                            <asp:Button ID="btn_close_tags" CssClass="btn btn-default" runat="server" Text="Close" Width="100%" />
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:Panel>

                                    </div>
                                    <div class="col-md-12" style="text-align: left; margin-top: 10px; padding: 0;">
                                        <asp:Label ID="lbl_res" runat="server" Text="Available Resolutions"></asp:Label>
                                        <asp:DropDownList ID="ddl_resolution" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="100x100" Value="100x100"></asp:ListItem>
                                            <asp:ListItem Text="500x500" Value="500x500"></asp:ListItem>
                                            <asp:ListItem Text="Original" Value="Original"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Label ID="lbl_quality" runat="server" Text="Available Qualities"></asp:Label>
                                        <asp:DropDownList ID="ddl_vidQuality" CssClass="form-control" runat="server">
                                            <asp:ListItem Text="480p" Value="480p"></asp:ListItem>
                                            <asp:ListItem Text="720p" Value="720p"></asp:ListItem>
                                            <asp:ListItem Text="1080p" Value="1080p"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-12" style="margin-top: 10px; padding: 0;">
                                        <asp:Button ID="Button2" CssClass="btn btn-success" OnClick="Button3_Click" CausesValidation="false" Width="100%" runat="server" Text="Add" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%--<div class="col-md-6" style="margin-left:auto; margin-right:auto; margin-top:20px; float:none;">
                                                            
                                                        </div>--%>
                    </div>
                </asp:Panel>
                <%--</div>--%>
                <div class="row" style="display: none;">
                    <asp:DropDownList ID="ddlImages" runat="server" Width="113px" DataTextField="name" DataValueField="id">
                        <asp:ListItem>Iamge1</asp:ListItem>
                        <asp:ListItem>Image2</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;
            <asp:LinkButton ID="cmdImageSelected" runat="server" OnClick="cmdImageSelected_Click" CausesValidation="False">Add</asp:LinkButton>
                    &nbsp;
    
            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Button ID="Button1" runat="server" Text="ServerSideButton" OnClick="Button1_Click" />

                </ContentTemplate>

            </asp:UpdatePanel>--%>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Panel>
