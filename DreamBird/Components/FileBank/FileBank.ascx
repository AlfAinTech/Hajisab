<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FileBank.ascx.cs" Inherits="Components_FileBank_FileBank" %>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/jquery-ui.js"></script>
<script src="<%# Server.MapPath("~/") %>/Admin/Content/js/bootstrap.min.js"></script>
<script src="<%# Server.MapPath("~/") %>/Components/FileBank/content/myScript.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="col-md-12" style="padding: 5px; background-color: #404040;">
    <h3 style="margin: 0; text-align: center; color: white;">File Bank</h3>
    <asp:Button ID="close_filebank" CssClass="btn btn-danger" runat="server" CausesValidation="false" Style="border-radius: 0px; position: absolute; top: 0px; right: 0px;" OnClick="close_filebank_Click" Text="X" />
</div>
<div class="col-md-12" style="padding: 0;">
    <div class="col-md-3" style="background-color: #e6e6e6; height: 500PX;">
        <div class="col-md-12" id="search-dream" style="padding: 15px;">
            <div style="width: 15%; float: left;" id="add-dream">
                <button type="button" class="btn btn-default" data-toggle="collapse" data-target="#AddMedia" aria-expanded="false" aria-controls="AddMedia" aria-label="Left Align">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                </button>
            </div>
        </div>
        <div class="col-md-12">
            <div class="collapse" id="AddMedia">
                <div class="well" style="height: 130px;">
                    <div class="col-md-12" style="background-color: #e6e6e6;">
                        <h4>Upload JS files</h4>
                        <input type="file" />
                        <input class="Button_Upload_files" type="button" value="Upload" />
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-9" style="height: 500px; overflow-y: auto;">
        <asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
        <ProgressTemplate>
            <div class="modal" style="display:block">
                <div class="center">
                    <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="col-md-12" style="margin-top: 15px; margin-bottom: 15px;">
                    <div class="col-md-1">
                        Sort
                    </div>
                    <div class="col-md-2">
                        <asp:DropDownList ID="ddl_sort" AutoPostBack="true" OnSelectedIndexChanged="ddl_sort_SelectedIndexChanged" runat="server">
                            <asp:ListItem Text="Name" Value="name"></asp:ListItem>
                            <asp:ListItem Text="Date" Value="DateAdded"></asp:ListItem>
                            <asp:ListItem Text="Type" Value="FileType"></asp:ListItem>
                            <asp:ListItem Text="Category" Value="FileCategory_id"></asp:ListItem>
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
                <div class="col-md-12">
                    <asp:Button ID="btn_Refresh" Style="display:none;" ClientIDMode="Static" OnClick="ddl_paging_SelectedIndexChanged" runat="server" Text="Button" />
                    <asp:Repeater ID="file_grid" runat="server">
                        <ItemTemplate>
                            <div class="col-md-2">
                                <asp:LinkButton ID="file_item" CssClass="file_thumb" CommandName='<%# Eval("name") %>' Height="70px" Width="100%" data-path='<%# Eval("path")+"/"+Eval("name") %>' Style="background-color: #e6e6e6;" runat="server"><h1 style="vertical-align: bottom; margin-top:15px; font-size:3.5em; text-align: right; margin-bottom:5px; margin-right:5px;"><%# Eval("fileType") %></h1></asp:LinkButton>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name").ToString().PadRight(15).Substring(0,15).TrimEnd() %>' Width="100%" Height="25px" Style="background-color: #00769c; color: white; vertical-align: middle; text-align: center;"></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-md-12">
                    <div class="col-md-12">
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


    </div>
</div>
