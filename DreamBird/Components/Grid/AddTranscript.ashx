<%@ WebHandler Language="C#" Class="AddTranscript" %>

using System;
using System.Web;
using System.Web.Script.Serialization;

public class AddTranscript : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        string TranscriptText = context.Request.Form[0];
        decimal TimeStamp = Convert.ToDecimal(context.Request.Form[1]);
        PackageEntities db = new PackageEntities();
        VideoTranscript transcript = new VideoTranscript();

        transcript.Text = TranscriptText;
        transcript.TimeStamp = TimeStamp;
        db.VideoTranscripts.Add(transcript);
        db.SaveChanges();
        Transcript transcr = new Transcript();
        transcr.Id = transcript.id;
        transcr.TranscriptText = transcript.Text;
        transcr.TimeStamp = Convert.ToDecimal(transcript.TimeStamp);
        context.Response.ContentType = "text/plain";
        context.Response.Write(new JavaScriptSerializer().Serialize(transcr));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}