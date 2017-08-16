<%@ WebHandler Language="C#" Class="MenuOrder" %>

using System;
using System.Web;
using System.Web.Script.Serialization;
using System.Collections.Generic;
using System.Linq;

public class MenuOrder : IHttpHandler {
    public class OrderingElements
    {
        public int ParentMenuID;
        public int ChildMenuID;
        public int AppearenceOrder;
    }
    public void ProcessRequest (HttpContext context) {
        string jsonString = string.Empty;

        context.Request.InputStream.Position = 0;
        using (var inputStream = new System.IO.StreamReader(context.Request.InputStream))
        {
            jsonString = inputStream.ReadToEnd();
        }
        List<OrderingElements> menus = new JavaScriptSerializer().Deserialize<List<OrderingElements>>(jsonString);

        if(menus.Count > 0)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            foreach(var thismenu in menus)
            {
                var menu = db.LessonMenus.Where(w => w.parentMenu_id == thismenu.ParentMenuID && w.id == thismenu.ChildMenuID).First();
                menu.AppOrder = thismenu.AppearenceOrder;
            }
            db.SaveChanges();
        }

        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}