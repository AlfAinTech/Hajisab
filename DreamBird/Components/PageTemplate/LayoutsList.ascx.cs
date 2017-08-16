using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Components_PageTemplate_LayoutsList : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DreamBirdEntities db = new DreamBirdEntities();
            repeat_layouts.DataSource = db.ClientLayouts.ToList();
            repeat_layouts.DataBind();
        }
    }
}