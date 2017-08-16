<%@ WebHandler Language="C#" Class="UpdateTranscript" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Linq;

public class UpdateTranscript : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {

        int id = Convert.ToInt32(context.Request.Form[0]);
        string TranscriptText = context.Request.Form[1];
        decimal TimeStamp = Convert.ToDecimal(context.Request.Form[2]);
        DreamBirdEntities db = new DreamBirdEntities();
        VideoTranscript transcript = db.VideoTranscripts.Where(w => w.id == id).First();
        transcript.Text = TranscriptText;
        transcript.TimeStamp = TimeStamp;
        db.SaveChanges();

        Transcript transcr = new Transcript();
        transcr.Id = transcript.id;
        transcr.TranscriptText = transcript.Text;
        transcr.TimeStamp = Convert.ToDecimal(transcript.TimeStamp);
        context.Response.ContentType = "text/plain";
        context.Response.Write(new JavaScriptSerializer().Serialize(transcr));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}