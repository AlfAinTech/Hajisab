<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonMenuProgress.ascx.cs" Inherits="Components_LessonMenu_LessonMenuProgress" %>
<div class="progress">
  <div class="progress-bar progress-bar-striped" role="progressbar" aria-valuenow="<%= CurrentPercentage %>" aria-valuemin="0" aria-valuemax="100" style="<%= "width:"+CurrentPercentage+"%" %>">
    <span><%= CurrentPercentage %>% Complete</span>
  </div>
</div>
