using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UmrahComponents_AdminPages_Package_PackageBasicInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated && HttpContext.Current.User.IsInRole("Admin")))
        {
            Response.Redirect("~/Components/Account/LoginSetting.aspx");
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["packageID"] != null)
            {
                int package_id = int.Parse(Request.QueryString["packageID"]);
                PackageInfo.EditDataBind(package_id);
            }
        }

    }
    protected void package_Added(object sender, EventArgs e)
    {
        EventArgPackageClicked evt = (EventArgPackageClicked)e;
        ViewState["SelectedPackageID"] = evt.PackageID;
        Response.Redirect("~/UmrahComponents/AdminPages/Package/PAckageBasicInfo?packageID=" + evt.PackageID);
    }
    
}