<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RelatedNews.ascx.cs" Inherits="Components_News_NewControls_RelatedNews" %>
 <div class="addNews_wrapper">
          <div class="container">
            <h3>Related News</h3>
              <asp:Repeater ID="Repeater1" runat="server">
                  <ItemTemplate>
                    <div class="col-md-2">
                      <div class="col-md-12" style="padding:0;" id="img_related">
                          <asp:Image ID="image_related" runat="server" Width="100%" ImageUrl='<%# Eval("MediaItem.Path100") %>' />
                      </div>
                      <div class="col-md-12" style="padding:0; background-color:#fff;" id="text_related">
                        <p style="padding:5px;">
                            <asp:LinkButton ID="link_related" runat="server" Text='<%# Eval("news_title") %>' CommandName='<%# Eval("id") %>' OnClick="link_related_Click"></asp:LinkButton></p>
                      </div>
                    </div>
                  </ItemTemplate>
              </asp:Repeater>
            </div>
            </div>