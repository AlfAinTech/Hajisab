<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RegisteredDreamsList.ascx.cs" Inherits="Components_UserDashBoard_RegisteredDreamsList" %>
<div class="col-md-12">
		  <!-- Default panel contents -->
		  <!-- List group -->
    <asp:Repeater ID="EnrolledDreams_list" runat="server" >
        <ItemTemplate>
             <div class="col-md-12" style="background-color: #e6e6e6; padding:15px; margin-top: 15px; margin-bottom: 15px; min-height: 147px;">
		  	<div class="col-md-2" style="padding:0px;">
                      <asp:Image ID="dream_img" runat="server" ImageUrl='<%# Eval("Dream.MediaItem.PathOriginal") %>' Visible='<%# Bind("Dream.IsMediaItemImage") %>'  width="100%"/>
            <video   ID="dream_video"   runat="server" onclick="playvideo(this)"  Visible='<%# Bind("Dream.IsMediaItemVideo") %>'  width="100%">
                <source type="video/mp4" src='<%# Eval("Dream.MediaItem.Path480") %>'>
            </video>
              </div>
		  	<div class="col-md-7">
                  <h3>
                      <asp:LinkButton ID="dream_link" runat="server" Text='<%# Eval("Dream.DreamName") %>' CommandArgument='<%# Eval("Dream.id") %>' OnClick="dream_link_clicked"></asp:LinkButton>
                  </h3>
		  		<h5>
                      <asp:Label ID="dream_description" runat="server" Text='<%# Eval("Dream.Description") %>'></asp:Label>

		  		</h5>
		  		
		  	</div>
            <div class="col-md-3">
               
        			<div class="col-md-12" style="padding:15px;">
						<div class="c100 p<%#  Eval("TotalDreamProgress").ToString() %> small green" style="margin-left: auto; margin-right: auto; float:none;">
		                    <span>  <%# Eval("TotalDreamProgress").ToString()+"%" %></span>
		                    <div class="slice" >
		                        <div class="bar"></div>
		                        <div class="fill"></div>
		                    </div>
		                </div>
					</div>
                <asp:Button ID="resume_btn" runat="server"  CommandArgument='<%# Eval("Dream.id") %>' Text="Go To Dream" CausesValidation="false" class="btn btn-primary" style="width: 100%;" OnClick="resume_btn_clicked"/>
        		
		  	</div>
		  </div>
		 
        </ItemTemplate>
    </asp:Repeater>
		 
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