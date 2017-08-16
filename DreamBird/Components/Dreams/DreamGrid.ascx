<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamGrid.ascx.cs" Inherits="Components_Dreams_DreamGrid" %>

<div class="col-md-12" style="margin-top: 20px; margin-bottom: 20px;">
    <div class="col-md-3">
        <asp:DropDownList ID="ddl_DreamCat" OnSelectedIndexChanged="ddl_DreamCat_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server">
        </asp:DropDownList>
    </div>
    <div class="col-md-9">
        <div class="row">
            <!-- /.col-lg-6 -->
            <div class="col-lg-12">
                <div class="input-group">
                    <asp:TextBox ID="dream_keyword" class="form-control" placeholder="Search Dreams" runat="server"></asp:TextBox>
                    <span class="input-group-btn">
                        <button class="btn btn-primary" causesvalidation="false" id="search_dream_button" runat="server" onserverclick="search_dream_button_ServerClick" type="button">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                    </span>
                </div>
                <!-- /input-group -->
            </div>
            <!-- /.col-lg-6 -->
        </div>
        <!-- /.row -->
    </div>

</div>
<div class="col-md-12">
    <asp:Repeater ID="rptr_dreamGrid" runat="server">
        <ItemTemplate>
            <div class="col-md-2" style="margin-top: 10px; margin-bottom: 5px;">
                <div class="col-md-12" style="background-color: #e6e6e6; padding: 15px;">
                    <div class="col-md-12" style="padding: 0;">
                        <asp:Image ID="img_dream" ImageUrl='<%# Eval("MediaItem.Path500") %>' runat="server" Width="100%" />
                    </div>
                    <div class="col-md-12">
                        <asp:LinkButton ID="lb1" CommandName='<%# Eval("id") %>' CausesValidation="false" OnClick="lb1_Click" runat="server">
                        <h4 style="text-align: center;"><%# Eval("DreamName") %></h4></asp:LinkButton>
                    </div>
                </div>
            </div>
             <div style="clear: both" runat="server" Visible="<%# (Container.ItemIndex+1) % 6 == 0 %>"></div>
        </ItemTemplate>
    </asp:Repeater>
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

