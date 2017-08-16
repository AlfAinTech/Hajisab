<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ImportTextBanks.ascx.cs" Inherits="Components_TextBank_ImportTextBanks" %>
<div class="col-md-12">
    <div class="row">
        <div class="col-md-3" style="height:435px; overflow-y:auto;">
            <div class="row">
                <input type="text" class="form-control" id="search_dream_list" placeholder="Search Dreams" />
            </div>
            <div class="row">
                <asp:Repeater ID="dreams" runat="server">
                    <HeaderTemplate>
                        <ul class="nav nav-stacked" id="dream_list_main" role="tablist">
                    </HeaderTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                    <ItemTemplate>
                        <li role="presentation"><a href="#<%# Eval("id") %>" class="list-group-item" aria-controls="<%# Eval("id") %>" role="tab" data-toggle="tab"><%# Eval("dreamName") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="col-md-3">
            <div class="row">
                <input type="text" class="form-control" id="search_dream_page_list" placeholder="Search Page" />
            </div>
            <div class="row">
                <div class="tab-content" style="overflow-y: auto; padding: 0; height: 400px;">
                    <asp:Repeater ID="dreams_for_pages" OnItemDataBound="dreams_for_pages_ItemDataBound" runat="server">
                        <ItemTemplate>
                            <div role="tabpanel" class="tab-pane" id="<%# Eval("id") %>">
                                <asp:Repeater ID="pages" runat="server">
                                    <HeaderTemplate>
                                        <ul class="nav nav-stacked dream_page_list_main" role="tablist">
                                    </HeaderTemplate>
                                    <FooterTemplate>
                                        </ul>
                                    </FooterTemplate>
                                    <ItemTemplate>
                                        <li role="presentation"><a href="#<%# Eval("id")+"_"+Eval("id") %>" class="list-group-item" aria-controls="<%# Eval("id")+"_"+Eval("id") %>" role="tab" data-toggle="tab"><%# Eval("Page") %></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="tab-content" style="overflow-y: auto; padding: 0; height: 400px;">
                <asp:Repeater ID="pages_for_textBanks" OnItemDataBound="pages_for_textBanks_ItemDataBound" runat="server">
                    <ItemTemplate>
                        <div role="tabpanel" class="tab-pane" id="<%# Eval("id")+"_"+Eval("id") %>">
                            <asp:Repeater ID="text_banks" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-12" style="margin-top:3px; margin-bottom:2px;">
                                        <div class="col-md-12" style="background-color: white;">
                                            <h6><a href="_" class="textbank_item" data-text-id='<%# Eval("TextBank.id") %>'><%# Eval("TextBank.textName") %></a></h6>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</div>
