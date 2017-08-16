using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_LessonMenuAdminPage : System.Web.UI.Page
{
    static int parentLayoutID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["PID"] != null)
            {
                int id = int.Parse(Request.QueryString["PID"].ToString());
                DreamBirdEntities db = new DreamBirdEntities();
                if (db.DreamLayouts.Where(q => q.id == id).Count() != 0)
                {
                    //ViewState["PID"] = parentLayoutID = id;
                    DreamPageBasicInfo.EditDataBind(id);
                    LessonMenuAdminNew.BindData(id);
                }
                else { Response.Redirect(Request.RawUrl); }
            }
            else { Response.Redirect(Request.RawUrl); }
        }
    }
}