<%@ WebHandler Language="C#" Class="PageSaver" %>

using System;
using System.Web;
using System.Linq;
using System.Web.Script;

public class PageSaver : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        int DreamID = Convert.ToInt32(context.Request.QueryString["DID"].ToString());
        string PageName = context.Request.QueryString["Page"].ToString();
        string isPublished = context.Request.QueryString["Published"].ToString();
        string PageType = context.Request.QueryString["Type"].ToString();
        PackageEntities db = new PackageEntities();
        if (db.DreamLayouts.Any(a => a.DreamID == DreamID && a.Page == PageName))
        {
            if (isPublished != "undefined")
            {
                db.DreamLayouts.Where(w => w.DreamID == DreamID && w.Page == PageName).First().IsPublished = Convert.ToBoolean(isPublished);
                db.DreamLayouts.Where(w => w.DreamID == DreamID && w.Page == PageName).First().LayoutType = PageType;
                db.DreamLayouts.Where(w => w.DreamID == DreamID && w.Page == PageName).First().IsActive = false;
                db.SaveChanges();
                if (db.DreamLayouts.Where(w => w.DreamID == DreamID && w.Page == PageName).First().LayoutType == "Activity" && db.DreamLayouts.Where(w => w.DreamID == DreamID && w.Page == PageName).First().Layout == "Hello World")
                {
                    context.Response.ContentType = "text/plain";
                    context.Response.Write("Blank Activity Page");
                }
            }
            else
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write("Page Already Exist");
            }

        }
        else
        {
            DreamLayout layout = new DreamLayout();
            layout.Page = PageName;
            layout.DreamID = DreamID;
            layout.IsPublished = false;
            layout.IsUserDefaultPage = false;
            layout.IsPublished = false;
            layout.IsPublicDefaultPage = false;
            layout.LayoutType = PageType;
            layout.Layout = "Hello World";
            layout.IsActive = false;
            db.DreamLayouts.Add(layout);
            db.SaveChanges();
            context.Response.ContentType = "text/plain";
            context.Response.Write("Layout Successfully Added");
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