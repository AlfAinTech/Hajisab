<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LatestNews.ascx.cs" Inherits="Components_News_NewControls_LatestNews" %>
<div class="container">
        <h2>Latest News</h2>
        <div class="col-md-12" style="padding:0;" id="latest_news_header">
            <asp:Repeater ID="Latest_news_1" runat="server">
                <ItemTemplate>
                    <div class="col-md-7" style="padding:0;">
        <h4>
            <asp:Label ID="lnk_title" runat="server" Text='<%# Eval("news_title") %>'></asp:Label></h4>
        <h6>
            <asp:Label ID="from_date" runat="server" Text='<%# Eval("from_date") %>'></asp:Label></h6>
          <div class="col-md-6" style="padding:0;">
              <asp:Image ID="img_news" runat="server" Width="100%" ImageUrl='<%#Eval("MediaItem.Path500") %>' Style="display:table-cell; vertical-align:middle; max-height:250px;" />
          </div> 
          <div class="col-md-6" id="latest_news_detail" style="padding:0; background-color:white;">
              <p>
                  <asp:Label ID="news_description" runat="server" Text='<%# Eval("news_description").ToString().PadRight(250).Substring(0,250).TrimEnd()+"..."%>'></asp:Label></p>
              <asp:LinkButton ID="LinkButton1" runat="server" CommandName='<%# Eval("id") %>' OnClick="LinkButton1_Click" style="padding-left:20px;">--Read More</asp:LinkButton>
          </div>  
          </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="col-md-5" style="padding:0;">
            <asp:Repeater ID="Latest_news_2" runat="server">
                <ItemTemplate>
                     <div class="latest_side_news">
                      <div class="col-md-5" style="padding:0; height:132px; overflow:hidden;">
                          <asp:Image ID="img_news" runat="server" Width="100%" ImageUrl='<%#Eval("MediaItem.Path500") %>' />
                      </div>
                      <div class="col-md-7" style="background-color:#e6e6e6; height:132px; padding:15px;">
                          <asp:LinkButton ID="lnk_title" runat="server" Text='<%# Eval("news_title") %>' OnClick="lnk_title_Click" CommandName='<%# Eval("id") %>'></asp:LinkButton>
                          <h6><asp:Label ID="from_date" runat="server" Text='<%# Eval("from_date") %>'></asp:Label></h6>
                      </div>
                     </div>
                </ItemTemplate>
            </asp:Repeater>
          </div>
        </div>
        </div>