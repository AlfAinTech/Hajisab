using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_LessonMenuProgress : CoreDreamControlAdapter, ICoreDreamControl
{
    public string CurrentPercentage = "0";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
            DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
            LessonProgressControl lessonProgress = db.LessonProgressControls.Where(w => w.ResidingLayoutID == page.id && w.BaseControlID == BaseDreamControl_ServerID).First();
            if (lessonProgress.ProgressType == "ParentOnly")
            {
                CurrentPercentage = ShowParentProgress(lessonProgress);
            }
            else if (lessonProgress.ProgressType == "ChildOnly")
            {
                CurrentPercentage = ShowPageProgress(lessonProgress);
            }
        }
    }

    private string ShowParentProgress(LessonProgressControl lessonProgressControl)
    {
        decimal totalPoints = 0;
        decimal AchievedPoints = 0;
        DreamBirdEntities db = new DreamBirdEntities();
        var lessonmenu = db.LessonMenus.Where(w => w.id == lessonProgressControl.MenuID).First();
        CalculateProgress(lessonmenu, ref totalPoints, ref AchievedPoints, db);
        decimal currentperc = Convert.ToDecimal((AchievedPoints / totalPoints) * 100);
        return currentperc.ToString("0.00");
    }

    private void CalculateProgress(LessonMenu lessonmenu, ref decimal totalPoints, ref decimal AchievedPoints, DreamBirdEntities db)
    {
        if(lessonmenu.IsContainer)
        {
            var LessonMenus = db.LessonMenus.Where(w => w.parentMenu_id == lessonmenu.id).ToList();
            foreach(var LessonMenu in LessonMenus)
            {
                CalculateProgress(LessonMenu, ref totalPoints, ref AchievedPoints, db);
            }
        }
        string UserID = HttpContext.Current.User.Identity.GetUserId();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.Dream.DreamName == dreamName).First();
        DreamLayout OriginalPage = db.DreamLayouts.Where(w => w.id == lessonmenu.DreamLayoutID).First();
        //LessonProgressControl lessonProgress = db.LessonProgressControls.Where(w => w.ResidingLayoutID == page.id && w.BaseControlID == BaseDreamControl_ServerID).First();
        if (db.DreamPageControls.Any(a => a.Layout_ID == OriginalPage.id))
        {
            var ProgressControls = Convert.ToDecimal(db.DreamPageControls.Where(w => w.Layout_ID == OriginalPage.id).Select(s => s.TotalProgress).Sum());
            totalPoints = totalPoints + ProgressControls;
            if (db.UserLessonProgresses.Any(w => w.AspNetUser_id == UserID && w.menu_id == lessonmenu.id))
            {
                var totalProceeded = Convert.ToDecimal(db.UserLessonProgresses.Where(w => w.AspNetUser_id == UserID && w.menu_id == lessonmenu.id).Select(s => s.progress).Sum());
                AchievedPoints = AchievedPoints + totalProceeded;
                //return currentperc.ToString("0.00");
            }
        }
    }
    private string ShowPageProgress(LessonProgressControl lessonProgressControl)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        string UserID = HttpContext.Current.User.Identity.GetUserId();
        if(db.DreamPageControls.Any(a => a.Layout_ID == lessonProgressControl.OriginalLayoutID))
        {
            var ProgressControls = db.DreamPageControls.Where(w => w.Layout_ID == lessonProgressControl.OriginalLayoutID).Select(s => s.TotalProgress).Sum();
            if(db.UserLessonProgresses.Any(w => w.AspNetUser_id == UserID && w.menu_id == lessonProgressControl.MenuID))
            {
                var totalProceeded = db.UserLessonProgresses.Where(w => w.AspNetUser_id == UserID && w.menu_id == lessonProgressControl.MenuID).Select(s => s.progress).Sum();
                decimal currentperc = Convert.ToDecimal((totalProceeded / ProgressControls) * 100);
                return currentperc.ToString("0.00");
            }
        }
        return "0.00";
    }
}