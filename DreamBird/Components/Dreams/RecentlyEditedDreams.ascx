<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RecentlyEditedDreams.ascx.cs" Inherits="Components_Dreams_RecentlyEditedDreams" %>
<div class="col-md-12">
    <div class="row">
        <asp:Repeater ID="rptr_recent_dreams" runat="server">
            <ItemTemplate>
                <div class="col-md-3" style="margin-top:10px; margin-bottom:5px;">
                    <div class="col-md-12">
                        <div class="row">
                            <asp:LinkButton ID="dream" runat="server" OnClick="dream_Click" CausesValidation="false" CommandName='<%# Eval("id") %>'>
                                <asp:Image ID="dream_image" ImageUrl='<%# Eval("MediaItem.Path100") %>' Width="100%" runat="server" />
                                <h4><%# Eval("dreamName") %></h4>
                                <h5><%# Eval("Description").ToString().PadRight(75).Substring(0,75).TrimEnd()+"..." %></h5>
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>