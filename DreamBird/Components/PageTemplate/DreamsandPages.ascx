<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamsandPages.ascx.cs" Inherits="Components_PageTemplate_DreamsandPages" %>
<div class="col-md-3" style="padding: 0; height: 400px;" id="side-nav">
    <asp:Repeater ID="rptr_dream_list" runat="server">
        <HeaderTemplate>
            <ul class="nav nav-stacked" role="tablist">
        </HeaderTemplate>
        <ItemTemplate>
            <li role="presentation"><a href="#<%# Eval("dreamName") %>" class="list-group-item" aria-controls="<%# Eval("id") %>" role="tab" data-toggle="tab"><%# Eval("dreamName") %></a></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
</div>
<div class="col-md-9" style="background-color: #e6e6e6; height: 400px; padding-right:0;">
    <div class="tab-content">
    <asp:Repeater ID="rptr_dream_page_List" runat="server" OnItemDataBound="rptr_dream_page_List_ItemDataBound">
        <ItemTemplate>
            <div role="tabpanel" class="tab-pane" id="<%# Eval("dreamName") %>">
                <div class="col-md-4" style="padding:0;"><h3><%# Eval("dreamName") %></h3></div>
                <div class="col-md-8"><p>Note: Clicking on the Page Name below shall replace all the existing content of the page with content of clicked page. Proceed with caution.</p></div>
                <input type="hidden" id="hf" />
                <asp:HiddenField ID="hf_id" runat="server" Value='<%# Eval("id") %>' />
                <asp:Repeater ID="rptr_page_list" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4" style="margin-top:15px; margin-bottom:15px;">
                            <div class="col-md-12" style="background-color:white; text-overflow: ellipsis;">
                                <h4><a href="#" class="dream_page" id="<%# Eval("DreamID") %>" data-name="<%# Eval("Page") %>"><%# Eval("Page").ToString().PadRight(10).Substring(0,10).TrimEnd() %></a></h4>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </ItemTemplate>
    </asp:Repeater>
        </div>
</div>
