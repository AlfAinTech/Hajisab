using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Components_UserDashBoard_WhatToDoNext_list : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string user_id = HttpContext.Current.User.Identity.GetUserId();
                List<LessonMenu> nextTask_list = new List<LessonMenu>();
                List<LessonMenu> lesson;
                List<DreamEnrollment> enrolled_dreams = db.DreamEnrollments.Where(q => q.AspNetUserID == user_id).ToList();
                foreach(DreamEnrollment dd in enrolled_dreams)
                {
                    List<int> progress = db.UserLessonProgresses.Where(q => q.AspNetUser_id == user_id && q.LessonMenu.DreamLayout1.DreamID == dd.dreamID).OrderBy(q => q.menu_id).Select(q => q.menu_id).ToList();
                    if (progress.Count != 0)
                    {  lesson = db.LessonMenus.Where(q => q.DreamLayout1.DreamID == dd.Dream.id && !(progress.Contains(q.id)) && q.menuType != "none").OrderBy(q => q.id).ToList();}
                    else
                    { lesson = db.LessonMenus.Where(q => q.DreamLayout1.DreamID == dd.Dream.id && q.menuType != "none").OrderBy(q => q.id).ToList();}
                    if (lesson.Count() != 0)
                        {
                            LessonMenu lm = lesson[0];
                            nextTask_list.Add(lm);
                        }
                       
               
                }
                lesson_list.DataSource = nextTask_list;
                lesson_list.DataBind();
                if(lesson_list.Items.Count ==0)
                {
                    detail_panel.Visible = false;
                }

            
            }
        }
    }

    protected void menu_btn_clicked(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        LinkButton bt = (LinkButton)sender;
        int menu_id = int.Parse(bt.CommandArgument);
        var data = db.LessonMenus.Where(q => q.id == menu_id).ToList();
        if (data.Count() != 0)
        {
            LessonMenu menu = data[0];
            Session["menu_id"] = menu.id;
            String src = ("../dreamhome/" + menu.DreamLayout1.Dream.DreamName + "/" + menu.DreamLayout1.Page);
            Response.Redirect(src);
        }
    }
}