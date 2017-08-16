<%@ WebHandler Language="C#" Class="PageAuthorizationUpdater" %>

using System;
using System.Web;
using System.Linq;

public class PageAuthorizationUpdater : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string PageName = context.Request.QueryString["Page"].ToString();
        string RoleID = context.Request.QueryString["RoleID"].ToString();
        int DreamID = Convert.ToInt32(context.Request.QueryString["DID"].ToString());
        string Allowed = context.Request.QueryString["Allowed"].ToString();

        DreamBirdEntities db = new DreamBirdEntities();
        int PageID = db.DreamLayouts.Where(w => w.DreamID == DreamID && w.Page == PageName).Select(s => s.id).First();
        string rolename = db.AspNetRoles.Where(w => w.Id == RoleID).Select(s => s.Name).First();
        if (db.DreamPageAuthorizations.Any(a => a.DreamLayout_id == PageID && a.PageRole == rolename))
        {
            var auth = db.DreamPageAuthorizations.Where(w => w.DreamLayout_id == PageID && w.PageRole == rolename).First();
            auth.isAllowed = Convert.ToBoolean(Allowed);
            db.SaveChanges();
        }
        else
        {
            var auth = new DreamPageAuthorization();
            auth.PageRole = rolename;
            auth.DreamLayout_id = PageID;
            auth.isAllowed = Convert.ToBoolean(Allowed);
            db.DreamPageAuthorizations.Add(auth);
            db.SaveChanges();
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write("Successfully saved the authorization");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}