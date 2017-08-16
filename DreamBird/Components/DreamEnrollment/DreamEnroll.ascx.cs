using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Components_DreamEnrollment_DreamEnroll : System.Web.UI.UserControl, ICoreDreamControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string userID = HttpContext.Current.User.Identity.GetUserId();
                string dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);

                Dream dream = db.Dreams.Where(q => q.DreamName == dreamName).First();
                dreamName_lbl.Text = dream.DreamName;
                var data = db.DreamEnrollments.Where(q => q.AspNetUserID == userID && q.dreamID == dream.id).ToList();
                List<LessonMenu> lesson = new List<LessonMenu>();
                if (data.Count() != 0)
                {
                    updateDreamStatus();
                    List<int> progress = db.UserLessonProgresses.Where(q => q.AspNetUser_id == userID && q.LessonMenu.DreamLayout1.DreamID == dream.id).OrderBy(q => q.menu_id).Select(q => q.menu_id).ToList();
                    if (progress.Count() != 0)
                    {
                        lesson = db.LessonMenus.Where(q => q.DreamLayout1.DreamID == dream.id && !(progress.Contains(q.id)) && q.menuType != "none").OrderBy(q => q.id).ToList();
                    }
                    else
                    {
                        lesson = db.LessonMenus.Where(q => q.DreamLayout1.DreamID == dream.id && q.menuType != "none").OrderBy(q => q.id).ToList();

                    }
                    if (lesson.Count() != 0)
                    {
                        LessonMenu lm = lesson[0];
                        resume_menu.Text = lm.DisplayName;
                        resume_btn.CommandArgument = "" + lm.id;
                    }
                    else
                    {
                        resume_btn.Visible = false;
                    }
                }
            }

        }
    }

    protected void Enroll_btn_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            string userID = HttpContext.Current.User.Identity.GetUserId();
            string dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);

            Dream dream = db.Dreams.Where(q => q.DreamName == dreamName).First();
            var data = db.DreamEnrollments.Where(q => q.AspNetUserID == userID && q.dreamID == dream.id).ToList();
            if (data.Count() == 0)
            {
                DreamEnrollment t = new DreamEnrollment
                {
                    AspNetUserID = userID,
                    dreamID = dream.id,
                    enroll_Date = System.DateTime.Now,
                };
                db.DreamEnrollments.Add(t);
                db.SaveChanges();
                if(db.LessonMenus.Any(a => a.DreamLayout.Dream.DreamName == dream.DreamName))
                {
                    updateDreamStatus();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "alert_enrollment", "alert('Dream Enrolled Successfully')", true);
                }

            }
            var layouts = db.DreamLayouts.Where(q => q.DreamID == dream.id && q.IsUserDefaultPage == true && q.IsPublished == true).ToList();
            if (layouts.Count() != 0)
            {
                DreamLayout dl = layouts[0];
                Response.Redirect("/dreamhome/" + dream.DreamName + "/" + dl.Page);
            }
        }
        else
        {
            string host = HttpContext.Current.Request.Url.Host;
            String url = "~/Components/Account/LoginSetting.aspx? returnURL=" + host.ToString() + "";
            Response.Redirect(url);
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
    public void updateDreamStatus()
    {

        register_panel.Visible = false;
        resume_panel.Visible = true;
        DreamBirdEntities db = new DreamBirdEntities();
        //   db.UserLessonProgresses.Where(q=>q.)
    }

    protected void resume_btn_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        Button bt = (Button)sender;
        if (bt.CommandArgument != null || bt.CommandArgument != "")
        {
            int menu_id = int.Parse(bt.CommandArgument);
            var data = db.LessonMenus.Where(q => q.id == menu_id).ToList();
            if (data.Count() != 0)
            {
                LessonMenu menu = data[0];
                Session["menu_id"] = menu.id;
                Response.Redirect("../../dreamhome/" + menu.DreamLayout1.Dream.DreamName + "/" + menu.DreamLayout1.Page);

            }
        }
        else
        {
        }
    }
}