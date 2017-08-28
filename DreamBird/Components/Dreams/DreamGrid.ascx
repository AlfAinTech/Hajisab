<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamGrid.ascx.cs" Inherits="Components_Dreams_DreamGrid" %>


<div class="col-md-12">
    <div class="row">
        <div class="col-md-9">
            <div class="row">
                <!-- /.col-lg-6 -->
                <div class="col-lg-12">
                    <asp:Panel DefaultButton="search_dream_button" runat="server" CssClass="input-group blogsearch">
                        <asp:TextBox ID="dream_keyword" class="form-control" placeholder="Search Package" runat="server"></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:LinkButton  class="btn btn-primary" validationgroup="SearchDream"  ID="search_dream_button" runat="server"  OnClick="search_dream_button_ServerClick">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                            </asp:LinkButton>
                        </span>
                    </asp:Panel>
                    <!-- /input-group -->
                    <%--<asp:Panel DefaultButton="search_dream_button" runat="server" CssClass="input-group blogsearch">
                        <asp:TextBox ID="dream_keyword" CssClass="form-control" runat="server" Width="100%" Placeholder="Search for..."></asp:TextBox>
                        <span class="input-group-btn">
                            <asp:LinkButton ID="search_dream_button" onserverclick="search_dream_button_ServerClick"  runat="server" CssClass="btn btn-default"><i class="fa fa-search"></i></asp:LinkButton>
                    </span>
                                            <asp:RequiredFieldValidator ID="req_dream_keyword" ControlToValidate="dream_keyword" ValidationGroup="SearchDream" runat="server" ErrorMessage="Field Required"></asp:RequiredFieldValidator>

                    </asp:Panel>--%>

                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
        </div>
        <div class="col-md-3">
            <asp:DropDownList ID="ddl_DreamCat" OnSelectedIndexChanged="ddl_DreamCat_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server">
            </asp:DropDownList>
        </div>
    </div>
</div>
<div class="col-md-12">
    <h5>Showing
        <asp:Label ID="current_count" runat="server" Text="0"></asp:Label>
        of
        <asp:Label ID="total_count" runat="server" Text="0"></asp:Label>
        Packages(s)</h5>
    <div class="row">
        <asp:Repeater ID="rptr_dreamGrid" runat="server">
            <ItemTemplate>
                <div class="col-md-2" style="margin-top: 10px; margin-bottom: 5px;">
                    <div class="col-md-12" style="background-color: #e6e6e6; height: 165px; padding:10px;">

                        <asp:HyperLink ID="lb1" CommandName='<%# Eval("id") %>' CausesValidation="false" NavigateUrl='<%# "../../Admin/DreamDetail?DID="+Eval("id") %>' runat="server">
                            <div class="col-md-12" style="padding: 0;">
                                <asp:Image ID="img_dream" ImageUrl='<%# Eval("MediaItem.Path500") %>' runat="server" Width="100%"  Visible='<%# Bind("IsMediaItemImage") %>' />
                                <br />
                                    <video id="dream_video" runat="server" display="dynamic" onclick="playvideo(this)" visible='<%# Bind("IsMediaItemVideo") %>' width="100%">
                                        <source type="video/mp4" src='<%# Eval("MediaItem.Path480") %>'>
                                    </video>
                            </div>
                            <div class="col-md-12">

                                <h5 style="text-align:center; nowrap; overflow:hidden; text-overflow:ellipsis;"><%# Eval("DreamName") %></h5>
                            </div>
                        </asp:HyperLink>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <h4>
        <asp:Label ID="errormessage" runat="server"></asp:Label></h4>
</div>
<div class="col-md-12">
    <div class="row">
        <div class="col-md-6">
            <asp:Repeater ID="rptr_dream_pagination" runat="server">
                <HeaderTemplate>
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <asp:LinkButton ID="Previous_Pagination_Item" CausesValidation="false" OnClick="Previous_Pagination_Item_Click" runat="server" aria-label="Next">
                                    <span aria-hidden="true">&laquo;</span>
                                </asp:LinkButton>
                            </li>
                </HeaderTemplate>
                <ItemTemplate>
                    <li class='<%# Convert.ToBoolean(Eval("Enabled"))? "enabled" : "disabled" %>'>
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName='<%# Eval("Value") %>' Text='<%# Eval("Value") %>' OnClick="LinkButton2_Click" CausesValidation="false"></asp:LinkButton>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    <li>
                        <asp:LinkButton ID="Next_Pagination_Item" CausesValidation="false" OnClick="Next_Pagination_Item_Click" runat="server" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </asp:LinkButton>
                    </li>
                    </ul>
                </nav>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>

<script>
    function playvideo(thisobj) {
        thisobj.paused ? thisobj.play() : thisobj.pause();
        if (thisobj.hasAttribute("controls")) {
            thisobj.removeAttribute("controls")
        } else {
            thisobj.setAttribute("controls", "controls")
        }
    }
</script>