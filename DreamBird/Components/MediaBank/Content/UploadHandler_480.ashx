<%@ WebHandler Language="C#" Class="UploadHandler" %>

using System;
using System.Web;
using ImageProcessor;
using ImageProcessor.Imaging;
using System.IO;
using System.Linq;
using System.Linq.Dynamic;
using System.Drawing;

public class UploadHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            MediaItem mi = new MediaItem();
            bool duplicate = false;
            string filename = files[0].FileName;
            if (db.MediaItems.Any(a => a.name == filename))
            {
                mi = db.MediaItems.Where(w => w.name == filename).First();
                duplicate = true;
            }
            string VideoQuality = null;
            if (context.Request.QueryString.HasKeys())
            {
                VideoQuality = context.Request.QueryString["video_quality"].ToString();
            }
            else
            {
                VideoQuality = "480p";
            }
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                //string fname = context.Server.MapPath("~/uploads/" + file.FileName); 

                string Extension = Path.GetExtension(file.FileName);
                if (Extension.Equals(".mpeg") || Extension.Equals(".avi") || Extension.Equals(".mp4"))
                {
                    if (!(Directory.Exists(HttpContext.Current.Server.MapPath("~/Components/MediaBank/Content/Video/" + VideoQuality))))
                    {
                        Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/Components/MediaBank/Content/Video/" + VideoQuality));
                    }
                    string mediaPath = HttpContext.Current.Server.MapPath("~/Components/MediaBank/Content/Video/" + VideoQuality + "/") + file.FileName;
                    if (!(File.Exists(mediaPath)))
                        file.SaveAs(mediaPath);
                    mi.name = file.FileName;
                    mi.path = "/Components/MediaBank/Content/Video";
                    mi.mediaType = "video";
                    mi.DateAdded = DateTime.Now;
                    if (!(duplicate))
                    {
                        db.MediaItems.Add(mi);
                    }
                    db.SaveChanges();
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("File Uploaded Successfully!");
                }
                else
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Only Videos (.mp4) are allowed through this uploader");
                }
            }

        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }



}