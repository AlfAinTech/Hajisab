<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WhatToDoNext_list.ascx.cs" Inherits="Components_UserDashBoard_WhatToDoNext_list" %>
<asp:Panel ID="detail_panel" runat="server">	
<div class="panel panel-default" style="font-size:16px;">
      
              <asp:Repeater ID="lesson_list" runat="server">
                  <HeaderTemplate>
                      <!-- Default panel contents -->
		                <div class="panel-heading" >What To Do Next</div>
		                <!-- List group -->
		                <ul class="list-group">
                  </HeaderTemplate>
                  <ItemTemplate>
		            <li class="list-group-item">
                        <div class="row">
                            <div class="col-md-12">
                        <div class="col-md-3">
                            <asp:Image ID="dream_img" runat="server"  ImageUrl='<%# Eval("DreamLayout1.Dream.MediaItem.PathOriginal") %>'  Visible='<%# Bind("DreamLayout1.Dream.IsMediaItemImage") %>'  width="100%"/>
                            <video   ID="dream_video"   runat="server" onclick="playvideo(this)"  Visible='<%# Bind("DreamLayout1.Dream.IsMediaItemVideo") %>'  width="100%">
                                <source type="video/mp4" src='<%# Eval("DreamLayout1.Dream.MediaItem.Path480") %>'>
                            </video>
                            <%--<asp:Label ID="lesson_lbl" runat="server" Text='<%# Eval("DreamLayout1.Dream.dreamName") %>'></asp:Label>--%>
                        </div>
                        <div class="col-md-9">
                            To Progress in <%# Eval("DreamLayout1.Dream.DreamName") %> Dream Complete
                        <asp:LinkButton ID="menu_btn" runat="server" Text=' <%# Eval("DisplayName")  %>' CausesValidation="false" CommandArgument='<%# Eval("id") %>' OnClick="menu_btn_clicked"></asp:LinkButton>
		           </div>
                                </div></div>
                             </li>
                </ItemTemplate>
                  <FooterTemplate>
                        </ul>
                  </FooterTemplate>
              </asp:Repeater>
	  
		
		</div></asp:Panel>		