using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LessonMenuPage : System.Web.UI.Page
{
    static int parentLayoutID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["ParentLayoutID"] != null)
            {
                int id = int.Parse(Request.QueryString["ParentLayoutID"].ToString());
                DreamBirdEntities db = new DreamBirdEntities();
                if (db.DreamLayouts.Where(q => q.id == id).Count() != 0)
                {
                    ViewState["ParentLayoutID"] = parentLayoutID = id;
                   // LessonMenuAdmin.bindData(parentLayoutID);
                }
                else { Response.Redirect(Request.RawUrl); }
            }
            else { Response.Redirect(Request.RawUrl); }
        }
    }
}