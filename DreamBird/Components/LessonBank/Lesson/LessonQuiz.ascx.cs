using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Components_LessonBank_Lesson_LessonQuiz : System.Web.UI.UserControl,ICoreDreamControl
{
    public void BindData()
    {
       
    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {
       
    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {
    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {
       
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submit_quiz_Click(object sender, EventArgs e)
    {
        if (HttpContext.Current.User.Identity.IsAuthenticated) {
        DreamBirdEntities db = new DreamBirdEntities();
        String user_id = HttpContext.Current.User.Identity.GetUserId();
        String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
        Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
        DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.DreamID==dream.id).First();
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
            //ShowStatus(ulp);

        }
        }
    }
   
        
 
}
