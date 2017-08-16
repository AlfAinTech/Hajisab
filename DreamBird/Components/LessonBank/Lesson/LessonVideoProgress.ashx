<%@ WebHandler Language="C#" Class="LessonVideoProgress" %>

using System;
using System.Web;
using System.Linq;
using Microsoft.AspNet.Identity;

public class LessonVideoProgress : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string URL = context.Request["URL"].ToString();
        string BaseServerID = context.Request["BaseServerID"].ToString();
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            String user_id = HttpContext.Current.User.Identity.GetUserId();
            String dreamName = DreamUtil.getDreamNameFromURL(URL);
            String pageName = DreamUtil.getPageNameFromURL(URL);

            Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
            DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName).First();
            LessonMenu menu = db.LessonMenus.Where(q => q.DreamLayoutID == page.id).First();
            var LessonUserProgress = db.DreamPageControls.Where(w => w.Layout_ID == page.id && w.BaseDreamServer_ID == BaseServerID).First();

            var data = db.UserLessonProgresses.Where(q => q.menu_id == menu.id && q.AspNetUser_id == user_id).ToList();
            //if (data.Count != 0)
            //{
            //    UserLessonProgress ulp = data[0];
            //    ulp.progress = Convert.ToDecimal(LessonUserProgress.TotalProgress);
            //    db.SaveChanges();
            //}
            //else
            //{
            UserLessonProgress ulp = new UserLessonProgress
            {
                AspNetUser_id = user_id,
                menu_id = menu.id,
                progress = Convert.ToDecimal(LessonUserProgress.TotalProgress),
            };
            db.UserLessonProgresses.Add(ulp);
            db.SaveChanges();
            //}

        }
        context.Response.ContentType = "text/plain";
        context.Response.Write("Successfully Saved the Progress");
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}