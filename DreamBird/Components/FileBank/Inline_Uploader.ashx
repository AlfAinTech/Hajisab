<%@ WebHandler Language="C#" Class="Inline_Uploader" %>

using System;
using System.Web;
using System.IO;
using System.Web.Script.Serialization;

public class Inline_Uploader : IHttpHandler {
    class uploaded_response
    {
        public int uploaded;
        public string filename;
        public string url;
    }
    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                string Extension = Path.GetExtension(file.FileName);
                if (!(Directory.Exists(HttpContext.Current.Server.MapPath("~/Components/FileBank/Content/Inline_Images"))))
                {
                    Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/Components/FileBank/Content/Inline_Images"));
                }
                string mediaPath = HttpContext.Current.Server.MapPath("~/Components/FileBank/Content/Inline_Images/") + file.FileName;
                file.SaveAs(mediaPath);
                uploaded_response uploaded = new uploaded_response();
                uploaded.uploaded = 1;
                uploaded.filename = file.FileName;
                uploaded.url = "../../Components/FileBank/Content/Inline_Images/" + file.FileName;
                context.Response.ContentType = "text/plain";
                context.Response.Write(new JavaScriptSerializer().Serialize(uploaded));
            }
        }
    }
    public bool IsReusable {
        get {
            return false;
        }
    }

}