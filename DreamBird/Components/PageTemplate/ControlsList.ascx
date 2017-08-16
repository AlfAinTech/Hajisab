<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ControlsList.ascx.cs" Inherits="Components_PageTemplate_ControlsList" %>
<asp:UpdateProgress ID="UpdateProgress1" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
    <ProgressTemplate>
        <div class="modal" style="display: block">
            <div class="center">
                <img alt="" src="../../Components/MediaBank/Content/Images/100x100/ajax_loader_blue_512.gif" />
            </div>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" Style="width: 100%">
    <ContentTemplate>
        <div class="col-md-12" style="padding: 0;">
            <div id="controls_list">
                <div class="col-md-3" style="padding: 0;">
                    <!-- Nav tabs -->
                    <asp:Repeater ID="rptr_controlcategory" runat="server">
                        <HeaderTemplate>
                            <ul class="nav nav-stacked" role="tablist">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li role="presentation"><a href="#<%# Eval("Name") %>" class="list-group-item" aria-controls="<%# Eval("Name") %>" role="tab" data-toggle="tab"><%# Eval("Name") %></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-md-9" style="padding: 0;">
                    <!-- Tab panes -->
                    <div class="tab-content" style="overflow-y: auto; max-height: 300px;">
                        <input type="hidden" id="hf" />
                        <input type="hidden" id="hf1" />
                        <asp:Repeater ID="rprt_tabpans" runat="server" OnItemDataBound="rprt_tabpans_ItemDataBound">
                            <ItemTemplate>
                                <div role="tabpanel" class="tab-pane" id="<%# Eval("Name") %>">

                                    <asp:HiddenField ID="hf_id" runat="server" Value='<%# Eval("id") %>' />
                                    <asp:Repeater ID="Repeater2" runat="server">
                                        <ItemTemplate>
                                            <div class="col-md-3" style="margin-top: 15px; margin-bottom: 5px;">
                                                <a href="#" class="img_control" data-progress="<%# Eval("isProgress") %>" data-componentid="<%# Eval("id") %>" data-name="<%# Eval("name") %>">
                                                    <img src="<%# Eval("MediaItem.Path100") %>" width="100%" /></a>
                                                <div class="col-md-12" style="padding: 0; background-color: #627b90; height: 50px; color: white;">
                                                    <h5 style="text-align: center;"><%# Eval("name").ToString().PadRight(18).Substring(0,18).TrimEnd() %></h5>
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
    </ContentTemplate>
</asp:UpdatePanel>

