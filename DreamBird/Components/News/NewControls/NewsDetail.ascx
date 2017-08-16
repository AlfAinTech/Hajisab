<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsDetail.ascx.cs" Inherits="Components_News_NewControls_NewsDetail" %>
<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
        <div class="container">
        <div class="col-md-12" style="padding:0; padding-top:20px; padding-bottom:20px;" id="latest_news_header">
        <h4>
            <asp:Label ID="lbl_title" runat="server" Text='<%# Eval("news_title") %>'></asp:Label></h4>
        <h6>
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("from_date") %>'></asp:Label></h6>
          <div class="col-md-4" style="padding:0;">
              <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("MediaItem.Path500") %>' Width="100%" />
          </div>
          <div class="col-md-8" id="latest_news_detail" style="padding:0; background-color:white;">
              <p>
                  <asp:Label ID="Label2" runat="server" Text='<%# Eval("news_description") %>'></asp:Label></p>
          </div>  
          </div>
          </div>
    </ItemTemplate>
</asp:Repeater>
