using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Components_UserDashBoard_DreamContentsummary : System.Web.UI.UserControl,ICoreDreamControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindData();
        }
    }
    public void bindData()
    {
         DreamBirdEntities db = new DreamBirdEntities();
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string dreamName = DreamUtil.getDreamNameFromURL(Request.RawUrl);

                Dream dream = db.Dreams.Where(q => q.DreamName == dreamName).First();
                int lessons= db.LessonMenus.Where(q => q.DreamLayout1.DreamID == dream.id && q.menuType == "multimedia").Count();
                int videos = db.LessonMenus.Where(q => q.DreamLayout1.DreamID == dream.id && q.menuType == "video").Count();
                int quizes = db.LessonMenus.Where(q => q.DreamLayout1.DreamID == dream.id && q.menuType == "quiz").Count();
                lesson_lbl.Text = "" + lessons;
                video_lbl.Text = "" + videos;
                quiz_lbl.Text = "" + quizes;

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