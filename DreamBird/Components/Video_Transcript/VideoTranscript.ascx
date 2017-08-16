<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VideoTranscript.ascx.cs" Inherits="Components_MediaBank_VideoTranscript" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<link href="<%# Server.MapPath("~/") %>/Components/Video_Transcript/Assets/css/style.css" rel="stylesheet" />
<link href="<%# Server.MapPath("~/") %>/Components/Video_Transcript/Assets/css/normalize.css" rel="stylesheet" />
<link href='https://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
	<script src="http://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript" charset="utf-8"></script>
<%--<script src='<%# Server.MapPath("~/") %>/Components/Video_Transcript/Assets/js/app.js'></script>--%>


            <div class="col-md-12" style="padding:15px">
        <div id="wrapper" style="width:100%;">
        <div style="width:48%; float:left;">
  		<div id="videoContainer" style="background-color:#808080;">
			<!-- Video -->
		     <video id="video" runat="server" width="100%">
		      </video>

		    <!-- Video Controls -->
			<div id="videoControls" runat="server" style="padding:10px; background-color:#2b2b2b;">
				<input type="range" id="progressBar" value="0">
				<span id="progress"></span>	
					<div id="buttonControls">	
					    <span id="play"><img id="playImg" src="<%# Server.MapPath("~/") %>/Components/Video_Transcript/Assets/icons/play-icon.png" alt="The play icon"></span>
					    <span id="duration">00:00 / 01:00</span> 
					    <span id="fastFwd">1x Speed</span>						    			    
					    <span id="fullScreen"><img id="fullScreenImg" src="<%# Server.MapPath("~/") %>/Components/Video_Transcript/Assets/icons/fullscreen-icon.png" alt="The fullscreen icon"></span>
					    <input type="range" id="volumeSlider" min="0" max="1" step="0.01" value="1">  
					    <span id="mute"><img id="muteImg" src="<%# Server.MapPath("~/") %>/Components/Video_Transcript/Assets/icons/volume-on-icon.png" alt="The mute icon"></span>				    
					</div>   	
			</div>

		</div>   
        </div>
        <div style="background-color:#e6e6e6; width:48%; float:left;">
		<div id="transcript" runat="server" style="overflow-y:auto;">															

		</div>
  	</div>
   </div>
        </div>

