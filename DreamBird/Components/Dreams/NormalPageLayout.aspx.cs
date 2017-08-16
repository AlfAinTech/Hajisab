using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_Dreams_NormalPageLayout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            int PageID = Convert.ToInt32(Request.QueryString["PID"].ToString());
            DreamBirdEntities db = new DreamBirdEntities();
            var page = db.DreamLayouts.Where(w => w.id == PageID).First();
            DreamPageBasicInfo.EditDataBind(page.id);
            ControlsList1.BindData();
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "retrive_layout", "callFetcher('" + page.Page + "', " + page.DreamID + ");", true);
        }
    }
}