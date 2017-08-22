using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminPages_Package_PackageDiscount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if (Request.QueryString["packageID"] != null)
        {
            int package_id = int.Parse(Request.QueryString["packageID"].ToString());
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "b_key", "selectedPackage(" + package_id + ");", true);
        }
    }
}