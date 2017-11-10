<%@ WebHandler Language="C#" Class="LoadTranscript" %>

using System;
using System.Web;
using System.Linq;
using System.Web.Script.Serialization;
using System.Collections.Generic;

public class LoadTranscript : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        int Id = 0;
        if(context.Request.Form.Count != 0)
            Id = Convert.ToInt32(context.Request.Form[0]);
        PackageEntities db = new PackageEntities();
        var Transcripts = db.VideoTranscripts.Where(w => w.MediaItem_id == Id).ToList();
        List<Transcript> list = new List<Transcript>();
        foreach(var Transcript in Transcripts)
        {
            Transcript transcript = new Transcript();
            transcript.Id = Transcript.id;
            transcript.TranscriptText = Transcript.Text;
            transcript.TimeStamp = Convert.ToDecimal(Transcript.TimeStamp);
            list.Add(transcript);
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(new JavaScriptSerializer().Serialize(list));
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}