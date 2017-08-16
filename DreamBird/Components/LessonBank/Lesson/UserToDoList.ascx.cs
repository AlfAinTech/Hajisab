using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Components_LessonBank_Lesson_UserToDoList : System.Web.UI.UserControl
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
       bindData();
        }


    public void bindData()
    {
        DreamBirdEntities db = new DreamBirdEntities();
        String user_id = HttpContext.Current.User.Identity.GetUserId();
        //String dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);
        List<DreamEnrollment> enrolled_dream = db.DreamEnrollments.Where(q => q.AspNetUserID == user_id).ToList();
        if (enrolled_dream.Count != 0)
        {
          //  DreamEnrollment de = enrolled_dream[0];
            List<LessonMenu> overDue_list = new List<LessonMenu>();
            foreach(DreamEnrollment de in enrolled_dream) { 
                 overDue_list.AddRange( DreamUtil.GetOverDue_ToDoList(de.dreamID, de.AspNetUserID));
            }
            overdue_task.DataSource = overDue_list;
            overdue_task.DataBind();
           // dreamName_lbl.Text = dreamName;
            //today.Text = System.DateTime.Now.Date.ToString("dd-MM-yyyy");
        } }
    protected void menu_link_Click(object sender, EventArgs e)
    {
        LinkButton lk =  (LinkButton)sender;
        int menu_id = int.Parse(lk.CommandArgument);
        DreamBirdEntities db = new DreamBirdEntities();
        var data= db.LessonMenus.Where(q => q.id == menu_id).ToList();
        if(data.Count()!=0)
        {
            LessonMenu lm = data[0];
            String url = "~/dreamhome/" + lm.DreamLayout1.Dream.DreamName + "/" + lm.DreamLayout1.Page;
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
}