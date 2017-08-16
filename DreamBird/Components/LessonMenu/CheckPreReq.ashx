<%@ WebHandler Language="C#" Class="CheckPreReq" %>

using System;
using System.Web;
using System.Linq;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public class CheckPreReq : IHttpHandler
{
    public class LessonMenuPreReqList
    {
        public int MenuID;
        public string MenuName;
    }
    public void ProcessRequest(HttpContext context)
    {
        string MenuID = context.Request.QueryString["MenuID"].ToString();
        DreamBirdEntities db = new DreamBirdEntities();
        int LessonMenuID = Convert.ToInt32(MenuID.Substring(9));
        List<LessonMenuPreReqList> MenuList = new List<LessonMenuPreReqList>();
        if (db.LessonMenuPreRequisites.Any(a => a.menu_id == LessonMenuID))
        {
            db.LessonMenuPreRequisites.Where(w => w.menu_id == LessonMenuID).Select(s => s.LessonMenu1).ToList().ForEach(f => MenuList.Add(new LessonMenuPreReqList { MenuID = f.id, MenuName = f.DisplayName }));
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write(new JavaScriptSerializer().Serialize(MenuList));
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}