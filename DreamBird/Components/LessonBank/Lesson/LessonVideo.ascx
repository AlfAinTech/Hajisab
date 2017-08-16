<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LessonVideo.ascx.cs" Inherits="Components_LessonBank_Lesson_LessonVideo" %>
<%@ Register Src="~/Components/Video_Transcript/VideoTranscript.ascx" TagPrefix="uc1" TagName="VideoTranscript" %>


<%--<video controls poster="../../../Content/img/ets.png" runat="server" id="video" class="video_id_class">
   <source src="../../../Content/Images/video1.mp4" type="video/mp4" />  
   <p>Fallback code if video isn't supported</p>/
 </video>
<uc1:VideoTranscript runat="server" ID="VideoTranscript"   MediaItemID="49" ShowTranscript="true" />
<script>

    jQuery(document).ready(function ($) {
        var aud = document.getElementsByClassName("video_id_class");
        aud[0].onended = function () {
            var url = window.location.pathname;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "../../Components/LessonBank/Lesson/Services.aspx/UpdateVideoProgress",
                dataType: "json",
                data: "{url:" + JSON.stringify(url) + "}",
                success: function (response) {

                },
                Error: function () {
                    alert("error");

                }
            });
        }
       
    });
</script>--%>

<uc1:VideoTranscript runat="server" ID="VideoTranscript"  />