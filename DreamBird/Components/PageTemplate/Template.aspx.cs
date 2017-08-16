using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_Template : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            int layoutID = 0;
            string MenuType = "";
            if (Request.QueryString.HasKeys())
            {
                layoutID = Convert.ToInt32(Request.QueryString["ParentLayoutID"].ToString());
                if(Request.QueryString["MenuType"] != null)
                {
                    MenuType = Request.QueryString["MenuType"].ToString();
                }
            }
            else
            {
                layoutID = 31;
            }
            DreamBirdEntities db = new DreamBirdEntities();
            var layout = db.DreamLayouts.Where(w => w.id == layoutID).First();
            string dream = db.Dreams.Where(w => w.id == layout.DreamID).Select(s => s.DreamName).First();
            //heading.Text = dream + "/" + layout.Page;
            //HyperLink1.NavigateUrl = "~/DreamHome/" + heading.Text;
            string pageName = layout.Page;
            int dreamid = Convert.ToInt32(layout.DreamID.ToString());
            if(db.ClientPages.Any(a => a.DreamLayout_id == dreamid && a.Page == pageName))
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "retrive_layout", "callFetcher('" + pageName + "', " + dreamid + ");", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, typeof(Page), "retrive_layout", "LoadTemplate('" + MenuType.First().ToString().ToUpper() + MenuType.Substring(1) + "', '" + pageName + "', " + dreamid + ");", true);
            }
        }
    }
}