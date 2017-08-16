<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MediaBank.ascx.cs" ValidateRequestMode="Disabled" Inherits="Components_MediaBank_MediaBank" %>
<%@ Register Src="~/Components/Grid/Grid.ascx" TagPrefix="uc1" TagName="Grid" %>

<link rel="stylesheet" href="<%# Server.MapPath("~/") %>/Admin/Content/css/dropzone.css">
<script>
    var RenderBaseURL = '<%=    ResolveUrl("~/Components/MediaBank/Content/RenderMedia.ashx?MediaCategory=") %>';
    var MediaItemBaseURL = '<%=    ResolveUrl("~/Components/MediaBank/MediaItemControl.ashx?MIID=") %>';
</script>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/myScripts.js"></script>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery.twbsPagination.js"></script>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/dropzone.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/MediaBank/Content/js/myScripts.js"></script>
<script>
    var RenderBaseURL = '<%=    ResolveUrl("~/Components/MediaBank/Content/RenderMedia.ashx?MediaCategory=") %>';
    var MediaItemBaseURL = '<%=    ResolveUrl("~/Components/MediaBank/MediaItemControl.ashx?MIID=") %>';
</script>
<div id="MediaBankBody" class="col-md-12">
    <div class="row">
        <div class="col-md-12 top_nav">
            <div class="row">
                <h3>Media Bank</h3>
            </div>
        </div>

        <div class="col-md-12" id="MediaBank">
            <div class="row">
                <div class="col-md-3 left_portion">
                    <div class="row">
                        <ul class="nav nav-tabs nav-stacked" role="tablist">
                            <li role="presentation" class="active"><a href="#InsertMedia" id="InsertMedia_Main" aria-controls="InsertMedia" role="tab" data-toggle="tab">Insert Media</a></li>
                            <li role="presentation"><a role="button" data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">Group Media Items</a>
                                <div class="collapse" id="collapseExample">
                                    <div class="well" style="background-color: #464646; padding-right: 0px;">
                                        <div id="Group_Media_items">
                                            <ul class="nav nav-tabs nav-stacked" role="tablist">
                                                <li role="presentation"><a href="#InsertMedia" id="GroupMedia" aria-controls="InsertMedia" role="tab" data-toggle="tab">Create a new group</a></li>
                                                <li role="presentation"><a href="#InsertMedia" id="view_group" aria-controls="InsertMedia" role="tab" data-toggle="tab">View group items</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li role="separator" class="divider"></li>
                            <li role="presentation"><a href="#ExternalSourceAdd" id="ExternalSourceAddition" aria-controls="ExternalSourceAdd" role="tab" data-toggle="tab">Add External Media</a></li>
                            <li role="presentation"><a role="button" data-toggle="collapse" href="#upload_media" aria-expanded="false" aria-controls="upload_media">Add Media From Your PC</a></li>
                        </ul>
                    </div>
                    <%--<hr style="margin-top: 0;" />--%>
                    <div class="row">
                        <div class="collapse" id="upload_media">
                            <div class="well" style="height: 300px; overflow-y: auto;">
                                <div class="col-md-12 dropzone" id="file_upload"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="InsertMedia">
                        <div class="col-md-7 middle_portion">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-4">
                                        <asp:DropDownList ID="ddl_mediaType" ClientIDMode="Static" CssClass="form-control filter_media" runat="server"></asp:DropDownList>
                                    </div>
                                    <div id="General_Filter">
                                        <div class="col-md-4">
                                            <input type="date" class="form-control filter_media" id="date_added" value="2012-03-22" />
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control filter_media" id="search_media" placeholder="Search Media" />
                                        </div>
                                    </div>
                                    <div class="col-md-4" id="group_media_list" style="display: none;">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                            <ContentTemplate>
                                                <asp:DropDownList ID="ddl_media_cat" ClientIDMode="Static" CssClass="form-control" runat="server"></asp:DropDownList>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12" style="height: 445px; padding: 15px;">
                                <div class="row">
                                    <div id="media_grid"></div>
                                </div>
                            </div>
                            <div class="col-md-12" style="position: absolute; bottom: 0; background-color: #f6f6f6;">
                                <nav aria-label="Page navigation">
                                    <ul class="pagination" id="pagination"></ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-md-2" style="background-color: #e6e6e6;">
                            <div class="row">
                                <div class="right_portion">
                                    <asp:HiddenField ID="MediaItemID" ClientIDMode="Static" runat="server" />
                                    <div class="col-md-12">
                                        <div id="edit_block" style="display: none;">
                                            <div class="row">
                                                <div class="col-md-11" style="margin-left: auto; margin-right: auto; float: none; margin-top: 15px;">
                                                    <div class="row">
                                                        <img id="thumb_media" style="display: none;" width="100%" />
                                                        <video id="video_media" style="display: none;" width="100%" controls></video>
                                                        <iframe id="EVideo_Thumb" width="100%" style="display: none;"></iframe>
                                                    </div>
                                                </div>
                                            </div>
                                            <h4>
                                                <strong>
                                                    <span id="MediaName"></span>
                                                </strong>
                                            </h4>
                                            <h5>
                                                <span id="MediaResolution"></span>
                                            </h5>
                                            <h5>
                                                <span id="MediaSize"></span>
                                            </h5>
                                            <h5>
                                                <span id="MediaDateAdded"></span>
                                            </h5>

                                            <h5>
                                                <a href="#" id="RemoveMedia" style="color: red;">Remove Media Item</a>
                                            </h5>
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <a role="button" style="color: green; display: none;" id="Transcript_button" data-toggle="modal" data-target="#myModal">Add Video Transcript
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <h5>Media Item URL</h5>
                                                    <input type="text" class="form-control" id="MediaURL" />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <h5>Select Resolution</h5>
                                                    <asp:DropDownList ID="ddl_res" CssClass="form-control" runat="server">
                                                        <asp:ListItem Value="500" Text="500 x 500"></asp:ListItem>
                                                        <asp:ListItem Value="100" Text="100 x 100"></asp:ListItem>
                                                        <asp:ListItem Value="Original" Text="Original"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="Group_Block" style="display: none;">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <span class="glyphicon glyphicon-remove ClearGroup" style="float: right;" aria-hidden="true"></span>
                                                    <div id="add_group_items" style="min-height: 60px;">
                                                    </div>
                                                    <asp:HiddenField ID="group_items_ids" ClientIDMode="Static" runat="server" />
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <h5>Add to Existing Group</h5>
                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                        <ContentTemplate>
                                                            <asp:RadioButtonList ID="existing_groups" CssClass="MyRadioClass" runat="server"></asp:RadioButtonList>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <h5>New Group Name</h5>
                                                    <asp:TextBox ID="new_group_name" CssClass="form-control" ClientIDMode="Static" runat="server"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="selection_panel">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:Button ID="GroupMediaItems" Style="display: none;" ClientIDMode="Static" CausesValidation="false" OnClick="GroupMediaItems_Click" CssClass="btn btn-success" runat="server" Text="Create Group" />
                                                    <asp:Button ID="select_media" Style="display: none;" ClientIDMode="Static" CausesValidation="false" OnClick="select_media_Click" CssClass="btn btn-success" runat="server" Text="Select Media" />
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="ExternalSourceAdd">
                        <div class="right_portion" style="height: 504px;">
                            <div class="col-md-12">
                                <h4>Add Image from External Source</h4>
                                <div class="row">
                                    <div class="col-md-4">
                                        <h5>Image Name</h5>
                                        <asp:TextBox ID="img_name" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Field Required" ControlToValidate="img_name" ValidationGroup="ImageName"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>Image Path</h5>
                                        <asp:TextBox ID="img_url" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="img_url" ValidationGroup="ImageName" runat="server" ErrorMessage="Invalid Image URL" ValidationExpression=".*\.(gif|jpe?g|bmp|png)$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Field Required" ValidationGroup="ImageName" ControlToValidate="img_url"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>&nbsp;</h5>
                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                            <ContentTemplate>
                                                <asp:Button ID="save_external_img" ValidationGroup="ImageName" OnClick="save_external_img_Click" CssClass="btn btn-success" Width="100%" runat="server" Text="Save Image" />
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <h4>Add Video from External Source</h4>
                                <h5>Video source should be embed code given by various video hosting sites example source is given below:</h5>
                                <h5 style="color: white; background-color: #464646;">&lt;iframe width="854" height="480" src="https://www.youtube.com/embed/Ggy-2_LI7eY" frameborder="0" allowfullscreen&gt;&lt;/iframe&gt;</h5>
                                <div class="row">
                                    <div class="col-md-4">
                                        <h5>Video Name</h5>
                                        <asp:TextBox ID="Video_Name" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Field Required" ControlToValidate="Video_Name" ValidationGroup="ExternalVideo"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>Video Embed Code</h5>
                                        <asp:TextBox ID="Video_Embed_Code" CssClass="form-control" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Field Required" ControlToValidate="Video_Embed_Code" ValidationGroup="ExternalVideo"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-4">
                                        <h5>&nbsp;</h5>
                                        <asp:Button ID="Save_External_Video" OnClick="Save_External_Video_Click" CausesValidation="false" CssClass="btn btn-success" Width="100%" runat="server" Text="Save Video" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--  <div role="tabpanel" class="tab-pane" id="ViewExternalMedia">
                <div class="col-md-7 middle_portion">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-4">
                                <asp:DropDownList ID="Eddl_mediaType" ClientIDMode="Static" CssClass="form-control Efilter_media" runat="server"></asp:DropDownList>
                            </div>
                            <div id="EGeneral_Filter">
                                <div class="col-md-4">
                                    <input type="date" class="form-control Efilter_media" id="Edate_added" value="2012-03-22" />
                                </div>
                                <div class="col-md-4">
                                    <input type="text" class="form-control Efilter_media" id="Esearch_media" placeholder="Search Media" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12" style="height: 445px; overflow-y: auto; padding: 15px;">
                        <div class="row">
                            <div id="Emedia_grid"></div>
                        </div>
                    </div>
                    <div class="col-md-12" style="position: absolute; bottom: 0; background-color: #f6f6f6;">
                        <nav aria-label="Page navigation">
                            <ul class="pagination" id="Epagination"></ul>
                        </nav>
                    </div>
                </div>
               <div class="col-md-2" style="background-color: #e6e6e6;">
                    <div class="row">
                        <div class="right_portion">
                            <asp:HiddenField ID="HiddenField1" ClientIDMode="Static" runat="server" />
                            <div class="col-md-12">
                                <div id="Eedit_block" style="display: none;">
                                    <div class="row">
                                        <div class="col-md-11" style="margin-left: auto; margin-right: auto; float: none; margin-top: 15px;">
                                            <div class="row">
                                                <img id="Ethumb_media" style="display: none;" width="100%" />
                                                <iframe id="EVideo_Thumb" width="100%" style="display: none;"></iframe>
                                            </div>
                                        </div>
                                    </div>
                                    <h4>
                                        <strong>
                                            <span id="EMediaName"></span>
                                        </strong>
                                    </h4>
                                    <h5>
                                        <span id="EMediaDateAdded"></span>
                                    </h5>

                                    <h5>
                                        <a href="#" id="ERemoveMedia" style="color: red;">Remove Media Item</a>
                                    </h5>

                                    <div class="col-md-12">
                                        <div class="row">
                                            <h5>Media Item URL</h5>
                                            <input type="text" class="form-control" id="EMediaURL" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="selection_panel">
                            <div class="col-md-12">
                                <div class="row">
                                    <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="Button2" Style="display: none;" ClientIDMode="Static" CausesValidation="false" CssClass="btn btn-success" runat="server" Text="Select Media" />
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-lg" role="document" style="width: 80%;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Add / Edit Video Transcript</h4>
                        </div>
                        <div class="modal-body col-md-12" style="height: 430px;">
                            <div class="row">
                                <div class="col-md-4">
                                    <video id="Video_Transcript" style="width: 100%" controls></video>
                                </div>
                                <div class="col-md-8">
                                    <uc1:Grid runat="server" ID="Grid" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
