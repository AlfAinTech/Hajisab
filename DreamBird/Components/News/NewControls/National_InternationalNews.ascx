<%@ Control Language="C#" AutoEventWireup="true" CodeFile="National_InternationalNews.ascx.cs" Inherits="Components_News_NewControls_National_InternationalNews" %>
        <div class="col-md-5" style="padding:0;" id="latest_news_header">
            <asp:Repeater ID="Latest_news_1" runat="server">
                <ItemTemplate>
                    <div class="col-md-12" style="padding:0; height:265px; overflow:auto; border-bottom:1px solid #e6e6e6;">
        <h4>
            <asp:Label ID="lnk_title" runat="server" Text='<%# Eval("news_title") %>'></asp:Label></h4>
        <h6>
            <asp:Label ID="from_date" runat="server" Text='<%# Eval("from_date") %>'></asp:Label></h6>
          <div class="col-md-4" style="padding:0;">
              <asp:Image ID="img_news" runat="server" Width="100%" ImageUrl='<%#Eval("MediaItem.Path500") %>' Style="display:table-cell; vertical-align:middle; max-height:250px;" />
          </div> 
          <div class="col-md-8" id="latest_news_detail" style="padding:0; background-color:white;">
              <p>
                  <asp:Label ID="news_description" runat="server" Text='<%# Eval("news_description").ToString().PadRight(100).Substring(0,100).TrimEnd() %>'></asp:Label></p>
              <asp:LinkButton ID="LinkButton1" runat="server" CommandName='<%# Eval("id") %>' style="padding-left:20px;">--Read More</asp:LinkButton>
          </div>  
          </div>
                </ItemTemplate>
            </asp:Repeater>
            </div>
            <div class="col-md-7" style="padding:0;">
            <asp:Repeater ID="Latest_news_2" runat="server">
                <ItemTemplate>

                    <div class="col-md-6">
                      
                          <div class="col-md-12" style="padding:0; height:195px; overflow:hidden;">
                             <asp:Image ID="img_news" runat="server" Width="100%" ImageUrl='<%#Eval("MediaItem.Path500") %>' />
                          </div>
                          <div class="col-md-12" style="background-color:#e6e6e6; height:70px; padding:15px;">
                              <asp:LinkButton ID="lnk_title" runat="server" Text='<%# Eval("news_title") %>' CommandName='<%# Eval("id") %>'></asp:LinkButton>
                              <h6><asp:Label ID="from_date" runat="server" Text='<%# Eval("from_date") %>'></asp:Label></h6>
                          </div>
                          
                      </div>
                </ItemTemplate>
            </asp:Repeater>
          </div>
  