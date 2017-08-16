<%@ WebHandler Language="C#" Class="LayoutRetrive" %>

using System;
using System.Web;
using System.Linq;

public class LayoutRetrive : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {

        DreamBirdEntities db = new DreamBirdEntities();
        string jsonString = string.Empty;
        if (context.Request["TemplateName"] == null)
        {
            context.Request.InputStream.Position = 0;
            using (var inputStream = new System.IO.StreamReader(context.Request.InputStream))
            {
                jsonString = inputStream.ReadToEnd();
            }
            string[] separators = { "SPLIT" };
            string[] words = jsonString.Split(separators, StringSplitOptions.RemoveEmptyEntries);
            int dreamid = Convert.ToInt32(words[1]);
            string pagename = words[0];
            if (db.ClientPages.Any(w => w.Page == pagename && w.DreamLayout_id == dreamid))
            {
                ClientPage cp = db.ClientPages.Where(w => w.Page == pagename && w.DreamLayout_id == dreamid).First();
                context.Response.ContentType = "text/html";
                context.Response.Write(cp.pageContent);
            }
        }
        else
        {
            string LayoutName = context.Request["TemplateName"].ToString();
            if (LayoutName != "None")
            {
                context.Response.ContentType = "text/html";
                context.Response.Write(db.ClientLayouts.Where(w => w.layoutName == LayoutName).Select(s => s.layoutContent).First());
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