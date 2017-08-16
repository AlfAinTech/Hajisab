<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RelatedDreams.ascx.cs" Inherits="Components_Dreams_RelatedDreams" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<div class="row"><div class="col-md-12">
				<h3 style="color: #eb8c2e;">Similar Dreams</h3>
    <asp:UpdatePanel ID="DreamView_UpdatePanel" runat="server" UpdateMode="Conditional">
          

<ContentTemplate>
    <asp:Repeater ID="related_dreams" runat="server">
          <ItemTemplate>
				<div class="col-md-6">
					<div class="content_item container_featured" style="min-height:108px; max-height:108px;">
                        
						<div class="col-md-3" style="padding:0;"><div>
                             <asp:Image ID="dream_img" runat="server" ImageUrl='<%# Eval("MediaItem.Path500") %>' Visible='<%# Bind("IsMediaItemImage") %>' Width="100%"  />
                                <br />
                            <video   ID="dream_video"   runat="server" onclick="playvideo(this)"  Visible='<%# Bind("IsMediaItemVideo") %>'  Width="100%">
                                <source type="video/mp4" src='<%# Eval("MediaItem.Path480") %>'>
                            </video>
							<%--<img src="img/gmat.jpg" />--%>
						</div></div>
						<div class="col-md-5" style="padding:0;">
							<div class="content_pan" style="min-height: auto; max-height: auto;">
                                <h4 style="margin-top:5px;">  <asp:Label ID="dreamName" runat="server" Height="16px" Text='<%# Eval("DreamName") %>' Visible="true" Width="32%" Font-Bold="true" Enabled="False"></asp:Label></h4>
                                <h5 style="text-align:justify;"><asp:Label ID="dream_description" runat="server"  Text='<%# Eval("Description").ToString().PadRight(50).Substring(0,50).TrimEnd()+"..." %>'  ></asp:Label></h5>

							</div></div><div class="col-md-4" style="height:100;">
							<div class="dream_footer" style="height:85px;">
								<div class="col-md-12" style="position:absolute; top:10px; right:0px; padding-left:0;">
									 <asp:LinkButton class="btn btn-default" ID="dream_detail" runat="server"    Width="100%" CommandArgument='<%# Eval("id") %>' CausesValidation="False" OnClick="dream_description_Click" >Enroll Now</asp:LinkButton>
								</div>
                                <div class="col-md-12" style="position:absolute; bottom:10px; right:0px;">
                                    <asp:LinkButton  ID="like_link" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="like_link_Click" style='<%# getLikeButtonStyle(Eval("isNotLikedByLoginUser"))%>' CausesValidation="False"> <i class="material-icons" >favorite</i></asp:LinkButton>
								</div>
								
							</div>
						</div>
					</div>
                   
				</div>
              </ItemTemplate>
         </asp:Repeater>
    </ContentTemplate>
        </asp:UpdatePanel>
    </div></div>