<%@ WebHandler Language="C#" Class="AddChild" %>

using System;
using System.Web;
using System.Linq;

public class AddChild : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        int ParentMenuID = Convert.ToInt32(context.Request.QueryString["MenuID"].ToString());
        int ParentLayoutID = Convert.ToInt32(context.Request.QueryString["Page"].ToString());
        string MenuName = context.Request.QueryString["MenuName"].ToString();
        if(ParentMenuID == 0)
        {
            ParentMenuID = 1;
        }
        DreamBirdEntities db = new DreamBirdEntities();
        if (db.LessonMenus.Any(a => a.ParentLayoutID == ParentLayoutID && a.parentMenu_id == ParentMenuID && a.menuName == MenuName))
        {
            context.Response.ContentType = "text/plain";
            context.Response.Write("Menu Already Exist");
        }
        else
        {
            DreamLayout dreamLayout = new DreamLayout();
            dreamLayout.DreamID = db.DreamLayouts.Where(w => w.id == ParentLayoutID).Select(s => s.DreamID).First();
            dreamLayout.Page = MenuName;
            dreamLayout.Layout = "Hello World";
            dreamLayout.IsPublicDefaultPage = false;
            dreamLayout.IsPublished = true;
            dreamLayout.IsUserDefaultPage = false;
            dreamLayout.IsActive = false;
            db.DreamLayouts.Add(dreamLayout);
            db.SaveChanges();


            LessonMenu menu = new LessonMenu();
            menu.menuName = MenuName;
            menu.DisplayName = MenuName;
            menu.IsContainer = false;
            menu.parentMenu_id = ParentMenuID;
            menu.ParentLayoutID = ParentLayoutID;
            menu.DreamLayoutID = dreamLayout.id;
            menu.menuRight = "User";
            menu.menuType = "none";
            menu.AppOrder = db.LessonMenus.Where(w => w.parentMenu_id == ParentMenuID && w.ParentLayoutID == ParentLayoutID).Count() + 1;
            menu.isDefault = false;

            db.LessonMenus.Add(menu);
            db.LessonMenus.Where(w => w.id == ParentMenuID).First().IsContainer = true;
            db.SaveChanges();

            context.Response.ContentType = "text/plain";
            context.Response.Write("Menu added successfully!");
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