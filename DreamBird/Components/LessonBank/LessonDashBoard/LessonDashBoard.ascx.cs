using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Components_LessonBank_LessonDashBoard_LessonDashBoard : CoreDreamControlAdapter
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            String user_id = HttpContext.Current.User.Identity.GetUserId();
            String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
            String pageName = DreamUtil.getPageNameFromURL(Request.RawUrl);
            Dream dream = db.Dreams.Where(dm => dm.DreamName == dreamName).First();
            DreamLayout page = db.DreamLayouts.Where(dl => dl.Page == pageName && dl.DreamID == dream.id).First();
            if (db.LessonMenus.Where(q => q.DreamLayoutID == page.id).Count() != 0)
            {
                LessonMenu menu = db.LessonMenus.Where(q => q.DreamLayoutID == page.id).First();

                //List<UserLessonProgress> data = db.UserLessonProgresses.Where(q => q.LessonMenu.DreamLayoutID == page.id && q.AspNetUser_id == user_id).ToList();
                var current_obj = db.LessonProgressDashBoards.Where(q => q.LayoutID == page.id && q.BaseControlID == this.BaseDreamControl_ServerID).ToList();
                if (current_obj.Count != 0)
                {
                    LessonProgressDashBoard currentDashBoar = current_obj[0];
                    List<LessonMenu> weeks;
                    if (currentDashBoar.ShowSiblingsProgress)
                    {
                        weeks = db.LessonMenus.Where(q => q.parentMenu_id == menu.parentMenu_id && q.ParentLayoutID == menu.ParentLayoutID && q.id != menu.id).ToList();


                    }
                    else
                    {
                        weeks = db.LessonMenus.Where(q => q.parentMenu_id == menu.id).ToList();
                    }
                    for (int k = 0; k < weeks.Count; k++)
                    {
                        //if lesson not currently available remove from list
                        LessonMenu week = weeks[k];
                        var lavailable = db.LessonMenuAvailabilities.Where(q => q.MenuID == week.id).ToList();
                        if (lavailable.Count() != 0)
                        {
                            LessonMenuAvailability lma = lavailable[0];
                            if (lma.AvailableFrom > System.DateTime.Now)
                            { weeks.RemoveAt(k); continue; }
                        }
                        week.video_progress = LessonProgressUtil.GetProgress(week, user_id, "video");
                        week.reading_progress = LessonProgressUtil.GetProgress(week, user_id, "reading");
                        week.quiz_grade = LessonProgressUtil.GetProgress(week, user_id, "quiz");
                        week.OverdueTask = LessonProgressUtil.CalculateOverdueTask(week);
                        week.completedTask = LessonProgressUtil.getCompletedStatus(week);
                    }
                    LessonCards.DataSource = weeks;
                    LessonCards.DataBind();
                }
            }
        }
    }


    protected void Repeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (LessonCards.Items.Count < 1)
        {
            if (e.Item.ItemType == ListItemType.Footer)
            {
                Label lblDefaultMessage = (Label)e.Item.FindControl("lblDefaultMessage");
                lblDefaultMessage.Visible = true;
            }
        }
    }

    public void BindData()
    {

    }

    public void OnShowAdminEvent(object sender, EventArgs e)
    {

    }

    public void OnHideAdminEvent(object sender, EventArgs e)
    {

    }

    public void SetBaseDreamControl(IBaseDreamControl baseDreamControl)
    {

    }
}