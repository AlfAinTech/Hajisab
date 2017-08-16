using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_MenuOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString.HasKeys())
            {
                DreamBirdEntities db = new DreamBirdEntities();
                int PageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
                var LessonMenu = db.LessonMenus.Where(w => w.ParentLayoutID == PageID).First();
                int ParentMenuID = Convert.ToInt32(LessonMenu.parentMenu_id);
                MenuOrder.bindMenu(ParentMenuID, PageID);
            }
        }
    }
}