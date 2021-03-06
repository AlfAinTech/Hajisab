﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BookedPackages.ascx.cs" Inherits="Components_Dreams_BookedPackages" %>


<div class="col-md-12">
    <h5>Showing
        <asp:Label ID="current_count" runat="server" Text="0"></asp:Label>
        of
        <asp:Label ID="total_count" runat="server" Text="0"></asp:Label>
        Packages(s)</h5>
    <div class="row">
        <asp:Repeater ID="rptr_dreamGrid" runat="server" OnItemDataBound="rptr_dreamGrid_ItemDataBound">
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
                             <%-- <div class="col-md-12">
                            <div class="col-md-2 " style="float:right;margin:1px;float:right; border-radius: 50%;  background: red;">
                                <asp:Literal ID="NoOfBooking" runat="server"></asp:Literal>
                            </div>
                                  </div> --%>
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