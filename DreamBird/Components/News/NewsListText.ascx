<%@ Control Language="C#" AutoEventWireup="true" CodeFile="NewsListText.ascx.cs" Inherits="Components_News_NewsListText" %>

	<div class="col-md-6">
			<h3>News Feed</h3>
			
<asp:DataList ID="newsText_list" runat="server" RepeatDirection="Horizontal"  Width="100%" RepeatLayout="Flow">
                      <ItemTemplate>
                          	<div class="col-md-12">
				                  <div class="news_detail latest">
                                     <asp:LinkButton Text = '<%#Eval("news_title")%>' ID="lb_news_detail" runat="server" CommandName="id" CommandArgument= '<%#Eval("id")%>' OnClick="lb_news_detail_Click" ></asp:LinkButton>

					              </div>
			                </div>
                     </ItemTemplate>

                 </asp:DataList>

             <div class="col-md-12">
				<div style="float:right">
					<button class="btn btn-default">View More News</button>
				</div>
			</div>
		</div>
