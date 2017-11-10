<%@ WebHandler Language="C#" Class="DeleteTranscript" %>

using System;
using System.Web;
using System.Linq;

public class DeleteTranscript : IHttpHandler {

    public void ProcessRequest (HttpContext context) {
        int id = Convert.ToInt32(context.Request.Form[0]);
        PackageEntities db = new PackageEntities();
        VideoTranscript transcript = db.VideoTranscripts.Where(w => w.id == id).First();
        db.VideoTranscripts.Remove(transcript);
        db.SaveChanges();
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}