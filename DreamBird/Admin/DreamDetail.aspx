<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="DreamDetail.aspx.cs" Inherits="Admin_DreamDetail" %>

<%@ Register Src="~/Components/Dreams/DreamButtons.ascx" TagPrefix="uc1" TagName="DreamButtons" %>
<%@ Register Src="~/Components/Dreams/DreamPageListView.ascx" TagPrefix="uc1" TagName="DreamPageListView" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:TextBox ID="dream_idss" ClientIDMode="Static" Style="display:none;" runat="server" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="col-md-12" style="background-color: #464646; padding-right: 0; padding-top: 8px;">
        <div class="col-md-2" style="padding: 0;">
            <div class="col-md-2">
                <div class="row">
                    <asp:HyperLink ID="dream_basic_info" onclick="$('.page_frame').css('display', 'block'); $('#content_item').css('display', 'none');" Target="Page_Preview" runat="server" CssClass="btn btn-primary BasicInfo">
                         <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
                    </asp:HyperLink>
                    <asp:HyperLink ID="UmrahDetails" Visible="false" onclick="$('.page_frame').css('display', 'block'); $('#content_item').css('display', 'none');" Target="Page_Preview" runat="server" CssClass="btn btn-success UmrahDetail">
                <span class="glyphicon glyphicon-plane" aria-hidden="true"></span>
            </asp:HyperLink>
                </div>
            </div>
            <div class="col-md-10">
                <h3 style="margin-top: 3px;">
                    <asp:Label ID="dream_name" Style="color: white;" runat="server">HyperLink</asp:Label>

                    <%--<asp:LinkButton ID="" OnClick="dream_name_Click" runat="server"></asp:LinkButton>--%></h3>
            </div>
        </div>
       <%-- <div class="col-md-2">
            <div class="dropdown">
                <a id="dLabel" data-target="#" href="#" class="btn btn-default" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span id="dLabelSpan">Select Dream Pages</span>
    <span class="caret"></span>
                </a>

                <div class="dropdown-menu" style="width: 600px; height: 350px;" aria-labelledby="dLabel">
                    <div class="col-md-12">
                        <input type="text" class="form-control" placeholder="Filter Dream Pages" id="filter_pages" />
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <h4>Exquisite Pages</h4>
                                <asp:Repeater ID="dream_pages" OnItemDataBound="dream_pages_ItemDataBound" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-4">
                                            <h5>
                                                <asp:HyperLink ID="page_name" Target="Page_Preview" onclick="$('.page_frame').css('display', 'block'); $('#content_item').css('display', 'none'); $('#dLabelSpan').text($(this).text());" data-pageid='<%# Eval("id") %>' runat="server"><%# Eval("Page") %></asp:HyperLink></h5>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="col-md-6">

                                <h4>Activity Pages</h4>
                                <asp:Repeater ID="Repeater1" OnItemDataBound="Repeater1_ItemDataBound" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-4">
                                            <h5>
                                                <asp:HyperLink ID="page_name" Target="Page_Preview" onclick="$('.page_frame').css('display', 'block'); $('#content_item').css('display', 'none'); $('#dLabelSpan').text($(this).text());" data-pageid='<%# Eval("id") %>' runat="server"><%# Eval("Page") %></asp:HyperLink></h5>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>--%>
        <div class="col-md-1" style="margin-left: -37px;">
            <%--<a href="#" class="btn btn-primary" id="add_new_page">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
            </a>--%>
            
        </div>

        <div class="col-md-4" id="save_new_page" style="display: none;">
            <div class="row">
                <div class="col-md-6">
                    <asp:TextBox ID="New_Page_Name" ClientIDMode="Static" CssClass="form-control" required="required" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:CheckBox ID="IsActivity" ClientIDMode="Static" CssClass="form-control" runat="server" Text="Activity Page" />
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary" id="save_new_page_button" runat="server" onserverclick="save_new_page_button_ServerClick"><span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span></button>
                </div>
            </div>
        </div>
    </div>
    <%--<div class="col-md-2">
                    <button class="btn btn-default" runat="server" id="add_new_page_server" onserverclick="add_new_page_server_ServerClick">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    </button>
                </div>--%>
    <%--<div class="col-md-2" style="padding: 0; background-color: #464646; height: 570px; overflow-y: auto;">
        <div id="accordion" role="tablist" aria-multiselectable="true">
            <div class="col-md-6">
                <div class="row">
                    <a class="btn btn-primary" role="button" style="width: 100%;" data-parent="#accordion" data-toggle="collapse" data-target="#add_new_page_collapse" aria-expanded="false" aria-controls="add_new_page_collapse">
                        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                    </a>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <a class="btn btn-primary" role="button" style="width: 100%;" data-parent="#accordion" data-toggle="collapse" data-target="#search_dream_pages" aria-expanded="false" aria-controls="search_dream_pages">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </a>
                </div>
            </div>

            <div class="collapse" id="add_new_page_collapse">
                <div class="well" style="height: 70px;">
                    <div class="col-md-12" style="padding: 0">
                        <div class="col-md-10" style="padding-left: 0;">
                            <input type="text" class="form-control" placeholder="Add Page Name" id="add_new_page_collapse_text" />
                        </div>
                        <div class="col-md-2" style="padding-left: 0;">
                            <button class="btn btn-success" id="save_kro">
                                <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="collapse" id="search_dream_pages">
                <div class="well" style="height: 70px;">
                    <div class="col-md-12" style="padding: 0">
                        <input type="text" class="form-control" placeholder="Search Page Name" id="search_pages" />
                    </div>
                </div>
            </div>
            <uc1:DreamPageListView runat="server" ID="DreamPageListView" OnDreamPageClicked="DreamPageClicked" />
        </div>
    </div>--%>
    <div class="col-md-12" style="background-color: #e6e6e6; padding: 0;">
        <iframe name="Page_Preview" class="page_frame" scrolling="no" onload="calcHeight();" width="100%" height="580px" border="no" scroll="yes" style="display:block"></iframe>
    </div>
</asp:Content>

