<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MediaSelection.ascx.cs" Inherits="Components_MediaBank_MediaSelection" %>
<div class="col-md-12" style="padding: 5px; background-color: #404040;">
    <h3 style="margin: 0; text-align: center; color: white;">Media Bank</h3>
    <%--<asp:Button ID="Button4" CssClass="btn btn-danger" runat="server" CausesValidation="false" Style="border-radius: 0px; position: absolute; top: 0px; right: 0px;" OnClick="Button4_Click" Text="X" />--%>
</div>
<div class="col-md-12" style="height: 500px;">
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
            <div class="col-md-12" style="margin-top: 5px; margin-bottom: 5px;">
                <div class="col-md-1">
                    Sort
                </div>
                <div class="col-md-2">
                    <asp:DropDownList ID="ddl_sort" AutoPostBack="true" OnSelectedIndexChanged="ddl_sort_SelectedIndexChanged" runat="server">
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
            <div class="col-md-12">

                <div class="col-md-12" style="overflow-y: auto; height: 450px;">

                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="col-md-2" style="padding: 15px;">
                                <asp:ImageButton ID="thumb_media" CausesValidation="false" OnClick="thumb_media_Click" data-id='<%# Eval("id") %>' CommandName='<%# Eval("name") %>' ImageUrl='<%# Eval("path") %>' Width="100%" runat="server" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
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
