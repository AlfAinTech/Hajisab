using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_LessonMenuProgressAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.QueryString.HasKeys())
            {
                int ChildPageID = Convert.ToInt32(Request.QueryString["PID"].ToString()); 
                DreamBirdEntities db = new DreamBirdEntities();
                var PageID = db.LessonMenus.Where(w => w.DreamLayoutID == ChildPageID).Select(s => s.ParentLayoutID).First();
                LessonMenuList.bindData(Convert.ToInt32(PageID));
                LessonMenuList1.bindData(Convert.ToInt32(PageID), true);
            }
        }
    }

    protected void LessonMenuList1_menuClicked(object sender, EventArgs e)
    {
        EventArgLessonMenuClik evt = e as EventArgLessonMenuClik;
        int menuid = evt.LessonMenuID;
        DreamBirdEntities db = new DreamBirdEntities();
        if(Request.QueryString.HasKeys())
        {
            int OriginalPageID = Convert.ToInt32(db.LessonMenus.Where(w => w.id == menuid).Select(s => s.DreamLayoutID).First());
            int ResidingPageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
            string CID = Request.QueryString["CID"].ToString();
            LessonProgressControl lpc = new LessonProgressControl();
            if(db.LessonProgressControls.Any(a => a.ResidingLayoutID == ResidingPageID && a.BaseControlID == CID))
            {
                lpc = db.LessonProgressControls.Where(w => w.ResidingLayoutID == ResidingPageID && w.BaseControlID == CID).First();
                lpc.MenuID = menuid;
                lpc.OriginalLayoutID = OriginalPageID;
                lpc.ProgressType = "ParentOnly";
            }
            else
            {
                lpc.ResidingLayoutID = ResidingPageID;
                lpc.OriginalLayoutID = OriginalPageID;
                lpc.BaseControlID = CID;
                lpc.MenuID = menuid;
                lpc.ProgressType = "ParentOnly";
                db.LessonProgressControls.Add(lpc);
            }
            db.SaveChanges();
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "window_close", "window.close();", true);
    }

    protected void LessonMenuList_menuClicked(object sender, EventArgs e)
    {
        EventArgLessonMenuClik evt = e as EventArgLessonMenuClik;
        int menuid = evt.LessonMenuID;
        DreamBirdEntities db = new DreamBirdEntities();
        if (Request.QueryString.HasKeys())
        {
            int OriginalPageID = Convert.ToInt32(db.LessonMenus.Where(w => w.id == menuid).Select(s => s.DreamLayoutID).First());
            int ResidingPageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
            string CID = Request.QueryString["CID"].ToString();

            LessonProgressControl lpc = new LessonProgressControl();
            if (db.LessonProgressControls.Any(a => a.ResidingLayoutID == ResidingPageID && a.BaseControlID == CID))
            {
                lpc = db.LessonProgressControls.Where(w => w.ResidingLayoutID == ResidingPageID && w.BaseControlID == CID).First();
                lpc.MenuID = menuid;
                lpc.OriginalLayoutID = OriginalPageID;
                lpc.ProgressType = "ChildOnly";
            }
            else
            {
                lpc.ResidingLayoutID = ResidingPageID;
                lpc.OriginalLayoutID = OriginalPageID;
                lpc.BaseControlID = CID;
                lpc.MenuID = menuid;
                lpc.ProgressType = "ChildOnly";
                db.LessonProgressControls.Add(lpc);
            }
            db.SaveChanges();
        }
        ScriptManager.RegisterStartupScript(Page, typeof(Page), "window_close", "window.close();", true);
    }
}