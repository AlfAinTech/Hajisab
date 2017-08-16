<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DreamContentsummary.ascx.cs" Inherits="Components_UserDashBoard_DreamContentsummary" %>
<div class="panel panel-default" style="font-size:16px;">
		  <!-- Default panel contents -->
		  <div class="panel-heading" >Content Summary</div>
		  <!-- List group -->
		  <ul class="list-group">
		    <li class="list-group-item"><span class="glyphicon glyphicon-book" style="margin-right:10px; color: #eb8c2e;" aria-hidden="true"></span>
                <asp:Label ID="lesson_lbl" runat="server"></asp:Label> Lessons</li>
		    <li class="list-group-item"><span class="glyphicon glyphicon-film" style="margin-right:10px; color: #eb8c2e;" aria-hidden="true"></span>
                <asp:Label ID="video_lbl" runat="server" ></asp:Label> Videos</li>
		    <li class="list-group-item"><span class="glyphicon glyphicon-pencil" style="margin-right:10px; color: #eb8c2e;" aria-hidden="true"></span>
                <asp:Label ID="quiz_lbl" runat="server" ></asp:Label> Quiz</li>
		    
		  </ul>
		</div>