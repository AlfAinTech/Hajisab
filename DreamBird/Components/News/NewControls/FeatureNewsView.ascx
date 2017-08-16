<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FeatureNewsView.ascx.cs" Inherits="Components_News_NewControls_FeatureNewsView" %>
<div class="col-md-6" id="featured_news" style="border-right:3px solid #eb8c2e">
		<h3>Featured News</h3>
	    
	
<asp:DataList ID="dl_search_news" runat="server" RepeatDirection="Horizontal"  RepeatColumns="2"   Width="100%" RepeatLayout="Flow">
                      <ItemTemplate>
                         
                          	<div class="col-md-6">
				                
					                <div class="featured_news thumb" style="height:160px; overflow:hidden;">
                                         <asp:Image ID="nav_img" runat="server"   ImageUrl='<%#Eval("MediaItem.PathOriginal") %>' />
					                </div>
					                <div class="news_detail" style="height:50px;">
                                         <asp:LinkButton Text = '<%#Eval("news_title").ToString().PadRight(75).Substring(0,75).TrimEnd() %>' ID="lb_news_detail" runat="server" CommandName="id" CommandArgument= '<%#Eval("id")%>' OnClick="lb_news_detail_Click" ></asp:LinkButton>
						               
					                </div>
				                
			                </div>
                     </ItemTemplate>

                 </asp:DataList>
	
		</div>