<%@ WebHandler Language="C#" Class="File_Uploader" %>

using System;
using System.Web;
using System.IO;


public class File_Uploader : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            XFile xfile = new XFile();
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                string Extension = Path.GetExtension(file.FileName);
                if (!(Extension.Equals(".exe") || Extension.Equals(".com") || Extension.Equals(".msi")))
                {
                    if (!(Directory.Exists(HttpContext.Current.Server.MapPath("~/Components/FileBank/Content/"+Extension))))
                    {
                        Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/Components/FileBank/Content/"+Extension));
                    }
                    string mediaPath = HttpContext.Current.Server.MapPath("~/Components/FileBank/Content/"+Extension+"/") + file.FileName;
                    file.SaveAs(mediaPath);
                    xfile.name = file.FileName;
                    xfile.path = "/Components/FileBank/Content/"+Extension;
                    xfile.FileType = Extension;
                    xfile.DateAdded = DateTime.Now;
                    db.XFiles.Add(xfile);
                    db.SaveChanges();
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("File Uploaded Successfully!");
                }
                else
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Your file type is in restricted List, Cannot be uploaded");
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