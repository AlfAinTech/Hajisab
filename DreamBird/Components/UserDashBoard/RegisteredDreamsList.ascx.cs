using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Components_UserDashBoard_RegisteredDreamsList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindData();
        }

    }
    protected void dream_link_clicked(object sender, EventArgs e)
    {
        LinkButton lk = (LinkButton)sender;
        int dream_id = int.Parse(lk.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        var data = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsUserDefaultPage == true && q.IsPublished == true).ToList();
        if(data.Count !=0)
        {
            DreamLayout dt = data[0];
            Response.Redirect("~/dreamhome/" + dt.Dream.DreamName + "/" + dt.Page);
        }
    }
    public void bindData()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if(HttpContext.Current.User.Identity.IsAuthenticated)
        {
            string user_id = HttpContext.Current.User.Identity.GetUserId();
            List<DreamEnrollment> enrolled_dreams =  db.DreamEnrollments.Where(q => q.AspNetUserID == user_id).ToList();
            EnrolledDreams_list.DataSource = enrolled_dreams;
            EnrolledDreams_list.DataBind();
            //resume_btn_clicked
        }
    }
    protected void resume_btn_clicked(object sender, EventArgs  e)
    {
        Button lk = (Button)sender;
        int dream_id = int.Parse(lk.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        var data =db.LessonMenus.Where(q => q.DreamLayout1.DreamID == dream_id).ToList();
        
        if (data.Count != 0)
        {
            LessonMenu dt = data[0];
            Response.Redirect("~/dreamhome/" + dt.DreamLayout1.Dream.DreamName + "/" + dt.DreamLayout1.Page);
        }
        else
        {
            List<DreamLayout> data1 = new List<DreamLayout>();
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                data1 = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsUserDefaultPage == true && q.IsPublished == true).ToList();
            }
            else { data1 = db.DreamLayouts.Where(q => q.DreamID == dream_id && q.IsPublicDefaultPage == true && q.IsPublished == true).ToList(); }
            
            if (data1.Count != 0)
            {
                DreamLayout dt = data1[0];
                Response.Redirect("~/dreamhome/" + dt.Dream.DreamName + "/" + dt.Page);
            }
        }

    }



}