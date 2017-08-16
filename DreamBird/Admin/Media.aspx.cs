using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Media : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(HttpContext.Current.User.Identity.IsAuthenticated && HttpContext.Current.User.Identity.Name == "admin"))
        {
            Response.Redirect("~/Components/Account/LoginSetting.aspx");
        }
    }
}