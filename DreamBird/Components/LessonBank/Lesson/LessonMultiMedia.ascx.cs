using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Components_LessonBank_Lesson_LessonMultiMedia : CoreDreamControlAdapter, ICoreDreamControl
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (!HttpContext.Current.User.Identity.IsAuthenticated)
            {
                save_progress.Visible = false;
            }
            else
            {
                DreamBirdEntities db = new DreamBirdEntities();
                String user_id = HttpContext.Current.User.Identity.GetUserId();
                String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
                String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
                Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
                DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName).First();
                List<UserLessonProgress> data = db.UserLessonProgresses.Where(q => q.LessonMenu.DreamLayoutID == page.id && q.AspNetUser_id == user_id).ToList();
                if (data.Count != 0)
                {
                    UserLessonProgress ulp = data[0];
                    ShowStatus(ulp);


                }
            }
        }
    }

    protected void save_progress_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String user_id = HttpContext.Current.User.Identity.GetUserId();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName).First();
        LessonMenu menu = db.LessonMenus.Where(q => q.DreamLayoutID == page.id).First();
        List<UserLessonProgress> data = db.UserLessonProgresses.Where(q => q.LessonMenu.DreamLayoutID == page.id && q.AspNetUser_id == user_id).ToList();

        if (data.Count == 0)
        {
            UserLessonProgress ulp = new UserLessonProgress
            {
                menu_id = menu.id,
                AspNetUser_id = user_id,
                progress = 100,
            };
            db.UserLessonProgresses.Add(ulp);
            db.SaveChanges();
            ShowStatus(ulp);
        }

    }
    protected void ShowStatus(UserLessonProgress ulp)
    {
        if (ulp.progress == 100)
        {
            completed.Visible = true;
            save_progress.Visible = false;

        }
        else
        {
            completed.Visible = false;
            save_progress.Visible = true;
        }
    }

}