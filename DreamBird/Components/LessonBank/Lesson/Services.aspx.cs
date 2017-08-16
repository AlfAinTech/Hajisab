using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Components_LessonBank_Lesson_Services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string UpdateVideoProgress(string url, string BaseDreamID)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            String user_id = HttpContext.Current.User.Identity.GetUserId();
            String dreamName = DreamUtil.getDreamNameFromURL(url);
            String pageName = DreamUtil.getPageNameFromURL(url);

            Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
            DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName).First();
            LessonMenu menu = db.LessonMenus.Where(q => q.DreamLayoutID == page.id).First();
            var LessonUserProgress = db.DreamPageControls.Where(w => w.Layout_ID == page.id && w.BaseDreamServer_ID == BaseDreamID).First();

            var data = db.UserLessonProgresses.Where(q => q.menu_id == menu.id && q.AspNetUser_id == user_id).ToList();
            if (data.Count != 0)
            {
                UserLessonProgress ulp = data[0];
                ulp.progress = Convert.ToDecimal(LessonUserProgress.TotalProgress);
                db.SaveChanges();
            }
            else
            {
                UserLessonProgress ulp = new UserLessonProgress
                {
                    AspNetUser_id = user_id,
                    menu_id = menu.id,
                    progress = Convert.ToDecimal(LessonUserProgress.TotalProgress),
                };
                db.UserLessonProgresses.Add(ulp);
                db.SaveChanges();
            }

        }
        return "";
    }
}
